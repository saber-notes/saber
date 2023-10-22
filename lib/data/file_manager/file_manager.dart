import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_save/image_save.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saber/components/home/preview_card.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:share_plus/share_plus.dart';

/// A collection of cross-platform utility functions for working with a virtual file system.
class FileManager {
  // disable constructor
  FileManager._();

  static final log = Logger('FileManager');

  static const String appRootDirectoryPrefix = 'Saber';
  @visibleForTesting
  static Future<String> get documentsDirectory async => '${(await getApplicationDocumentsDirectory()).path}/$appRootDirectoryPrefix';

  static final StreamController<FileOperation> fileWriteStream = StreamController.broadcast(
    onListen: () => _fileWriteStreamIsListening = true,
    onCancel: () => _fileWriteStreamIsListening = false,
  );
  static bool _fileWriteStreamIsListening = false;

  static String _sanitisePath(String path) => File(path).path;

  static Future<void> init() async {
    await watchRootDirectory();
  }

  @visibleForTesting
  static Future<void> watchRootDirectory() async {
    Directory rootDir = Directory(await documentsDirectory);
    await rootDir.create(recursive: true);
    rootDir.watch(recursive: true).listen((FileSystemEvent event) {
      final type = event.type == FileSystemEvent.create
          || event.type == FileSystemEvent.modify
          || event.type == FileSystemEvent.move
          ? FileOperationType.write
          : FileOperationType.delete;
      String path = event.path
          .replaceAll('\\', '/')
          // The path may or may not be relative,
          // so remove the root directory path to make sure it's relative.
          .replaceFirst(rootDir.path, '');
      broadcastFileWrite(type, path);
    });
  }

  @visibleForTesting
  static void broadcastFileWrite(FileOperationType type, String path) async {
    if (!_fileWriteStreamIsListening) return;

    // remove extension
    if (path.endsWith(Editor.extension)) {
      path = path.substring(0, path.length - Editor.extension.length);
    } else if (path.endsWith(Editor.extensionOldJson)) {
      path = path.substring(0, path.length - Editor.extensionOldJson.length);
    }

    fileWriteStream.add(FileOperation(type, path));
  }

  /// Returns the contents of the file at [filePath].
  static Future<Uint8List?> readFile(String filePath, {int retries = 3}) async {
    filePath = _sanitisePath(filePath);

    Uint8List? result;
    final File file = File(await documentsDirectory + filePath);
    if (file.existsSync()) {
      result = await file.readAsBytes();
      if (result.isEmpty) result = null;
    } else {
      retries = 0; // don't retry if the file doesn't exist
    }

    // If result is null, try again in case the file was locked.
    if (result == null && retries > 0) {
      await Future.delayed(const Duration(milliseconds: 100));
      return readFile(filePath, retries: retries - 1);
    }
    return result;
  }

  /// Writes [toWrite] to [filePath].
  static Future<void> writeFile(String filePath, List<int> toWrite, { bool awaitWrite = false, bool alsoUpload = true }) async {
    filePath = _sanitisePath(filePath);
    log.fine('Writing to $filePath');

    await _saveFileAsRecentlyAccessed(filePath);

    final documentsDirectory = await FileManager.documentsDirectory;
    final File file = File('$documentsDirectory$filePath');
    await _createFileDirectory(filePath);
    Future writeFuture = Future.wait([
      file.writeAsBytes(toWrite),

      // if we're using a new format, also delete the old file
      if (filePath.endsWith(Editor.extension))
        File(
          '$documentsDirectory'
          '${filePath.substring(0, filePath.length - Editor.extension.length)}'
          '${Editor.extensionOldJson}'
        )
            .delete()
            // ignore if the file doesn't exist
            .catchError((_) => File(''), test: (e) => e is PathNotFoundException),
    ]);

    void afterWrite() {
      broadcastFileWrite(FileOperationType.write, filePath);
      if (alsoUpload) FileSyncer.addToUploadQueue(filePath);
      if (filePath.endsWith(Editor.extension)) {
        _removeReferences(
          '${filePath.substring(0, filePath.length - Editor.extension.length)}'
          '${Editor.extensionOldJson}'
        );
      }
    }

    writeFuture = writeFuture.then((_) => afterWrite());
    if (awaitWrite) await writeFuture;
  }

  static Future<void> createFolder(String folderPath) async {
    folderPath = _sanitisePath(folderPath);

    final Directory dir = Directory(await documentsDirectory + folderPath);
    await dir.create(recursive: true);
  }

  static Future exportFile(String fileName, Uint8List bytes, {bool isImage = false}) async {
    File? tempFile;
    Future<File> getTempFile() async {
      final String tempFolder = (await getTemporaryDirectory()).path;
      final File file = File('$tempFolder/$fileName');
      await file.writeAsBytes(bytes);
      return file;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      if (isImage) { // save image to gallery
        await ImageSave.saveImage(
          bytes,
          fileName,
          albumName: 'Saber',
        );
      } else { // share file
        tempFile = await getTempFile();
        await Share.shareXFiles([XFile(tempFile.path)]);
      }
    } else { // desktop, open save-as dialog
      String? outputFile = await FilePicker.platform.saveFile(
        fileName: fileName,
        initialDirectory: (await getDownloadsDirectory())?.path,
        allowedExtensions: [fileName.split('.').last],
      );
      if (outputFile != null) {
        File file = File(outputFile);
        await file.writeAsBytes(bytes);
      }
    }

    // delete temp file if it isn't null
    await tempFile?.delete();
  }

