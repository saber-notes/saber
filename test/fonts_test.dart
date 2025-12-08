import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';

const _appFonts = [
  'AtkinsonHyperlegibleNext',
  'Dekko',
  'FiraMono',
  'Inter',
  'Neucha',
];

void main() {
  group('Fonts', () {
    for (final font in _appFonts) {
      testGoldens(font, (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        font,
                        style: TextStyle(fontFamily: font, fontSize: 24),
                      ),
                    ),
                  ),
                  for (final fontWeight in FontWeight.values)
                    Row(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          fontWeight.value.toString(),
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: fontWeight,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'The quick brown fox jumps over the lazy dog.\n'
                          'THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.\n'
                          '0123456789',
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: fontWeight,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );

        await tester.loadAssets();
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(Column),
          matchesGoldenFile('goldens/$font.png'),
        );
      });
    }
  });
}
