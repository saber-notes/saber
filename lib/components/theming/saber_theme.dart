import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/data/prefs.dart';

abstract class SaberTheme {
  static TextTheme? createTextTheme(Brightness brightness) {
    if (stows.hyperlegibleFont.value) {
      return ThemeData(brightness: brightness).textTheme.withFont(
        fontFamily: 'AtkinsonHyperlegibleNext',
        fontFamilyFallback: saberSansSerifFontFallbacks,
      );
    } else {
      return null;
    }
  }

  static ThemeData createTheme(
    ColorScheme colorScheme,
    TargetPlatform platform,
  ) {
    // Hack: Mimic Material 3 Expressive color schemes by making
    // surfaceContainer much closer to surface.
    // Remove this when Flutter supports M3E natively.
    colorScheme = colorScheme.copyWith(
      surfaceContainer: Color.lerp(
        colorScheme.surface,
        colorScheme.surfaceTint,
        0.02,
      )!,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: createTextTheme(colorScheme.brightness),
      platform: platform,
      pageTransitionsTheme: _pageTransitionsTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        // ignore: deprecated_member_use
        year2023: false,
        stopIndicatorColor: Colors.transparent,
      ),
      cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
        applyThemeToAll: true,
      ),
    );
  }

  static ThemeData createThemeFromSeed(
    Color seedColor,
    Brightness brightness,
    TargetPlatform platform,
  ) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: seedColor,
    );
    return createTheme(colorScheme, platform);
  }

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
}
