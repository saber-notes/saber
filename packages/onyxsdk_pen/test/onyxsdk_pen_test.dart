import 'package:flutter_test/flutter_test.dart';
import 'package:onyxsdk_pen/onyxsdk_pen.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_platform_interface.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOnyxsdkPenPlatform
    with MockPlatformInterfaceMixin
    implements OnyxsdkPenPlatform {
  @override
  Future<bool> isOnyxDevice() => Future.value(false);
}

void main() {
  final OnyxsdkPenPlatform initialPlatform = OnyxsdkPenPlatform.instance;

  test('$MethodChannelOnyxsdkPen is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOnyxsdkPen>());
  });

  test('isOnyxDevice', () async {
    OnyxsdkPen onyxsdkPenPlugin = OnyxsdkPen();
    MockOnyxsdkPenPlatform fakePlatform = MockOnyxsdkPenPlatform();
    OnyxsdkPenPlatform.instance = fakePlatform;

    expect(await onyxsdkPenPlugin.isOnyxDevice(), false);
  });
}
