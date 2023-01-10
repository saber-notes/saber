import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'onyxsdk_pen_platform_interface.dart';

/// An implementation of [OnyxsdkPenPlatform] that uses method channels.
class MethodChannelOnyxsdkPen extends OnyxsdkPenPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('onyxsdk_pen');

  @override
  Future<bool> isOnyxDevice() async {
    return false;
  }
}
