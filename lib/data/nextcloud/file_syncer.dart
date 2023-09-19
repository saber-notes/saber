import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:worker_manager/worker_manager.dart';

abstract class FileSyncer {
  static final log = Logger('FileSyncer');

  /// the file extension of an encrypted base64 note
  static const String encExtension = '.sbe';

  static PlainPref<Queue<String>> get _uploadQueue => Prefs.fileSyncUploadQueue;
  static final Queue<SyncFile> _downloadQueue = Queue();
  static CancellableStruct _downloadCancellable = CancellableStruct();

  static NextcloudClient? _client;

  static bool _isUploadingFile = false;
  static final ChangeNotifier uploadNotifier = ChangeNotifier();

  static final ValueNotifier<int?> filesDone = ValueNotifier<int?>(null);
  static int get filesToSync => _uploadQueue.value.length + _downloadQueue.length;
  static const int filesDoneLimit = 100000000;

  /// We write [deletedFileDummyContent] to a deleted file on the cloud
  /// (instead of actually deleting it) so we can sync the file
  /// as this keeps the last-modified date intact.
  /// This is currently just an empty string.
  static const String deletedFileDummyContent = '';

  /// List of files to ignore on the server.
  /// Prefix with a slash so we can use [filePath.endsWith]
  static const List<String> _ignoredFiles = [
    '/Readme.md',
  ];

  static void startSync() async {
    // cancel previous sync
    _downloadCancellable.cancelled = true;
    final CancellableStruct downloadCancellable = CancellableStruct();
    _downloadCancellable = downloadCancellable;

    uploadFileFromQueue();

    if (_client?.loginName != Prefs.username.value) _client = null;
    _client ??= NextcloudClientExtension.withSavedDetails();
    if (_client == null) return;

    // Get list of remote files from server
    List<WebDavFile> remoteFiles;
    try {
      remoteFiles = await _client!.webdav.propfind(
        Uri.parse(FileManager.appRootDirectoryPrefix),
        prop: WebDavPropWithoutValues.fromBools(
          davgetcontentlength: true,
          davgetlastmodified: true,
        ),
      ).then((multistatus) => multistatus.toWebDavFiles());
    } on SocketException { // network error
      filesDone.value = filesDoneLimit;
      downloadCancellable.cancelled = true;
      return;
    }

    if (downloadCancellable.cancelled) return;

    // Add each file to download queue if needed
    await Future.wait(remoteFiles.map((WebDavFile file) => _addToDownloadQueue(file)));
    _sortDownloadQueue();
    filesDone.value = 1;

    if (downloadCancellable.cancelled) return;

    Queue<SyncFile> failedFiles = Queue();
    try {
      // Start downloading files one by one
      while (_downloadQueue.isNotEmpty) {
        final SyncFile file = _downloadQueue.removeFirst();
        final bool success = await downloadFile(file);
        if (downloadCancellable.cancelled) return;
        if (success) {
          filesDone.value = (filesDone.value ?? 0) + 1;
          Prefs.fileSyncCorruptFiles.value.remove(file.localPath);
        } else {
          failedFiles.add(file);
          Prefs.fileSyncCorruptFiles.value.add(file.localPath);
        }
        Prefs.fileSyncCorruptFiles.notifyListeners();
      }
    } finally {
      // Add failed files back to queue for next sync
      _downloadQueue.addAll(failedFiles);
    }

    // make sure progress indicator is complete
    filesDone.value = (filesDone.value ?? 0) + filesDoneLimit;
    downloadCancellable.cancelled = true;
  }

  /// Queues a file to be uploaded
  static void addToUploadQueue(String filePath) {
    try {
      if (_uploadQueue.value.contains(filePath)) return; // don't add it again
      _uploadQueue.value.add(filePath);
      _uploadQueue.notifyListeners();
    } finally {
      uploadFileFromQueue(); // start upload if not already uploading
    }
  }

