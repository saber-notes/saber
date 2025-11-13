import 'dart:io';

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
      final url = await UpdateManager.getLatestDownloadUrl(apiResponse, .iOS);
      expect(url, isNull);
    });

    test('on macOS', () async {
      final url = await UpdateManager.getLatestDownloadUrl(apiResponse, .macOS);
      expect(url, isNull);
    });

    test('on Windows', () async {
      final url = await UpdateManager.getLatestDownloadUrl(
        apiResponse,
        .windows,
      );
      expect(url, isNotNull);
      expect(url, startsWith('http'));
      expect(url, endsWith('.exe'));
    });

    test('on Linux', () async {
      final url = await UpdateManager.getLatestDownloadUrl(apiResponse, .linux);
      expect(url, isNull);
    });

    test('on Android', () async {
      final url = await UpdateManager.getLatestDownloadUrl(
        apiResponse,
        .android,
      );
      expect(url, isNotNull);
      expect(url, startsWith('http'));
      expect(url, endsWith('.apk'));
      expect(url, isNot(contains('FOSS')));
    });
  });
}
