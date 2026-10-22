import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Receives Samsung S Pen remote actions independently of keyboard focus.
abstract final class SpenRemote {
  static const _channel = MethodChannel('saber/spen');
  static final _undo = StreamController<void>.broadcast();
  static var _initialized = false;

  /// Editor-scoped listeners decide whether an Undo is currently allowed.
  static Stream<void> get undoEvents {
    if (!_initialized) {
      _channel.setMethodCallHandler((call) async {
        if (call.method == 'undo') _undo.add(null);
      });
      _initialized = true;
    }
    return _undo.stream;
  }

  /// Whether Samsung's S Pen settings are available on the current device.
  static Future<bool> isSupported() async {
    if (defaultTargetPlatform != TargetPlatform.android) return false;
    try {
      return await _channel.invokeMethod<bool>('isSupported') ?? false;
    } on MissingPluginException {
      return false;
    }
  }

  /// Opens S Pen settings, with Samsung's advanced features as a fallback.
  static Future<void> openSystemSettings() =>
      _channel.invokeMethod<void>('openSettings');
}
