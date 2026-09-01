import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/lock_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('com.adilhanney.saber/lock_screen');
  Object? mockResponse;
  Map<String, Object?>? mockResponses;

  setUp(() {
    LockScreen.isLockScreenNoteMode = false;
    LockScreen.isQuickNoteMode = false;
    LockScreen.isCreateNoteIntent = false;
    mockResponse = null;
    mockResponses = null;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          final response =
              mockResponses != null &&
                      mockResponses!.containsKey(methodCall.method)
                  ? mockResponses![methodCall.method]
                  : mockResponse;

          if (response is Exception) {
            throw response;
          }
          return response;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('LockScreen checkLockScreenNote', () {
    test(
      'handles isCreateNoteIntent when locked by setting isLockScreenNoteMode',
      () async {
        mockResponses = {
          'isCreateNoteIntent': true,
          'isKeyguardLocked': true,
        };
        final result = await LockScreen.checkLockScreenNote();
        expect(result, isTrue);
        expect(LockScreen.isLockScreenNoteMode, isTrue);
        expect(LockScreen.isCreateNoteIntent, isFalse);
      },
    );

    test(
      'handles isCreateNoteIntent when unlocked by setting isCreateNoteIntent',
      () async {
        mockResponses = {
          'isCreateNoteIntent': true,
          'isKeyguardLocked': false,
        };
        final result = await LockScreen.checkLockScreenNote();
        expect(result, isTrue);
        expect(LockScreen.isLockScreenNoteMode, isFalse);
        expect(LockScreen.isCreateNoteIntent, isTrue);
      },
    );

    test(
      'handles isCreateNoteIntent false by resetting flags and returning false',
      () async {
        mockResponses = {
          'isCreateNoteIntent': false,
        };
        final result = await LockScreen.checkLockScreenNote();
        expect(result, isFalse);
        expect(LockScreen.isLockScreenNoteMode, isFalse);
        expect(LockScreen.isCreateNoteIntent, isFalse);
      },
    );

    test(
      'falls back to isLockScreenNote when isCreateNoteIntent is null and returns true',
      () async {
        mockResponses = {
          'isCreateNoteIntent': null,
          'isLockScreenNote': true,
        };
        final result = await LockScreen.checkLockScreenNote();
        expect(result, isTrue);
        expect(LockScreen.isLockScreenNoteMode, isTrue);
        expect(LockScreen.isCreateNoteIntent, isFalse);
      },
    );

    test(
      'falls back to isLockScreenNote when isCreateNoteIntent is null and returns false',
      () async {
        mockResponses = {
          'isCreateNoteIntent': null,
          'isLockScreenNote': false,
        };
        final result = await LockScreen.checkLockScreenNote();
        expect(result, isFalse);
        expect(LockScreen.isLockScreenNoteMode, isFalse);
        expect(LockScreen.isCreateNoteIntent, isFalse);
      },
    );

    test(
      'resets isLockScreenNoteMode to false and returns false on exception (TDD case)',
      () async {
        // Set to true initially to simulate stale/previous state
        LockScreen.isLockScreenNoteMode = true;
        LockScreen.isCreateNoteIntent = true;
        mockResponse = PlatformException(
          code: 'UNAVAILABLE',
          message: 'Not supported',
        );

        final result = await LockScreen.checkLockScreenNote();
        expect(result, isFalse);
        expect(LockScreen.isLockScreenNoteMode, isFalse);
        expect(LockScreen.isCreateNoteIntent, isFalse);
      },
    );
  });

  group('LockScreen isKeyguardLocked', () {
    test('returns true when channel returns true', () async {
      mockResponse = true;
      final result = await LockScreen.isKeyguardLocked();
      expect(result, isTrue);
    });

    test('returns false when channel returns false or fails', () async {
      mockResponse = false;
      var result = await LockScreen.isKeyguardLocked();
      expect(result, isFalse);

      mockResponse = PlatformException(
        code: 'UNAVAILABLE',
        message: 'Keyguard check failed',
      );
      result = await LockScreen.isKeyguardLocked();
      expect(result, isFalse);
    });
  });

  group('LockScreen syncLockScreenNoteMode', () {
    test(
      'resets isLockScreenNoteMode to false when device is unlocked',
      () async {
        LockScreen.isLockScreenNoteMode = true;
        mockResponse = false;
        await LockScreen.syncLockScreenNoteMode();
        expect(LockScreen.isLockScreenNoteMode, isFalse);
      },
    );

    test('keeps isLockScreenNoteMode as true when device is locked', () async {
      LockScreen.isLockScreenNoteMode = true;
      mockResponse = true;
      await LockScreen.syncLockScreenNoteMode();
      expect(LockScreen.isLockScreenNoteMode, isTrue);
    });
  });

  group('LockScreen listenToIntent', () {
    test(
      'handles onLockScreenNoteIntent and sets isLockScreenNoteMode based on keyguard state',
      () async {
        var callbackCalled = false;
        LockScreen.listenToIntent(() async {
          callbackCalled = true;
        });

        mockResponse = true;
        const message = MethodCall('onLockScreenNoteIntent');
        final byteData = channel.codec.encodeMethodCall(message);

        await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .handlePlatformMessage(channel.name, byteData, (ByteData? data) {});

        expect(LockScreen.isLockScreenNoteMode, isTrue);
        expect(callbackCalled, isTrue);
      },
    );

    test(
      'handles onLockScreenNoteIntent when unlocked and sets isLockScreenNoteMode to false',
      () async {
        var callbackCalled = false;
        LockScreen.listenToIntent(() async {
          callbackCalled = true;
        });

        mockResponse = false;
        const message = MethodCall('onLockScreenNoteIntent');
        final byteData = channel.codec.encodeMethodCall(message);

        await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .handlePlatformMessage(channel.name, byteData, (ByteData? data) {});

        expect(LockScreen.isLockScreenNoteMode, isFalse);
        expect(callbackCalled, isTrue);
      },
    );

    test(
      'handles onResetLockScreenNoteMode and sets isLockScreenNoteMode to false',
      () async {
        LockScreen.isLockScreenNoteMode = true;
        LockScreen.listenToIntent(() async {});

        const message = MethodCall('onResetLockScreenNoteMode');
        final byteData = channel.codec.encodeMethodCall(message);

        await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .handlePlatformMessage(channel.name, byteData, (ByteData? data) {});

        expect(LockScreen.isLockScreenNoteMode, isFalse);
      },
    );
  });

  group('LockScreen clearLockScreenFlags', () {
    test('invokes clearLockScreenFlags without throwing exception', () async {
      await expectLater(LockScreen.clearLockScreenFlags(), completes);
    });
  });

  group('LockScreen exitLockScreenNote', () {
    test(
      'resets isLockScreenNoteMode and isQuickNoteMode to false and executes without error',
      () async {
        LockScreen.isLockScreenNoteMode = true;
        LockScreen.isQuickNoteMode = true;
        await expectLater(LockScreen.exitLockScreenNote(), completes);
        expect(LockScreen.isLockScreenNoteMode, isFalse);
        expect(LockScreen.isQuickNoteMode, isFalse);
      },
    );
  });
}