  /// Moves a file from [fromPath] to [toPath], returning its final path.
  ///
  /// If a file already exists at [toPath], [fromPath] will be suffixed with
  /// a number e.g. "file (1)". If [replaceExistingFile] is true, the existing
  /// file will be overwritten instead.
  ///
  /// If [replaceExistingFile] is true but the file is a reserved file name,
  /// the filename will be suffixed with a number instead
  /// (like if [replaceExistingFile] was false).
  static Future<String> moveFile(String fromPath, String toPath, [bool replaceExistingFile = false]) async {
    fromPath = _sanitisePath(fromPath);
    toPath = _sanitisePath(toPath);

    if (!toPath.contains('/')) { // if toPath is a relative path
      toPath = fromPath.substring(0, fromPath.lastIndexOf('/') + 1) + toPath;
    }

    if (!replaceExistingFile || Editor.isReservedPath(toPath)) {
      toPath = await suffixFilePathToMakeItUnique(toPath, false, fromPath);
    }

    if (fromPath == toPath) return toPath;

    final File fromFile = File(await documentsDirectory + fromPath);
    final File toFile = File(await documentsDirectory + toPath);
    await _createFileDirectory(toPath);
    if (fromFile.existsSync()) {
      await fromFile.rename(toFile.path);
    } else {
      log.warning('Tried to move non-existent file from $fromPath to $toPath');
    }

    FileSyncer.addToUploadQueue(fromPath);
    FileSyncer.addToUploadQueue(toPath);

    _renameReferences(fromPath, toPath);
    broadcastFileWrite(FileOperationType.delete, fromPath);
    broadcastFileWrite(FileOperationType.write, toPath);

    return toPath;
  }

  static Future deleteFile(String filePath, {bool alsoUpload = true}) async {
    filePath = _sanitisePath(filePath);

    final File file = File(await documentsDirectory + filePath);
    if (!file.existsSync()) return;
    await file.delete();

    if (alsoUpload) FileSyncer.addToUploadQueue(filePath);

    _removeReferences(filePath);
    broadcastFileWrite(FileOperationType.delete, filePath);
  }

  static Future renameDirectory(String directoryPath, String newName) async {
    directoryPath = _sanitisePath(directoryPath);

    final documentsDirectory = await FileManager.documentsDirectory;

    final Directory directory = Directory(documentsDirectory + directoryPath);
    if (!directory.existsSync()) return;

    /// recursively find children of [directory] for [_renameReferences]
    final List<String> children = [];
    await for (final entity in directory.list(recursive: true)) {
      if (entity is File) {
        children.add(entity.path.substring(directory.path.length));
      }
    }

    final String newPath = directoryPath.substring(0, directoryPath.lastIndexOf('/') + 1) + newName;
    await directory.rename(documentsDirectory + newPath);

    for (final child in children) {
      _renameReferences(directoryPath + child, newPath + child);
      broadcastFileWrite(FileOperationType.delete, directoryPath + child);
      broadcastFileWrite(FileOperationType.write, newPath + child);
    }
  }

  static Future deleteDirectory(String directoryPath, [bool recursive = true]) async {
    directoryPath = _sanitisePath(directoryPath);

    final Directory directory = Directory(await documentsDirectory + directoryPath);
    if (!directory.existsSync()) return;

    if (recursive) {
      // call [deleteFile] on all files that are descendants of the directory
      await for (final entity in directory.list(recursive: true)) {
        if (entity is File) {
          await deleteFile(entity.path.substring((await documentsDirectory).length));
        }
      }
    }

    await directory.delete(recursive: recursive);
  }

