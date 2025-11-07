import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/nextcloud/readable_bytes.dart';

void main() {
  group('readableBytes', () {
    test('null', () {
      expect(readableBytes(null), '... B');
    });
    test('zero', () {
      expect(readableBytes(0), '0 B');
    });
    test('bytes', () {
      expect(readableBytes(512), '512 B');
    });
    test('<1 KB', () {
      expect(readableBytes(0.926 * 1024), '0.93 KB');
    });
    test('KB', () {
      expect(readableBytes(2 * 1024), '2.00 KB');
    });
    test('MB', () {
      expect(readableBytes(5 * 1024 * 1024), '5.00 MB');
    });
    test('GB', () {
      expect(readableBytes(3 * 1024 * 1024 * 1024), '3.00 GB');
    });
    test('<1 TB', () {
      expect(readableBytes(0.95 * 1024 * 1024 * 1024 * 1024), '0.95 TB');
    });
    test('TB', () {
      expect(readableBytes(7 * 1024 * 1024 * 1024 * 1024), '7.00 TB');
    });
    test('PB', () {
      expect(readableBytes(4 * 1024 * 1024 * 1024 * 1024 * 1024), '4.00 PB');
    });
    test('3sf (2dp)', () {
      expect(readableBytes(1.234 * 1024), '1.23 KB');
    });
    test('3sf (1dp)', () {
      expect(readableBytes(12.34 * 1024), '12.3 KB');
    });
    test('3sf (0dp)', () {
      expect(readableBytes(123.4 * 1024), '123 KB');
    });
  });
}
