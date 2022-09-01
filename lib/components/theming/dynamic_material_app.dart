
import 'dart:io' show Platform;

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DynamicMaterialApp extends StatefulWidget {
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
  State<DynamicMaterialApp> createState() => _DynamicMaterialAppState();
}

class _DynamicMaterialAppState extends State<DynamicMaterialApp> {
  @override
  void initState() {
    super.initState();
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

          title: widget.title,
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
