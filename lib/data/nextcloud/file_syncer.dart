import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

abstract class FileSyncer {

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

    if (_client?.username != Prefs.username.value) _client = null;
    _client ??= NextcloudClientExtension.withSavedDetails();
    if (_client == null) return;

    // Get list of remote files from server
    List<WebDavFile> remoteFiles;
    try {
      remoteFiles = await _client!.webdav.ls(
          FileManager.appRootDirectoryPrefix,
          props: {WebDavProps.davLastModified.name, WebDavProps.davContentLength.name}
      );
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
        } else {
          failedFiles.add(file);
        }
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

    if (_client?.username != Prefs.username.value) _client = null;
    _client ??= NextcloudClientExtension.withSavedDetails();
    if (_client == null) return;

    final String filePathUnencrypted = _uploadQueue.value.removeFirst();
    _uploadQueue.notifyListeners();

    try {
      _isUploadingFile = true;

      final Encrypter encrypter = await _client!.encrypter;
      final IV iv = IV.fromBase64(Prefs.iv.value);
      final String filePathEncrypted = encrypter.encrypt(filePathUnencrypted, iv: iv).base16;
      final String filePathRemote = '${FileManager.appRootDirectoryPrefix}/$filePathEncrypted$encExtension';

      final syncFile = SyncFile(remotePath: filePathRemote, localPath: filePathUnencrypted);
      if (!await _shouldLocalFileBeKept(syncFile, inUploadQueue: true)) {
        // remote file is newer; download it instead
        _downloadQueue.add(syncFile);
        return;
      }

      final String localDataEncrypted;
      if (await FileManager.doesFileExist(filePathUnencrypted)) {
        String? localDataUnencrypted = await FileManager.readFile(filePathUnencrypted);
        if (localDataUnencrypted == null) {
          if (kDebugMode) print('Failed to read file $filePathUnencrypted to upload');
          return;
        }
        localDataEncrypted = encrypter.encrypt(localDataUnencrypted, iv: iv).base64;
      } else {
        localDataEncrypted = deletedFileDummyContent;
      }

      const Utf8Encoder encoder = Utf8Encoder();
      final WebDavClient webdav = _client!.webdav;

      DateTime lastModified;
      try {
        lastModified = await FileManager.lastModified(filePathUnencrypted);
      } on FileSystemException {
        lastModified = DateTime.now();
      }

      // upload file
      await webdav.upload(
        encoder.convert(localDataEncrypted),
        filePathRemote,
        lastModified: lastModified,
      );
    } on SocketException { // network error
      _uploadQueue.value.add(filePathUnencrypted);
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      _isUploadingFile = false;
      uploadNotifier.notifyListeners();
      uploadFileFromQueue();
    }
  }

  static Future _addToDownloadQueue(WebDavFile file) async {
    final Encrypter encrypter = await _client!.encrypter;
    final IV iv = IV.fromBase64(Prefs.iv.value);

    final String filePathRemote = file.path;
    String filePathEncrypted = filePathRemote;

    // remove parent directory from path
    if (filePathEncrypted.startsWith(FileManager.appRootDirectoryPrefix)) {
      // with the leading slash; remove "/Saber/"
      filePathEncrypted = filePathEncrypted.substring(FileManager.appRootDirectoryPrefix.length + 1);
    } else if (filePathEncrypted.startsWith(FileManager.appRootDirectoryPrefix.substring(1))) {
      // without the leading slash; remove "Saber/"
      filePathEncrypted = filePathEncrypted.substring(FileManager.appRootDirectoryPrefix.length);
    } else {
      if (kDebugMode) print('remote file not in app root: $filePathEncrypted');
      return;
    }

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
      if (kDebugMode) print('remote file not in recognised encrypted format: $filePathRemote');
      return;
    } // todo: also sync config.sbc

    // decrypt file path
    final String filePathUnencrypted = encrypter.decrypt16(filePathEncrypted, iv: iv);

    final syncFile = SyncFile(
      remotePath: filePathRemote,
      localPath: filePathUnencrypted,
      webDavFile: file,
    );
    if (await _shouldLocalFileBeKept(syncFile)) return;
    if (Editor.reservedFileNames.contains(syncFile.localPath)) {
      _downloadQueue.addFirst(syncFile);
    } else {
      _downloadQueue.add(syncFile);
    }
  }

  /// Sorts [_downloadQueue] so that deleted files are at the end.
  /// Also filters out already-deleted files
  static void _sortDownloadQueue() {
    // list of remotely deleted files
    final emptyFiles = _downloadQueue.where((SyncFile file) => (file.webDavFile!.size ?? 0) == 0).toList(growable: false);

    // move empty files to end of queue, or remove them if they are already deleted locally
    for (final SyncFile file in emptyFiles) {
      bool alreadyDeleted = Prefs.fileSyncAlreadyDeleted.value.contains(file.localPath);
      _downloadQueue.remove(file);
      if (!alreadyDeleted) _downloadQueue.add(file);
    }

    // forget un-deleted files that were previously deleted locally
    Prefs.fileSyncAlreadyDeleted.value.removeWhere((filePath) => !Prefs.fileSyncAlreadyDeleted.value.contains(filePath));
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

    final Uint8List encryptedDataEncoded;
    try {
      encryptedDataEncoded = await _client!.webdav.download(file.remotePath);
    } on NextcloudApiException {
      return false;
    }

    final Encrypter encrypter = await _client!.encrypter;
    final IV iv = IV.fromBase64(Prefs.iv.value);

    try {
      final String encryptedDataBytesJson = utf8.decode(encryptedDataEncoded); // formatted weirdly e.g. [57, 2, 3, ...][128, 0, 13, ...][...]
      final List<dynamic> encryptedDataBytes = jsonDecode(encryptedDataBytesJson.replaceAll('][', ','));
      final String encryptedData = utf8.decode(encryptedDataBytes.cast<int>());
      final String decryptedData = encrypter.decrypt64(encryptedData, iv: iv);
      FileManager.writeFile(file.localPath, decryptedData, awaitWrite: awaitWrite, alsoUpload: false);
      return true;
    } catch (e) {
      if (kDebugMode) print('Failed to download file ${file.localPath} ${file.remotePath}');
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
      file.webDavFile ??= (await _client!.webdav.ls(
        file.remotePath,
        props: {WebDavProps.davLastModified.name, WebDavProps.davContentLength.name}
      ))[0];
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
