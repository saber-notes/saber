import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/canvas/pencil_shader.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:saber/data/sentry/sentry_init.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/user/login.dart';
import 'package:yaru/yaru.dart';

import 'utils/test_mock_channel_handlers.dart';
import 'utils/test_user.dart';

void main() {
  group('Screenshots:', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    BackgroundIsolateBinaryMessenger.ensureInitialized(
      ServicesBinding.rootIsolateToken!,
    );

    setupMockPathProvider();
    setupMockPrinting();
    disableSentryForTesting();

    FlavorConfig.setup();
    SyncingButton.forceButtonActive = true;
    AppInfo.showDebugMessage = false;

    stows.lastStorageQuota.value = TestUser.getQuota();
    stows.username.value = 'myusername';
    stows.sentryConsent.value = SentryConsent.granted;

    setUpAll(
      () => Future.wait([
        FileManager.init(shouldWatchRootDirectory: false),
        PencilShader.init(),
      ]),
    );

    setUpAll(() async {
      final recentFiles = <String>[];
      await Future.wait(
        Directory('test/demo_notes/').listSync().whereType<File>().map((
          file,
        ) async {
          /// The file name starting with a slash
          final fileName = file.path.substring(file.path.lastIndexOf('/'));
          if (fileName.endsWith('.sbn2') || fileName.endsWith('.sbn')) {
            recentFiles.add(fileName);
          }
          final bytes = await file.readAsBytes();
          final dstFile = FileManager.getFile(fileName);
          await dstFile.create(recursive: true);
          return dstFile.writeAsBytes(bytes);
        }),
      );
      stows.recentFiles.value = recentFiles..sort();
    });

    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xffdae2ff),
      surface: const Color(0xfffefbff),
    );
    final materialTheme = SaberTheme.createTheme(
      colorScheme,
      TargetPlatform.android,
    );
    final cupertinoTheme = SaberTheme.createTheme(
      colorScheme,
      TargetPlatform.iOS,
    );
    const yaruTheme = YaruThemeData(
      variant: YaruVariant.orange,
      useMaterial3: true,
    );

    _screenshot(
      materialTheme: materialTheme,
      cupertinoTheme: cupertinoTheme,
      yaruTheme: yaruTheme,
      goldenFileName: '1_home',
      child: const HomePage(subpage: HomePage.recentSubpage, path: ''),
    );
    _screenshot(
      materialTheme: materialTheme,
      cupertinoTheme: cupertinoTheme,
      yaruTheme: yaruTheme,
      goldenFileName: '2_editor',
      child: Editor(path: '/Metric Spaces Week 1'),
    );
    _screenshot(
      materialTheme: materialTheme,
      cupertinoTheme: cupertinoTheme,
      yaruTheme: yaruTheme,
      goldenFileName: '3_login',
      child: const NcLoginPage(forceAppBarLeading: true),
    );
    _screenshot(
      materialTheme: materialTheme,
      cupertinoTheme: cupertinoTheme,
      yaruTheme: yaruTheme,
      goldenFileName: '4_settings',
      child: const HomePage(subpage: HomePage.settingsSubpage, path: ''),
    );
  });
}

void _screenshot({
  ScreenshotFrameColors? frameColors,
  required ThemeData materialTheme,
  required ThemeData cupertinoTheme,
  required YaruThemeData yaruTheme,
  required String goldenFileName,
  required Widget child,
}) {
  /// Some locales have font issues where text is not displayed properly.
  /// If you know how to fix this, contributions are welcome!
  const localesWithFontIssues = {
    'ar',
    'fa',
    'he',
    'ja',
    'zh-Hans-CN',
    'zh-Hant-TW',
  };
  const allScreenshots = bool.fromEnvironment('ALL_SCREENSHOTS');
  final localeDeviceMatrix = allScreenshots
      ? {
          // for english, do all devices
          for (final goldenDevice in GoldenScreenshotDevices.values)
            ('en', goldenDevice),
          // for other locales (except those with font issues)
          // create screenshots for flathub and android only
          for (final locale in localeNames.keys)
            if (!localesWithFontIssues.contains(locale)) ...[
              (locale, GoldenScreenshotDevices.flathub),
              (locale, GoldenScreenshotDevices.androidPhone),
            ],
        }
      : {
          // limited screenshots are used to speed up tests
          ('en', GoldenScreenshotDevices.flathub),
          ('en', GoldenScreenshotDevices.androidPhone),
        };

  group(goldenFileName, () {
    for (final (localeCode, goldenDevice) in localeDeviceMatrix) {
      testGoldens('for ${goldenDevice.name} in $localeCode', (tester) async {
        final device = goldenDevice.device;
        stows.platform.value = device.platform;
        await tester.runAsync(() => LocaleSettings.setLocaleRaw(localeCode));

        if (goldenFileName == '4_settings') {
          NextcloudProfile.forceLoginStep = LoginStep.done;
          addTearDown(() => NextcloudProfile.forceLoginStep = null);
        }

        final widget = ScreenshotApp.withConditionalTitlebar(
          theme: switch (device.platform) {
            TargetPlatform.linux => yaruTheme.theme,
            TargetPlatform.iOS || TargetPlatform.macOS => cupertinoTheme,
            _ => materialTheme,
          },
          device: device,
          frameColors: frameColors,
          title: 'Saber',
          home: TranslationProvider(child: child),
        );
        await tester.pumpWidget(widget);
        await tester.pump();

        for (final editorState in tester.stateList<EditorState>(
          find.byType(Editor),
        )) {
          // Wait for the editor to load
          while (editorState.coreInfo.isEmpty) {
            await tester.runAsync(
              () => Future.delayed(const Duration(milliseconds: 100)),
            );
          }
          await tester.pump();
        }

        await tester.precacheImagesInWidgetTree();
        await tester.precacheTopbarImages();
        await tester.loadFonts(overriddenFonts: saberSansSerifFontFallbacks);
        await tester.pumpAndSettle();

        await tester.expectScreenshot(
          device,
          goldenFileName,
          langCode: switch (localeCode) {
            'en' => 'en-US',
            _ => localeCode,
          },
        );
      });
    }
  });
}
