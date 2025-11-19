import 'src/onyxsdk_pen_platform_interface.dart';

export 'src/onyx_stroke_style.dart';
export 'src/onyxsdk_pen_area.dart';
export 'src/onyxsdk_pen_platform_interface.dart';

class OnyxsdkPen {
  Future<bool> isOnyxDevice() {
    return OnyxsdkPenPlatform.instance.isOnyxDevice();
  }
}
