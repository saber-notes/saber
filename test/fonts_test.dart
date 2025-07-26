import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/theming/font_fallbacks.dart';

const _appFonts = [
  'AtkinsonHyperlegible',
  'Dekko',
  'FiraMono',
  // Note that we no longer bundle Inter with the app, so it should fall back to Roboto in tests.
  'Inter',
  'Neucha'
];

void main() {
  testGoldens('Fonts', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              for (final font in _appFonts)
                Expanded(
                  child: Text(
                    font,
                    style: TextStyle(fontFamily: font, fontSize: 48),
                  ),
                ),
            ],
          ),
        ),
      ),
    ));

    await tester.loadFonts(overriddenFonts: saberSansSerifFontFallbacks);
    await tester.pumpAndSettle();

    tester.useFuzzyComparator(allowedDiffPercent: 0.1);
    await expectLater(
      find.byType(Column),
      matchesGoldenFile('goldens/fonts.png'),
    );
  });
}
