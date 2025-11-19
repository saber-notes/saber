import 'dart:convert';
import 'dart:io';

import 'package:abstract_sync/abstract_sync.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/webdav.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/errors.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:worker_manager/worker_manager.dart';

final syncer = Syncer<SaberSyncInterface, SaberSyncFile, File, WebDavFile>(
  const SaberSyncInterface(),
);

class SaberSyncInterface
    extends AbstractSyncInterface<SaberSyncFile, File, WebDavFile> {
  const SaberSyncInterface();

  static final log = Logger('SaberSyncInterface');

  @override
  bool areRemoteFilesEqual(WebDavFile a, WebDavFile b) => a.path == b.path;

  @override
  bool areLocalFilesEqual(File a, File b) => a.path == b.path;

  @override
  Future<List<SaberSyncFile>> findLocalChanges() async {
    for (var tries = 0; tries < 10 && remoteFiles.isEmpty; ++tries) {
      // Wait for [findRemoteChanges] to populate [remoteFiles]
      await Future.delayed(const Duration(milliseconds: 200));
    }

    final syncFiles = <SaberSyncFile>[];
    await for (final localFile in FileManager.getRootDirectory().list(
      recursive: true,
    )) {
      if (localFile is! File) continue;

      final syncFile = await getSyncFileFromLocalFile(localFile);

      final bestFile = await getBestFile(
        syncFile,
        onLocalFileNotFound: .local,
        onEqualFiles: .remote,
      );
      switch (bestFile) {
        case .local:
          syncFiles.add(syncFile);
        case .remote:
          // Remote file is newer, do nothing
          break;
      }
    }
    return syncFiles;
  }

  @override
  Future<List<SaberSyncFile>> findRemoteChanges() async {
    final client = SaberSyncInterface.client;
    if (client == null) return const [];

    remoteFiles = await findRemoteFiles();
    if (remoteFiles.isEmpty) return const [];

    final List<SaberSyncFile> changedFiles = await Future.wait(
      remoteFiles.map((remoteFile) async {
        final SaberSyncFile syncFile;
        try {
          syncFile = await getSyncFileFromRemoteFile(remoteFile);
        } catch (e) {
          log.warning('Failed to get sync file from remote file: $e', e);
          return null;
        }

        final bestFile = await getBestFile(
          syncFile,
          onLocalFileNotFound: .remote,
          onEqualFiles: .local,
        );
        switch (bestFile) {
          case .local:
            // Local file is newer, do nothing
            return null;
          case .remote:
            // Remote file is newer or doesn't exist locally

            final remotelyDeleted = syncFile.remoteFile!.size! <= 0;
            final locallyDeleted = stows.fileSyncAlreadyDeleted.value.contains(
              syncFile.relativeLocalPath,
            );
            if (remotelyDeleted && locallyDeleted) break;

            return syncFile;
        }
      }),
    ).then((list) => list.nonNulls.toList());

    // Prioritize note.sbn2.p over note.sbn2 (so the preview is updated first)
    final previewSyncFiles = changedFiles
        .where((syncFile) => syncFile.localFile.path.endsWith('.p'))
        .toList(growable: false);
    for (final previewSyncFile in previewSyncFiles) {
      final previewSyncFileIndex = changedFiles.indexOf(previewSyncFile);
      final mainSyncFileIndex = changedFiles.indexWhere(
        (syncFile) =>
            syncFile.localFile.path ==
            previewSyncFile.localFile.path.substring(
              0,
              previewSyncFile.localFile.path.length - 2,
            ),
      );
      if (previewSyncFileIndex <= -1 || mainSyncFileIndex <= -1) continue;

      if (previewSyncFileIndex >= mainSyncFileIndex) {
        changedFiles
          ..removeAt(previewSyncFileIndex)
          ..insert(mainSyncFileIndex, previewSyncFile);
      } else {
        changedFiles
          ..removeAt(previewSyncFileIndex)
          ..insert(mainSyncFileIndex - 1, previewSyncFile);
      }
    }

    return changedFiles;
  }

  @override
  Future<SaberSyncFile> getSyncFileFromLocalFile(File localFile) async {
    final relativePath = localFile.path
        .substring(FileManager.documentsDirectory.length)
        // Compensate for Windows using backslashes
        .replaceAll(Platform.pathSeparator, '/');

    assert(relativePath.startsWith('/'));
    final encryptedName = await encryptPath(client, relativePath);
    final remotePath =
        '${FileManager.appRootDirectoryPrefix}/'
        '$encryptedName'
        '$encExtension';

    final remoteFile = await getWebDavFile(remotePath);

    return SaberSyncFile(
      remoteFile: remoteFile,
      remotePath: remotePath,
      localFile: localFile,
    );
  }

  @override
  Future<SaberSyncFile> getSyncFileFromRemoteFile(WebDavFile remoteFile) async {
    final relativeLocalPath = await decryptPath(client!, remoteFile.path.path);
    if (relativeLocalPath == null)
      throw Exception('Decryption failed for ${remoteFile.path.path}');
    final localFile = FileManager.getFile(relativeLocalPath);

    return SaberSyncFile(remoteFile: remoteFile, localFile: localFile);
  }

  @override
  Future<Uint8List> downloadRemoteFile(SaberSyncFile file) async {
    if (file.localFile.path.endsWith(NextcloudClientExtension.configFileName)) {
      // Config file changed
      try {
        _client!.loadEncryptionKey(generateKeyIfMissing: false);
      } on EncLoginFailure {
        // enc password has changed since the user last logged in, so log out
        stows.encPassword.value = '';
        stows.key.value = '';
        stows.iv.value = '';
      }
      return Uint8List(0);
    } else if (file.remoteFile?.size == 0) {
      // Deleted file, handle in [writeLocalFile]
      return Uint8List(0);
    }

    final client = SaberSyncInterface.client;
    if (client == null)
      throw Exception('Tried to download file without being logged in');

    return await client.webdav.get(PathUri.parse(file.remotePath));
  }

  @override
  Future<void> writeLocalFile(
    SaberSyncFile file,
    // ignore: avoid_renaming_method_parameters
    Uint8List encryptedBytes, {
    @visibleForTesting bool awaitWrite = false,
  }) async {
    if (file.localFile.path == NextcloudClientExtension.configFileName) {
      // Config file changed, already handled in [downloadRemoteFile]
      return;
    }

    if (encryptedBytes.isEmpty) {
      // Remote file was deleted
      await FileManager.deleteFile(file.relativeLocalPath, alsoUpload: false);
      stows.fileSyncAlreadyDeleted.value.add(file.relativeLocalPath);
      stows.fileSyncAlreadyDeleted.notifyListeners();
      return;
    }

    final client = SaberSyncInterface.client;
    if (client == null)
      throw Exception('Tried to decrypt file without being logged in');

    final encrypter = client.encrypter;
    final iv = IV.fromBase64(stows.iv.value);

    final decryptedData = await workerManager.execute(
      file.localFile.path.endsWith(Editor.extensionOldJson)
          ? () async {
              final encrypted = utf8.decode(encryptedBytes.cast<int>());
              final decrypted = encrypter.decrypt64(encrypted, iv: iv);
              return utf8.encode(decrypted);
            }
          : () async {
              final encrypted = Encrypted(encryptedBytes);
              final decrypted = encrypter.decryptBytes(encrypted, iv: iv);
              return Uint8List.fromList(decrypted);
            },
      priority: WorkPriority.highRegular,
    );
    assert(
      decryptedData.isNotEmpty,
      'Decrypted data is empty but encryptedBytes.length is ${encryptedBytes.length}',
    );
    await FileManager.writeFile(
      file.relativeLocalPath,
      decryptedData,
      awaitWrite: awaitWrite,
      alsoUpload: false,
      // Local file should have the same last modified date as remote
      lastModified: file.remoteFile?.lastModified,
    );
  }

  @override
  Future<Uint8List> readLocalFile(SaberSyncFile file) async {
    final decryptedBytes = file.localFile.existsSync()
        ? await file.localFile.readAsBytes()
        : Uint8List(0);
    if (decryptedBytes.isEmpty) {
      // deleted file, handle in [uploadRemoteFile]
      return decryptedBytes;
    }

    final client = SaberSyncInterface.client;
    if (client == null)
      throw Exception('Tried to encrypt file without being logged in');

    final encrypter = client.encrypter;
    final iv = IV.fromBase64(stows.iv.value);

    final encryptedData = await workerManager.execute(
      file.localFile.path.endsWith(Editor.extensionOldJson)
          ? () async {
              final decrypted = utf8.decode(decryptedBytes);
              final encrypted = encrypter.encrypt(decrypted, iv: iv);
              return utf8.encode(encrypted.base64);
            }
          : () async {
              final decrypted = decryptedBytes;
              final encrypted = encrypter.encryptBytes(decrypted, iv: iv);
              return encrypted.bytes;
            },
      priority: WorkPriority.highRegular,
    );

    return encryptedData;
  }

  @override
  Future<void> uploadRemoteFile(
    SaberSyncFile file,
    // ignore: avoid_renaming_method_parameters
    Uint8List encryptedBytes,
  ) async {
    DateTime lastModified;
    try {
      lastModified = file.localFile.lastModifiedSync();
    } on FileSystemException {
      lastModified = DateTime.now();
    }
    if (lastModified.isBefore(stows.fileSyncResyncEverythingDate.value)) {
      lastModified = stows.fileSyncResyncEverythingDate.value;
    }

    final client = SaberSyncInterface.client;
    if (client == null)
      throw Exception('Tried to upload file without being logged in');

    await client.webdav.put(
      encryptedBytes,
      PathUri.parse(file.remotePath),
      lastModified: lastModified,
    );
  }

  static NextcloudClient? _client;
  static NextcloudClient? get client {
    if (_client?.authentications?.isEmpty ?? true) {
      _client = NextcloudClientExtension.withSavedDetails();
    }
    return _client;
  }

  /// A list of remote files from server,
  /// used to speed up [getSyncFileFromLocalFile].
  ///
  /// This is set in [findRemoteFiles], and may be empty
  /// or incomplete if [findRemoteFiles] has not been called recently.
  static var remoteFiles = <WebDavFile>{};

  /// A cache map to encrypt file paths.
  /// e.g. '/path/to/file.sbn2' -> 'L3BhdGgvdG8vZmlsZS5zYm4y'
  ///
  /// Use [encryptPath] to encrypt a path instead of accessing this directly.
  static final _encryptMap = <String, String>{};

  /// A cache map to decrypt file paths.
  /// e.g. 'L3BhdGgvdG8vZmlsZS5zYm4y' -> '/path/to/file.sbn2'
  ///
  /// Use [decryptPath] to decrypt a path instead of accessing this directly.
  static final _decryptMap = <String, String>{};

  static Future<Set<WebDavFile>> findRemoteFiles() async {
    final client = SaberSyncInterface.client;
    if (client == null) return {};

    try {
      return await client.webdav
          .propfind(
            PathUri.parse(FileManager.appRootDirectoryPrefix),
            prop: const WebDavPropWithoutValues.fromBools(
              davGetcontentlength: true,
              davGetlastmodified: true,
            ),
          )
          .then(
            (multistatus) => multistatus
                .toWebDavFiles()
                // ignore root directory itself
                .where(
                  (file) =>
                      file.path.path !=
                      '${FileManager.appRootDirectoryPrefix}/',
                )
                .toSet(),
          );
    } on DynamiteStatusCodeException catch (e, st) {
      if (e.statusCode == HttpStatus.notFound) {
        log.info('findRemoteFiles: Creating app directory', e);
        await client.webdav.mkcol(
          PathUri.parse(FileManager.appRootDirectoryPrefix),
        );
        log.info('findRemoteFiles: Generating config');
        await client
            .getConfig()
            .then((config) => client.generateConfig(config: config))
            .then((config) => client.setConfig(config));
        return {};
      } else {
        log.severe('Failed to get list of remote files: $e', e, st);
        if (kDebugMode) rethrow;
        return {};
      }
    } on SocketException catch (e, st) {
      log.warning('findRemoteFiles: Network error: $e', e, st);
      return {};
    } catch (e, st) {
      log.severe('findRemoteFiles: Unknown error: $e', e, st);
      if (kDebugMode) rethrow;
      return {};
    }
  }

  static Future<String> encryptPath(
    NextcloudClient? client,
    String path,
  ) async {
    if (_encryptMap.containsKey(path)) return _encryptMap[path]!;

    if (client == null)
      throw Exception('Tried to encrypt path without being logged in');

    final encrypter = client.encrypter;
    final iv = IV.fromBase64(stows.iv.value);

    final encrypted = await workerManager.execute(
      () => encrypter.encrypt(path, iv: iv).base16,
      priority: WorkPriority.veryHigh,
    );

    _encryptMap[path] = encrypted;
    _decryptMap[encrypted] = path;
    return encrypted;
  }

  static Future<String?> decryptPath(
    NextcloudClient? client,
    String path,
  ) async {
    // Ignore README.md and other ignored files
    if (_ignoredFiles.any(path.endsWith)) return null;

    final String encryptedName;
    if (path.endsWith(encExtension)) {
      // File name without extension
      encryptedName = path.substring(
        path.lastIndexOf('/') + 1,
        path.length - encExtension.length,
      );
    } else if (path.endsWith(NextcloudClientExtension.configFileUri.path)) {
      // Config file is a special case, it's not encrypted
      return '/${NextcloudClientExtension.configFileName}';
    } else {
      log.info('remote file not in recognised encrypted format: $path');
      return null;
    }

    if (_decryptMap.containsKey(encryptedName))
      return _decryptMap[encryptedName]!;

    if (client == null)
      throw Exception('Tried to decrypt path without being logged in');

    final encrypter = client.encrypter;
    final iv = IV.fromBase64(stows.iv.value);

    var decrypted = await workerManager.execute(
      () => encrypter.decrypt16(encryptedName, iv: iv),
      priority: WorkPriority.veryHigh,
    );

    // Mitigates a bug where files got imported starting with `null/` instead of `/`.
    if (decrypted.startsWith('null/')) {
      decrypted = decrypted.substring('null/'.length - 1);
    }

    _encryptMap[decrypted] = encryptedName;
    _decryptMap[encryptedName] = decrypted;
    return decrypted;
  }

  /// Returns the best file to keep, local or remote.
  ///
  /// If the local file doesn't exist, [onLocalFileNotFound] is returned.
  ///
  /// If the remote and local files have the same last modified date,
  /// [onEqualFiles] is returned.
  static Future<BestFile> getBestFile(
    SaberSyncFile file, {
    required BestFile onLocalFileNotFound,
    required BestFile onEqualFiles,
  }) async {
    if (!file.localFile.existsSync()) {
      // We either have a new remote file or a deleted local file
      return onLocalFileNotFound;
    }

    // get remote file
    file.remoteFile ??= await _getWebDavFileStatic(
      file.remotePath,
      useCache: false,
    );
    if (file.remoteFile == null) {
      // Remote file doesn't exist, keep local
      return .local;
    }

    final lastModifiedRemote = file.remoteFile!.lastModified;
    if (lastModifiedRemote == null) {
      // Remote file doesn't exist, keep local
      return .local;
    } else if (lastModifiedRemote.isBefore(
      stows.fileSyncResyncEverythingDate.value,
    )) {
      // If we've prompted a full resync at [resyncEverythingDate],
      // keep the local file if it was modified before [resyncEverythingDate]
      return .local;
    }

    // File exists locally, check if it's newer than the remote file
    final lastModifiedLocal = file.localFile.lastModifiedSync();
    if (lastModifiedRemote.difference(lastModifiedLocal).abs() <
        const Duration(milliseconds: 500)) {
      return onEqualFiles;
    } else if (lastModifiedRemote.isAfter(lastModifiedLocal)) {
      return .remote;
    } else {
      return .local;
    }
  }

  Future<WebDavFile?> getWebDavFile(
    String remotePath, {
    bool useCache = true,
  }) => _getWebDavFileStatic(remotePath, useCache: useCache);

  static Future<WebDavFile?> _getWebDavFileStatic(
    String remotePath, {
    bool useCache = true,
  }) async {
    WebDavFile? webDavFile;

    try {
      webDavFile = remoteFiles.firstWhere(
        (remoteFile) => remoteFile.path.path == remotePath,
      );
      if (useCache) return webDavFile;
    } on StateError {
      log.fine('Remote file not cached for $remotePath');
    }

    webDavFile = await _getWebDavFileUncached(remotePath) ?? webDavFile;
    if (webDavFile != null) remoteFiles.add(webDavFile);
    return webDavFile;
  }

  static Future<WebDavFile?> _getWebDavFileUncached(String remotePath) async {
    final client = SaberSyncInterface.client;
    if (client == null) return null;

    try {
      return await client.webdav
          .propfind(
            PathUri.parse(remotePath),
            prop: const WebDavPropWithoutValues.fromBools(
              davGetcontentlength: true,
              davGetlastmodified: true,
            ),
          )
          .then((multistatus) => multistatus.toWebDavFiles().first);
    } catch (e) {
      log.fine('Remote file not found for $remotePath: $e', e);
    }

    return null;
  }

  /// the file extension of an encrypted base64 note
  static const encExtension = '.sbe';

  /// List of files to ignore on the server.
  /// Prefixed with a slash so we can use [filePath.endsWith]
  static const _ignoredFiles = <String>['/Readme.md'];
}

