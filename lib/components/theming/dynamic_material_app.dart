
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DynamicMaterialApp extends StatelessWidget {
  const DynamicMaterialApp({
    Key? key,
    required this.title,
    required this.router,
    this.defaultSwatch = Colors.yellow,
  }) : super(key: key);

  final String title;
  final Color defaultSwatch;
  final GoRouter router;

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
          // Otherwise, use fallback schemes.
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: defaultSwatch,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: defaultSwatch,
            brightness: Brightness.dark,
          );
        }

        return MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,

          title: title,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
