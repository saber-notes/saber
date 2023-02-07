import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';

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
      FileManager.broadcastFileWrite(FileOperationType.write, '/test.sbn');

      // wait for the event to be broadcast
      await Future.delayed(const Duration(milliseconds: 100));

      // check that the event was received
      expect(events.length, 1);
      expect(events.last.filePath, '/test'); // without the extension
      expect(events.last.type, FileOperationType.write);
    });
  });
}
