#!/usr/bin/env dart
// Run `dart scripts/translate_app.dart` to generate the changelogs.

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:saber/data/locales.dart';
import 'package:yaml/yaml.dart';

import 'src/fix_spelling.dart';
import 'src/lms_translator.dart';

final translator = LmsTranslator.create();

final Set<String> newlyTranslatedPaths = {};

Future<YamlMap> _getMissingTranslations() async {
  final file = File('lib/i18n/_missing_translations.yaml');
  final yaml = await file.readAsString();
  return loadYaml(yaml) as YamlMap;
}

/// Translate the given tree of strings in place.
/// Note that the tree can contain lists, maps, and strings.
Future<void> translateTree(
  String languageCode,
  YamlMap tree,
  List<Object> pathOfKeys,
) async {
  // first translate all direct descendants that are strings
  for (final key in tree.keys) {
    if (key is! String) continue;
    if (key.endsWith('(OUTDATED)')) continue;

    final childPathOfKeys = [...pathOfKeys, key];
    final childPathString = childPathOfKeys.join('.');
    if (newlyTranslatedPaths.contains('$languageCode/$childPathString'))
      continue;

    final value = tree[key];
    if (value is! String) continue;

    final translated = await translateString(languageCode, value);

    _insert(languageCode, childPathOfKeys, translated);
    newlyTranslatedPaths.add('$languageCode/$childPathString');
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
  List<Object> pathOfKeys,
) async {
  // first translate all direct descendants that are strings
  for (var i = 0; i < list.length; ++i) {
    final childPathOfKeys = [...pathOfKeys, i];
    final childPathString = childPathOfKeys.join('.');
    if (newlyTranslatedPaths.contains('$languageCode/$childPathString'))
      continue;

    final value = list[i];
    if (value is! String) continue;

    final translated = await translateString(languageCode, value);

    _insert(languageCode, childPathOfKeys, translated);
    newlyTranslatedPaths.add('$languageCode/$childPathString');
  }

  // then recurse
  for (var i = 0; i < list.length; ++i) {
    // then recurse
    final value = list[i];
    if (value is String) {
      // already done
    } else if (value is YamlMap) {
      await translateTree(languageCode, value, [...pathOfKeys, i]);
    } else if (value is YamlList) {
      await translateList(languageCode, value, [...pathOfKeys, i]);
    } else {
      throw Exception('Unknown type: ${value.runtimeType}');
    }
  }
}

Future<String> translateString(String localeCode, String english) async {
  final short =
      (english.length > 100 ? '${english.substring(0, 100)}...' : english)
          .replaceAll('\n', '\\n');
  final localeName = localeNames[localeCode];
  print('  Translating into $localeName ($localeCode): $short');

  final translatedText = (await translator).translate(
    english,
    to: '$localeName ($localeCode)',
  );

  return fixSpelling(translatedText);
}

var errorOccurredInTranslatingTree = false;
void main() async {
  await _runLive('dart', ['run', 'slang']);
  await _runLive('dart', ['run', 'slang', 'analyze', '--full']);

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
  while (errorOccurredInTranslatingTree && attempts < 10) {
    errorOccurredInTranslatingTree = false;
    attempts++;

    for (final languageCode in missingLanguageCodes) {
      print('Translating $languageCode...');

      final YamlMap tree = missingTranslations[languageCode];
      await translateTree(languageCode, tree, const []);
    }

    if (errorOccurredInTranslatingTree && attempts < 5) {
      print('\nError occurred. Retrying...');
    }
  }
  if (errorOccurredInTranslatingTree) {
    print('\nError occurred too many times. Please rerun the script.');
  }

  if (newlyTranslatedPaths.isNotEmpty) {
    await _runLive('dart', ['run', 'slang', 'normalize']);
    await _runLive('dart', ['run', 'slang']);
    await _runLive('dart', ['run', 'slang', 'analyze', '--full']);
  }
}

void _insert(String languageCode, List<Object> pathOfKeys, String translated) {
  final query = StringBuffer();
  for (var i = 0; i < pathOfKeys.length; ++i) {
    var key = pathOfKeys[i];

    if (key is int) {
      query.writeAll(['[', key, ']']);
    } else if (key is String) {
      if (i == pathOfKeys.length - 1) {
        key += '(OUTDATED)';
      } else if (i == pathOfKeys.length - 2 && pathOfKeys.last is int) {
        // can't put (OUTDATED) on the list index, so put it here
        key += '(OUTDATED)';
      }
      query.writeAll(['.', jsonEncode(key)]);
    }
  }

  _run('yq', [
    '-i',
    '$query = ${jsonEncode(translated)}',
    'lib/i18n/$languageCode.i18n.yaml',
  ]);
}

/// Runs a command silently and returns its output as a string.
String _run(String exe, List<String> args) => Process.runSync(exe, args).stdout;

/// Runs a command interactively, but cannot return its output.
Future<void> _runLive(String exe, List<String> args) async {
  final process = await Process.start(exe, args, mode: .inheritStdio);
  final exitCode = await process.exitCode;
  if (exitCode != 0) throw ProcessException(exe, args, '', exitCode);
}
