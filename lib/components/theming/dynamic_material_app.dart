import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/components/theming/yaru_builder.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:window_manager/window_manager.dart';

class DynamicMaterialApp extends StatefulWidget {
  const DynamicMaterialApp({
    super.key,
    required this.title,
    required this.router,
    this.defaultSwatch = Colors.yellow,
  });

  final String title;
  final Color defaultSwatch;
  final GoRouter router;

  static final ValueNotifier<bool> _isFullscreen = ValueNotifier(false);
  static bool get isFullscreen => _isFullscreen.value;

  static void setFullscreen(bool value, {required bool updateSystem}) {
    _isFullscreen.value = value;
    if (!updateSystem) return;

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      windowManager.setFullScreen(value);
    } else {
      SystemChrome.setEnabledSystemUIMode(
          value ? SystemUiMode.immersive : SystemUiMode.edgeToEdge);
    }
  }

  static void addFullscreenListener(void Function() listener) {
    _isFullscreen.addListener(listener);
  }

  static void removeFullscreenListener(void Function() listener) {
    _isFullscreen.removeListener(listener);
  }

  @override
  State<DynamicMaterialApp> createState() => _DynamicMaterialAppState();
}

class _DynamicMaterialAppState extends State<DynamicMaterialApp>
    with WindowListener {
  bool requiresCustomFont = false;

  @override
  void initState() {
    Prefs.appTheme.addListener(onChanged);
    Prefs.platform.addListener(onChanged);
    Prefs.accentColor.addListener(onChanged);
    Prefs.hyperlegibleFont.addListener(onChanged);
    decideOnFont();

    windowManager.addListener(this);
    SystemChrome.setSystemUIChangeCallback(_onFullscreenChange);

    super.initState();
  }

  void onChanged() {
    setState(() {});
  }

  @override
  void onWindowEnterFullScreen() {
    DynamicMaterialApp.setFullscreen(true, updateSystem: false);
  }

  @override
  void onWindowLeaveFullScreen() {
    DynamicMaterialApp.setFullscreen(false, updateSystem: false);
  }

  Future<void> _onFullscreenChange(bool systemOverlaysAreVisible) async {
    DynamicMaterialApp.setFullscreen(!systemOverlaysAreVisible,
        updateSystem: false);
  }

  /// We need to use a custom font if macOS < 10.13,
  /// see https://github.com/saber-notes/saber/issues/26
  void decideOnFont() {
    if (!Platform.isMacOS) return;

    final RegExp numberRegex = RegExp(r'\d+\.\d+'); // e.g. 10.13 or 12.5
    final RegExpMatch? osVersionMatch =
        numberRegex.firstMatch(Platform.operatingSystemVersion);
    if (osVersionMatch == null) return;

    final double osVersion = double.tryParse(osVersionMatch[0] ?? '0') ?? 0;
    if (osVersion >= 10.13) return;

    requiresCustomFont = true;
  }

  TextTheme? getTextTheme(Brightness brightness) {
    if (Prefs.hyperlegibleFont.loaded && Prefs.hyperlegibleFont.value) {
      return GoogleFonts.atkinsonHyperlegibleTextTheme(
        ThemeData(brightness: brightness).textTheme,
      ).withFallbacks();
    } else if (requiresCustomFont) {
      return GoogleFonts.interTextTheme(
        ThemeData(brightness: brightness).textTheme,
      ).withFallbacks();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final Color seedColor;
        final ColorScheme lightColorScheme;
        final ColorScheme darkColorScheme;

        if (Prefs.accentColor.loaded && Prefs.accentColor.value != 0) {
          seedColor = Color(Prefs.accentColor.value);
          lightColorScheme = ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: seedColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: seedColor,
          );
        } else if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
          seedColor = lightColorScheme.primary;
        } else {
          seedColor = widget.defaultSwatch;
          lightColorScheme = ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: seedColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: seedColor,
          );
        }

        final highContrastLightColorScheme = ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: seedColor,
          surface: Colors.white,
          contrastLevel: 1,
        );
        final highContrastDarkColorScheme = ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: seedColor,
          surface: Colors.black,
          contrastLevel: 1,
        );

        final TargetPlatform? platform = switch (Prefs.platform.value) {
          TargetPlatform.iOS => TargetPlatform.iOS,
          TargetPlatform.android => TargetPlatform.android,
          TargetPlatform.linux => TargetPlatform.linux,
          _ => null,
        };

        return YaruBuilder(
            enabled: platform == TargetPlatform.linux,
            primary: lightColorScheme.primary,
            builder: (context, yaruTheme, yaruHighContrastTheme) {
              return MaterialApp.router(
                routeInformationProvider:
                    widget.router.routeInformationProvider,
                routeInformationParser: widget.router.routeInformationParser,
                routerDelegate: widget.router.routerDelegate,
                locale: TranslationProvider.of(context).flutterLocale,
                supportedLocales: AppLocaleUtils.supportedLocales,
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
                title: widget.title,
                themeMode: Prefs.appTheme.loaded
                    ? Prefs.appTheme.value
                    : ThemeMode.system,
                theme: yaruTheme?.theme ??
                    ThemeData(
                      useMaterial3: true,
                      colorScheme: lightColorScheme,
                      textTheme: getTextTheme(Brightness.light),
                      scaffoldBackgroundColor: lightColorScheme.surface,
                      platform: platform,
                    ),
                darkTheme: yaruTheme?.darkTheme ??
                    ThemeData(
                      useMaterial3: true,
                      colorScheme: darkColorScheme,
                      textTheme: getTextTheme(Brightness.dark),
                      scaffoldBackgroundColor: darkColorScheme.surface,
                      platform: platform,
                    ),
                highContrastTheme: yaruHighContrastTheme?.theme ??
                    ThemeData(
                      useMaterial3: true,
                      colorScheme: highContrastLightColorScheme,
                      textTheme: getTextTheme(Brightness.light),
                      scaffoldBackgroundColor:
                          highContrastLightColorScheme.surface,
                      platform: platform,
                    ),
                highContrastDarkTheme: yaruHighContrastTheme?.darkTheme ??
                    ThemeData(
                      useMaterial3: true,
                      colorScheme: highContrastDarkColorScheme,
                      textTheme: getTextTheme(Brightness.dark),
                      scaffoldBackgroundColor:
                          highContrastDarkColorScheme.surface,
                      platform: platform,
                    ),
                debugShowCheckedModeBanner: false,
              );
            });
      },
    );
  }

  @override
  void dispose() {
    Prefs.appTheme.removeListener(onChanged);
    Prefs.platform.removeListener(onChanged);
    Prefs.accentColor.removeListener(onChanged);
    Prefs.hyperlegibleFont.removeListener(onChanged);

    windowManager.removeListener(this);
    SystemChrome.setSystemUIChangeCallback(null);

    super.dispose();
  }
}
