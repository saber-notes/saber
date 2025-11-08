import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

final _mockSecureStorage = <String, String>{};
void setupMockFlutterSecureStorage() {
  const channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  TestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        if (methodCall.method == 'delete') {
          _mockSecureStorage.remove(methodCall.arguments['key'] as String);
        } else if (methodCall.method == 'write') {
          _mockSecureStorage[methodCall.arguments['key'] as String] =
              methodCall.arguments['value'] as String;
        } else if (methodCall.method == 'read') {
          return _mockSecureStorage[methodCall.arguments['key'] as String];
        }
        return null;
      });
}

final tmpDir = Directory.systemTemp.path;

void setupMockPathProvider() {
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  TestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        if (methodCall.method == 'getApplicationDocumentsDirectory') {
          return '$tmpDir/saber-test-docs';
        } else if (methodCall.method == 'getTemporaryDirectory') {
          return '$tmpDir/saber-test-tmp';
        }
        return null;
      });
}

void setupMockPrinting() {
  const channel = MethodChannel('net.nfet.printing');
  TestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        if (methodCall.method == 'printingInfo') {
          return {}; // [PrintingInfo.unavailable]
        }
        return null;
      });
}

void setupMockWindowManager() {
  const channel = MethodChannel('window_manager');
  TestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        if (methodCall.method == 'setFullScreen') {
          return true;
        }
        return null;
      });
}
