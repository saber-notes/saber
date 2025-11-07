import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/components/theming/yaru_builder.dart';
import 'package:saber/data/prefs.dart';
import 'package:yaru/yaru.dart';

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
    colorScheme = _adjustColorScheme(colorScheme, platform);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
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
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }

  static ThemeData createThemeFromSeed(
    Color seedColor,
    Brightness brightness,
    TargetPlatform platform, {
    @Deprecated(
      'High contrast is not implemented here. '
      'Use ColorScheme.withHighContrast() instead',
    )
    bool highContrast = false,
  }) {
    late final yaruVariant = YaruBuilder.getYaruVariant(seedColor);
    if (platform == TargetPlatform.linux) {
      return getThemeFromYaru(
        YaruThemeData(variant: yaruVariant),
        brightness,
        platform,
        highContrast,
      );
    }

    final ColorScheme colorScheme;
    if (platform.usesYaruColors) {
      colorScheme = brightness == Brightness.light
          ? yaruVariant.theme.colorScheme
          : yaruVariant.darkTheme.colorScheme;
    } else {
      colorScheme = ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: seedColor,
      );
    }
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

  /// Adjusts certain colors in the [ColorScheme].
  static ColorScheme _adjustColorScheme(
    ColorScheme colorScheme,
    TargetPlatform platform,
  ) {
    return colorScheme.copyWith(
      surface: platform.isCupertino
          ? (colorScheme.brightness == Brightness.light
                ? CupertinoColors.white
                : CupertinoColors.darkBackgroundGray)
          : null,
      // Hack: Mimic Material 3 Expressive color schemes by making
      // surfaceContainer much closer to surface.
      // Remove this when Flutter supports M3E natively.
      surfaceContainer: Color.lerp(
        colorScheme.surface,
        colorScheme.surfaceTint,
        0.02,
      )!,
    );
  }

  static ThemeData getThemeFromYaru(
    YaruThemeData yaru,
    Brightness brightness,
    TargetPlatform platform,
    bool highContrast,
  ) {
    final base = highContrast
        ? (brightness == Brightness.light
              ? yaruHighContrastLight
              : yaruHighContrastDark)
        : (brightness == Brightness.light
              ? yaru.theme ?? yaruLight
              : yaru.darkTheme ?? yaruDark);
    return base.copyWith(
      platform: platform,
      textTheme: createTextTheme(brightness),
    );
  }
}

extension SaberThemePlatform on TargetPlatform {
  /// iOS uses Yaru's colorscheme since it looks more native than M3.
  bool get usesYaruColors => switch (this) {
    TargetPlatform.linux => true,
    TargetPlatform.iOS => true,
    TargetPlatform.macOS => true,
    _ => false,
  };

  bool get isCupertino => switch (this) {
    TargetPlatform.iOS => true,
    TargetPlatform.macOS => true,
    _ => false,
  };
}
