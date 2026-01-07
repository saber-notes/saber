import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('FileManager', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupMockPathProvider();
    SharedPreferences.setMockInitialValues({});

    FlavorConfig.setup();

    late final String rootDir;
    setUpAll(() async {
      await FileManager.init();
      rootDir = FileManager.documentsDirectory;
    });

    test('readFile', () async {
      const filePath = '/test_readFile.sbn2';
      const content = 'test content for $filePath';

      // write test data manually
      final file = File('$rootDir$filePath');
      await file.create(recursive: true);
      await file.writeAsString(content);

      // read file
      final readBytes = await FileManager.readFile(filePath);
      final readContent = utf8.decode(readBytes!);
      expect(readContent, content);

      // delete file
      await file.delete();
    });

    test('writeFile', () async {
      const filePath = '/test_writeFile.sbn2';
      const content = 'test content for $filePath';

      // write file
      await FileManager.writeFile(
        filePath,
        utf8.encode(content),
        awaitWrite: true,
      );

      // read file
      final file = File('$rootDir$filePath');
      final readContent = await file.readAsString();
      expect(readContent, content);

      // delete file
      await file.delete();
    });

    test('writeFile and readFile', () async {
      const filePath = '/test_readWriteFile.sbn2';
      const content = 'test content for $filePath';

      // write file
      await FileManager.writeFile(
        filePath,
        utf8.encode(content),
        awaitWrite: true,
      );

      // read file
      final readBytes = await FileManager.readFile(filePath);
      final readContent = utf8.decode(readBytes!);
      expect(readContent, content);

      // delete file
      final file = File('$rootDir$filePath');
      await file.delete();
    });

    test('moveFile', () async {
      const filePathBefore = '/test_moveFile_before.sbn2';
      const filePathBeforeA = '/test_moveFile_before.sbn2.0';
      const filePathBeforeP = '/test_moveFile_before.sbn2.p';
      const filePathAfter = '/test_moveFile_after.sbn2';
      const filePathAfterA = '/test_moveFile_after.sbn2.0';
      const filePathAfterP = '/test_moveFile_after.sbn2.p';
      const content = 'test content for $filePathBefore';
      const contentA = 'test content for $filePathBefore.0';
      const contentP = 'test content for $filePathBefore.p';

      // write files
      await FileManager.writeFile(
        filePathBefore,
        utf8.encode(content),
        awaitWrite: true,
      );
      await FileManager.writeFile(
        filePathBeforeA,
        utf8.encode(contentA),
        awaitWrite: true,
      );
      await FileManager.writeFile(
        filePathBeforeP,
        utf8.encode(contentP),
        awaitWrite: true,
      );

      // ensure file does not exist (in case of previous test failure)
      await FileManager.deleteFile(filePathAfter);

      // move file
      final filePathActual = await FileManager.moveFile(
        filePathBefore,
        filePathAfter,
      );
      expect(filePathActual, filePathAfter);

      // verify filePathBefore does not exist, but filePathAfter does
      final fileBefore = File('$rootDir$filePathBefore');
      final fileAfter = File('$rootDir$filePathAfter');
      expect(fileBefore.existsSync(), false);
      expect(fileAfter.existsSync(), true);
      // read file
      final readBytes = await FileManager.readFile(filePathAfter);
      final readContent = utf8.decode(readBytes!);
      expect(readContent, content);

      final fileBeforeA = File('$rootDir$filePathBeforeA');
      final fileAfterA = File('$rootDir$filePathAfterA');
      expect(fileBeforeA.existsSync(), false);
      expect(fileAfterA.existsSync(), true);
      // read file
      final readBytesA = await FileManager.readFile(filePathAfterA);
      final readContentA = utf8.decode(readBytesA!);
      expect(readContentA, contentA);

      final fileBeforeP = File('$rootDir$filePathBeforeP');
      final fileAfterP = File('$rootDir$filePathAfterP');
      expect(fileBeforeP.existsSync(), false);
      expect(fileAfterP.existsSync(), true);
      // read file
      final readBytesP = await FileManager.readFile(filePathAfterP);
      final readContentP = utf8.decode(readBytesP!);
      expect(readContentP, contentP);

      // delete files
      await Future.wait([
        fileAfter.delete(),
        fileAfterA.delete(),
        fileAfterP.delete(),
      ]);
    });

    test('deleteFile', () async {
      const filePath = '/test_deleteFile.sbn2';
      const filePathA = '/test_deleteFile.sbn2.0';
      const filePathP = '/test_deleteFile.sbn2.p';
      const content = 'test content for $filePath';

      // write files
      await FileManager.writeFile(
        filePath,
        utf8.encode(content),
        awaitWrite: true,
      );
      await FileManager.writeFile(
        filePathA,
        utf8.encode(content),
        awaitWrite: true,
      );
      await FileManager.writeFile(
        filePathP,
        utf8.encode(content),
        awaitWrite: true,
      );

      // delete file
      await FileManager.deleteFile(filePath);

      // verify files do not exist
      expect(File('$rootDir$filePath').existsSync(), false);
      expect(File('$rootDir$filePathA').existsSync(), false);
      expect(File('$rootDir$filePathP').existsSync(), false);
    });

    group('getChildrenOfDirectory', () {
      const dirPath = '/test_getChildrenOfDirectory';
      const fileNames = [
        'test_file1',
        'test_file2',
        'test_file3',
        'subdir/test_file4',
      ];

      setUp(() async {
        // create files
        for (final fileName in fileNames) {
          final file = File('$rootDir$dirPath/$fileName.sbn2');
          await file.create(recursive: true);
          final asset = File('$rootDir$dirPath/$fileName.sbn2.0');
          await asset.create(recursive: true);
          final preview = File('$rootDir$dirPath/$fileName.sbn2.p');
          await preview.create(recursive: true);
        }
      });
      tearDown(() async {
        // delete files
        final dir = Directory('$rootDir$dirPath');
        await dir.delete(recursive: true);
      });

      test('without extensions or assets', () async {
        // get children
        final children = await FileManager.getChildrenOfDirectory(dirPath);
        expect(children, isNotNull);
        printOnFailure('children.files: ${children!.files}');
        printOnFailure('children.directories: ${children.directories}');
        expect(children.files.length, 3);
        expect(children.directories.length, 1);

        // verify children
        for (final fileName in fileNames) {
          if (fileName.contains('subdir')) continue;
          expect(children.files.contains(fileName), true);
        }
        expect(children.directories.contains('subdir'), true);
      });

      test('with extensions and assets', () async {
        final children = await FileManager.getChildrenOfDirectory(
          dirPath,
          includeExtensions: true,
          includeAssets: true,
        );
        expect(children, isNotNull);
        printOnFailure('childrenWithAssets.files: ${children!.files}');
        printOnFailure(
          'childrenWithAssets.directories: ${children.directories}',
        );
        expect(children.files.length, 9);
        expect(children.directories.length, 1);
        expect(children.files.contains('test_file3.sbn2'), true);
        expect(children.files.contains('test_file3.sbn2.0'), true);
        expect(children.files.contains('test_file3.sbn2.p'), true);
      });
    });

    test('getRecentlyAccessed', () async {
      // check empty
      stows.recentFiles.value = [];
      var recentlyAccessed = await FileManager.getRecentlyAccessed();
      expect(recentlyAccessed, isEmpty);

      const fileName1 = 'test_getRecentlyAccessed1';
      const fileName2 = 'test_getRecentlyAccessed2';

      // write files
      await FileManager.writeFile('/$fileName1.sbn2', [1], awaitWrite: true);
      await FileManager.writeFile('/$fileName2.sbn2', [2], awaitWrite: true);

      // check recently accessed
      recentlyAccessed = await FileManager.getRecentlyAccessed();
      expect(recentlyAccessed.length, 2);
      expect(recentlyAccessed[0], '/$fileName2');
      expect(recentlyAccessed[1], '/$fileName1');

      // delete files
      await FileManager.deleteFile('/$fileName1.sbn2');
      await FileManager.deleteFile('/$fileName2.sbn2');
    });

    test('isDirectory and doesFileExist', () async {
      const dirPath = '/test_isDirectory';
      const filePath = '/test_doesFileExist.sbn2';
      const nonExistentPath = '/test_nonExistentPath.sbn2';

      // create directory and file
      final dir = Directory('$rootDir$dirPath');
      await dir.create(recursive: true);
      final file = File('$rootDir$filePath');
      await file.create(recursive: true);

      // verify isDirectory
      expect(FileManager.isDirectory(dirPath), true);
      expect(FileManager.isDirectory(filePath), false);
      expect(FileManager.isDirectory(nonExistentPath), false);

      // verify doesFileExist
      expect(FileManager.doesFileExist(filePath), true);
      expect(FileManager.doesFileExist(dirPath), false);
      expect(FileManager.doesFileExist(nonExistentPath), false);

      // delete directory and file
      await dir.delete(recursive: true);
      await file.delete();
    });
  });
}
