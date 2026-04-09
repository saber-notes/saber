#!/usr/bin/env dart
// Run `dart scripts/translate_changelogs.dart` to generate the changelogs.

// ignore_for_file: avoid_print

import 'dart:io';

import 'package:saber/data/locales.dart';
import 'package:saber/data/version.dart';

import 'src/fix_spelling.dart';
import 'src/lms_translator.dart';

void copyChangelogForFdroid(String localeCode) async {
  final normal = File('metadata/$localeCode/changelogs/$buildNumber.txt');
  final fdroid = File('metadata/$localeCode/changelogs/${buildNumber}3.txt');
  normal.copySync(fdroid.path);
}

void main() async {
  final englishChangelog = File(
    'metadata/en-US/changelogs/$buildNumber.txt',
  ).readAsStringSync();
  print('English changelog for $buildName ($buildNumber):');
  print(englishChangelog);

  if (englishChangelog.length > 500) {
    print(
      'Warning: The English changelog has length ${englishChangelog.length}, '
      'but Google Play only allows 500 characters.',
    );
    print('Please shorten the changelog and try again.');
    return;
  }

  final localeCodes = localeNames.keys.toList();

  final total = localeCodes.length.toString();

  late final translator = LmsTranslator.create();

  var someTranslationsFailed = false;
  for (var i = 0; i < localeCodes.length; i++) {
    final localeCode = localeCodes[i];
    final localeName = localeNames[localeCode];

    /// The step number and total number of steps.
    /// e.g. 1/10
    final stepPrefix = '${(i + 1).toString().padLeft(total.length)}/$total';

    if (localeCode == 'en') {
      copyChangelogForFdroid('en-US');
      continue;
    }

    final file = File('metadata/$localeCode/changelogs/$buildNumber.txt');
    if (file.existsSync()) {
      continue;
    } else {
      print('$stepPrefix. Translating to $localeCode ($localeName)...');
    }

    var translatedChangelog = (await translator).translate(
      englishChangelog,
      from: 'en',
      to: localeCode,
    );

    translatedChangelog = fixSpelling(translatedChangelog);
    if (!translatedChangelog.endsWith('\n')) {
      // translations sometimes don't end with a newline
      translatedChangelog += '\n';
    }

    const bullet = '•';
    if (englishChangelog.contains(bullet) &&
        !translatedChangelog.contains(bullet)) {
      print('${' ' * stepPrefix.length}  ! Translation invalid, skipping...');
      someTranslationsFailed = true;
      continue;
    }

    if (translatedChangelog.length > 500) {
      final oldLength = translatedChangelog.length;
      const suffix = '\n...\n';
      var linesRemoved = -1; // -1 to account for removing the trailing newline
      while (translatedChangelog.length > 500 - suffix.length) {
        final lastNewlineIndex = translatedChangelog.lastIndexOf('\n');
        translatedChangelog = translatedChangelog.substring(
          0,
          lastNewlineIndex,
        );
        linesRemoved++;
      }
      translatedChangelog += suffix;
      print(
        '${' ' * stepPrefix.length}  ! Removed $linesRemoved lines to '
        'shorten the changelog from $oldLength to '
        '${translatedChangelog.length} characters (max 500).',
      );
    }

    await file.create(recursive: true);
    await file.writeAsString(translatedChangelog);
    copyChangelogForFdroid(localeCode);
  }

  if (someTranslationsFailed) {
    print('\nSome translations failed: please re-run this script.');
    exit(1);
  } else {
    print('\nAll translations succeeded!');
    exit(0);
  }
}
