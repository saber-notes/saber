#!/usr/bin/env dart
// Run `dart scripts/translate_changelogs.dart` to generate the changelogs.

// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:saber/data/locales.dart';
import 'package:saber/data/version.dart';
import 'package:simplytranslate/simplytranslate.dart';
import 'package:simplytranslate/src/langs/language.dart';

import 'src/fix_spelling.dart';

const nearestLocaleCodes = <String, String>{
  'he': 'iw',
  'zh-Hans-CN': 'zh-cn',
  'zh-Hant-TW': 'zh-tw',
};

Future<String> getEnglishChangelog() async {
  final file = File('metadata/en-US/changelogs/$buildNumber.txt');
  final changelog = await file.readAsString();
  return changelog;
}

Future copyChangelogForFdroid(String localeCode) async {
  final normal = File('metadata/$localeCode/changelogs/$buildNumber.txt');
  final fdroid = File('metadata/$localeCode/changelogs/${buildNumber}3.txt');
  await normal.copy(fdroid.path);
}

void main() async {
  final random = Random();

  final useLibreEngine = random.nextBool();
  print('Using ${useLibreEngine ? 'Libre' : 'Google'} translation engine...\n');
  final translator = SimplyTranslator(
    useLibreEngine ? EngineType.libre : EngineType.google,
  );

  final englishChangelog = await getEnglishChangelog();
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

  var someTranslationsFailed = false;
  for (var i = 0; i < localeCodes.length; i++) {
    final localeCode = localeCodes[i];
    final localeName = localeNames[localeCode];

    /// The step number and total number of steps.
    /// e.g. 1/10
    final stepPrefix = '${(i + 1).toString().padLeft(total.length)}/$total';

    if (localeCode == 'en') {
      await copyChangelogForFdroid('en-US');
      continue;
    }

    final file = File('metadata/$localeCode/changelogs/$buildNumber.txt');
    if (file.existsSync()) {
      continue;
    } else {
      print('$stepPrefix. Translating to $localeCode ($localeName)...');
    }

    final String nearestLocaleCode;
    if (LanguageList.contains(localeCode)) {
      nearestLocaleCode = localeCode;
    } else if (nearestLocaleCodes.containsKey(localeCode)) {
      nearestLocaleCode = nearestLocaleCodes[localeCode]!;
    } else if (LanguageList.contains(
      localeCode.substring(0, localeCode.indexOf('-')),
    )) {
      nearestLocaleCode = localeCode.substring(0, localeCode.indexOf('-'));
    } else {
      print(
        '${' ' * stepPrefix.length}  ! Language not supported, skipping...',
      );
      someTranslationsFailed = true;
      continue;
    }
    if (localeCode != nearestLocaleCode) {
      print('${' ' * stepPrefix.length}  - Selected $nearestLocaleCode');
    }

    String translatedChangelog;
    try {
      translatedChangelog = await translator
          .translateSimply(
            englishChangelog,
            from: 'en',
            to: nearestLocaleCode,
            instanceMode: .Random,
            retries: 3,
          )
          .then((translation) => translation.translations.text)
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      print(
        '${' ' * stepPrefix.length}  ! ${e.toString().replaceAll('\n', '\\n')}',
      );
      print('${' ' * stepPrefix.length}  ! Translation failed, skipping...');
      someTranslationsFailed = true;
      continue;
    }

    translatedChangelog = fixSpelling(translatedChangelog);
    if (!translatedChangelog.endsWith('\n')) {
      // translations sometimes don't end with a newline
      translatedChangelog += '\n';
    }

    // Response might be something like "Invalid request: request (276) exceeds text limit (250)"
    const failurePrefixes = [
      'Invalid request: request (',
      'None is not supported',
    ];
    if (failurePrefixes.any(translatedChangelog.startsWith)) {
      print('${' ' * stepPrefix.length}  ! Translation invalid, skipping...');
      someTranslationsFailed = true;
      continue;
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
    await copyChangelogForFdroid(localeCode);
  }

  if (someTranslationsFailed) {
    print('\nSome translations failed: please re-run this script.');
    exit(1);
  } else {
    print('\nAll translations succeeded!');
    exit(0);
  }
}