  /// Picks the first filePath from [_uploadQueue] and uploads it
  @visibleForTesting
  static Future uploadFileFromQueue() async {
    if (_isUploadingFile) return;
    await _uploadQueue.waitUntilLoaded();
    if (_uploadQueue.value.isEmpty) return;

    if (_client?.loginName != Prefs.username.value) _client = null;
    _client ??= NextcloudClientExtension.withSavedDetails();
    if (_client == null) return;

    final String filePathUnencrypted = _uploadQueue.value.removeFirst();
    _uploadQueue.notifyListeners();

    try {
      _isUploadingFile = true;

      final Encrypter encrypter = await _client!.encrypter;
      final IV iv = IV.fromBase64(Prefs.iv.value);
      final String filePathEncrypted = await workerManager.execute(
        () => encrypter.encrypt(filePathUnencrypted, iv: iv).base16,
        priority: WorkPriority.veryHigh,
      );
      final String filePathRemote = '${FileManager.appRootDirectoryPrefix}/$filePathEncrypted$encExtension';

      final syncFile = SyncFile(remotePath: filePathRemote, localPath: filePathUnencrypted);
      if (!await _shouldLocalFileBeKept(syncFile, inUploadQueue: true)) {
        // remote file is newer; download it instead
        _downloadQueue.add(syncFile);
        return;
      }

      final WebDavClient webdav = _client!.webdav;

      final Uint8List localDataEncrypted;
      if (await FileManager.doesFileExist(filePathUnencrypted)) {
        Uint8List? localDataUnencrypted = await FileManager.readFile(filePathUnencrypted);
        if (localDataUnencrypted == null) {
          log.severe('Failed to read file $filePathUnencrypted to upload');
          return;
        }

        if (filePathUnencrypted.endsWith(Editor.extensionOldJson)) {
          localDataEncrypted = await workerManager.execute(
            () async {
              final stringUnencrypted = utf8.decode(localDataUnencrypted);
              final encrypted = encrypter.encrypt(stringUnencrypted, iv: iv);
              return utf8.encode(encrypted.base64) as Uint8List;
            },
            priority: WorkPriority.highRegular,
          );
        } else  {
          localDataEncrypted = await workerManager.execute(
            () async {
              final encrypted = encrypter.encryptBytes(localDataUnencrypted, iv: iv);
              return encrypted.bytes;
            },
            priority: WorkPriority.highRegular,
          );
        }
      } else {
        localDataEncrypted = utf8.encode(deletedFileDummyContent) as Uint8List;
      }

      DateTime lastModified;
      try {
        lastModified = await FileManager.lastModified(filePathUnencrypted);
      } on FileSystemException {
        lastModified = DateTime.now();
      }

      // upload file
      await webdav.put(
        localDataEncrypted,
        Uri.parse(filePathRemote),
        lastModified: lastModified,
      );
    } on SocketException { // network error
      _uploadQueue.value.add(filePathUnencrypted);
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      _isUploadingFile = false;
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      uploadNotifier.notifyListeners();
      uploadFileFromQueue();
    }
  }

  static Future _addToDownloadQueue(WebDavFile file) async {
    final Encrypter encrypter = await _client!.encrypter;
    final IV iv = IV.fromBase64(Prefs.iv.value);

    String filePathRemote = file.path;
    if (filePathRemote.startsWith('/')) {
      filePathRemote = filePathRemote.substring(1);
    }

    // remove parent directory from path
    String filePathEncrypted = filePathRemote;
    const rootSlash = '${FileManager.appRootDirectoryPrefix}/';
    if (filePathEncrypted.startsWith(RegExp(r'files/[^/]+/Saber/'))) {
      // Directory may be prefixed with /files/username/ then the /Saber/ folder.
      // See https://github.com/adil192/saber/issues/382

      // min index 8 to handle edge case where the username is 'Saber'
      // i.e. '/files/Saber/Saber/76987698ab9c7697.sbn'
      final i = filePathEncrypted.indexOf(rootSlash, 8) + rootSlash.length;
      filePathEncrypted = filePathEncrypted.substring(i);
    } else if (filePathEncrypted.startsWith(rootSlash)) { // remove "Saber/"
      filePathEncrypted = filePathEncrypted.substring(rootSlash.length);
    } else {
      log.severe('remote file not in app root: $filePathEncrypted');
      return;
    }
    assert(!filePathEncrypted.contains('/'), 'filePathEncrypted contains a slash: $filePathEncrypted');

    // ignored files
    for (final String ignoredFile in _ignoredFiles) {
      if (('/$filePathEncrypted').endsWith(ignoredFile)) {
        return;
      }
    }

    // remove extension
    if (filePathEncrypted.endsWith(encExtension)) {
      filePathEncrypted = filePathEncrypted.substring(0, filePathEncrypted.length - encExtension.length);
    } else {
      log.info('remote file not in recognised encrypted format: $filePathRemote');
      return;
    } // TODO: also sync config.sbc

    // decrypt file path
    final filePathUnencrypted = await workerManager.execute(
      () => encrypter.decrypt16(filePathEncrypted, iv: iv),
      priority: WorkPriority.veryHigh,
    );

    final syncFile = SyncFile(
      remotePath: filePathRemote,
      localPath: filePathUnencrypted,
      webDavFile: file,
    );
    if (await _shouldLocalFileBeKept(syncFile)) return;
    if (Editor.isReservedPath(syncFile.localPath)) {
      _downloadQueue.addFirst(syncFile);
    } else {
      _downloadQueue.add(syncFile);
    }
  }

