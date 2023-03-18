import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/flavor_config.dart';

void main() {
  group('getLatestDownloadUrl', () {
    late final String apiResponse;
    setUpAll(() async {
      FlavorConfig.setup();
      final file = File('test/samples/github_releases_api.json');
      apiResponse = await file.readAsString();
    });

    test('on iOS', () async {
      final url = await UpdateManager.getLatestDownloadUrl(apiResponse, TargetPlatform.iOS);
      expect(url, isNull);
    });

    test('on macOS', () async {
      final url = await UpdateManager.getLatestDownloadUrl(apiResponse, TargetPlatform.macOS);
      expect(url, isNull);
    });

    test('on Windows', () async {
      final url = await UpdateManager.getLatestDownloadUrl(apiResponse, TargetPlatform.windows);
      expect(url, isNotNull);
      expect(url, startsWith('http'));
      expect(url, endsWith('.exe'));
    });

    test('on Linux', () async {
      final url = await UpdateManager.getLatestDownloadUrl(apiResponse, TargetPlatform.linux);
      expect(url, isNull);
    });

    test('on Android', () async {
      final url = await UpdateManager.getLatestDownloadUrl(apiResponse, TargetPlatform.android);
      expect(url, isNotNull);
      expect(url, startsWith('http'));
      expect(url, endsWith('.apk'));
      expect(url, isNot(contains('FOSS')));
    });
  });
}
