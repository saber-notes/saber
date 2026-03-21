import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/yaru_builder.dart';
import 'package:saber/data/prefs.dart';
import 'package:sbn/font_fallbacks.dart';
import 'package:yaru/yaru.dart';

abstract class SaberTheme {
  static ThemeData createTheme(
    ColorScheme colorScheme,
    TargetPlatform platform,
  ) {
    colorScheme = _adjustColorScheme(colorScheme, platform);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _Components.textTheme(platform, colorScheme),
      platform: platform,
      progressIndicatorTheme: _Components.progressIndicatorTheme,
      cardColor: colorScheme.surface,
      cardTheme: _Components.cardTheme(colorScheme),
      cupertinoOverrideTheme: _Components.cupertinoOverrideTheme,
      appBarTheme: _Components.appBarTheme,
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
    if (platform == .linux) {
      return getThemeFromYaru(
        YaruThemeData(variant: yaruVariant),
        brightness,
        platform,
        highContrast,
      );
    }

    final ColorScheme colorScheme;
    if (platform.usesYaruColors) {
      colorScheme = brightness == .light
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

  /// Adjusts certain colors in the [ColorScheme].
  static ColorScheme _adjustColorScheme(
    ColorScheme colorScheme,
    TargetPlatform platform,
  ) {
    return colorScheme.copyWith(
      surface: platform.isCupertino
          ? (colorScheme.brightness == .light
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
        ? (brightness == .light ? yaruHighContrastLight : yaruHighContrastDark)
        : (brightness == .light ? yaru.theme : yaru.darkTheme);
    return getThemeFromYaruFixed(base, platform);
  }

  static ThemeData getThemeFromYaruFixed(
    ThemeData base,
    TargetPlatform platform,
  ) {
    final textTheme = _Components.textTheme(platform, base.colorScheme);
    final fontFamily = textTheme.bodyMedium!.fontFamily;
    final fontFamilyFallback = textTheme.bodyMedium!.fontFamilyFallback;
    return base.copyWith(
      platform: platform,
      textTheme: textTheme,
      progressIndicatorTheme: _Components.progressIndicatorTheme,
      cardTheme: _Components.cardTheme(base.colorScheme),
      cupertinoOverrideTheme: _Components.cupertinoOverrideTheme,
      listTileTheme: base.listTileTheme.copyWith(
        // Yaru forces list tiles to use Ubuntu font, fix that
        titleTextStyle: base.listTileTheme.titleTextStyle?.withFont(
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
        ),
        subtitleTextStyle: base.listTileTheme.subtitleTextStyle?.withFont(
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
        ),
        leadingAndTrailingTextStyle: base
            .listTileTheme
            .leadingAndTrailingTextStyle
            ?.withFont(
              fontFamily: fontFamily,
              fontFamilyFallback: fontFamilyFallback,
            ),
      ),
      // Leave Yaru's app bar theme, since it adds a border bottom.
      // appBarTheme: _Components.appBarTheme,
    );
  }
}

abstract class _Components {
  static TextTheme textTheme(TargetPlatform platform, ColorScheme colorScheme) {
    final typography = Typography.material2021(
      platform: platform,
      colorScheme: colorScheme,
    );
    final textTheme = colorScheme.brightness == .dark
        ? typography.white
        : typography.black;

    if (stows.hyperlegibleFont.value) {
      return textTheme.withFont(
        fontFamily: 'AtkinsonHyperlegibleNext',
        fontFamilyFallback: saberSansSerifFontFallbacks,
      );
    } else if (platform == .linux) {
      // Flutter picks Roboto but Adwaita Sans is a better default
      return textTheme.withFont(fontFamily: 'Adwaita Sans');
    } else {
      return textTheme;
    }
  }

  static const progressIndicatorTheme = ProgressIndicatorThemeData(
    // ignore: deprecated_member_use
    year2023: false,
    stopIndicatorColor: Colors.transparent,
  );

  static CardThemeData cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      elevation: 0,
      color: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(kYaruContainerRadius),
        side: BorderSide(
          color: colorScheme.onSurface.withValues(alpha: 0.12),
          width: 2,
        ),
      ),
    );
  }

  static const cupertinoOverrideTheme = NoDefaultCupertinoThemeData(
    applyThemeToAll: true,
  );

  static const appBarTheme = AppBarTheme(centerTitle: false);
}

extension SaberThemePlatform on TargetPlatform {
  /// iOS uses Yaru's colorscheme since it looks more native than M3.
  bool get usesYaruColors => switch (this) {
    .linux => true,
    .iOS => true,
    .macOS => true,
    _ => false,
  };

  bool get isCupertino => switch (this) {
    .iOS => true,
    .macOS => true,
    _ => false,
  };
}
