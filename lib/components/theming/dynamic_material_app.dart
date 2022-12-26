
import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/web/fullscreen_nonweb.dart'
  if (dart.library.html) 'package:saber/data/web/fullscreen_web.dart' as web;
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

  static ValueNotifier<bool> isFullscreen = ValueNotifier(false)
    ..addListener(() {
      if (DynamicMaterialApp.isFullscreen.value) {
        if (kIsWeb) {
          web.enterFullScreen();
        } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
          windowManager.setFullScreen(true);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        }
      } else {
        if (kIsWeb) {
          web.exitFullscreen();
        } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
          windowManager.setFullScreen(false);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }
      }
    });

  @override
  State<DynamicMaterialApp> createState() => _DynamicMaterialAppState();
}

class _DynamicMaterialAppState extends State<DynamicMaterialApp> with WindowListener {
  bool requiresCustomFont = false;

  @override
  void initState() {
    Prefs.appTheme.addListener(onChanged);
    Prefs.accentColor.addListener(onChanged);
    Prefs.hyperlegibleFont.addListener(onChanged);
    decideOnFont();

    windowManager.addListener(this);
    SystemChrome.setSystemUIChangeCallback(_onFullscreenChange);

    super.initState();
  }

  void onChanged() {
    setState(() { });
  }

  @override
  void onWindowEnterFullScreen() {
    DynamicMaterialApp.isFullscreen.value = true;
  }
  @override
  void onWindowLeaveFullScreen() {
    DynamicMaterialApp.isFullscreen.value = false;
  }
  Future<void> _onFullscreenChange(bool fullscreen) async {
    DynamicMaterialApp.isFullscreen.value = fullscreen;
  }

  /// We need to use a custom font if macOS < 10.13,
  /// see https://github.com/adil192/saber/issues/26
  void decideOnFont() {
    if (kIsWeb) return;
    if (!Platform.isMacOS) return;

    final RegExp numberRegex = RegExp(r'\d+\.\d+'); // e.g. 10.13 or 12.5
    final RegExpMatch? osVersionMatch = numberRegex.firstMatch(Platform.operatingSystemVersion);
    if (osVersionMatch == null) return;

    final double osVersion = double.tryParse(osVersionMatch[0] ?? "0") ?? 0;
    if (osVersion >= 10.13) return;

    requiresCustomFont = true;
  }

  TextTheme? getTextTheme(Brightness brightness) {
    if (Prefs.hyperlegibleFont.loaded && Prefs.hyperlegibleFont.value) {
      return GoogleFonts.atkinsonHyperlegibleTextTheme(
        ThemeData(brightness: brightness).textTheme,
      );
    } else if (requiresCustomFont) {
      return GoogleFonts.robotoTextTheme(
        ThemeData(brightness: brightness).textTheme,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (Prefs.accentColor.loaded && Prefs.accentColor.value != 0) {
          Color accentColor = Color(Prefs.accentColor.value);
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: accentColor,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: accentColor,
            brightness: Brightness.dark,
          );
        } else if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: widget.defaultSwatch,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: widget.defaultSwatch,
            brightness: Brightness.dark,
          );
        }

        return MaterialApp.router(
          routeInformationProvider: widget.router.routeInformationProvider,
          routeInformationParser: widget.router.routeInformationParser,
          routerDelegate: widget.router.routerDelegate,

          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: LocaleSettings.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,

          title: widget.title,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            textTheme: getTextTheme(Brightness.light),
            scaffoldBackgroundColor: lightColorScheme.background,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            textTheme: getTextTheme(Brightness.dark),
            scaffoldBackgroundColor: darkColorScheme.background,
          ),
          themeMode: Prefs.appTheme.loaded ? ThemeMode.values[Prefs.appTheme.value] : ThemeMode.system,

          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  @override
  void dispose() {
    Prefs.appTheme.removeListener(onChanged);
    Prefs.accentColor.removeListener(onChanged);
    windowManager.removeListener(this);
    SystemChrome.setSystemUIChangeCallback(null);

    super.dispose();
  }
}
