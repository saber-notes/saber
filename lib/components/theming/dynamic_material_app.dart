

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
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
  @override
  void initState() {
    Prefs.appTheme.addListener(onChanged);
    super.initState();
  }

  void onChanged() {
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
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
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
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
    super.dispose();
  }
}
