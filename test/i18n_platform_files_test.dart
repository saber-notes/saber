import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/i18n/strings.g.dart';

void main() {
  group('Locales listed in platform files', () {
    for (final path in ['ios/Runner/Info.plist', 'macos/Runner/Info.plist']) {
      test(path, () async {
        var contents = await File(path).readAsString();

        // trim to this section to make failed tests more readable
        final start = contents.indexOf('<key>CFBundleLocalizations</key>');
        contents = contents.substring(
          start,
          contents.indexOf('</array>', start),
        );

        for (final locale in AppLocaleUtils.supportedLocales) {
          var localeCode = locale.toLanguageTag();
          localeCode =
              {
                'pt-BR': 'pt_BR',
                'zh-Hans-CN': 'zh_CN',
                'zh-Hant-TW': 'zh_TW',
              }[localeCode] ??
              localeCode;

          expect(contents, contains('<string>$localeCode</string>'));
        }
      });
    }

    test('android locales_config.xml', () async {
      final contents = await File(
        'android/app/src/main/res/xml/locales_config.xml',
      ).readAsString();

      for (final locale in AppLocaleUtils.supportedLocales) {
        final localeCode = locale.toLanguageTag();
        expect(contents, contains('<locale android:name="$localeCode"/>'));
      }
    });
  });
}
