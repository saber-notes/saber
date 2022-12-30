
import 'onyxsdk_pen_platform_interface.dart';

class OnyxsdkPen {
  Future<String?> getPlatformVersion() {
    return OnyxsdkPenPlatform.instance.getPlatformVersion();
  }
}
