@TestOn('linux || mac-os || windows')

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:process_run/shell.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/data/version.dart';

const String dummyChangelog = 'Release notes will be added here.';

void main() {
  test('Check for dummy text in changelogs', () async {
    final File androidMetadata = File('metadata/en-US/changelogs/$buildNumber.txt');
    expect(androidMetadata.existsSync(), true);
    final String androidMetadataContents = await androidMetadata.readAsString();
    expect(androidMetadataContents.contains(dummyChangelog), false, reason: 'Dummy text found in Android changelog');

    final File flatpakMetadata = File('flatpak/com.adilhanney.saber.metainfo.xml');
    expect(flatpakMetadata.existsSync(), true);
    final String flatpakMetadataContents = await flatpakMetadata.readAsString();
    expect(flatpakMetadataContents.contains(dummyChangelog), false, reason: 'Dummy text found in Flatpak changelog');
  });

  test('Check that metainfo <release> tags are in the right place', () async {
    final File flatpakMetadata = File('flatpak/com.adilhanney.saber.metainfo.xml');
    expect(flatpakMetadata.existsSync(), true);
    final String flatpakMetadataContents = await flatpakMetadata.readAsString();
    
    final releasesTag = flatpakMetadataContents.indexOf('<releases');
    expect(releasesTag, isNot(-1), reason: 'No <releases> tag found in Flatpak metainfo');
    final releaseTag = flatpakMetadataContents.indexOf('<release ');
    expect(releaseTag, isNot(-1), reason: 'No <release> tag found in Flatpak metainfo');

    expect(releaseTag > releasesTag, true, reason: '<release> tag is not inside <releases> tag');
  });

  test('Test that buildNumber parses to buildName', () {
    final v = UpdateManager.parseVersionNumber(buildNumber);
    expect('${v.major}.${v.minor}.${v.patch}', buildName);
  });

  test('Test that versions in code are valid', () async {
    // We will use git's history to see if ./scripts/apply_version.sh
    // changes anything. If it does, then the versions in the
    // code are not valid.

    final shell = Shell(verbose: false);

    // Initial commit to hide any unrelated changes...
    printOnFailure('Stashing any existing changes...');
    await shell.run('''
    touch stash-me.txt  # make sure we can stash
    git stash --include-untracked
    ''');
    addTearDown(() async {
      // restore changes
      await shell.run('''
      touch stash-me-2.txt  # make sure we can stash
      git stash --include-untracked
      git stash drop
      ''');
      // restore original stash
      await shell.run('''
      git stash pop
      rm stash-me.txt
      ''');
    });

    // expect git to be clean
    final before = await shell.run('git status --porcelain');
    expect(before.outText.isEmpty, true, reason: 'Git status is not initially clean');

    // Run `./scripts/apply_version.sh` to update the version in code...
    const command = 'bash ./scripts/apply_version.sh $buildName $buildNumber -q';
    printOnFailure('Running: $command');
    await shell.run(command);

    // expect that script didn't need to change anything
    final after = await shell.run('git diff -w'); // ignore whitespace
    printOnFailure('Git diff after running $command:\n ${after.outText}');
    expect(after.outText.isEmpty, true, reason: './scripts/apply_version.sh found inconsistencies');
  });

  test('Test that changelog can be downloaded from GitHub', () async {
    final changelog = await UpdateManager.getChangelog(
      newestVersion: buildNumber,
    );
    expect(changelog, isNotNull, reason: 'Changelog can\'t be found on GitHub. Please ignore this test if you haven\'t pushed the latest version yet.');
    expect(changelog, isNotEmpty);
    expect(changelog!.contains(dummyChangelog), false, reason: 'Dummy text found in changelog downloaded from GitHub');
  });

  test('Test that changelog has been translated', () {
    for (final localeCode in localeNames.keys) {
      if (localeCode == 'en') continue;

      final File file = File('metadata/$localeCode/changelogs/$buildNumber.txt');
      expect(file.existsSync(), true, reason: 'Changelog for $localeCode does not exist');
    }
  });
}
