import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:path_provider/path_provider.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'file_manager_nonweb.dart'
  if (dart.library.html) 'file_manager_web.dart';

/// A collection of cross-platform utility functions for working with a virtual file system.
class FileManager {
  // disable constructor
  FileManager._();

  static const String appRootDirectoryPrefix = "/Saber";
  static Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();
  static Future<String> get documentsDirectory async => (await getApplicationDocumentsDirectory()).path + appRootDirectoryPrefix;

  static final StreamController<FileOperation> fileWriteStream = StreamController.broadcast(
    onListen: () => _fileWriteStreamIsListening = true,
    onCancel: () => _fileWriteStreamIsListening = false,
  );
  static bool _fileWriteStreamIsListening = false;

  static String _sanitisePath(String path) => File(path).path;

  static Future<void> init() async {
    watchRootDirectory();
  }

  @visibleForTesting
  static Future<void> watchRootDirectory() async {
    // non-web only
  }

  @visibleForTesting
  static void broadcastFileWrite(FileOperationType type, String path) async {
    if (!_fileWriteStreamIsListening) return;

    if (path.endsWith(Editor.extension)) { // remove extension
      path = path.substring(0, path.length - Editor.extension.length);
    }

    fileWriteStream.add(FileOperation(type, path));
  }

  /// Returns the contents of the file at [filePath] as a String.
  static Future<String?> readFile(String filePath, {int retries = 3}) async {
    filePath = _sanitisePath(filePath);

    String? result = (await _prefs).getString(filePath);

    // If result is null, try again in case the file was locked.
    if (result == null && retries > 0) {
      await Future.delayed(const Duration(milliseconds: 100));
      return readFile(filePath, retries: retries - 1);
    }
    return result;
  }

  /// Writes [toWrite] to [filePath].
  static Future<void> writeFile(String filePath, String toWrite, { bool awaitWrite = false, bool alsoUpload = true }) async {
    filePath = _sanitisePath(filePath);

    await _saveFileAsRecentlyAccessed(filePath);

    final prefs = await _prefs;
    Future writeFuture = Future.wait({
      prefs.setString(filePath, toWrite),
      prefs.setInt(_lastModifiedPrefix + filePath, DateTime.now().millisecondsSinceEpoch),
    });

    afterWrite() {
      broadcastFileWrite(FileOperationType.write, filePath);
      if (alsoUpload) FileSyncer.addToUploadQueue(filePath);
    }

    writeFuture = writeFuture.then((_) => afterWrite());
    if (awaitWrite) await writeFuture;
  }

  static Future exportFile(String fileName, Uint8List bytes, {bool isImage = false}) async {
    return await fmExportFile(fileName, bytes, isImage: isImage);
  }

  /// Moves a file from [fromPath] to [toPath], returning its final path.
  ///
  /// If a file already exists at [toPath], [fromPath] will be suffixed with
  /// a number e.g. "file (1)". If [replaceExistingFile] is true, the existing
  /// file will be overwritten instead.
  static Future<String> moveFile(String fromPath, String toPath, [bool replaceExistingFile = false]) async {
    fromPath = _sanitisePath(fromPath);
    toPath = _sanitisePath(toPath);

    if (!toPath.contains('/', 1)) { // if toPath is a relative path
      toPath = fromPath.substring(0, fromPath.lastIndexOf('/') + 1) + toPath;
    }

    if (!replaceExistingFile) {
      toPath = await suffixFilePathToMakeItUnique(toPath, fromPath);
    }

    if (fromPath == toPath) return toPath;

    final prefs = await _prefs;
    await prefs.setString(toPath, await readFile(fromPath) ?? "");
    await prefs.remove(fromPath);

    FileSyncer.addToUploadQueue(fromPath);
    FileSyncer.addToUploadQueue(toPath);

    _renameReferences(fromPath, toPath);
    broadcastFileWrite(FileOperationType.delete, fromPath);
    broadcastFileWrite(FileOperationType.write, toPath);

    return toPath;
  }

  static Future deleteFile(String filePath, {bool alsoUpload = true}) async {
    filePath = _sanitisePath(filePath);

    final prefs = await _prefs;
    if (prefs.containsKey(filePath)) {
      await prefs.remove(filePath);
    } else {
      return;
    }

    if (alsoUpload) FileSyncer.addToUploadQueue(filePath);

    _removeReferences(filePath);
    broadcastFileWrite(FileOperationType.delete, filePath);
  }

  static Future<DirectoryChildren?> getChildrenOfDirectory(String directory) async {
    directory = _sanitisePath(directory);
    if (!directory.endsWith('/')) directory += '/';

    final Iterable<String> allChildren;
    final List<String> directories = [], files = [];

    final prefs = await _prefs;
    allChildren = prefs.getKeys()
    //  .where((String file) => file.startsWith('/')) // directory already starts with '/'
        .where((String file) => file.startsWith(directory)) // filter out other directories
        .where((String file) => !Editor.reservedFileNames.contains(file)) // filter out reserved file names
        .map((String file) => file.substring(directory.length)) // remove directory prefix
        .map((String file) => file.contains('/') ? file.substring(0, file.indexOf('/')) : file) // remove nested folder names
        .map((String file) => file.endsWith(Editor.extension) ? file.substring(0, file.length - Editor.extension.length) : file) // remove extension
        .toSet();

    await Future.wait(allChildren.map((child) async {
      if (await FileManager.isDirectory(directory + child)) {
        directories.add(child);
      } else {
        files.add(child);
      }
    }));

    return DirectoryChildren(directories, files);
  }

