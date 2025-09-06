import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';
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
  /// Synced with [PageTransitionsTheme._defaultBuilders]
  /// but with PredictiveBackPageTransitionsBuilder for Android.
  static const _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
    },
  );

  @override
  void initState() {
    stows.appTheme.addListener(onChanged);
    stows.platform.addListener(onChanged);
    stows.accentColor.addListener(onChanged);
    stows.hyperlegibleFont.addListener(onChanged);

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

  TextTheme? getTextTheme(Brightness brightness) {
    if (stows.hyperlegibleFont.value) {
      return ThemeData(brightness: brightness).textTheme.withFont(
            fontFamily: 'AtkinsonHyperlegibleNext',
            fontFamilyFallback: saberSansSerifFontFallbacks,
          );
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

        final chosenAccentColor = stows.accentColor.value;
        if (chosenAccentColor != null &&
            chosenAccentColor != Colors.transparent) {
          seedColor = chosenAccentColor;
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

        final platform = switch (stows.platform.value) {
          TargetPlatform.iOS => TargetPlatform.iOS,
          TargetPlatform.android => TargetPlatform.android,
          TargetPlatform.linux => TargetPlatform.linux,
          _ => defaultTargetPlatform,
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
                localizationsDelegates: const [
                  ...GlobalMaterialLocalizations.delegates,
                  FlutterQuillLocalizations.delegate,
                ],
                title: widget.title,
                themeMode: stows.appTheme.loaded
                    ? stows.appTheme.value
                    : ThemeMode.system,
                theme: yaruTheme?.theme
                        ?.copyWith(textTheme: getTextTheme(Brightness.light)) ??
                    ThemeData(
                      useMaterial3: true,
                      colorScheme: lightColorScheme,
                      textTheme: getTextTheme(Brightness.light),
                      scaffoldBackgroundColor: lightColorScheme.surface,
                      platform: platform,
                      pageTransitionsTheme: _pageTransitionsTheme,
                    ),
                darkTheme: yaruTheme?.darkTheme
                        ?.copyWith(textTheme: getTextTheme(Brightness.dark)) ??
                    ThemeData(
                      useMaterial3: true,
                      colorScheme: darkColorScheme,
                      textTheme: getTextTheme(Brightness.dark),
                      scaffoldBackgroundColor: darkColorScheme.surface,
                      platform: platform,
                      pageTransitionsTheme: _pageTransitionsTheme,
                    ),
                highContrastTheme: yaruHighContrastTheme?.theme
                        ?.copyWith(textTheme: getTextTheme(Brightness.light)) ??
                    ThemeData(
                      useMaterial3: true,
                      colorScheme: highContrastLightColorScheme,
                      textTheme: getTextTheme(Brightness.light),
                      scaffoldBackgroundColor:
                          highContrastLightColorScheme.surface,
                      platform: platform,
                      pageTransitionsTheme: _pageTransitionsTheme,
                    ),
                highContrastDarkTheme: yaruHighContrastTheme?.darkTheme
                        ?.copyWith(textTheme: getTextTheme(Brightness.dark)) ??
                    ThemeData(
                      useMaterial3: true,
                      colorScheme: highContrastDarkColorScheme,
                      textTheme: getTextTheme(Brightness.dark),
                      scaffoldBackgroundColor:
                          highContrastDarkColorScheme.surface,
                      platform: platform,
                      pageTransitionsTheme: _pageTransitionsTheme,
                    ),
                debugShowCheckedModeBanner: false,
              );
            });
      },
    );
  }

  @override
  void dispose() {
    stows.appTheme.removeListener(onChanged);
    stows.platform.removeListener(onChanged);
    stows.accentColor.removeListener(onChanged);
    stows.hyperlegibleFont.removeListener(onChanged);

    windowManager.removeListener(this);
    SystemChrome.setSystemUIChangeCallback(null);

    super.dispose();
  }
}
