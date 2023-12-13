import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';

void main() {
  group('assetFileRegex', () {
    test('matches files ending with a number', () {
      expect(FileManager.assetFileRegex.hasMatch('name.sbn.0'), true);
      expect(FileManager.assetFileRegex.hasMatch('name.sbn2.0'), true);
      expect(FileManager.assetFileRegex.hasMatch('name.sbn.1'), true);
      expect(FileManager.assetFileRegex.hasMatch('name.sbn2.1'), true);
      expect(FileManager.assetFileRegex.hasMatch('name.sbn.10'), true);
      expect(FileManager.assetFileRegex.hasMatch('name.sbn2.10'), true);
      expect(FileManager.assetFileRegex.hasMatch('2023.11.30.sbn2.0'), true);
    });
    test('doesn\'t match files containing a number in the middle', () {
      expect(FileManager.assetFileRegex.hasMatch('name.0.sbn'), false);
      expect(FileManager.assetFileRegex.hasMatch('name.1.sbn'), false);
      expect(FileManager.assetFileRegex.hasMatch('name.10.sbn'), false);
      expect(FileManager.assetFileRegex.hasMatch('2023.11.30.sbn2'), false);
    });
    test('doesn\'t match files without an extension', () {
      expect(FileManager.assetFileRegex.hasMatch('name.0'), false);
      expect(FileManager.assetFileRegex.hasMatch('name.1'), false);
      expect(FileManager.assetFileRegex.hasMatch('name.10'), false);
      expect(FileManager.assetFileRegex.hasMatch('2023.11.30'), false);
      expect(FileManager.assetFileRegex.hasMatch('name.sbn3.0'), false);
    });
    test('matches previews', () {
      expect(FileManager.assetFileRegex.hasMatch('name.sbn.p'), true);
      expect(FileManager.assetFileRegex.hasMatch('name.sbn2.p'), true);
    });
  });
}
