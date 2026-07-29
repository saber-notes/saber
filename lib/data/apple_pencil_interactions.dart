/// 🤖 Generated wholely or partially with Claude Code (Claude Fable 5)
library;

import 'package:flutter/services.dart';

/// Receives Apple Pencil interaction events from the iOS runner,
/// sent over [channel] by `PencilInteractionHandler` in AppDelegate.swift.
abstract final class ApplePencilInteractions {
  static const channel = MethodChannel('com.adilhanney.saber/apple_pencil');

  /// Called when the user double-taps the side of their Apple Pencil.
  static VoidCallback? onDoubleTap;

  static var _initialized = false;

  /// Starts listening to [channel]. Safe to call multiple times.
  static void init() {
    if (_initialized) return;
    _initialized = true;
    channel.setMethodCallHandler(_onMethodCall);
  }

  /// Handles a call from the iOS runner. `doubleTap` calls come with the
  /// user's preferred tap action from the system-wide Apple Pencil settings:
  /// `ignore` means the user turned double-tap off, and any other action is
  /// mapped to Saber's pen/eraser toggle.
  static Future<void> _onMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'doubleTap':
        if (call.arguments == 'ignore') return;
        onDoubleTap?.call();
    }
  }
}
