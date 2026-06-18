import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/i18n/strings.g.dart';

void main() {
  test('Test that all supported languages have a localised name', () {
    for (final locale in AppLocaleUtils.supportedLocales) {
      final localeCode = locale.toLanguageTag();
      expect(
        localeNames,
        contains(localeCode),
        reason: 'Missing locale name for $localeCode',
      );
    }
  });
}
