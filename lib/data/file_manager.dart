
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A collection of cross-platform utility functions for working with a virtual file system.
abstract class FileManager {
  static Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();
  static Future<String> get _documentsDirectory async => "${(await getApplicationDocumentsDirectory()).path}/Saber";

  static String _sanitisePath(String path) => File(path).path;

  /// Returns the contents of the file at [filePath] as a String.
  static Future<String?> readFile(String filePath) async {
    filePath = _sanitisePath(filePath);

    String? result;
    if (kIsWeb) {
      result = (await _prefs).getString(filePath);
    } else {
      final File file = File(await _documentsDirectory + filePath);
      if (await file.exists()) {
        result = await file.readAsString(encoding: utf8);
        if (result.isEmpty) result = null;
      }
    }
    return result;
  }

  /// Writes [toWrite] to [filePath].
  static Future<void> writeFile(String filePath, String toWrite, [ bool awaitWrite = false ]) async {
    filePath = _sanitisePath(filePath);

    await _saveFileAsRecentlyAccessed(filePath);

    final Future writeFuture;
    if (kIsWeb) {
      final prefs = await _prefs;
      await _webRecordFileDirectories(filePath, prefs);
      writeFuture = prefs.setString(filePath, toWrite);
    } else {
      final File file = File(await _documentsDirectory + filePath);
      await _createFileDirectory(filePath);
      writeFuture = file.writeAsString(toWrite);
    }

    if (awaitWrite) await writeFuture;
  }

  /// Records the path to the file as a nested dictionary.
  /// This lets us simulate a file system on the web.
  static Future _webRecordFileDirectories(String filePath, SharedPreferences prefs) async {
    final List<String> pathParts = filePath.split('/');
    String currentPath = ""; // either a directory or the specified filePath
    String parentDirectory = "/";
    for (int i = 1; i < pathParts.length; i++) {  // i=1 to skip the leading slash
      currentPath += "/${pathParts[i]}";

      final String prefix = i == pathParts.length - 1 ? filePrefix : directoryPrefix;
      final String entry = prefix + currentPath;

      final String? siblingsStr = prefs.getString(parentDirectory);
      final List<String> siblings = siblingsStr != null ? json.decode(siblingsStr) : [];
      if (!siblings.contains(entry)) siblings.add(entry);
      prefs.setString(parentDirectory, json.encode(siblings));

      parentDirectory = currentPath;
    }
  }

  /// Creates the parent directories of filePath if they don't exist.
  static Future _createFileDirectory(String filePath) async {
    final String parentDirectory = filePath.substring(0, filePath.indexOf('/'));
    await Directory(await _documentsDirectory + parentDirectory).create(recursive: true);
  }

  static Future _saveFileAsRecentlyAccessed(String filePath) async {
    final prefs = await _prefs;

    final String entry = filePrefix + filePath;

    final String? recentlyAccessedStr = prefs.getString(recentlyAccessedKey);
    final List<String> recentlyAccessed = recentlyAccessedStr != null ? json.decode(recentlyAccessedStr) : [];

    if (!recentlyAccessed.contains(entry)) recentlyAccessed.insert(0, entry);
    if (recentlyAccessed.length > maxRecentlyAccessedFiles) recentlyAccessed.removeLast();

    prefs.setString(recentlyAccessedKey, json.encode(recentlyAccessed));
  }

  /// Shared preferences key for the list of recently accessed files.
  static const String recentlyAccessedKey = "recentlyAccessed";
  static const int maxRecentlyAccessedFiles = 30;

  /// Prefix directories in _webRecordFileDirectories to distinguish from files
  static const String directoryPrefix = 'd';
  /// Prefix files in _webRecordFileDirectories to distinguish from directories
  static const String filePrefix = 'f';
}
