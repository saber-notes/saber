import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/components/theming/yaru_builder.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/devils_book/registry/devils_catalog.dart';
import 'package:saber/i18n/extensions/redirecting_localization_delegate.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:window_manager/window_manager.dart';

class DynamicMaterialApp extends StatefulHookWidget {
  const DynamicMaterialApp({
    super.key,
    required this.title,
    required this.router,
    this.defaultSwatch = Colors.yellow,
  });

  final String title;
  final Color defaultSwatch;
  final GoRouter router;

  @override
  State<DynamicMaterialApp> createState() => DynamicMaterialAppState();

  static final ValueNotifier<bool> _isFullscreen = ValueNotifier(false);
  static bool get isFullscreen => _isFullscreen.value;

  static void setFullscreen(bool value, {required bool updateSystem}) {
    _isFullscreen.value = value;
    if (!updateSystem) return;

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      windowManager.setFullScreen(value);
    } else {
      SystemChrome.setEnabledSystemUIMode(
        value ? SystemUiMode.immersive : SystemUiMode.edgeToEdge,
      );
    }
  }

  static void addFullscreenListener(void Function() listener) {
    _isFullscreen.addListener(listener);
  }

  static void removeFullscreenListener(void Function() listener) {
    _isFullscreen.removeListener(listener);
  }
}

class DynamicMaterialAppState extends State<DynamicMaterialApp>
    with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    SystemChrome.setSystemUIChangeCallback(_onFullscreenChange);

    super.initState();
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
    DynamicMaterialApp.setFullscreen(
      !systemOverlaysAreVisible,
      updateSystem: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = useValueListenable(stows.appTheme);
    final platform = useValueListenable(stows.platform);
    var chosenAccentColor = useValueListenable(stows.accentColor);
    if ((chosenAccentColor?.a ?? 0) < double.minPositive)
      chosenAccentColor = null; // discard transparent accent color
    useListenable(stows.hyperlegibleFont);

    final activeThemeId = useValueListenable(stows.activeThemeId);
    final premiumTheme = DevilsCatalog.themes[activeThemeId];

    if (premiumTheme != null) {
      final themeData = SaberTheme.createThemeFromPreset(premiumTheme, platform);
      return ExplicitlyThemedApp(
        title: widget.title,
        router: widget.router,
        themeMode: ThemeMode.dark, // Most premium themes are dark-centric
        theme: themeData,
        darkTheme: themeData,
      );
    }

    // Use Yaru theme, with or without [chosenAccentColor]
    if (platform == .linux) {
      return YaruBuilder(
        primary: chosenAccentColor, // if null, falls back to system color
        platform: platform,
        builder: (context, themes) {
          return ExplicitlyThemedApp(
            title: widget.title,
            router: widget.router,
            themeMode: themeMode,
            theme: themes.theme,
            darkTheme: themes.darkTheme,
            highContrastTheme: themes.highContrastTheme,
            highContrastDarkTheme: themes.highContrastDarkTheme,
          );
        },
      );
    }

    // Use [chosenAccentColor] with material/cupertino theme
    if (chosenAccentColor != null) {
      return ExplicitlyThemedApp(
        title: widget.title,
        router: widget.router,
        themeMode: themeMode,
        theme: SaberTheme.createThemeFromSeed(
          chosenAccentColor,
          .light,
          platform,
        ),
        darkTheme: SaberTheme.createThemeFromSeed(
          chosenAccentColor,
          .dark,
          platform,
        ),
      );
    }

    // Try and use device's accent color, or fall back to defaultSwatch
    return DynamicColorBuilder(
      builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
        return ExplicitlyThemedApp(
          title: widget.title,
          router: widget.router,
          themeMode: themeMode,
          theme: (!platform.usesYaruColors && lightColorScheme != null)
              ? SaberTheme.createTheme(lightColorScheme, platform)
              : SaberTheme.createThemeFromSeed(
                  lightColorScheme?.primary ?? widget.defaultSwatch,
                  .light,
                  platform,
                ),
          darkTheme: (!platform.usesYaruColors && darkColorScheme != null)
              ? SaberTheme.createTheme(darkColorScheme, platform)
              : SaberTheme.createThemeFromSeed(
                  darkColorScheme?.primary ?? widget.defaultSwatch,
                  .dark,
                  platform,
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    SystemChrome.setSystemUIChangeCallback(null);

    super.dispose();
  }
}

@visibleForTesting
class ExplicitlyThemedApp extends StatelessWidget {
  @protected
  const ExplicitlyThemedApp({
    super.key,
    required this.title,
    required this.router,
    required this.themeMode,
    required this.theme,
    required this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
  });

  final String title;
  final GoRouter router;
  final ThemeMode themeMode;
  final ThemeData theme;
  final ThemeData? darkTheme, highContrastTheme, highContrastDarkTheme;

  static final _materialAppKey = GlobalKey<State<MaterialApp>>();

  @override
  Widget build(BuildContext context) {
    final highContrastTheme =
        this.highContrastTheme ??
        theme.copyWith(colorScheme: theme.colorScheme.withHighContrast());
    final highContrastDarkTheme =
        this.highContrastDarkTheme ??
        darkTheme?.copyWith(
          colorScheme: darkTheme?.colorScheme.withHighContrast(),
        );

    return MaterialApp.router(
      key: _materialAppKey,
      title: title,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        RedirectingLocalizationDelegate<CupertinoLocalizations>(
          GlobalCupertinoLocalizations.delegate,
        ),
        RedirectingLocalizationDelegate<MaterialLocalizations>(
          GlobalMaterialLocalizations.delegate,
        ),
        RedirectingLocalizationDelegate<WidgetsLocalizations>(
          GlobalWidgetsLocalizations.delegate,
        ),
        RedirectingLocalizationDelegate<FlutterQuillLocalizations>(
          FlutterQuillLocalizations.delegate,
        ),
      ],
      themeMode: themeMode,
      theme: theme,
      darkTheme: darkTheme,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

extension on ColorScheme {
  ColorScheme withHighContrast() => ColorScheme.fromSeed(
    brightness: brightness,
    seedColor: primary,
    surface: brightness == .light ? Colors.white : Colors.black,
    contrastLevel: 1,
  );
}
