import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum LockScreenMode {
  /// Normal app usage (not in a quick note).
  none,

  /// Running in quick note / bubble mode (opened via CREATE_NOTE) while unlocked.
  unlockedQuickNote,

  /// Running in Lock Screen Note mode while the device keyguard is locked.
  lockedQuickNote;

  bool get isQuickNote => this != .none;
  bool get isLocked => this == .lockedQuickNote;
}

/// Decoupled utility class to manage Lock Screen Note status.
class LockScreen {
  new _();

  static const _channel = MethodChannel('com.adilhanney.saber/lock_screen');

  /// Current lock screen / quick note mode.
  static var mode = LockScreenMode.none;

  /// Checks if the device keyguard is currently locked.
  static Future<bool> isKeyguardLocked() async {
    if (defaultTargetPlatform != .android) return false;
    final bool? isLocked = await _channel.invokeMethod('isKeyguardLocked');
    return isLocked ?? false;
  }

  /// Clears lock screen window flags on Android.
  static Future<void> clearLockScreenFlags() async {
    if (defaultTargetPlatform != .android) return;
    await _channel.invokeMethod('clearLockScreenFlags');
  }

  /// Exits lock screen note mode, clears window flags, and pops the system navigator.
  static Future<void> exitLockScreenNote() async {
    assert(mode.isQuickNote);
    mode = .none;
    await clearLockScreenFlags();
    await SystemNavigator.pop();
  }

  /// Downgrades [mode] from [LockScreenMode.lockedQuickNote] to
  /// [LockScreenMode.unlockedQuickNote] if the device keyguard is not locked.
  static Future<void> syncLockScreenNoteMode() async {
    if (!mode.isLocked) return;
    final locked = await isKeyguardLocked();
    if (!locked) {
      mode = .unlockedQuickNote;
      await clearLockScreenFlags();
    }
  }

  /// Checks if the app was started as a lock screen note or with a CREATE_NOTE intent.
  static Future<bool> checkLockScreenNote() async {
    if (defaultTargetPlatform != .android) return false;
    final bool? isCreateNote = await _channel.invokeMethod(
      'isCreateNoteIntent',
    );

    if (isCreateNote != null) {
      if (isCreateNote) {
        final isLocked = await isKeyguardLocked();
        if (isLocked) {
          mode = .lockedQuickNote;
        } else {
          mode = .unlockedQuickNote;
          await clearLockScreenFlags();
        }
        return true;
      } else {
        mode = .none;
        await clearLockScreenFlags();
        return false;
      }
    }

    final bool isLockScreen =
        await _channel.invokeMethod('isLockScreenNote') ?? false;
    if (isLockScreen) {
      mode = .lockedQuickNote;
    } else {
      mode = .none;
      await clearLockScreenFlags();
    }
    return isLockScreen;
  }

  /// Sets up a listener for hot-start lock screen note intents.
  static void listenToIntent({
    required Future<void> Function() openNewQuickNote,
  }) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onLockScreenNoteIntent') {
        final isLocked = await isKeyguardLocked();
        if (isLocked) {
          mode = .lockedQuickNote;
        } else {
          mode = .unlockedQuickNote;
          await clearLockScreenFlags();
        }
        await openNewQuickNote();
      } else if (call.method == 'onResetLockScreenNoteMode') {
        mode = .none;
        await clearLockScreenFlags();
      }
    });
  }
}
