
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:saber/pages/editor/editor.dart';
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
      if (await fromFile.exists()) await fromFile.rename(toFile.path);
    }

    _renameReferences(fromPath, toPath);

    return toPath;
  }

  static Future<DirectoryChildren?> getChildrenOfDirectory(String directory) async {
    directory = _sanitisePath(directory);
    if (!directory.endsWith('/')) directory += '/';

    final Iterable<String> allChildren;
    final List<String> directories = [], files = [];

    if (kIsWeb) {
      final prefs = await _prefs;

      List<String>? fileIndex = prefs.getStringList(fileIndexKey);
      if (fileIndex == null) return null;

      allChildren = fileIndex
          .where((String file) => file.startsWith(directory)) // filter out other directories
          .map((String file) => file.substring(directory.length)) // remove directory prefix
          .map((String file) => file.contains('/') ? file.substring(0, file.indexOf('/')) : file) // remove nested folder names
          .map((String file) => file.endsWith(Editor.extension) ? file.substring(0, file.length - Editor.extension.length) : file) // remove extension
          .toSet();
    } else {
      final String documentsDirectory = await _documentsDirectory;
      final Directory dir = Directory(documentsDirectory + directory);
      if (!await dir.exists()) return null;

      int pathEndIndex = documentsDirectory.length + (directory.endsWith('/') ? directory.length : directory.length + 1);
      allChildren = await dir.list().map(
        (FileSystemEntity entity) {
          String filename = entity.path.substring(pathEndIndex);
          if (filename.endsWith(Editor.extension)) filename = filename.substring(0, filename.length - Editor.extension.length);
          return filename;
        }
      ).toList();
    }

    await Future.wait(allChildren.map((child) async {
      if (await FileManager.isDirectory(directory + child)) {
        directories.add(child);
      } else {
        files.add(child);
      }
    }));

    return DirectoryChildren(directories, files);
  }

  static Future<List<String>?> getRecentlyAccessed() async {
    final prefs = await _prefs;
    List<String>? recentlyAccessed = prefs.getStringList(recentlyAccessedKey);
    if (recentlyAccessed == null) return null;
    return recentlyAccessed.map((String filePath) {
      if (filePath.endsWith(Editor.extension)) {
        return filePath.substring(0, filePath.length - Editor.extension.length);
      } else {
        return filePath;
      }
    }).toList();
  }

  /// Returns whether the [filePath] is a directory or file.
  /// Behaviour is undefined if [filePath] is not a valid path.
  static Future<bool> isDirectory(String filePath) async {
    filePath = _sanitisePath(filePath);
    if (kIsWeb) {
      final prefs = await _prefs;
      return !prefs.containsKey(filePath + Editor.extension);
    } else {
      final Directory directory = Directory(await _documentsDirectory + filePath);
      return await directory.exists();
    }
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
    final String parentDirectory = filePath.substring(0, filePath.lastIndexOf('/'));
    await Directory(await _documentsDirectory + parentDirectory).create(recursive: true);
  }

  static Future _renameReferences(String fromPath, String toPath) async {
    // rename file in recently accessed
    final prefs = await _prefs;
    final List<String> recentlyAccessed = prefs.getStringList(recentlyAccessedKey) ?? [];
    bool replaced = false;
    for (int i = 0; i < recentlyAccessed.length; i++) {
      if (recentlyAccessed[i] != fromPath) continue;
      if (!replaced) {
        recentlyAccessed[i] = toPath;
        replaced = true;
      } else {
        recentlyAccessed.removeAt(i);
      }
    }
    await prefs.setStringList(recentlyAccessedKey, recentlyAccessed);
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

class DirectoryChildren {
  final List<String> directories;
  final List<String> files;

  DirectoryChildren(this.directories, this.files);

  bool onlyOneChild() => directories.length + files.length <= 1;

  bool get isEmpty => directories.isEmpty && files.isEmpty;
}