  static Future<DirectoryChildren?> getChildrenOfDirectory(String directory) async {
    directory = _sanitisePath(directory);
    if (!directory.endsWith('/')) directory += '/';

    final Iterable<String> allChildren;
    final List<String> directories = [], files = [];

    final String documentsDirectory = await FileManager.documentsDirectory;
    final Directory dir = Directory(documentsDirectory + directory);
    if (!dir.existsSync()) return null;

    int directoryPrefixLength = directory.endsWith('/') ? directory.length : directory.length + 1; // +1 for the trailing slash
    allChildren = await dir.list()
      .map((FileSystemEntity entity) {
        String filePath = entity.path.substring(documentsDirectory.length);

        // remove extension
        if (filePath.endsWith(Editor.extension)) {
          filePath = filePath.substring(0, filePath.length - Editor.extension.length);
        } else if (filePath.endsWith(Editor.extensionOldJson)) {
          filePath = filePath.substring(0, filePath.length - Editor.extensionOldJson.length);
        }

        if (Editor.isReservedPath(filePath)) return null; // filter out reserved files

        return filePath.substring(directoryPrefixLength); // remove directory prefix
      })
      .where((String? file) => file != null)
      .cast<String>()
      .toList();

    await Future.wait(allChildren.map((child) async {
      if (await FileManager.isDirectory(directory + child) && !directories.contains(child)) {
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
          } else if (filePath.endsWith(Editor.extensionOldJson)) {
            return filePath.substring(0, filePath.length - Editor.extensionOldJson.length);
          } else {
            return filePath;
          }
        })
        .where((String file) => !Editor.isReservedPath(file)) // filter out reserved file names
        .toList();
  }

  /// Returns whether the [filePath] is a directory or file.
  /// Behaviour is undefined if [filePath] is not a valid path.
  static Future<bool> isDirectory(String filePath) async {
    filePath = _sanitisePath(filePath);
    final Directory directory = Directory(await documentsDirectory + filePath);
    return directory.existsSync();
  }

  static Future<bool> doesFileExist(String filePath) async {
    filePath = _sanitisePath(filePath);
    final File file = File(await documentsDirectory + filePath);
    return file.existsSync();
  }

  static Future<DateTime> lastModified(String filePath) async {
    filePath = _sanitisePath(filePath);
    final File file = File(await documentsDirectory + filePath);
    return file.lastModifiedSync();
  }

  static Future<String> newFilePath([String parentPath = '/']) async {
    assert(parentPath.endsWith('/'));

    final DateTime now = DateTime.now();
    final String filePath = '$parentPath${DateFormat("yy-MM-dd").format(now)} '
        '${t.editor.untitled}';

    return await suffixFilePathToMakeItUnique(filePath, false);
  }

  /// Returns a unique file path by appending a number to the end of the [filePath].
  /// e.g. "/Untitled" -> "/Untitled (2)"
  ///
  /// Providing a [currentPath] means that e.g. "/Untitled (2)" being renamed
  /// to "/Untitled" will be returned as "/Untitled (2)" not "/Untitled (3)".
  /// 
  /// If [currentPath] is provided, it must
  /// end with [Editor.extension] or [Editor.extensionOldJson].
  static Future<String> suffixFilePathToMakeItUnique(String filePath, bool useOldExtension, [String? currentPath]) async {
    String newFilePath = filePath;
    bool hasExtension = false;

    if (filePath.endsWith(Editor.extension)) {
      filePath = filePath.substring(0, filePath.length - Editor.extension.length);
      newFilePath = filePath;
      hasExtension = true;
    } else if (filePath.endsWith(Editor.extensionOldJson)) {
      filePath = filePath.substring(0, filePath.length - Editor.extensionOldJson.length);
      newFilePath = filePath;
      hasExtension = true;
    }

    int i = 1;
    while (true) {
      if (
        !await doesFileExist(newFilePath + Editor.extension) &&
        !await doesFileExist(newFilePath + Editor.extensionOldJson)
      ) break;
      if (newFilePath + Editor.extension == currentPath) break;
      if (newFilePath + Editor.extensionOldJson == currentPath) break;
      i++;
      newFilePath = '$filePath ($i)';
    }

    if (useOldExtension) {
      return newFilePath + (hasExtension ? Editor.extensionOldJson : '');
    }
    return newFilePath + (hasExtension ? Editor.extension : '');
  }

  /// Imports a file from a sharing intent.
  /// 
  /// [parentDir], if provided, must start and end with a slash.
  /// 
  /// Returns the file path of the imported file.
  static Future<String?> importFile(String path, String? parentDir, bool useOldExtension, {bool awaitWrite = true}) async {
    assert(parentDir == null || parentDir.startsWith('/') && parentDir.endsWith('/'));

    final String fileName = path.split('/').last;
    final String importedPath = await suffixFilePathToMakeItUnique('${parentDir ?? '/'}$fileName', useOldExtension);

    final File tempFile = File(path);
    final Uint8List fileContents;
    try {
      fileContents = await tempFile.readAsBytes();
    } catch (e) {
      log.severe('Failed to read file when importing $path: $e', e);
      return null;
    }

    await writeFile(importedPath, fileContents, awaitWrite: awaitWrite);

    return importedPath;
  }


  /// Creates the parent directories of filePath if they don't exist.
  static Future _createFileDirectory(String filePath) async {
    assert(filePath.contains('/'), 'filePath must be a path, not a file name');
    final String parentDirectory = filePath.substring(0, filePath.lastIndexOf('/'));
    await Directory(await documentsDirectory + parentDirectory).create(recursive: true);
  }

  static Future _renameReferences(String fromPath, String toPath) async {
    // rename file in cache
    PreviewCard.moveFileInCache(fromPath, toPath);

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
}

class DirectoryChildren {
  final List<String> directories;
  final List<String> files;

  DirectoryChildren(this.directories, this.files);

  bool onlyOneChild() => directories.length + files.length <= 1;

  bool get isEmpty => directories.isEmpty && files.isEmpty;
  bool get isNotEmpty => !isEmpty;
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
