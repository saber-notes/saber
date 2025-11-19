import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/home/home.dart';

void main() {
  group('Home themes', () {
    for (final platform in TargetPlatform.values)
      for (final brightness in Brightness.values)
        testGoldens('${platform.name}_${brightness.name}', (tester) async {
          FlavorConfig.setup();
          stows.sentryConsent.value = .granted;

          final theme = SaberTheme.createThemeFromSeed(
            Colors.yellow,
            brightness,
            platform,
          );
          await tester.pumpWidget(
            ScreenshotApp.withConditionalTitlebar(
              device: GoldenScreenshotDevices.androidPhone.device,
              title: 'Saber',
              theme: theme,
              home: Theme(
                data: theme,
                child: const HomePage(
                  subpage: HomePage.recentSubpage,
                  path: '',
                ),
              ),
            ),
          );
          await tester.loadAssets();
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(MaterialApp),
            matchesGoldenFile(
              'goldens/home_theme_${platform.name}_${brightness.name}.png',
            ),
          );
        });
  });
}
