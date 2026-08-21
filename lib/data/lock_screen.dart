library;

import 'package:flutter/services.dart';

/// Decoupled utility class to manage Lock Screen Note status.
class LockScreen {
  LockScreen._();

  static const _channel = MethodChannel('com.adilhanney.saber/lock_screen');

  /// Indicates if Saber is running in Lock Screen Note mode.
  static var isLockScreenNoteMode = false;

  /// Checks if the app was started as a lock screen note.
  static Future<bool> checkLockScreenNote() async {
    try {
      final bool isLockScreen =
          await _channel.invokeMethod('isLockScreenNote') ?? false;
      isLockScreenNoteMode = isLockScreen;
      return isLockScreen;
    } catch (e) {
      isLockScreenNoteMode = false;
      // Return false if platform channel is not supported or fails
      return false;
    }
  }

  /// Sets up a listener for hot-start lock screen note intents.
  static void listenToIntent(Future<void> Function() onIntent) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onLockScreenNoteIntent') {
        isLockScreenNoteMode = true;
        await onIntent();
      }
    });
  }
}
