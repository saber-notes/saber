import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('File write stream:', () {
    final List<FileOperation> events = [];
    StreamSubscription<FileOperation>? subscription;

    setUp(() async {
      events.clear();
      await subscription?.cancel();
      subscription = FileManager.fileWriteStream.stream
        .listen((FileOperation event) {
          events.add(event);
        });
    });
    tearDown(() async {
      await subscription?.cancel();
    });

    test('broadcastFileWrite', () async {
      // broadcast a write event
      FileManager.broadcastFileWrite(FileOperationType.write, '/test.sbn2');

      // wait for the event to be broadcast
      await Future.delayed(const Duration(milliseconds: 100));

      // check that the event was received
      expect(events.length, 1);
      expect(events.last.filePath, '/test'); // without the extension
      expect(events.last.type, FileOperationType.write);
    });

    test('system directory watch', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupMockPathProvider();

      FileManager.watchRootDirectory();

      final String rootDir = await FileManager.documentsDirectory;
      final File file = File('$rootDir/test.sbn2');

      // write to file
      await file.create(recursive: true);
      await file.writeAsString('test_content');
      await Future.delayed(const Duration(milliseconds: 100));
      expect(events.length, greaterThanOrEqualTo(2));
      expect(events.last.filePath, '/test'); // without the extension
      expect(events.last.type, FileOperationType.write);
      events.clear();

      // delete file
      await file.delete();
      await Future.delayed(const Duration(milliseconds: 100));
      expect(events.length, greaterThanOrEqualTo(1));
      expect(events.last.filePath, '/test'); // without the extension
      expect(events.last.type, FileOperationType.delete);
    });
  });
}
