// Run `dart scripts/translate_app.dart` to generate the changelogs.

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:process_run/shell.dart';
import 'package:simplytranslate/simplytranslate.dart';
import 'package:simplytranslate/src/langs/language.dart';

final Shell shell = Shell(verbose: false);
late SimplyTranslator translator;

final nearestLocaleCodes = <String, String>{
  'zh-Hans-CN': 'zh-cn',
  'zh-Hant-TW': 'zh-tw',
};

Future<Map<String, dynamic>> _getMissingTranslations() async {
  final file = File('lib/i18n/_missing_translations.json');
  final json = await file.readAsString();
  return jsonDecode(json) as Map<String, dynamic>;
}

/// Translate the given tree of strings in place. Note that the tree can contain lists, maps, and strings.
Future<void> translateTree(String languageCode, Map<String, dynamic> tree, List<String> pathOfKeys) async {
  // first translate all direct descendants that are strings
  for (final key in tree.keys) {
    if (key.endsWith('(OUTDATED)')) continue;

    final value = tree[key];
    if (value is! String) continue;
    if (value.isEmpty) continue; // already translated in a previous iteration

    final translated = await translateString(translator, languageCode, value);
    if (translated == null) continue; // error occured in translation, so skip for now
    final pathToKey = [...pathOfKeys, key].join('.');
    await shell.run('dart run slang add $languageCode $pathToKey "${translated.replaceAll('"', '\\"')}"');
    tree[key] = '';
  }

  // then recurse
  for (final key in tree.keys) {
    if (key.endsWith('(OUTDATED)')) continue;

    final value = tree[key];
    if (value is String) {
      // already done
    } else if (value is Map<String, dynamic>) {
      await translateTree(languageCode, value, [...pathOfKeys, key]);
    } else if (value is List<dynamic>) {
      await translateList(languageCode, value, [...pathOfKeys, key]);
    } else {
      throw Exception('Unknown type: ${value.runtimeType}');
    }
  }
}
/// Translates the given list of strings in place. Note that the list can contain lists, maps, and strings.
Future<void> translateList(String languageCode, List<dynamic> list, List<String> pathOfKeys) async {
  // first translate all direct descendants that are strings
  for (int i = 0; i < list.length; ++i) {
    final value = list[i];
    if (value is! String) continue;
    if (value.isEmpty) continue; // already translated in a previous iteration

    final translated = await translateString(translator, languageCode, value);
    if (translated == null) continue; // error occurred in translation, so skip for now
    final pathToKey = [...pathOfKeys, i].join('.');
    await shell.run('dart run slang add $languageCode $pathToKey "${translated.replaceAll('"', '\\"')}"');
    list[i] = '';
  }

  // then recurse
  for (int i = 0; i < list.length; ++i) { // then recurse
    final value = list[i];
    if (value is String) {
      // already done
    } else if (value is Map<String, dynamic>) {
      await translateTree(languageCode, value, [...pathOfKeys, '$i']);
    } else if (value is List<dynamic>) {
      await translateList(languageCode, value, [...pathOfKeys, '$i']);
    } else {
      throw Exception('Unknown type: ${value.runtimeType}');
    }
  }
}
Future<String?> translateString(SimplyTranslator translator, String languageCode, String english) async {
  print('  Translating into $languageCode: ${english.length > 20 ? '${english.substring(0, 20)}...' : english}');
  Translation translation;
  try {
    translation = await translator.translateSimply(
      english,
      from: 'en',
      to: languageCode,
    ).timeout(const Duration(seconds: 3));
  } catch (e) {
    print('    Translation failed: $e');
    errorOccurredInTranslatingTree = true;
    return null;
  }

  final translatedText = translation.translations.text;
  if (translatedText.contains('Invalid request') || translatedText.contains('None is not supported')) {
    print('    Translation failed: $translatedText');
    errorOccurredInTranslatingTree = true;
    return english;
  }

  translatedText.replaceAll('Sabre', 'Saber');

  return translatedText;
}

bool errorOccurredInTranslatingTree = false;
void main() async {
  final random = Random();
  final missingTranslations = await _getMissingTranslations();

  final missingLanguageCodes = missingTranslations.keys
      .where((languageCode) => missingTranslations[languageCode].isNotEmpty)
      .where((languageCode) => !languageCode.startsWith('@@'))
      .toList();
  print('Found missing translations for ${missingLanguageCodes.length} languages.');

  errorOccurredInTranslatingTree = true;
  while (errorOccurredInTranslatingTree) {
    errorOccurredInTranslatingTree = false;

    final useLibreEngine = random.nextBool();
    print('Using ${useLibreEngine ? 'Libre' : 'Google'} translation engine...\n');
    translator = SimplyTranslator(useLibreEngine ? EngineType.libre : EngineType.google);

    for (final languageCode in missingLanguageCodes) {
      print('Translating $languageCode...');

      final Map<String, dynamic> tree = missingTranslations[languageCode];

      final String nearestLanguageCode;
      if (LanguageList.contains(languageCode)) {
        nearestLanguageCode = languageCode;
      } else if (nearestLocaleCodes.containsKey(languageCode)) {
        nearestLanguageCode = nearestLocaleCodes[languageCode]!;
      } else if (LanguageList.contains(languageCode.split('-').first)) {
        nearestLanguageCode = languageCode.split('-').first;
      } else {
        print('  No nearest language code found for $languageCode.');
        continue;
      }
      await translateTree(nearestLanguageCode, tree, const []);
    }

    if (errorOccurredInTranslatingTree) {
      print('\nError occurred. Retrying...');
    }
  }
}
