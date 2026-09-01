import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/lock_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('com.adilhanney.saber/lock_screen');
  late Map<String, Object?> mockResponses;
  late List<String> invokedMethods;

  setUp(() {
    LockScreen.mode = .none;
    mockResponses = {};
    invokedMethods = [];

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          invokedMethods.add(methodCall.method);
          if (!mockResponses.containsKey(methodCall.method)) {
            fail('Unexpected method call: ${methodCall.method}');
          }
          return mockResponses[methodCall.method];
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('LockScreen checkLockScreenNote', () {
    test(
      'handles isCreateNoteIntent when locked by setting lockedQuickNote',
      () async {
        mockResponses = {'isCreateNoteIntent': true, 'isKeyguardLocked': true};
        final result = await LockScreen.checkLockScreenNote();
        expect(result, isTrue);
        expect(LockScreen.mode, LockScreenMode.lockedQuickNote);
      },
    );

    test(
      'handles isCreateNoteIntent when unlocked by setting unlockedQuickNote',
      () async {
        mockResponses = {
          'isCreateNoteIntent': true,
          'isKeyguardLocked': false,
          'clearLockScreenFlags': null,
        };
        final result = await LockScreen.checkLockScreenNote();
        expect(result, isTrue);
        expect(LockScreen.mode, LockScreenMode.unlockedQuickNote);
      },
    );

    test(
      'handles isCreateNoteIntent false by resetting mode and returning false',
      () async {
        LockScreen.mode = .lockedQuickNote;
        mockResponses = {
          'isCreateNoteIntent': false,
          'clearLockScreenFlags': null,
        };
        final result = await LockScreen.checkLockScreenNote();
        expect(result, isFalse);
        expect(LockScreen.mode, LockScreenMode.none);
      },
    );

    test('falls back to isLockScreenNote when isCreateNoteIntent is null and returns true', () async {
      mockResponses = {'isCreateNoteIntent': null, 'isLockScreenNote': true};
      final result = await LockScreen.checkLockScreenNote();
      expect(result, isTrue);
      expect(LockScreen.mode, LockScreenMode.lockedQuickNote);
    });

    test('falls back to isLockScreenNote when isCreateNoteIntent is null and returns false', () async {
      LockScreen.mode = .lockedQuickNote;
      mockResponses = {
        'isCreateNoteIntent': null,
        'isLockScreenNote': false,
        'clearLockScreenFlags': null,
      };
      final result = await LockScreen.checkLockScreenNote();
      expect(result, isFalse);
      expect(LockScreen.mode, LockScreenMode.none);
    });
  });

  group('LockScreen isKeyguardLocked', () {
    test('returns true when channel returns true', () async {
      mockResponses = {'isKeyguardLocked': true};
      final result = await LockScreen.isKeyguardLocked();
      expect(result, isTrue);
    });

    test('returns false when channel returns false', () async {
      mockResponses = {'isKeyguardLocked': false};
      final result = await LockScreen.isKeyguardLocked();
      expect(result, isFalse);
    });
  });

  group('LockScreen syncLockScreenNoteMode', () {
    test(
      'downgrades mode to unlockedQuickNote when device is unlocked',
      () async {
        LockScreen.mode = .lockedQuickNote;
        mockResponses = {
          'isKeyguardLocked': false,
          'clearLockScreenFlags': null,
        };
        await LockScreen.syncLockScreenNoteMode();
        expect(LockScreen.mode, LockScreenMode.unlockedQuickNote);
      },
    );

    test('keeps mode as lockedQuickNote when device is locked', () async {
      LockScreen.mode = .lockedQuickNote;
      mockResponses = {'isKeyguardLocked': true};
      await LockScreen.syncLockScreenNoteMode();
      expect(LockScreen.mode, LockScreenMode.lockedQuickNote);
    });
  });

  group('LockScreen listenToIntent', () {
    test('handles onLockScreenNoteIntent when locked and sets mode to lockedQuickNote', () async {
      var callbackCalled = false;
      LockScreen.listenToIntent(
        openNewQuickNote: () async {
          callbackCalled = true;
        },
      );

      mockResponses = {'isKeyguardLocked': true};
      const message = MethodCall('onLockScreenNoteIntent');
      final byteData = channel.codec.encodeMethodCall(message);

      await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage(channel.name, byteData, (ByteData? data) {});

      expect(LockScreen.mode, LockScreenMode.lockedQuickNote);
      expect(callbackCalled, isTrue);
    });

    test('handles onLockScreenNoteIntent when unlocked and sets mode to unlockedQuickNote', () async {
      LockScreen.mode = .lockedQuickNote;
      var callbackCalled = false;
      LockScreen.listenToIntent(
        openNewQuickNote: () async {
          callbackCalled = true;
        },
      );

      mockResponses = {'isKeyguardLocked': false, 'clearLockScreenFlags': null};
      const message = MethodCall('onLockScreenNoteIntent');
      final byteData = channel.codec.encodeMethodCall(message);

      await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage(channel.name, byteData, (ByteData? data) {});

      expect(LockScreen.mode, LockScreenMode.unlockedQuickNote);
      expect(callbackCalled, isTrue);
    });

    test('handles onResetLockScreenNoteMode and resets mode to none', () async {
      LockScreen.mode = .lockedQuickNote;
      var callbackCalled = false;
      LockScreen.listenToIntent(
        openNewQuickNote: () async {
          callbackCalled = true;
        },
      );

      mockResponses = {'clearLockScreenFlags': null};
      const message = MethodCall('onResetLockScreenNoteMode');
      final byteData = channel.codec.encodeMethodCall(message);

      await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage(channel.name, byteData, (ByteData? data) {});

      expect(LockScreen.mode, LockScreenMode.none);
      expect(callbackCalled, isFalse);
    });
  });

  group('LockScreen clearLockScreenFlags', () {
    test('invokes clearLockScreenFlags on method channel', () async {
      mockResponses = {'clearLockScreenFlags': null};
      await LockScreen.clearLockScreenFlags();
      expect(invokedMethods, ['clearLockScreenFlags']);
    });
  });

  group('LockScreen exitLockScreenNote', () {
    test('resets mode to none and clears lock screen flags', () async {
      LockScreen.mode = .lockedQuickNote;
      mockResponses = {'clearLockScreenFlags': null};
      await LockScreen.exitLockScreenNote();
      expect(LockScreen.mode, LockScreenMode.none);
      expect(invokedMethods, ['clearLockScreenFlags']);
    });
  });
}
