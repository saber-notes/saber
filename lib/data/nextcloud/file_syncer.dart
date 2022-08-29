
import 'dart:collection';
import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/file_manager.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';

class FileSyncer {

  /// A queue of file paths that need to be uploaded to Nextcloud
  static Queue<String> _uploadQueue = Queue();

  NextCloudClient? _client;

  bool _isUploadingFile = false;
  bool _isDisposed = false;

  static FileSyncer? Instance;
  FileSyncer(this._client) {
    Instance?.dispose();
    Instance = this;
  }

  /// Queues a file to be uploaded
  void addToUploadQueue(String filePath) {
    _uploadQueue.add(filePath);
    _uploadFileFromUploadQueue();
  }

  /// Picks the first filePath from [_uploadQueue] and uploads it
  void _uploadFileFromUploadQueue() async {
    if (_client == null || _isUploadingFile || _isDisposed) return;
    if (_uploadQueue.isEmpty) return;

    try {
      _isUploadingFile = true;

      final String filePathUnencrypted = _uploadQueue.removeFirst();

      final String? localDataUnencrypted = await FileManager.readFile(filePathUnencrypted);
      if (localDataUnencrypted == null) {
        if (kDebugMode) print("Failed to read file ${filePathUnencrypted} to upload");
        return;
      }

      final Encrypter encrypter = await _client!.encrypter;
      final IV iv = IV.fromBase64(Prefs.iv.value);
      final String filePathEncrypted = encrypter.encrypt(filePathUnencrypted, iv: iv).base64;
      final String filePathRemote = "${FileManager.appRootDirectoryPrefix}/$filePathEncrypted";
      final String localDataEncrypted = encrypter.encrypt(localDataUnencrypted!, iv: iv).base64;

      const Utf8Encoder encoder = Utf8Encoder();
      await _client!.webDav.upload(encoder.convert(localDataEncrypted), filePathRemote);
    } finally {
      _isUploadingFile = false;
      _uploadFileFromUploadQueue();
    }
  }

  /// Stops uploading files from [_uploadQueue]
  /// AFTER the current file has finished downloading.
  void dispose() {
    _isDisposed = true;
    Instance = null;
  }
}
