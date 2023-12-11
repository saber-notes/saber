import 'dart:async';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:collection/collection.dart';
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
  static late final String documentsDirectory;

  static final StreamController<FileOperation> fileWriteStream =
      StreamController.broadcast(
    onListen: () => _fileWriteStreamIsListening = true,
    onCancel: () => _fileWriteStreamIsListening = false,
  );
  static bool _fileWriteStreamIsListening = false;

  // TODO(adil192): Implement or remove this
  static String _sanitisePath(String path) => File(path).path;

  /// A regex that matches the file names/paths of asset files,
  /// e.g. `mynote.sbn2.1`.
  @visibleForTesting
  static final assetFileRegex = RegExp(r'\.sbn2?\.\d+$');

  static Future<void> init() async {
    documentsDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/$appRootDirectoryPrefix';
    unawaited(watchRootDirectory());
  }

  @visibleForTesting
  static Future<void> watchRootDirectory() async {
    Directory rootDir = Directory(documentsDirectory);
    await rootDir.create(recursive: true);
    rootDir.watch(recursive: true).listen((FileSystemEvent event) {
      final type = event.type == FileSystemEvent.create ||
              event.type == FileSystemEvent.modify ||
              event.type == FileSystemEvent.move
          ? FileOperationType.write
          : FileOperationType.delete;
      String path = event.path
          .replaceAll('\\', '/')
          // The path may or may not be relative,
          // so remove the root directory path to make sure it's relative.
          .replaceFirst(documentsDirectory, '');
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
    final File file = getFile(filePath);
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

  /// Whether getFile should just return File(filePath)
  /// instead of prefixing with the documents directory.
  /// This is useful for testing when test files
  /// aren't in the documents directory.
  @visibleForTesting
  static bool shouldUseRawFilePath = false;

  static File getFile(String filePath) {
    if (shouldUseRawFilePath) {
      return File(filePath);
    } else {
      assert(filePath.startsWith('/'),
          'Expected filePath to start with a slash, got $filePath');
      return File(documentsDirectory + filePath);
    }
  }

  /// Writes [toWrite] to [filePath].
  static Future<void> writeFile(String filePath, List<int> toWrite,
      {bool awaitWrite = false, bool alsoUpload = true}) async {
    filePath = _sanitisePath(filePath);
    log.fine('Writing to $filePath');

    await _saveFileAsRecentlyAccessed(filePath);

    final File file = getFile(filePath);
    await _createFileDirectory(filePath);
    Future writeFuture = Future.wait([
      file.writeAsBytes(toWrite),

      // if we're using a new format, also delete the old file
      if (filePath.endsWith(Editor.extension))
        getFile(
                '${filePath.substring(0, filePath.length - Editor.extension.length)}'
                '${Editor.extensionOldJson}')
            .delete()
            // ignore if the file doesn't exist
            .catchError((_) => File(''),
                test: (e) => e is PathNotFoundException),
    ]);

    void afterWrite() {
      broadcastFileWrite(FileOperationType.write, filePath);
      if (alsoUpload) FileSyncer.addToUploadQueue(filePath);
      if (filePath.endsWith(Editor.extension)) {
        _removeReferences(
            '${filePath.substring(0, filePath.length - Editor.extension.length)}'
            '${Editor.extensionOldJson}');
      }
    }

    writeFuture = writeFuture.then((_) => afterWrite());
    if (awaitWrite) await writeFuture;
  }

  static Future<void> createFolder(String folderPath) async {
    folderPath = _sanitisePath(folderPath);

    final Directory dir = Directory(documentsDirectory + folderPath);
    await dir.create(recursive: true);
  }

  static Future exportFile(String fileName, List<int> bytes,
      {bool isImage = false}) async {
    File? tempFile;
    Future<File> getTempFile() async {
      final String tempFolder = (await getTemporaryDirectory()).path;
      final File file = File('$tempFolder/$fileName');
      await file.writeAsBytes(bytes);
      return file;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      if (isImage) {
        // save image to gallery
        await ImageSave.saveImage(
          Uint8List.fromList(bytes),
          fileName,
          albumName: 'Saber',
        );
      } else {
        // share file
        tempFile = await getTempFile();
        await Share.shareXFiles([XFile(tempFile.path)]);
      }
    } else {
      // desktop, open save-as dialog
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
  static Future<String> moveFile(String fromPath, String toPath,
      {bool replaceExistingFile = false, bool alsoMoveAssets = true}) async {
    fromPath = _sanitisePath(fromPath);
    toPath = _sanitisePath(toPath);

    if (!toPath.contains('/')) {
      // if toPath is a relative path
      toPath = fromPath.substring(0, fromPath.lastIndexOf('/') + 1) + toPath;
    }

    if (!replaceExistingFile || Editor.isReservedPath(toPath)) {
      toPath =
          await suffixFilePathToMakeItUnique(toPath, currentPath: fromPath);
    }

    if (fromPath == toPath) return toPath;

    final File fromFile = getFile(fromPath);
    final File toFile = getFile(toPath);
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

    if (alsoMoveAssets && !assetFileRegex.hasMatch(fromPath)) {
      final assets = <int>[];
      for (int assetNumber = 0; true; assetNumber++) {
        final assetFile = getFile('$fromPath.$assetNumber');
        if (assetFile.existsSync()) {
          assets.add(assetNumber);
        } else {
          break;
        }
      }

      await Future.wait([
        for (final assetNumber in assets)
          moveFile(
            '$fromPath.$assetNumber',
            '$toPath.$assetNumber',
            replaceExistingFile: replaceExistingFile,
          ),
      ]);
    }

    return toPath;
  }

  static Future deleteFile(String filePath,
      {bool alsoUpload = true, bool alsoDeleteAssets = true}) async {
    filePath = _sanitisePath(filePath);

    final File file = getFile(filePath);
    if (!file.existsSync()) return;
    await file.delete();

    if (alsoUpload) FileSyncer.addToUploadQueue(filePath);

    _removeReferences(filePath);
    broadcastFileWrite(FileOperationType.delete, filePath);

    if (alsoDeleteAssets && !assetFileRegex.hasMatch(filePath)) {
      final assets = <int>[];
      for (int assetNumber = 0; true; assetNumber++) {
        final assetFile = getFile('$filePath.$assetNumber');
        if (assetFile.existsSync()) {
          assets.add(assetNumber);
        } else {
          break;
        }
      }

      await Future.wait([
        for (final assetNumber in assets) deleteFile('$filePath.$assetNumber'),
      ]);
    }
  }

  static Future removeUnusedAssets(String filePath,
      {required int numAssets}) async {
    final futures = <Future>[];

    for (int assetNumber = numAssets; true; assetNumber++) {
      final assetPath = '$filePath.$assetNumber';
      if (getFile(assetPath).existsSync()) {
        futures.add(deleteFile(assetPath));
      } else {
        break;
      }
    }

    await Future.wait(futures);
  }

  static Future renameDirectory(String directoryPath, String newName) async {
    directoryPath = _sanitisePath(directoryPath);

    final Directory directory = Directory(documentsDirectory + directoryPath);
    if (!directory.existsSync()) return;

    /// recursively find children of [directory] for [_renameReferences]
    final List<String> children = [];
    await for (final entity in directory.list(recursive: true)) {
      if (entity is File) {
        children.add(entity.path.substring(directory.path.length));
      }
    }

    final String newPath =
        directoryPath.substring(0, directoryPath.lastIndexOf('/') + 1) +
            newName;
    await directory.rename(documentsDirectory + newPath);

    for (final child in children) {
      _renameReferences(directoryPath + child, newPath + child);
      broadcastFileWrite(FileOperationType.delete, directoryPath + child);
      broadcastFileWrite(FileOperationType.write, newPath + child);
    }
  }

  static Future deleteDirectory(String directoryPath,
      [bool recursive = true]) async {
    directoryPath = _sanitisePath(directoryPath);

    final Directory directory = Directory(documentsDirectory + directoryPath);
    if (!directory.existsSync()) return;

    if (recursive) {
      // call [deleteFile] on all files that are descendants of the directory
      await for (final entity in directory.list(recursive: true)) {
        if (entity is File) {
          await deleteFile(entity.path.substring(documentsDirectory.length));
        }
      }
    }

    await directory.delete(recursive: recursive);
  }

  static Future<DirectoryChildren?> getChildrenOfDirectory(
      String directory) async {
    directory = _sanitisePath(directory);
    if (!directory.endsWith('/')) directory += '/';

    final Iterable<String> allChildren;
    final List<String> directories = [], files = [];

    final Directory dir = Directory(documentsDirectory + directory);
    if (!dir.existsSync()) return null;

    int directoryPrefixLength = directory.endsWith('/')
        ? directory.length
        : directory.length + 1; // +1 for the trailing slash
    allChildren = await dir
        .list()
        .map((FileSystemEntity entity) {
          String filePath = entity.path.substring(documentsDirectory.length);

          // remove extension
          if (filePath.endsWith(Editor.extension)) {
            filePath = filePath.substring(
                0, filePath.length - Editor.extension.length);
          } else if (filePath.endsWith(Editor.extensionOldJson)) {
            filePath = filePath.substring(
                0, filePath.length - Editor.extensionOldJson.length);
          }

          if (Editor.isReservedPath(filePath))
            return null; // filter out reserved files

          return filePath
              .substring(directoryPrefixLength); // remove directory prefix
        })
        .where((String? file) => file != null)
        .cast<String>()
        .toList();

    await Future.wait(allChildren.map((child) async {
      if (await FileManager.isDirectory(directory + child) &&
          !directories.contains(child)) {
        directories.add(child);
      } else if (assetFileRegex.hasMatch(child)) {
        // if the file is an asset, don't add it to the list of files
      } else {
        files.add(child);
      }
    }));

    return DirectoryChildren(directories, files);
  }

  static Future<List<String>> getAllFiles() async {
    final allFiles = <String>[];
    final directories = <String>['/'];

    while (directories.isNotEmpty) {
      final directory = directories.removeLast();
      final children = await getChildrenOfDirectory(directory);
      if (children == null) continue;

      for (final file in children.files) {
        allFiles.add('$directory$file');
      }
      for (final childDirectory in children.directories) {
        directories.add('$directory$childDirectory/');
      }
    }

    return allFiles;
  }

  static Future<List<String>> getRecentlyAccessed() async {
    await Prefs.recentFiles.waitUntilLoaded();
    return Prefs.recentFiles.value
        .map((String filePath) {
          if (filePath.endsWith(Editor.extension)) {
            return filePath.substring(
                0, filePath.length - Editor.extension.length);
          } else if (filePath.endsWith(Editor.extensionOldJson)) {
            return filePath.substring(
                0, filePath.length - Editor.extensionOldJson.length);
          } else {
            return filePath;
          }
        })
        .where((String file) =>
            !Editor.isReservedPath(file)) // filter out reserved file names
        .toList();
  }

  /// Returns whether the [filePath] is a directory or file.
  /// Behaviour is undefined if [filePath] is not a valid path.
  static Future<bool> isDirectory(String filePath) async {
    filePath = _sanitisePath(filePath);
    final Directory directory = Directory(documentsDirectory + filePath);
    return directory.existsSync();
  }

  static Future<bool> doesFileExist(String filePath) async {
    filePath = _sanitisePath(filePath);
    final File file = getFile(filePath);
    return file.existsSync();
  }

  static Future<DateTime> lastModified(String filePath) async {
    filePath = _sanitisePath(filePath);
    final File file = getFile(filePath);
    return file.lastModifiedSync();
  }

  static Future<String> newFilePath([String parentPath = '/']) async {
    assert(parentPath.endsWith('/'));

    final DateTime now = DateTime.now();
    final String filePath = '$parentPath${DateFormat("yy-MM-dd").format(now)} '
        '${t.editor.untitled}';

    return await suffixFilePathToMakeItUnique(filePath);
  }

  /// Returns a unique file path by appending a number to the end of the [filePath].
  /// e.g. "/Untitled" -> "/Untitled (2)"
  ///
  /// Providing a [currentPath] means that e.g. "/Untitled (2)" being renamed
  /// to "/Untitled" will be returned as "/Untitled (2)" not "/Untitled (3)".
  ///
  /// If [currentPath] is provided, it must
  /// end with [Editor.extension] or [Editor.extensionOldJson].
  static Future<String> suffixFilePathToMakeItUnique(
    String filePath, {
    String? intendedExtension,
    String? currentPath,
  }) async {
    String newFilePath = filePath;
    bool hasExtension = false;

    if (filePath.endsWith(Editor.extension)) {
      filePath =
          filePath.substring(0, filePath.length - Editor.extension.length);
      newFilePath = filePath;
      hasExtension = true;
      intendedExtension ??= Editor.extension;
    } else if (filePath.endsWith(Editor.extensionOldJson)) {
      filePath = filePath.substring(
          0, filePath.length - Editor.extensionOldJson.length);
      newFilePath = filePath;
      hasExtension = true;
      intendedExtension ??= Editor.extensionOldJson;
    } else {
      intendedExtension ??= Editor.extension;
    }

    int i = 1;
    while (true) {
      if (!await doesFileExist(newFilePath + Editor.extension) &&
          !await doesFileExist(newFilePath + Editor.extensionOldJson)) break;
      if (newFilePath + Editor.extension == currentPath) break;
      if (newFilePath + Editor.extensionOldJson == currentPath) break;
      i++;
      newFilePath = '$filePath ($i)';
    }

    return newFilePath + (hasExtension ? intendedExtension : '');
  }

  /// Imports a file from a sharing intent.
  ///
  /// [parentDir], if provided, must start and end with a slash.
  ///
  /// [extension], if provided, must start with a dot.
  /// If not provided, it will be inferred from the [path].
  ///
  /// Returns the file path of the imported file.
  static Future<String?> importFile(String path, String? parentDir,
      {String? extension, bool awaitWrite = true}) async {
    assert(parentDir == null ||
        parentDir.startsWith('/') && parentDir.endsWith('/'));

    if (extension == null) {
      extension = '.${path.split('.').last}';
      assert(extension.length > 1);
    } else {
      assert(extension.startsWith('.')); // extension must start with a dot
    }

    /// The file name without its extension
    String fileName = path.split('/').last;
    fileName = fileName.substring(0, fileName.lastIndexOf('.'));
    final String importedPath;

    final writeFutures = <Future>[];

    if (extension == '.sba') {
      final inputStream = InputFileStream(path);
      final archive = ZipDecoder().decodeBuffer(inputStream);

      final mainFile = archive.files.firstWhereOrNull(
        (file) => file.name.endsWith('sbn') || file.name.endsWith('sbn2'),
      );
      if (mainFile == null) {
        log.severe('Failed to find main note in sba: $path');
        return null;
      }
      final mainFileExtension = '.${mainFile.name.split('.').last}';
      importedPath = await suffixFilePathToMakeItUnique(
        '${parentDir ?? '/'}$fileName',
        intendedExtension: mainFileExtension,
      );
      final mainFileContents = () {
        final output = OutputStream();
        mainFile.writeContent(output);
        return output.getBytes();
      }();
      writeFutures.add(
        writeFile(
          importedPath + mainFileExtension,
          mainFileContents,
          awaitWrite: awaitWrite,
        ),
      );

      // now import assets
      for (var file in archive.files) {
        if (!file.isFile) continue;
        if (file == mainFile) continue;

        final extension = file.name.split('.').last;
        final assetNumber = int.tryParse(extension);
        if (assetNumber == null) continue;
        if (assetNumber < 0) continue;

        final assetBytes = () {
          final output = OutputStream();
          file.writeContent(output);
          return output.getBytes();
        }();
        writeFutures.add(
          writeFile(
            '$importedPath$mainFileExtension.$assetNumber',
            assetBytes,
            awaitWrite: awaitWrite,
          ),
        );
      }
    } else {
      // import sbn or sbn2
      final file = File(path);
      final fileContents = await file.readAsBytes();
      importedPath = await suffixFilePathToMakeItUnique(
        '${parentDir ?? '/'}$fileName',
        intendedExtension: extension,
      );
      writeFutures.add(
        writeFile(
          importedPath + extension,
          fileContents,
          awaitWrite: awaitWrite,
        ),
      );
    }

    await Future.wait(writeFutures);

    return importedPath;
  }

  /// Creates the parent directories of filePath if they don't exist.
  static Future _createFileDirectory(String filePath) async {
    assert(filePath.contains('/'), 'filePath must be a path, not a file name');
    final String parentDirectory =
        filePath.substring(0, filePath.lastIndexOf('/'));
    await Directory(documentsDirectory + parentDirectory)
        .create(recursive: true);
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
    // don't add assets to recently accessed
    if (assetFileRegex.hasMatch(filePath)) return;

    Prefs.recentFiles.value.remove(filePath);
    Prefs.recentFiles.value.insert(0, filePath);
    if (Prefs.recentFiles.value.length > maxRecentlyAccessedFiles)
      Prefs.recentFiles.value.removeLast();

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
