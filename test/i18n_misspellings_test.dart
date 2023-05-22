import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Check that Saber isn\'t misspelled', () {
    final List<FileSystemEntity> files = [
      File('lib/i18n/_missing_translations.json'),
      ...Directory('lib/i18n/community').listSync(),
    ];

    for (final file in files) {
      test('in ${file.path}', () async {
        final contents = await File(file.path).readAsString();
        expect(contents, isNot(contains('Sabre')), reason: 'Saber is misspelled as Sabre in ${file.path}');
      });
    }
  });
}
