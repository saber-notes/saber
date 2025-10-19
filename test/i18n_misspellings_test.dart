import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check that Saber isn\'t misspelled', () async {
    final List<File> files = [
      File('lib/i18n/_missing_translations.yaml'),
      ...Directory('lib/i18n').listSync().whereType<File>(),

      // Metadata files like metadata/XX/full_description.txt
      ...Directory('metadata')
          .listSync()
          .whereType<Directory>()
          .expand((dir) => dir.listSync())
          .whereType<File>()
          .where(
            (file) =>
                file.path.endsWith('full_description.txt') ||
                file.path.endsWith('short_description.txt') ||
                file.path.endsWith('title.txt'),
          ),
    ];

    await Future.wait([
      for (final file in files)
        file.readAsString().then((contents) {
          expect(
            contents,
            isNot(contains('Sabre')),
            reason: 'Saber is misspelled as Sabre in ${file.path}',
          );
        }),
    ]);
  });
}
