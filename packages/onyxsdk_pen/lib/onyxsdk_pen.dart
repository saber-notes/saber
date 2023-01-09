import 'onyxsdk_pen_platform_interface.dart';

class OnyxsdkPen {
  Future<bool> isOnyxDevice() {
    return OnyxsdkPenPlatform.instance.isOnyxDevice();
  }
}
