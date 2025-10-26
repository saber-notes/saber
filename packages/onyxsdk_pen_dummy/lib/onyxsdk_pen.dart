import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class OnyxsdkPen {
  FutureOr<bool> isOnyxDevice() => false;
}

class OnyxSdkPenArea extends StatelessWidget {
  const OnyxSdkPenArea({
    super.key,
    this.refreshDelay = const Duration(seconds: 1),
    required this.child,
  });

  final Duration refreshDelay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  static Future<bool> init() async {
    return false;
  }
}

abstract class OnyxsdkPenPlatform extends PlatformInterface {
  /// Constructs a OnyxsdkPenPlatform.
  OnyxsdkPenPlatform() : super(token: _token);

  static final Object _token = Object();

  static OnyxsdkPenPlatform _instance = _MethodChannelOnyxsdkPen();

  /// The default instance of [OnyxsdkPenPlatform] to use.
  ///
  /// Defaults to [MethodChannelOnyxsdkPen].
  static OnyxsdkPenPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OnyxsdkPenPlatform] when
  /// they register themselves.
  static set instance(OnyxsdkPenPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  FutureOr<bool> isOnyxDevice() => false;
}

class _MethodChannelOnyxsdkPen extends OnyxsdkPenPlatform {}
