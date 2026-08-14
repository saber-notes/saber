import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onyxsdk_pen/src/onyxsdk_pen_method_channel.dart';

void main() {
  final platform = MethodChannelOnyxsdkPen();
  const channel = MethodChannel('onyxsdk_pen');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return false;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('isOnyxDevice', () async {
    expect(await platform.isOnyxDevice(), false);
  });
}
