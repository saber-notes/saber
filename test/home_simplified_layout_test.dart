import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/_sentry_init_foss.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/home.dart';

import 'screenshot_goldens_test.dart';
import 'utils/test_mock_channel_handlers.dart';
import 'utils/test_user.dart';

void main() {
  group('simplifiedHomeLayout', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupMockPathProvider();
    disableSentryForTesting();

    FlavorConfig.setup();
    SyncingButton.forceButtonActive = true;
    AppInfo.showDebugMessage = false;

    stows.lastStorageQuota.value = TestUser.getQuota();
    stows.username.value = 'myusername';
    stows.sentryConsent.value = .granted;
    stows.simplifiedHomeLayout.value = true;

    setUpAll(() async {
      await FileManager.init(shouldWatchRootDirectory: false);
      await setupDemoFiles();
    });

    testGoldens('golden', (tester) async {
      final device = GoldenSmallDevices.androidPhone.device;

      final widget = ScreenshotApp.withConditionalTitlebar(
        device: device,
        title: 'Saber',
        home: TranslationProvider(
          child: const HomePage(subpage: HomePage.recentSubpage, path: ''),
        ),
      );
      await tester.pumpWidget(widget);
      await tester.pump();

      await tester.loadAssets();
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/home_simplified_layout.png'),
      );
    });
  });
}
