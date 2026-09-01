import 'package:flutter/services.dart';

/// Decoupled utility class to manage Lock Screen Note status.
class LockScreen {
  new _();

  static const _channel = MethodChannel('com.adilhanney.saber/lock_screen');

  /// Indicates if Saber is running in Lock Screen Note mode.
  static var isLockScreenNoteMode = false;

  /// Indicates if Saber is running in a quick note / bubble mode (opened via CREATE_NOTE).
  static var isQuickNoteMode = false;

  /// Indicates if Saber was cold-started with a CREATE_NOTE intent while unlocked.
  static var isCreateNoteIntent = false;

  /// Checks if the device keyguard is currently locked.
  static Future<bool> isKeyguardLocked() async {
    try {
      final bool isLocked =
          await _channel.invokeMethod('isKeyguardLocked') ?? false;
      return isLocked;
    } catch (e) {
      return false;
    }
  }

  /// Clears lock screen window flags on Android.
  static Future<void> clearLockScreenFlags() async {
    try {
      await _channel.invokeMethod('clearLockScreenFlags');
    } catch (_) {}
  }

  /// Exits lock screen note mode, clears window flags, and pops the system navigator.
  static Future<void> exitLockScreenNote() async {
    isLockScreenNoteMode = false;
    isQuickNoteMode = false;
    await clearLockScreenFlags();
    await SystemNavigator.pop();
  }

  /// Resets [isLockScreenNoteMode] to false if the device keyguard is not locked.
  static Future<void> syncLockScreenNoteMode() async {
    if (!isLockScreenNoteMode) return;
    final locked = await isKeyguardLocked();
    if (!locked) {
      isLockScreenNoteMode = false;
      await clearLockScreenFlags();
    }
  }

  /// Checks if the app was started as a lock screen note or with a CREATE_NOTE intent.
  static Future<bool> checkLockScreenNote() async {
    try {
      final bool? isCreateNote =
          await _channel.invokeMethod('isCreateNoteIntent');
      final bool isLocked = await isKeyguardLocked();

      if (isCreateNote != null) {
        if (isCreateNote) {
          isQuickNoteMode = true;
          if (isLocked) {
            isLockScreenNoteMode = true;
            isCreateNoteIntent = false;
          } else {
            isLockScreenNoteMode = false;
            isCreateNoteIntent = true;
            await clearLockScreenFlags();
          }
          return true;
        } else {
          isQuickNoteMode = false;
          isLockScreenNoteMode = false;
          isCreateNoteIntent = false;
          await clearLockScreenFlags();
          return false;
        }
      }

      final bool isLockScreen =
          await _channel.invokeMethod('isLockScreenNote') ?? false;
      isLockScreenNoteMode = isLockScreen;
      isQuickNoteMode = isLockScreen;
      isCreateNoteIntent = false;
      if (!isLockScreen) {
        await clearLockScreenFlags();
      }
      return isLockScreen;
    } catch (e) {
      isLockScreenNoteMode = false;
      isQuickNoteMode = false;
      isCreateNoteIntent = false;
      await clearLockScreenFlags();
      // Return false if platform channel is not supported or fails
      return false;
    }
  }

  /// Sets up a listener for hot-start lock screen note intents.
  static void listenToIntent(Future<void> Function() onIntent) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onLockScreenNoteIntent') {
        isQuickNoteMode = true;
        isLockScreenNoteMode = await isKeyguardLocked();
        if (!isLockScreenNoteMode) {
          await clearLockScreenFlags();
        }
        await onIntent();
      } else if (call.method == 'onResetLockScreenNoteMode') {
        isQuickNoteMode = false;
        isLockScreenNoteMode = false;
        await clearLockScreenFlags();
      }
    });
  }
}
