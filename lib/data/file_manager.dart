
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
      if (!prefs.containsKey(filePath)) await _addFileToIndex(filePath, prefs);
      writeFuture = prefs.setString(filePath, toWrite);
    } else {
      final File file = File(await _documentsDirectory + filePath);
      await _createFileDirectory(filePath);
      writeFuture = file.writeAsString(toWrite);
    }

    if (awaitWrite) await writeFuture;
  }

  /// Moves a file from [fromPath] to [toPath], returning its final path.
  static Future<String> moveFile(String fromPath, String toPath) async {
    fromPath = _sanitisePath(fromPath);
    toPath = _sanitisePath(toPath);

    if (!toPath.contains('/', 1)) { // if toPath is a file name, not a path
      toPath = fromPath.substring(0, fromPath.lastIndexOf('/') + 1) + toPath;
    }

    if (kIsWeb) {
      final prefs = await _prefs;
      await _addFileToIndex(toPath, prefs);
      await _removeFileFromIndex(fromPath, prefs);
      await prefs.setString(toPath, await readFile(fromPath) ?? "");
      await prefs.remove(fromPath);
    } else {
      final File fromFile = File(await _documentsDirectory + fromPath);
      final File toFile = File(await _documentsDirectory + toPath);
      await _createFileDirectory(toPath);
      await fromFile.rename(toFile.path);
    }

    return toPath;
  }

  static Future _removeFileFromIndex(String filePath, SharedPreferences prefs) async {
    final List<String> files = prefs.getStringList(fileIndexKey) ?? [];
    files.remove(filePath);
    await prefs.setStringList(fileIndexKey, files);
  }
  static Future _addFileToIndex(String filePath, SharedPreferences prefs) async {
    final List<String> files = prefs.getStringList(fileIndexKey) ?? [];
    if (files.contains(filePath)) return;
    files.add(filePath);
    await prefs.setStringList(fileIndexKey, files);
  }

  /// Creates the parent directories of filePath if they don't exist.
  static Future _createFileDirectory(String filePath) async {
    final String parentDirectory = filePath.substring(0, filePath.indexOf('/'));
    await Directory(await _documentsDirectory + parentDirectory).create(recursive: true);
  }

  static Future _saveFileAsRecentlyAccessed(String filePath) async {
    final prefs = await _prefs;

    final List<String> recentlyAccessed = prefs.getStringList(recentlyAccessedKey) ?? [];

    if (!recentlyAccessed.contains(filePath)) recentlyAccessed.insert(0, filePath);
    if (recentlyAccessed.length > maxRecentlyAccessedFiles) recentlyAccessed.removeLast();

    prefs.setStringList(recentlyAccessedKey, recentlyAccessed);
  }

  /// Shared preferences key for the list of recently accessed files.
  static const String recentlyAccessedKey = "recentlyAccessed";
  static const int maxRecentlyAccessedFiles = 30;
  /// Shared preferences key for the list of all files.
  static const String fileIndexKey = "fileIndex";
}
