import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_method_channel.dart';

void main() {
  MethodChannelOnyxsdkPen platform = MethodChannelOnyxsdkPen();
  const MethodChannel channel = MethodChannel('onyxsdk_pen');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
