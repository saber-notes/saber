
import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

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
  State<DynamicMaterialApp> createState() => _DynamicMaterialAppState();
}

class _DynamicMaterialAppState extends State<DynamicMaterialApp> {
  bool useCustomFont = false;

  @override
  void initState() {
    Prefs.appTheme.addListener(onChanged);
    Prefs.accentColor.addListener(onChanged);
    decideOnFont();
    super.initState();
  }

  void onChanged() {
    setState(() { });
  }

  /// We need to use a custom font if macOS < 10.13,
  /// see https://github.com/adil192/saber/issues/26
  void decideOnFont() {
    if (!Platform.isMacOS) return;

    final RegExp numberRegex = RegExp(r'\d+\.\d+'); // e.g. 10.13 or 12.5
    final RegExpMatch? osVersionMatch = numberRegex.firstMatch(Platform.operatingSystemVersion);
    if (osVersionMatch == null) return;

    final double osVersion = double.tryParse(osVersionMatch[0] ?? "0") ?? 0;
    if (osVersion >= 10.13) return;

    useCustomFont = true;
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (Prefs.accentColor.value != 0) {
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
            textTheme: useCustomFont ? GoogleFonts.robotoTextTheme(
              ThemeData(brightness: Brightness.light).textTheme,
            ) : null,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            textTheme: useCustomFont ? GoogleFonts.robotoTextTheme(
              ThemeData(brightness: Brightness.dark).textTheme,
            ) : null,
          ),
          themeMode: ThemeMode.values[Prefs.appTheme.value],

          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  @override
  void dispose() {
    Prefs.appTheme.removeListener(onChanged);
    Prefs.accentColor.removeListener(onChanged);
    super.dispose();
  }
}
