import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';

void main() {
  group('File write stream:', () {
    test('broadcastFileWrite', () async {
      List<FileOperation> events = [];
      FileManager.fileWriteStream.stream.listen((FileOperation event) {
        events.add(event);
      });
      expect(events.length, 0);

      // broadcast a write event
      FileManager.broadcastFileWrite(FileOperationType.write, '/test.sbn');

      // wait for the event to be broadcast
      await Future.delayed(const Duration(milliseconds: 100));

      // check that the event was received
      expect(events.length, 1);
      expect(events.first.filePath, '/test'); // without the extension
    });
  });
}
