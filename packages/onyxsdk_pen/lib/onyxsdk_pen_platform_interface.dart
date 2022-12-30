import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'onyxsdk_pen_method_channel.dart';

abstract class OnyxsdkPenPlatform extends PlatformInterface {
  /// Constructs a OnyxsdkPenPlatform.
  OnyxsdkPenPlatform() : super(token: _token);

  static final Object _token = Object();

  static OnyxsdkPenPlatform _instance = MethodChannelOnyxsdkPen();

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

  Future<bool> isOnyxDevice() => Future<bool>.value(false);
}