  /// Sorts [_downloadQueue] with the following order:
  /// - New files (non-empty files that we know nothing about)
  /// - Deleted files (that are not already deleted locally)
  /// - Files that we know were corrupted/failed to download previously
  static void _sortDownloadQueue() {
    final newFiles = <SyncFile>{};
    final deletedFiles = <SyncFile>{};
    final corruptedFiles = <SyncFile>{};

    final files = _downloadQueue.toSet();
    for (final file in files) {
      late final knownCorrupted = Prefs.fileSyncCorruptFiles.value.contains(file.localPath);
      late final deleted = (file.webDavFile!.size ?? 0) == 0;

      if (knownCorrupted) {
        corruptedFiles.add(file);
      } else if (deleted) {
        final alreadyDeleted = Prefs.fileSyncAlreadyDeleted.value.contains(file.localPath);
        if (!alreadyDeleted) deletedFiles.add(file);
      } else {
        newFiles.add(file);
      }
    }

    log.info(() => 'New files: ${newFiles.length}, deleted files: ${deletedFiles.length}, corrupted files: ${corruptedFiles.length}');
    log.fine(() => 'New files: ${newFiles.map((file) => file.localPath)}');
    log.fine(() => 'Deleted files: ${deletedFiles.map((file) => file.localPath)}');
    log.fine(() => 'Corrupted files: ${corruptedFiles.map((file) => file.localPath)}');

    _downloadQueue.clear();
    _downloadQueue.addAll(newFiles);
    _downloadQueue.addAll(deletedFiles);
    _downloadQueue.addAll(corruptedFiles);

    // forget un-deleted files that were previously deleted locally
    Prefs.fileSyncAlreadyDeleted.value.removeWhere((filePath) => !deletedFiles.any((file) => file.localPath == filePath));
    Prefs.fileSyncAlreadyDeleted.notifyListeners();
  }

  @visibleForTesting
  static Future<bool> downloadFile(SyncFile file, { bool awaitWrite = false }) async {
    if (file.webDavFile!.size == 0) { // deleted file
      FileManager.deleteFile(file.localPath);
      Prefs.fileSyncAlreadyDeleted.value.add(file.localPath);
      Prefs.fileSyncAlreadyDeleted.notifyListeners();
      return true;
    }

    final Uint8List encryptedDataBytes;
    try {
      encryptedDataBytes = await _client!.webdav.get(Uri.parse(file.remotePath));
    } on DynamiteApiException {
      return false;
    }

    final Encrypter encrypter = await _client!.encrypter;
    final IV iv = IV.fromBase64(Prefs.iv.value);

    try {
      final Uint8List decryptedData;
      if (file.localPath.endsWith(Editor.extensionOldJson)) {
        decryptedData = await workerManager.execute(
          () async {
            final String encrypted = utf8.decode(encryptedDataBytes.cast<int>());
            final String decrypted = encrypter.decrypt64(encrypted, iv: iv);
            return utf8.encode(decrypted) as Uint8List;
          },
          priority: WorkPriority.regular,
        );
      } else {
        decryptedData = await workerManager.execute(
          () async {
            final Encrypted encrypted = Encrypted(encryptedDataBytes);
            final List<int> decrypted = encrypter.decryptBytes(encrypted, iv: iv);
            return Uint8List.fromList(decrypted);
          },
          priority: WorkPriority.regular,
        );
      }
      assert(decryptedData.isNotEmpty, 'Decrypted data is empty but file.webDavFile!.size is ${file.webDavFile!.size}');
      FileManager.writeFile(file.localPath, decryptedData, awaitWrite: awaitWrite, alsoUpload: false);
      return true;
    } catch (e) {
      log.severe('Failed to download file ${file.localPath} (${file.remotePath}): $e', e);
      return false;
    }
  }

  /// Decides if the local or remote version of a file should be kept
  /// by comparing the last modified date of each file.
  static Future<bool> _shouldLocalFileBeKept(SyncFile file, {bool inUploadQueue = false}) async {
    // if local file doesn't exist, keep remote (unless we're "uploading" a file that we want to delete)
    if (!await FileManager.doesFileExist(file.localPath)) {
      return inUploadQueue;
    }

    // get remote file
    try {
      file.webDavFile ??= await _client!.webdav.propfind(
        Uri.parse(file.remotePath),
        depth: WebDavDepth.zero,
        prop: WebDavPropWithoutValues.fromBools(
          davgetlastmodified: true,
          davgetcontentlength: true,
        ),
      ).then((multistatus) => multistatus.toWebDavFiles().single);
    } catch (e) {
      // remote file doesn't exist; keep local
      return true;
    }

    // file exists locally, check if it's newer
    final DateTime? lastModifiedRemote = file.webDavFile!.lastModified;
    final DateTime lastModifiedLocal = await FileManager.lastModified(file.localPath);
    if (lastModifiedRemote != null && lastModifiedRemote.isAfter(lastModifiedLocal)) {
      // remote is newer; keep remote
      return false;
    } else {
      // local is newer; keep local
      return true;
    }
  }
}

class SyncFile {
  final String remotePath;
  final String localPath;
  WebDavFile? webDavFile;
  SyncFile({required this.remotePath, required this.localPath, this.webDavFile});
}

class CancellableStruct {
  bool cancelled = false;
}
