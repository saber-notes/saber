#!/usr/bin/env dart
// Run `dart scripts/translate_app.dart` to generate the changelogs.

// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:simplytranslate/simplytranslate.dart';
import 'package:simplytranslate/src/langs/language.dart';
import 'package:yaml/yaml.dart';

import 'src/fix_spelling.dart';

late SimplyTranslator translator;

final Set<String> newlyTranslatedPaths = {};

Future<YamlMap> _getMissingTranslations() async {
  final file = File('lib/i18n/_missing_translations.yaml');
  final yaml = await file.readAsString();
  return loadYaml(yaml) as YamlMap;
}

String _nearestLocaleCode(String localeCode) {
  const nearestLocaleCodes = <String, String>{
    'he': 'iw',
    'zh-Hans-CN': 'zh-cn',
    'zh-Hant-TW': 'zh-tw',
  };

  if (LanguageList.contains(localeCode)) {
    return localeCode;
  } else if (nearestLocaleCodes.containsKey(localeCode)) {
    return nearestLocaleCodes[localeCode]!;
  } else if (LanguageList.contains(localeCode.split('-').first)) {
    return localeCode.split('-').first;
  } else {
    throw 'No nearest language code found for $localeCode.';
  }
}

/// Translate the given tree of strings in place.
/// Note that the tree can contain lists, maps, and strings.
Future<void> translateTree(
  String languageCode,
  YamlMap tree,
  List<String> pathOfKeys,
) async {
  // first translate all direct descendants that are strings
  for (final key in tree.keys) {
    if (key is! String) continue;
    if (key.endsWith('(OUTDATED)')) continue;

    final pathToKey = [...pathOfKeys, key].join('.');
    if (newlyTranslatedPaths.contains('$languageCode/$pathToKey')) continue;

    final value = tree[key];
    if (value is! String) continue;

    final translated = await translateString(translator, languageCode, value);

    // error occured in translation, so skip for now
    if (translated == null || translated == value) continue;

    try {
      await Process.run('dart', [
        'run',
        'slang',
        'add',
        languageCode,
        pathToKey,
        translated,
      ]);
    } catch (e) {
      print('    Adding translation failed: $e');
      errorOccurredInTranslatingTree = true;
      continue;
    }
    newlyTranslatedPaths.add('$languageCode/$pathToKey');
  }

  // then recurse
  for (final key in tree.keys) {
    if (key is! String) continue;
    if (key.endsWith('(OUTDATED)')) continue;

    final value = tree[key];
    if (value is String) {
      // already done
    } else if (value is YamlMap) {
      await translateTree(languageCode, value, [...pathOfKeys, key]);
    } else if (value is YamlList) {
      await translateList(languageCode, value, [...pathOfKeys, key]);
    } else {
      throw Exception('Unknown type: ${value.runtimeType}');
    }
  }
}

/// Translates the given list of strings in place.
/// Note that the list can contain lists, maps, and strings.
Future<void> translateList(
  String languageCode,
  YamlList list,
  List<String> pathOfKeys,
) async {
  // first translate all direct descendants that are strings
  for (var i = 0; i < list.length; ++i) {
    final pathToKey = [...pathOfKeys, i].join('.');
    if (newlyTranslatedPaths.contains('$languageCode/$pathToKey')) continue;

    final value = list[i];
    if (value is! String) continue;

    final translated = await translateString(translator, languageCode, value);

    // error occurred in translation, so skip for now
    if (translated == null || translated == value) continue;

    try {
      await Process.run('dart', [
        'run',
        'slang',
        'add',
        languageCode,
        pathToKey,
        translated,
      ]);
    } catch (e) {
      print('    Adding translation failed: $e');
      errorOccurredInTranslatingTree = true;
      continue;
    }
    newlyTranslatedPaths.add('$languageCode/$pathToKey');
  }

  // then recurse
  for (var i = 0; i < list.length; ++i) {
    // then recurse
    final value = list[i];
    if (value is String) {
      // already done
    } else if (value is YamlMap) {
      await translateTree(languageCode, value, [...pathOfKeys, '$i']);
    } else if (value is YamlList) {
      await translateList(languageCode, value, [...pathOfKeys, '$i']);
    } else {
      throw Exception('Unknown type: ${value.runtimeType}');
    }
  }
}

Future<String?> translateString(
  SimplyTranslator translator,
  String languageCode,
  String english,
) async {
  print(
    '  Translating into $languageCode: '
    '${english.length > 20 ? '${english.substring(0, 20)}...' : english}',
  );

  String translatedText;
  try {
    translatedText = await translator
        .translateSimply(
          english,
          from: 'en',
          to: _nearestLocaleCode(languageCode),
        )
        .then((translation) => translation.translations.text)
        .timeout(const Duration(seconds: 10));
  } catch (e) {
    print('    Translation failed: $e');
    errorOccurredInTranslatingTree = true;
    return null;
  }

  final errorTexts = [
    'Invalid request',
    'None is not supported',
    'Slowdown: 10 per 1 minute',
  ];
  if (errorTexts.any((error) => translatedText.contains(error))) {
    print('    Translation failed: $translatedText');
    errorOccurredInTranslatingTree = true;
    return english;
  }

  return fixSpelling(translatedText);
}

var errorOccurredInTranslatingTree = false;
void main() async {
  final random = Random();
  final missingTranslations = await _getMissingTranslations();

  final missingLanguageCodes = missingTranslations.keys
      .cast<String>()
      .where(
        (String languageCode) => switch (missingTranslations[languageCode]) {
          (final YamlList list) => list.isNotEmpty,
          (final YamlMap map) => map.isNotEmpty,
          _ => false,
        },
      )
      .where((languageCode) => !languageCode.startsWith('@@'))
      .toList();
  print(
    'Found missing translations for '
    '${missingLanguageCodes.length} languages.',
  );

  errorOccurredInTranslatingTree = true;
  var attempts = 0;
  while (errorOccurredInTranslatingTree && attempts < 5) {
    errorOccurredInTranslatingTree = false;
    attempts++;

    final useLibreEngine = random.nextBool();
    print(
      'Using ${useLibreEngine ? 'Libre' : 'Google'} translation engine...\n',
    );
    translator = SimplyTranslator(
      useLibreEngine ? EngineType.libre : EngineType.google,
    );

    for (final languageCode in missingLanguageCodes) {
      print('Translating $languageCode...');

      final YamlMap tree = missingTranslations[languageCode];
      await translateTree(languageCode, tree, const []);
    }

    if (errorOccurredInTranslatingTree) {
      print('\nError occurred. Retrying...');
    }
  }

  // mark all newly translated paths as outdated
  // for a human to review
  final pathsWithoutLanguageCode = newlyTranslatedPaths
      .map((e) => e.substring(e.indexOf('/') + 1))
      .toSet();
  for (final path in pathsWithoutLanguageCode) {
    print('Marking $path as outdated...');
    await Process.run('dart', ['run', 'slang', 'outdated', path]);
  }
}
