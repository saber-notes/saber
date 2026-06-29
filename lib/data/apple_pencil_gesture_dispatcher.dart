import 'dart:async';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

/// Gestures emitted by iPadOS for Apple Pencil interactions.
enum ApplePencilGestureType { doubleTap, squeeze }

/// Dispatches Apple Pencil gesture channel calls to active Dart listeners.
class ApplePencilGestureDispatcher {
  ApplePencilGestureDispatcher._() {
    // This singleton owns the method-channel handler for the app lifetime.
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  /// Shared dispatcher for Apple Pencil gesture events.
  static final instance = ApplePencilGestureDispatcher._();

  static const _channel = MethodChannel('com.saber.apple_pencil_gestures');
  static final _log = Logger('ApplePencilGestureDispatcher');

  // ignore: close_sinks
  final _gestures = StreamController<ApplePencilGestureType>.broadcast();

  /// Broadcast stream of Apple Pencil gestures received from iOS.
  Stream<ApplePencilGestureType> get gestures => _gestures.stream;

  Future<void> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'applePencilDoubleTap':
        _gestures.add(ApplePencilGestureType.doubleTap);
      case 'applePencilSqueeze':
        _gestures.add(ApplePencilGestureType.squeeze);
      default:
        _log.warning('Unknown Apple Pencil gesture: ${call.method}');
    }
  }
}
