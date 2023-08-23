import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/version.dart';

/// Example current build number.
/// See [buildNumber] in [lib/data/version.dart].
const int v = 5000;

void main() => group('Update manager:', () {
  FlavorConfig.setup();
  Prefs.testingMode = true;
  Prefs.init();

  test('Test version comparison (release mode)', () {
    Prefs.shouldAlwaysAlertForUpdates.value = false;

    expect(UpdateManager.getUpdateStatus(v, v - 10), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v - 1), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v + 1), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v + 9), UpdateStatus.upToDate);

    expect(UpdateManager.getUpdateStatus(v, v + 10), UpdateStatus.updateOptional);
    expect(UpdateManager.getUpdateStatus(v, v + 11), UpdateStatus.updateOptional);
    expect(UpdateManager.getUpdateStatus(v, v + 19), UpdateStatus.updateOptional);

    expect(UpdateManager.getUpdateStatus(v, v + 20), UpdateStatus.updateRecommended);
    expect(UpdateManager.getUpdateStatus(v, v + 100), UpdateStatus.updateRecommended);
  });

  test('Test version comparison (debug mode)', () {
    Prefs.shouldAlwaysAlertForUpdates.value = true;

    expect(UpdateManager.getUpdateStatus(v, v), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v + 1), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v + 9), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v + 10), UpdateStatus.updateRecommended);
  });

  test('Test that the latest version can be parsed from version.dart', () async {
    // load local file from lib/data/version.dart
    String latestVersionFile = await File('lib/data/version.dart').readAsString();
    expect(latestVersionFile.isNotEmpty, true, reason: 'Failed to load local version.dart file');

    final int? parsedVersion = await UpdateManager.getNewestVersion(latestVersionFile);
    expect(parsedVersion, isNotNull, reason: 'Could not parse version number from version.dart file');
    expect(parsedVersion, buildNumber, reason: 'Incorrect version number parsed from version.dart file');
  });

  test('Test that the latest version can be parsed from GitHub', () async {
    final int? newestVersion;
    try {
      newestVersion = await UpdateManager.getNewestVersion();
    } on SocketException {
      fail('Failed to download newest version from GitHub');
    }

    expect(newestVersion, isNotNull, reason: 'Could not parse version number from GitHub');
    // at the time of writing, the latest version is 5050
    expect(newestVersion, greaterThan(5000), reason: 'Incorrect version number parsed from GitHub');
  });
});
