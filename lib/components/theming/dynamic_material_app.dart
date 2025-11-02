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
    if (mounted) setState(() {});
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
      return ExplicitlyThemedApp(
        title: widget.title,
        router: widget.router,
        themeMode: stows.appTheme.value,
        theme: SaberTheme.createThemeFromSeed(
          chosenAccentColor,
          Brightness.light,
          platform,
        ),
        darkTheme: SaberTheme.createThemeFromSeed(
          chosenAccentColor,
          Brightness.dark,
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
          themeMode: stows.appTheme.value,
          theme: lightColorScheme != null
              ? SaberTheme.createTheme(lightColorScheme, platform)
              : SaberTheme.createThemeFromSeed(
                  widget.defaultSwatch,
                  Brightness.light,
                  platform,
                ),
          darkTheme: darkColorScheme != null
              ? SaberTheme.createTheme(darkColorScheme, platform)
              : SaberTheme.createThemeFromSeed(
                  widget.defaultSwatch,
                  Brightness.dark,
                  platform,
                ),
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

  static final _materialAppKey = GlobalKey<State<MaterialApp>>();

  @override
  Widget build(BuildContext context) {
    final highContrastTheme =
        this.highContrastTheme ??
        theme.copyWith(colorScheme: theme.colorScheme.withHighContrast());
    final highContrastDarkTheme =
        this.highContrastDarkTheme ??
        darkTheme.copyWith(colorScheme: theme.colorScheme.withHighContrast());

    return MaterialApp.router(
      key: _materialAppKey,
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
      builder: (Platform.isWindows || Platform.isLinux)
          ? (context, child) => _BorderedWindow(child: child)
          : null,
    );
  }
}

/// A widget that adds a border around the app window when not in fullscreen.
class _BorderedWindow extends StatefulWidget {
  const _BorderedWindow({required this.child});
  final Widget? child;
  @override
  State<_BorderedWindow> createState() => _BorderedWindowState();
}

class _BorderedWindowState extends State<_BorderedWindow> {
  static var _lastBorderColor = Colors.transparent;
  static final _childKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    DynamicMaterialApp.addFullscreenListener(_onFullscreenChanged);
  }

  @override
  void dispose() {
    DynamicMaterialApp.removeFullscreenListener(_onFullscreenChanged);
    super.dispose();
  }

  void _onFullscreenChanged() {
    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    final borderColor = Color.alphaBlend(
      YaruTitleBarTheme.of(context).border?.color ??
          (Theme.brightnessOf(context) == Brightness.light
              ? Colors.black.withValues(alpha: 0.1)
              : Colors.white.withValues(alpha: 0.06)),
      ColorScheme.of(context).surface,
    );
    if (borderColor != _lastBorderColor) {
      _lastBorderColor = borderColor;
      windowManager.setBackgroundColor(borderColor).catchError((_) {});
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /// Use KeyedSubtree to preserve child state when adding/removing border
    final keyedChild = KeyedSubtree(
      key: _childKey,
      child: widget.child ?? const SizedBox(),
    );

    final showBorder = !DynamicMaterialApp.isFullscreen;
    return showBorder
        ? ColoredBox(
            color: _lastBorderColor,
            child: Padding(padding: const EdgeInsets.all(1), child: keyedChild),
          )
        : keyedChild;
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
