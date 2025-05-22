import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';

const _appFonts = [
  'AtkinsonHyperlegible',
  'Dekko',
  'FiraMono',
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

    await tester.loadFonts();
    await tester.pumpAndSettle();

    tester.useFuzzyComparator(allowedDiffPercent: 0.1);
    await expectLater(
      find.byType(Column),
      matchesGoldenFile('goldens/fonts.png'),
    );
  });
}
