// Run `dart scripts/translate_changelogs.dart` to generate the changelogs.

// ignore_for_file: avoid_print

import 'dart:io';

import 'package:saber/data/locales.dart';
import 'package:saber/data/version.dart';
import 'package:simplytranslate/simplytranslate.dart';
import 'package:simplytranslate/src/langs/language.dart';

final nearestLocaleCodes = <String, String>{
  'zh-Hans-CN': 'zh-cn',
  'zh-Hant-TW': 'zh-tw',
};

Future<String> getEnglishChangelog() async {
  final file = File('metadata/en-US/changelogs/$buildNumber.txt');
  final changelog = await file.readAsString();
  return changelog;
}

void main() async {
  final translator = SimplyTranslator(EngineType.google);

  final englishChangelog = await getEnglishChangelog();
  print('English changelog for $buildName ($buildNumber):');
  print(englishChangelog);

  final localeCodes = localeNames.keys.toList();
  localeCodes.shuffle();

  final String total = localeCodes.length.toString();

  for (int i = 0; i < localeCodes.length; i++) {
    final localeCode = localeCodes[i];
    final localeName = localeNames[localeCode];

    /// The step number and total number of steps.
    /// e.g. 1/10
    final stepPrefix = '${(i + 1).toString().padLeft(total.length)}/$total';

    if (localeCode == 'en') continue;

    final file = File('metadata/$localeCode/changelogs/$buildNumber.txt');
    if (file.existsSync()) {
      print('$stepPrefix. Skipped $localeCode ($localeName) because it already exists.');
      continue;
    } else {
      print('$stepPrefix. Translating to $localeCode ($localeName)...');
    }

    final String nearestLocaleCode;
    if (LanguageList.contains(localeCode)) {
      nearestLocaleCode = localeCode;
    } else if (nearestLocaleCodes.containsKey(localeCode)) {
      nearestLocaleCode = nearestLocaleCodes[localeCode]!;
    } else if (LanguageList.contains(localeCode.substring(0, localeCode.indexOf('-')))) {
      nearestLocaleCode = localeCode.substring(0, localeCode.indexOf('-'));
    } else {
      print('${' ' * stepPrefix.length}  - Language not supported, skipping...');
      continue;
    }
    if (localeCode != nearestLocaleCode) {
      print('${' ' * stepPrefix.length}  - Selected $nearestLocaleCode');
    }

    Translation? translation;
    for (int _ = 0; _ < 10; _++) {
      try {
        translation = await translator.translateSimply(
          englishChangelog,
          from: 'en',
          to: nearestLocaleCode,
        );
      } catch (e) {
        await Future.delayed(const Duration(milliseconds: 100));
        // try again
      }
    }
    if (translation == null) {
      print('Translation failed, skipping...');
      continue;
    }

    String translatedChangelog = translation.translations.text;
    if (!translatedChangelog.endsWith('\n')) {
      translatedChangelog += '\n';
    }

    await file.create(recursive: true);
    await file.writeAsString(translatedChangelog);
  }
}
