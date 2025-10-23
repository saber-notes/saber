import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/components/theming/yaru_builder.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru/yaru.dart';

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
    DynamicMaterialApp.setFullscreen(
      !systemOverlaysAreVisible,
      updateSystem: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var chosenAccentColor = stows.accentColor.value;
    if ((chosenAccentColor?.a ?? 0) < double.minPositive)
      chosenAccentColor = null; // discard transparent accent color
    final platform = stows.platform.value;

    // Use Yaru theme, with or without [chosenAccentColor]
    if (platform == TargetPlatform.linux) {
      return YaruBuilder(
        primary: chosenAccentColor, // if null, falls back to system color
        builder: (context, yaru, _) {
          return ExplicitlyThemedApp(
            title: widget.title,
            router: widget.router,
            themeMode: stows.appTheme.value,
            theme: (yaru.theme ?? yaruLight).copyWith(
              platform: platform,
              textTheme: SaberTheme.createTextTheme(Brightness.light),
            ),
            darkTheme: (yaru.darkTheme ?? yaruDark).copyWith(
              platform: platform,
              textTheme: SaberTheme.createTextTheme(Brightness.dark),
            ),
            highContrastTheme: yaruHighContrastLight.copyWith(
              platform: platform,
              textTheme: SaberTheme.createTextTheme(Brightness.light),
            ),
            highContrastDarkTheme: yaruHighContrastDark.copyWith(
              platform: platform,
              textTheme: SaberTheme.createTextTheme(Brightness.dark),
            ),
          );
        },
      );
    }

    // Use [chosenAccentColor] with material/cupertino theme
    if (chosenAccentColor != null) {
      final lightColorScheme = ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: chosenAccentColor,
      );
      final darkColorScheme = ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: chosenAccentColor,
      );

      return ExplicitlyThemedApp(
        title: widget.title,
        router: widget.router,
        themeMode: stows.appTheme.value,
        theme: SaberTheme.createTheme(lightColorScheme, platform),
        darkTheme: SaberTheme.createTheme(darkColorScheme, platform),
      );
    }

    // Try and use device's accent color, or fall back to defaultSwatch
    return DynamicColorBuilder(
      builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
        lightColorScheme ??= ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: widget.defaultSwatch,
        );
        darkColorScheme ??= ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: widget.defaultSwatch,
        );

        return ExplicitlyThemedApp(
          title: widget.title,
          router: widget.router,
          themeMode: stows.appTheme.value,
          theme: SaberTheme.createTheme(lightColorScheme, platform),
          darkTheme: SaberTheme.createTheme(darkColorScheme, platform),
        );
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
  final ThemeData theme, darkTheme;
  final ThemeData? highContrastTheme, highContrastDarkTheme;

  @override
  Widget build(BuildContext context) {
    final highContrastTheme =
        this.highContrastTheme ??
        theme.copyWith(colorScheme: theme.colorScheme.withHighContrast());
    final highContrastDarkTheme =
        this.highContrastDarkTheme ??
        darkTheme.copyWith(colorScheme: theme.colorScheme.withHighContrast());

    return MaterialApp.router(
      title: title,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        FlutterQuillLocalizations.delegate,
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

extension _ColorSchemeContraster on ColorScheme {
  ColorScheme withHighContrast() => ColorScheme.fromSeed(
    brightness: brightness,
    seedColor: primary,
    surface: brightness == Brightness.light ? Colors.white : Colors.black,
    contrastLevel: 1,
  );
}
