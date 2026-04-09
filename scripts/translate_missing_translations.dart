#!/usr/bin/env dart
// Run `dart scripts/translate_app.dart` to generate the changelogs.

// ignore_for_file: avoid_print

import 'dart:io';

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

    final translated = await translateString(languageCode, value);

    // error occured in translation, so skip for now
    if (translated == null || translated == value) continue;

    _run('dart', ['run', 'slang', 'add', languageCode, pathToKey, translated]);
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

    final translated = await translateString(languageCode, value);

    // error occurred in translation, so skip for now
    if (translated == null || translated == value) continue;

    _run('dart', ['run', 'slang', 'add', languageCode, pathToKey, translated]);
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

Future<String?> translateString(String languageCode, String english) async {
  print(
    '  Translating into $languageCode: '
    '${english.length > 50 ? '${english.substring(0, 50)}...' : english}',
  );

  final translatedText = (await translator).translate(
    english,
    from: 'en',
    to: languageCode,
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

  // mark all newly translated paths as outdated
  // for a human to review
  final pathsWithoutLanguageCode = newlyTranslatedPaths
      .map((e) => e.substring(e.indexOf('/') + 1))
      .toSet();
  for (final path in pathsWithoutLanguageCode) {
    print('Marking $path as outdated...');
    _run('dart', ['run', 'slang', 'outdated', path]);
  }

  if (newlyTranslatedPaths.isNotEmpty) {
    await _runLive('dart', ['run', 'slang']);
    await _runLive('dart', ['run', 'slang', 'analyze', '--full']);
  }
}

/// Runs a command silently and returns its output as a string.
String _run(String exe, List<String> args) => Process.runSync(exe, args).stdout;

/// Runs a command interactively, but cannot return its output.
Future<void> _runLive(String exe, List<String> args) async {
  final process = await Process.start(exe, args, mode: .inheritStdio);
  final exitCode = await process.exitCode;
  if (exitCode != 0) throw ProcessException(exe, args, '', exitCode);
}