  static Future<List<String>> getRecentlyAccessed() async {
    await Prefs.recentFiles.waitUntilLoaded();
    return Prefs.recentFiles.value
        .map((String filePath) {
          if (filePath.endsWith(Editor.extension)) {
            return filePath.substring(0, filePath.length - Editor.extension.length);
          } else {
            return filePath;
          }
        })
        .where((String file) => !Editor.reservedFileNames.contains(file)) // filter out reserved file names
        .toList();
  }

  /// Returns whether the [filePath] is a directory or file.
  /// Behaviour is undefined if [filePath] is not a valid path.
  static Future<bool> isDirectory(String filePath) async {
    filePath = _sanitisePath(filePath);
    final prefs = await _prefs;
    return !prefs.containsKey(filePath + Editor.extension);
  }

  static Future<bool> doesFileExist(String filePath) async {
    filePath = _sanitisePath(filePath);
    final prefs = await _prefs;
    return prefs.containsKey(filePath);
  }

  static Future<DateTime> lastModified(String filePath) async {
    filePath = _sanitisePath(filePath);
    final prefs = await _prefs;
    int? date = prefs.getInt(_lastModifiedPrefix + filePath);
    if (date == null) return DateTime(2022, 09, 09); // date when lastModifiedPrefix was introduced
    return DateTime.fromMillisecondsSinceEpoch(date);
  }

  static Future<String> newFilePath([String parentPath = "/"]) async {
    assert(parentPath.endsWith('/'));

    final DateTime now = DateTime.now();
    final String filePath = "$parentPath${DateFormat("yy-MM-dd").format(now)} Untitled";

    return await suffixFilePathToMakeItUnique(filePath);
  }

  /// Returns a unique file path by appending a number to the end of the [filePath].
  /// e.g. "/Untitled" -> "/Untitled (2)"
  ///
  /// Providing a [currentPath] means that e.g. "/Untitled (2)" being renamed
  /// to "/Untitled" will be returned as "/Untitled (2)" not "/Untitled (3)".
  @visibleForTesting
  static Future<String> suffixFilePathToMakeItUnique(String filePath, [String? currentPath]) async {
    String newFilePath = filePath;
    bool hasExtension = false;

    if (filePath.endsWith(Editor.extension)) {
      filePath = filePath.substring(0, filePath.length - Editor.extension.length);
      newFilePath = filePath;
      hasExtension = true;
    }

    int i = 1;
    while (await doesFileExist(newFilePath + Editor.extension) && newFilePath + Editor.extension != currentPath) {
      i++;
      newFilePath = "$filePath ($i)";
    }

    return newFilePath + (hasExtension ? Editor.extension : "");
  }

  static Future _renameReferences(String fromPath, String toPath) async {
    // rename file in recently accessed
    bool replaced = false;
    for (int i = 0; i < Prefs.recentFiles.value.length; i++) {
      if (Prefs.recentFiles.value[i] != fromPath) continue;
      if (!replaced) {
        Prefs.recentFiles.value[i] = toPath;
        replaced = true;
      } else {
        Prefs.recentFiles.value.removeAt(i);
      }
    }
    Prefs.recentFiles.notifyListeners();
  }
  static Future _removeReferences(String filePath) async {
    // remove file from recently accessed
    for (int i = 0; i < Prefs.recentFiles.value.length; i++) {
      if (Prefs.recentFiles.value[i] != filePath) continue;
      Prefs.recentFiles.value.removeAt(i);
    }
    Prefs.recentFiles.notifyListeners();
  }

  static Future _saveFileAsRecentlyAccessed(String filePath) async {
    Prefs.recentFiles.value.remove(filePath);
    Prefs.recentFiles.value.insert(0, filePath);
    if (Prefs.recentFiles.value.length > maxRecentlyAccessedFiles) Prefs.recentFiles.value.removeLast();

    Prefs.recentFiles.notifyListeners();
  }

  static const int maxRecentlyAccessedFiles = 30;
  /// [prefs.getInt(lastModifiedPrefix + filePath)] gives you the date it was last modified,
  /// in milliseconds since epoch.
  static const String _lastModifiedPrefix = "date";
}

class DirectoryChildren {
  final List<String> directories;
  final List<String> files;

  DirectoryChildren(this.directories, this.files);

  bool onlyOneChild() => directories.length + files.length <= 1;

  bool get isEmpty => directories.isEmpty && files.isEmpty;
}

enum FileOperationType {
  write,
  delete,
}
class FileOperation {
  final FileOperationType type;
  final String filePath;

  const FileOperation(this.type, this.filePath);
}
