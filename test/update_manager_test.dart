import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/version.dart';

/// Example current build number.
/// See [buildNumber] in [lib/data/version.dart].
const int v = 5000;

void main() => group("Update manager:", () {
  test("Test version comparison (release mode)", () {
    expect(UpdateManager.getUpdateStatus(v, v - 10, alwaysRecommendUpdates: false), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v - 1, alwaysRecommendUpdates: false), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v, alwaysRecommendUpdates: false), UpdateStatus.upToDate);

    expect(UpdateManager.getUpdateStatus(v, v + 1, alwaysRecommendUpdates: false), UpdateStatus.updateOptional);
    expect(UpdateManager.getUpdateStatus(v, v + 10, alwaysRecommendUpdates: false), UpdateStatus.updateOptional);
    expect(UpdateManager.getUpdateStatus(v, v + 11, alwaysRecommendUpdates: false), UpdateStatus.updateOptional);
    expect(UpdateManager.getUpdateStatus(v, v + 19, alwaysRecommendUpdates: false), UpdateStatus.updateOptional);

    expect(UpdateManager.getUpdateStatus(v, v + 20, alwaysRecommendUpdates: false), UpdateStatus.updateRecommended);
    expect(UpdateManager.getUpdateStatus(v, v + 100, alwaysRecommendUpdates: false), UpdateStatus.updateRecommended);
  });

  test("Test version comparison (debug mode)", () {
    expect(UpdateManager.getUpdateStatus(v, v, alwaysRecommendUpdates: true), UpdateStatus.upToDate);
    expect(UpdateManager.getUpdateStatus(v, v + 1, alwaysRecommendUpdates: true), UpdateStatus.updateRecommended);
    expect(UpdateManager.getUpdateStatus(v, v + 10, alwaysRecommendUpdates: true), UpdateStatus.updateRecommended);
  });

  test("Test that the latest version can be parsed from version.dart", () async {
    // load local file from lib/data/version.dart
    String latestVersionFile = await File("lib/data/version.dart").readAsString();
    expect(latestVersionFile.isNotEmpty, true, reason: "Failed to load local version.dart file");

    final int? parsedVersion = await UpdateManager.getNewestVersion(latestVersionFile);
    expect(parsedVersion, isNotNull, reason: "Could not parse version number from version.dart file");
    expect(parsedVersion, buildNumber, reason: "Incorrect version number parsed from version.dart file");
  });

  test("Test that the latest version can be parsed from GitHub", () async {
    final int? newestVersion;
    try {
      newestVersion = await UpdateManager.getNewestVersion();
    } on SocketException {
      fail("Failed to download newest version from GitHub");
    }

    expect(newestVersion, isNotNull, reason: "Could not parse version number from GitHub");
    // at the time of writing, the latest version is 5050
    expect(newestVersion, greaterThan(5000), reason: "Incorrect version number parsed from GitHub");
  });
});
