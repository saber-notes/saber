import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/user/login.dart';

void main() {
  group('LoginPage', () {
    final device = GoldenSmallDevices.iphone.device;
    late ThemeData theme;
    setUp(() {
      FlavorConfig.setup();
      theme = DynamicMaterialApp.themeFromColorScheme(
        ColorScheme.fromSeed(seedColor: Colors.yellow),
        device.platform,
      );
      stows.username.value = 'testuser';
      stows.ncPassword.value = 'testpassword';
      stows.encPassword.value = 'encpassword';
      stows.key.value = 'encryptionkey';
      stows.iv.value = 'encryptioniv';
      stows.lastStorageQuota.value = _getQuota();
    });

    testGoldens('done', (tester) async {
      FlavorConfig.setup();
      await tester.pumpWidget(
        ScreenshotApp(
          theme: theme,
          device: device,
          home: const NcLoginPage(forceAppBarLeading: true),
        ),
      );
      await tester.precacheImagesInWidgetTree();
      await tester.loadFonts(overriddenFonts: saberSansSerifFontFallbacks);
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/login_page_done.png'),
      );
    });

    testGoldens('done_faq', (tester) async {
      FlavorConfig.setup();
      await tester.pumpWidget(
        ScreenshotApp(
          theme: theme,
          device: device,
          home: const NcLoginPage(forceAppBarLeading: true),
        ),
      );
      await tester.precacheImagesInWidgetTree();
      await tester.loadFonts(overriddenFonts: saberSansSerifFontFallbacks);
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

Quota _getQuota() {
  const total = 5 * 1024 * 1024 * 1024; // 5 GB
  const usedRatio = 1 - 1 / 1.61803;
  final usedBytes = (total * usedRatio).round();
  return Quota.fromJson({
    'free': total - usedBytes,
    'used': usedBytes,
    'total': total,
    'relative': (1000 * usedRatio).round() / 10,
  });
}
