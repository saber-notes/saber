import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:saber/data/sentry/sentry_init.dart';
import 'package:saber/pages/home/home.dart';

void main() {
  group('SentryConsentDialog', () {
    testGoldens('', (tester) async {
      FlavorConfig.setup();
      disableSentryForTesting();
      // The consent dialog will be automatically shown if consent is unknown.
      stows.sentryConsent.value = SentryConsent.unknown;

      await tester.pumpWidget(ScreenshotApp(
        device: GoldenScreenshotDevices.android.device,
        child: const HomePage(
          subpage: HomePage.settingsSubpage,
          path: '',
        ),
      ));

      await tester.loadFonts();
      await tester.precacheImagesInWidgetTree();
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/sentry_consent_dialog.png'),
      );
    });
  });
}
