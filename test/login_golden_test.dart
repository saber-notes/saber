import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/user/login.dart';

import 'utils/test_user.dart';

final _device = GoldenSmallDevices.iphone.device;
late ThemeData _theme;

void main() {
  group('LoginPage', () {
    setUp(() {
      FlavorConfig.setup();
      _theme = SaberTheme.createThemeFromSeed(
        Colors.yellow,
        Brightness.light,
        _device.platform,
      );
      stows.username.value = 'testuser';
      stows.ncPassword.value = 'testpassword';
      stows.encPassword.value = 'encpassword';
      stows.key.value = 'encryptionkey';
      stows.iv.value = 'encryptioniv';
      stows.lastStorageQuota.value = TestUser.getQuota();
    });

    for (final step in LoginStep.values) {
      testGoldens(step.name, (tester) async {
        final app = _LoginApp(step);
        await tester.pumpWidget(app);
        await tester.loadAssets(overriddenFonts: saberSansSerifFontFallbacks);
        await tester.pumpFrames(app, const Duration(seconds: 1));

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile('goldens/login_page_${step.name}.png'),
        );
      });
    }

    testGoldens('done_faq', (tester) async {
      await tester.pumpWidget(const _LoginApp(LoginStep.done));
      await tester.loadAssets(overriddenFonts: saberSansSerifFontFallbacks);
      await tester.pumpAndSettle();

      await tester.tap(find.text('How do I change my encryption password?'));
      await tester.pumpAndSettle();

      // scroll down
      await tester.scrollUntilVisible(
        find.text('How can I delete my account?'),
        9999999,
        scrollable: find.byWidget(tester.firstWidget(find.byType(Scrollable))),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/login_page_done_faq.png'),
      );
    });
  });
}

class _LoginApp extends StatelessWidget {
  const _LoginApp(this.step);

  final LoginStep step;

  @override
  Widget build(BuildContext context) {
    return ScreenshotApp.withConditionalTitlebar(
      theme: _theme,
      device: _device,
      title: 'Saber',
      home: NcLoginPage(forceAppBarLeading: true, forceCurrentStep: step),
    );
  }
}
