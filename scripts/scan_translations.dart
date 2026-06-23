#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';

import 'src/lms_translator.dart';

Future<void> main() async {
  const systemPrompt = '''
Read this crowdsourced translation file and list any which are malicious, political, or inappropriate.
Ignore syntax errors and the "(OUTDATED)" annotation: they are not relevant here.
Output only the affected strings and a brief (<5 words) description of the issue in English.
Output only the tick emoji ✅ if there are no issues.
''';
  final lms = await LmsTranslator.create();

  try {
    final files = [
      ...Directory('lib/i18n')
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.i18n.yaml'))
          .sortedBy((file) => file.path),
      ...Directory('metadata')
          .listSync()
          .whereType<Directory>()
          .expand(
            (dir) => [
              File('${dir.path}/full_description.txt'),
              File('${dir.path}/short_description.txt'),
            ],
          )
          .where((file) => file.existsSync()),
    ];
    for (final file in files) {
      print('Reading ${file.path}');
      final lines = await file.readAsLines();
      const chunkSize = 64;
      for (var start = 0; start < lines.length; start += chunkSize) {
        final end = min(lines.length, start + chunkSize);
        print('Scanning $start-$end of ${lines.length}...');
        final chunk = lines.slice(start, end).join('\n');
        final response = lms.query(chunk, systemPrompt);
        if (response == '✅') continue;
        print('🔥');
        stderr.writeln(response);
        print('🔥');
      }
      print('');
    }
  } finally {
    lms.dispose();
  }
}
