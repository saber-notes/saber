library;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/lock_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('com.adilhanney.saber/lock_screen');
  Object? mockResponse;

  setUp(() {
    LockScreen.isLockScreenNoteMode = false;
    mockResponse = null;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'isLockScreenNote') {
        if (mockResponse is Exception) {
          throw mockResponse as Exception;
        }
        return mockResponse;
      }
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('LockScreen checkLockScreenNote', () {
    test('returns true and sets isLockScreenNoteMode when channel returns true', () async {
      mockResponse = true;
      final result = await LockScreen.checkLockScreenNote();
      expect(result, isTrue);
      expect(LockScreen.isLockScreenNoteMode, isTrue);
    });

    test('returns false and sets isLockScreenNoteMode when channel returns false', () async {
      mockResponse = false;
      final result = await LockScreen.checkLockScreenNote();
      expect(result, isFalse);
      expect(LockScreen.isLockScreenNoteMode, isFalse);
    });

    test('resets isLockScreenNoteMode to false and returns false on exception (TDD case)', () async {
      // Set to true initially to simulate stale/previous state
      LockScreen.isLockScreenNoteMode = true;
      mockResponse = PlatformException(code: 'UNAVAILABLE', message: 'Not supported');

      final result = await LockScreen.checkLockScreenNote();
      expect(result, isFalse);
      expect(LockScreen.isLockScreenNoteMode, isFalse);
    });
  });
}
