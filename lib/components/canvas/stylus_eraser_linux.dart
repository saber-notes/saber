import 'dart:io';

import 'package:flutter/services.dart';

/// Workaround for Flutter Linux not detecting stylus eraser mode.
/// See: https://github.com/flutter/flutter/issues/63209
///
/// The Flutter engine maps both GDK_SOURCE_PEN and GDK_SOURCE_ERASER
/// to kFlutterPointerDeviceKindStylus, but eraser should map to
/// kFlutterPointerDeviceKindInvertedStylus.
///
/// This class uses a native method channel to detect the true eraser state.
class StylusEraserLinux {
  static const _channel = MethodChannel('com.adilhanney.saber/stylus_eraser');

  static bool _isEraser = false;
  static bool get isEraser => _isEraser;

  static final _listeners = <void Function(bool isEraser)>[];

  static bool _initialized = false;

  /// Initialize the eraser detection. Only works on Linux.
  static void init() {
    if (_initialized || !Platform.isLinux) return;
    _initialized = true;

    _channel.setMethodCallHandler((call) async {
      if (call.method == 'eraserStateChanged') {
        _isEraser = call.arguments as bool;
        for (final listener in _listeners) {
          listener(_isEraser);
        }
      }
    });
  }

  /// Add a listener for eraser state changes.
  static void addListener(void Function(bool isEraser) listener) {
    _listeners.add(listener);
  }

  /// Remove a listener.
  static void removeListener(void Function(bool isEraser) listener) {
    _listeners.remove(listener);
  }

  /// Get the current eraser state (async, for initial check).
  static Future<bool> getEraserState() async {
    if (!Platform.isLinux) return false;
    try {
      return await _channel.invokeMethod<bool>('getEraserState') ?? false;
    } catch (e) {
      return false;
    }
  }
}
