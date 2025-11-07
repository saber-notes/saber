@TestOn('linux || mac-os || windows')
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/data/saber_version.dart';
import 'package:saber/data/version.dart';

const dummyChangelog = 'Release_notes_will_be_added_here';

void main() {
  test('Does bump_version.dart find changes needed?', () async {
    final result = await Process.run('dart', [
      './scripts/bump_version.dart',
      '--custom',
      buildName,
      '--fail-on-changes',
      '--quiet',
    ], runInShell: true);
    printOnFailure(result.stdout);
    printOnFailure(result.stderr);

    final exitCode = result.exitCode;
    if (exitCode != 0 && exitCode != 10) {
      throw Exception('Unexpected exit code: $exitCode');
    }
    expect(
      exitCode,
      isNot(equals(10)),
      reason:
          'Changes needed to be made. '
          'Please re-run `./scripts/bump_version.dart`',
    );
  });

  test('Check for dummy text in changelogs', () async {
    final androidMetadata = File('metadata/en-US/changelogs/$buildNumber.txt');
    expect(androidMetadata.existsSync(), true);
    final androidMetadataContents = await androidMetadata.readAsString();
    expect(
      androidMetadataContents.contains(dummyChangelog),
      false,
      reason: 'Dummy text found in Android changelog',
    );

    final flatpakMetadata = File('flatpak/com.adilhanney.saber.metainfo.xml');
    expect(flatpakMetadata.existsSync(), true);
    final flatpakMetadataContents = await flatpakMetadata.readAsString();
    expect(
      flatpakMetadataContents.contains(dummyChangelog),
      false,
      reason: 'Dummy text found in Flatpak changelog',
    );
  });

  test('Check that metainfo <release> tags are in the right place', () async {
    final flatpakMetadata = File('flatpak/com.adilhanney.saber.metainfo.xml');
    expect(flatpakMetadata.existsSync(), true);
    final flatpakMetadataContents = await flatpakMetadata.readAsString();

    final releasesTag = flatpakMetadataContents.indexOf('<releases');
    expect(
      releasesTag,
      isNot(-1),
      reason: 'No <releases> tag found in Flatpak metainfo',
    );
    final releaseTag = flatpakMetadataContents.indexOf('<release ');
    expect(
      releaseTag,
      isNot(-1),
      reason: 'No <release> tag found in Flatpak metainfo',
    );

    expect(
      releaseTag > releasesTag,
      true,
      reason: '<release> tag is not inside <releases> tag',
    );
  });

  test('Test that buildNumber parses to buildName', () {
    final fromNumber = SaberVersion.fromNumber(buildNumber);
    final fromName = SaberVersion.fromName(buildName);

    expect(
      fromNumber.buildNumberWithoutRevision,
      equals(fromName.buildNumberWithoutRevision),
    );

    expect(fromNumber.buildName, equals(fromName.buildName));
  });

  test('Test that changelog can be downloaded from GitHub', () async {
    final changelog = await UpdateManager.getChangelog(
      newestVersion: buildNumber,
    );
    expect(
      changelog,
      isNotNull,
      reason:
          'Changelog can\'t be found on GitHub. Please ignore this test if you haven\'t pushed the latest version yet.',
    );
    expect(changelog, isNotEmpty);
    expect(
      changelog!.contains(dummyChangelog),
      false,
      reason: 'Dummy text found in changelog downloaded from GitHub',
    );
  });

  test('Test that changelog has been translated', () {
    for (final localeCode in localeNames.keys) {
      if (localeCode == 'en') continue;

      final file = File('metadata/$localeCode/changelogs/$buildNumber.txt');
      expect(
        file.existsSync(),
        true,
        reason: 'Changelog for $localeCode does not exist',
      );
    }
  });

  group('SaberVersion class', () {
    test('getters', () {
      final version = SaberVersion.fromNumber(127018);
      expect(version.buildName, '1.27.1');
      expect(version.buildNameWithCommas, '1,27,1');
      expect(version.buildNumber, 127018);
      expect(version.buildNumberWithoutRevision, 127010);
      expect(version.copyWith(revision: 5).buildNumber, 127015);
    });
    test('Equality', () {
      final version = SaberVersion.fromNumber(127018);

      final sameVersion = SaberVersion.fromNumber(127018);
      expect(version == sameVersion, true);
      final sameVersionRevised = SaberVersion.fromNumber(127019);
      expect(version == sameVersionRevised, true);

      final previousVersion = SaberVersion.fromNumber(127000);
      expect(version == previousVersion, false);
      final nextVersion = SaberVersion.fromNumber(127020);
      expect(version == nextVersion, false);
    });
    test('Object overrides', () {
      final version = SaberVersion.fromNumber(127018);
      expect(version.toString(), '1.27.1');
      expect(version.hashCode, Object.hash(1, 27, 1));
    });
    test('bumpMajor', () {
      final version = SaberVersion.fromNumber(127018);
      final bumped = version.bumpMajor();
      expect(bumped.buildName, '2.0.0');
    });
    test('bumpMinor', () {
      final version = SaberVersion.fromNumber(127018);
      final bumped = version.bumpMinor();
      expect(bumped.buildName, '1.28.0');
    });
    test('bumpPatch', () {
      final version = SaberVersion.fromNumber(127018);
      final bumped = version.bumpPatch();
      expect(bumped.buildName, '1.27.2');
    });
  });
}
