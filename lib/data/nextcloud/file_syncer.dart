
import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/file_manager.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

abstract class FileSyncer {

  /// the file extension of an encrypted base64 note
  static const String _encExtension = ".sbe";

  static EncPref<List<String>> get _uploadQueue => Prefs.fileSyncUploadQueue;
  static final Queue<RemoteFile> _downloadQueue = Queue();

  static NextCloudClient? _client;

  static bool _isUploadingFile = false;

  static final ValueNotifier<int?> filesDone = ValueNotifier<int?>(null);
  static int get filesToSync => _uploadQueue.value.length + _downloadQueue.length;

  static void startDownloads() async {
    _client ??= await NextCloudClientExtension.withSavedDetails();
    if (_client == null) return;

    // Get list of remote files from server
    List<WebDavFile> remoteFiles = await _client!.webDav.ls(
        FileManager.appRootDirectoryPrefix,
        props: {WebDavProps.davLastModified}
    );

    // Add each file to download queue if needed
    await Future.wait(remoteFiles.map((WebDavFile file) => _addToDownloadQueue(file)));
    filesDone.value = 0;

    // Start downloading files one by one
    while (_downloadQueue.isNotEmpty) {
      final RemoteFile file = _downloadQueue.removeFirst();
      await _downloadFile(file);
      if (filesDone.value != null) {
        filesDone.value = filesDone.value! + 1;
      }
    }
  }

  /// Queues a file to be uploaded
  static void addToUploadQueue(String filePath) {
    if (_uploadQueue.value.contains(filePath)) return; // don't add it again
    _uploadQueue.value.add(filePath);
    _uploadQueue.notifyListeners();
    _uploadFileFromQueue();
  }

  /// Picks the first filePath from [_uploadQueue] and uploads it
  static Future _uploadFileFromQueue() async {
    if (_isUploadingFile) return;
    if (_uploadQueue.value.isEmpty) return;

    _client ??= await NextCloudClientExtension.withSavedDetails();
    if (_client == null) return;

    try {
      _isUploadingFile = true;

      final String filePathUnencrypted = _uploadQueue.value.removeAt(0);
      _uploadQueue.notifyListeners();

      // try 3 times to read file (may fail because file is locked by another process/thread)
      String? localDataUnencrypted;
      for (int i = 0; i < 3; ++i) {
        if (i > 0) await Future.delayed(const Duration(milliseconds: 100));
        localDataUnencrypted = await FileManager.readFile(filePathUnencrypted);
        if (localDataUnencrypted != null) break;
      }
      if (localDataUnencrypted == null) {
        if (kDebugMode) print("Failed to read file $filePathUnencrypted to upload");
        return;
      }

      final Encrypter encrypter = await _client!.encrypter;
      final IV iv = IV.fromBase64(Prefs.iv.value);
      final String filePathEncrypted = encrypter.encrypt(filePathUnencrypted, iv: iv).base16;
      final String filePathRemote = "${FileManager.appRootDirectoryPrefix}/$filePathEncrypted$_encExtension";
      final String localDataEncrypted = encrypter.encrypt(localDataUnencrypted, iv: iv).base64;

      const Utf8Encoder encoder = Utf8Encoder();
      await _client!.webDav.upload(encoder.convert(localDataEncrypted), filePathRemote);
    } finally {
      _isUploadingFile = false;
      _uploadFileFromQueue();
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
      if (kDebugMode) print("remote file not in app root: $filePathEncrypted");
      return;
    }

    // remove extension
    if (filePathEncrypted.endsWith(_encExtension)) {
      filePathEncrypted = filePathEncrypted.substring(0, filePathEncrypted.length - _encExtension.length);
    } else {
      if (kDebugMode) print("remote file not in recognised encrypted format: $filePathRemote");
      return;
    } // todo: also sync config.sbc

    // decrypt file path
    final String filePathUnencrypted = encrypter.decrypt16(filePathEncrypted, iv: iv);

    // if file doesn't exist locally, download it
    if (!await FileManager.doesFileExist(filePathUnencrypted)) {
      return _downloadQueue.add(RemoteFile(
        remotePath: filePathRemote,
        localPath: filePathUnencrypted,
      ));
    }

    // file exists locally, check if it's newer
    final DateTime lastModifiedRemote = file.lastModified;
    final DateTime lastModifiedLocal = await FileManager.lastModified(filePathUnencrypted);
    if (lastModifiedRemote.isAfter(lastModifiedLocal)) {
      return _downloadQueue.add(RemoteFile(
        remotePath: filePathRemote,
        localPath: filePathUnencrypted,
      ));
    }
  }

  static Future _downloadFile(RemoteFile file) async {
    final Uint8List encryptedDataEncoded = await _client!.webDav.download(file.remotePath);
    final String encryptedData = utf8.decode(encryptedDataEncoded);

    final Encrypter encrypter = await _client!.encrypter;
    final IV iv = IV.fromBase64(Prefs.iv.value);

    final String decryptedData = encrypter.decrypt64(encryptedData, iv: iv);

    FileManager.writeFile(file.localPath, decryptedData, alsoUpload: false);
  }
}

class RemoteFile {
  final String remotePath;
  final String localPath;
  RemoteFile({required this.remotePath, required this.localPath});
}
