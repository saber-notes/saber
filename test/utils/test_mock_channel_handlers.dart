import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

final Map<String, String> _mockSecureStorage = <String, String>{};
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

void setupMockAudioplayers() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  binding.defaultBinaryMessenger.setMockMethodCallHandler(
    MethodChannel('xyz.luan/audioplayers'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'create') return true;
      return null;
    },
  );

  binding.defaultBinaryMessenger.setMockMethodCallHandler(
    MethodChannel('xyz.luan/audioplayers.global'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'init') return true;
      return null;
    },
  );

  binding.defaultBinaryMessenger.setMockMethodCallHandler(
    MethodChannel('xyz.luan/audioplayers.global/events'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'listen') return true;
      return null;
    },
  );

  binding.defaultBinaryMessenger.setMockMethodCallHandler(
    MethodChannel('xyz.luan/audioplayers/events/pencilSoundEffect'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'listen') return true;
      return null;
    },
  );
}
