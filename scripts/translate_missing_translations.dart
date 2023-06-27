// Run `dart scripts/translate_app.dart` to generate the changelogs.

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:simplytranslate/simplytranslate.dart';
import 'package:simplytranslate/src/langs/language.dart';

final nearestLocaleCodes = <String, String>{
  'zh-Hans-CN': 'zh-cn',
  'zh-Hant-TW': 'zh-tw',
};

Future<(Map<String, dynamic>, Map<String, dynamic>)> getMissingTranslations() async {
  final file = File('lib/i18n/_missing_translations.json');
  final json = await file.readAsString();
  return (jsonDecode(json) as Map<String, dynamic>, jsonDecode(json) as Map<String, dynamic>);
}
Future<void> writeMissingTranslations(Map<String, dynamic> missingTranslations) async {
  final file = File('lib/i18n/_missing_translations.json');
  final json = JsonEncoder.withIndent(' ' * 2).convert(missingTranslations);
  await file.writeAsString(json);
}

/// Translate the given tree of strings in place. Note that the tree can contain lists, maps, and strings.
Future<void> translateTree(SimplyTranslator translator, String languageCode, Map<String, dynamic> tree, Map<String, dynamic> originalTree) async {
  // first translate all direct descendants that are strings
  await Future.wait(tree.keys.map((key) {
    final value = tree[key];
    final originalValue = originalTree[key];
    if (value is String && value == originalValue) {
      return translateString(translator, languageCode, value).then((translated) {
        tree[key] = translated;
      });
    } else {
      // recurse in next step
      return Future.value();
    }
  }));

  // then recurse
  for (final key in tree.keys) {
    final value = tree[key];
    final originalValue = originalTree[key];
    if (value is String) {
      // already done
    } else if (value is Map<String, dynamic>) {
      await translateTree(translator, languageCode, value, originalValue);
    } else if (value is List<dynamic>) {
      await translateList(translator, languageCode, value, originalValue);
    } else {
      throw Exception('Unknown type: ${value.runtimeType}');
    }
  }
}
/// Translates the given list of strings in place. Note that the list can contain lists, maps, and strings.
Future<void> translateList(SimplyTranslator translator, String languageCode, List<dynamic> list, List<dynamic> originalList) async {
  // first translate all direct descendants that are strings
  await Future.wait(List.generate(list.length, (i) {
    final value = list[i];
    final originalValue = originalList[i];
    if (value is String && value == originalValue) {
      return translateString(translator, languageCode, value).then((translated) {
        list[i] = translated;
      });
    } else {
      // recurse in next step
      return Future.value();
    }
  }));

  // then recurse
  for (int i = 0; i < list.length; ++i) { // then recurse
    final value = list[i];
    final originalValue = originalList[i];
    if (value is String) {
      // already done
    } else if (value is Map<String, dynamic>) {
      await translateTree(translator, languageCode, value, originalValue);
    } else if (value is List<dynamic>) {
      await translateList(translator, languageCode, value, originalValue);
    } else {
      throw Exception('Unknown type: ${value.runtimeType}');
    }
  }
}
Future<String> translateString(SimplyTranslator translator, String languageCode, String english) async {
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
    return english;
  }
  final translatedText = translation.translations.text;
  if (translatedText.contains('Invalid request') || translatedText.contains('None is not supported')) {
    print('    Translation failed: $translatedText');
    errorOccurredInTranslatingTree = true;
    return english;
  }
  return translatedText;
}

bool errorOccurredInTranslatingTree = false;
void main() async {
  final random = Random();
  final (missingTranslations, originalMissingTranslations) = await getMissingTranslations();

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
    final translator = SimplyTranslator(useLibreEngine ? EngineType.libre : EngineType.google);

    for (final languageCode in missingLanguageCodes) {
      print('Translating $languageCode...');

      final Map<String, dynamic> tree = missingTranslations[languageCode];
      final Map<String, dynamic> originalTree = originalMissingTranslations[languageCode];

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
      await translateTree(translator, nearestLanguageCode, tree, originalTree);
    }

    if (errorOccurredInTranslatingTree) {
      print('\nError occurred. Retrying...');
    }
  }

  await writeMissingTranslations(missingTranslations);
  print('\nDone.');
}
