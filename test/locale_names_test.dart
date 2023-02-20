import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/i18n/strings.g.dart';

void main() {
  test('Test that all supported languages have a localised name', () {
    for (Locale locale in AppLocaleUtils.supportedLocales) {
      final String localeCode = locale.toLanguageTag();
      expect(localeNames.containsKey(localeCode), true, reason: 'Missing locale name for $localeCode');
    }
  });
}