class SaberSyncFile extends AbstractSyncFile<File, WebDavFile> {
  late final relativeLocalPath = localFile.path.substring(
    FileManager.documentsDirectory.length,
  );

  late String remotePath;

  SaberSyncFile({
    required super.remoteFile,
    String? remotePath,
    required super.localFile,
  }) : assert(
         remotePath != null || remoteFile != null,
         'At least one of remotePath or remoteFile must be provided',
       ) {
    this.remotePath = remotePath ?? remoteFile!.path.path;
  }

  static Future<SaberSyncFile> relative(String relativeFilePath) {
    final localFile = FileManager.getFile(relativeFilePath);
    return const SaberSyncInterface().getSyncFileFromLocalFile(localFile);
  }

  @override
  String toString() =>
      'SaberSyncFile(local: $relativeLocalPath, remote: $remotePath)';

  @override
  bool operator ==(Object other) =>
      other is SaberSyncFile && other.localFile.path == localFile.path;

  @override
  int get hashCode => localFile.path.hashCode;
}

extension SaberSyncerComponent on SyncerComponent {
  Future<bool> enqueueRel(String relativeFilePath) async {
    if (!stows.loggedIn) return false;

    final syncFile = await SaberSyncFile.relative(relativeFilePath);
    return enqueue(syncFile: syncFile);
  }
}

enum BestFile { local, remote }
