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
import 'package:saber/components/theming/yaru_builder.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/data/prefs.dart' hide Quota;
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/user/login.dart';
import 'package:yaru/yaru.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Screenshots:', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    BackgroundIsolateBinaryMessenger.ensureInitialized(
      ServicesBinding.rootIsolateToken!,
    );

    setupMockPathProvider();
    setupMockPrinting();

    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();
    SyncingButton.forceButtonActive = true;
    AppInfo.showDebugMessage = false;

    Prefs.username.value = 'myusername';

    const quotaUsed = 17 * 1024 * 1024; // 17 MB
    const quotaTotal = 5 * 1024 * 1024 * 1024; // 5 GB
    Prefs.lastStorageQuota.value = Quota.fromJson({
      'free': quotaTotal - quotaUsed,
      'used': quotaUsed,
      'total': quotaTotal,
      'relative': quotaUsed / quotaTotal * 100,
      'quota': quotaTotal,
    });

    setUpAll(() => Future.wait([
          FileManager.init(
            shouldWatchRootDirectory: false,
          ),
          PencilShader.init(),
        ]));

    setUpAll(() async {
      final recentFiles = <String>[];
      await Future.wait(Directory('test/demo_notes/')
          .listSync()
          .whereType<File>()
          .map((file) async {
        /// The file name starting with a slash
        final fileName = file.path.substring(file.path.lastIndexOf('/'));
        if (fileName.endsWith('.sbn2') || fileName.endsWith('.sbn')) {
          recentFiles.add(fileName);
        }
        final bytes = await file.readAsBytes();
        return FileManager.getFile(fileName).writeAsBytes(bytes);
      }));
      Prefs.recentFiles.value = recentFiles..sort();
    });

    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xffdae2ff),
      surface: const Color(0xfffefbff),
    );
    final materialTheme = ThemeData(
      colorScheme: colorScheme,
      textTheme: ThemeData(brightness: Brightness.light).textTheme.withFont(
            fontFamily: 'Inter',
            fontFamilyFallback: saberSansSerifFontFallbacks,
          ),
      scaffoldBackgroundColor: colorScheme.surface,
    );
    final cupertinoTheme = ThemeData(
      colorScheme: colorScheme,
      textTheme: ThemeData(brightness: Brightness.light).textTheme.withFont(
            fontFamily: 'Inter',
            fontFamilyFallback: saberSansSerifFontFallbacks,
          ),
      scaffoldBackgroundColor: colorScheme.surface,
      platform: TargetPlatform.iOS,
    );
    final yaruVariant = YaruBuilder.findClosestYaruVariant(colorScheme.primary);
    final yaruTheme = YaruThemeData(variant: yaruVariant, useMaterial3: true);

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
      child: Editor(
        path: '/Metric Spaces Week 1',
      ),
    );
    _screenshot(
      materialTheme: materialTheme,
      cupertinoTheme: cupertinoTheme,
      yaruTheme: yaruTheme,
      goldenFileName: '3_login',
      child: const NcLoginPage(
        forceAppBarLeading: true,
      ),
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
              (locale, GoldenScreenshotDevices.android),
            ],
        }
      : {
          // limited screenshots are used to speed up tests
          ('en', GoldenScreenshotDevices.flathub),
          ('en', GoldenScreenshotDevices.android),
        };

  group(goldenFileName, () {
    for (final (localeCode, goldenDevice) in localeDeviceMatrix) {
      testGoldens('for ${goldenDevice.name} in $localeCode', (tester) async {
        final device = goldenDevice.device;
        Prefs.platform.value = device.platform;
        await tester.runAsync(() => LocaleSettings.setLocaleRaw(localeCode));

        if (goldenFileName == '4_settings') {
          NextcloudProfile.forceLoginStep = LoginStep.done;
          addTearDown(() => NextcloudProfile.forceLoginStep = null);
        }

        final widget = ScreenshotApp(
          theme: switch (device.platform) {
            TargetPlatform.linux => yaruTheme.theme,
            TargetPlatform.iOS || TargetPlatform.macOS => cupertinoTheme,
            _ => materialTheme,
          },
          device: device,
          frameColors: frameColors,
          child: TranslationProvider(
            child: child,
          ),
        );
        await tester.pumpWidget(widget);

        for (final editorState
            in tester.stateList<EditorState>(find.byType(Editor))) {
          while (editorState.coreInfo.isEmpty) {
            await tester.runAsync(
                () => Future.delayed(const Duration(milliseconds: 100)));
          }
          await tester.pump();
        }

        await tester.pump();
        await tester.precacheImagesInWidgetTree();
        await tester.precacheTopbarImages();
        await tester.loadFonts();
        await tester.pumpFrames(widget, const Duration(milliseconds: 100));

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
