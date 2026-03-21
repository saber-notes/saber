import 'package:flutter/material.dart';

const saberSansSerifFontFallbacks = [
  'Adwaita Sans',
  'Inter',
  'Noto Sans',
  'Roboto',
  'Cantarell',
  'system-ui',
  'Atkinson Hyperlegible Next',
  'AtkinsonHyperlegibleNext',
  'Atkinson Hyperlegible',
  'AtkinsonHyperlegible',
  'sans-serif',
  'Ubuntu',
  'packages/yaru/Ubuntu',
  'CupertinoSystemDisplay',
  'CupertinoSystemText',
  '.AppleSystemUIFont',
  '.SF Pro Display',
  '.SF Pro Text',
  '.SF UI Display',
  '.SF UI Text',
  'Segoe UI',
];
const saberMonoFontFallbacks = [
  'Fira Mono',
  'ui-monospace',
  'Cascadia Code',
  'Source Code Pro',
  'Menlo',
  'Consolas',
  'DejaVu Sans Mono',
  'monospace',
];
const saberHandwritingFontFallbacks = [
  'Neucha',
  'Dekko',
  // Fallback fonts from https://github.com/system-fonts/modern-font-stacks#handwritten
  'Segoe Print',
  'Bradley Hand',
  'Chilanka',
  'TSCu_Comic',
  'Coming Soon',
  'casual',
  'cursive',
  'handwriting',
  ...saberSansSerifFontFallbacks,
];

extension TextThemeExtension on TextTheme {
  TextTheme withFont({
    required String? fontFamily,
    List<String>? fontFamilyFallback,
  }) => copyWith(
    displayLarge: displayLarge?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    displayMedium: displayMedium?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    displaySmall: displaySmall?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    headlineLarge: headlineLarge?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    headlineMedium: headlineMedium?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    headlineSmall: headlineSmall?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    titleLarge: titleLarge?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    titleMedium: titleMedium?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    titleSmall: titleSmall?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    bodyLarge: bodyLarge?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    bodyMedium: bodyMedium?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    bodySmall: bodySmall?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    labelLarge: labelLarge?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    labelMedium: labelMedium?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
    labelSmall: labelSmall?.withFont(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
    ),
  );
}

extension TextStyleExtension on TextStyle {
  /// Overrides the font family of this text style.
  ///
  /// This method is needed because [copyWith] does not allow setting
  /// [package] to null, which is problematic when changing from
  /// `packages/yaru/Ubuntu` to a non-yaru font,
  TextStyle withFont({
    required String? fontFamily,
    List<String>? fontFamilyFallback,
  }) => TextStyle(
    inherit: inherit,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    leadingDistribution: leadingDistribution,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    fontVariations: fontVariations,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
    debugLabel: debugLabel,
    fontFamily: fontFamily ?? this.fontFamily,
    fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
    package: null,
    overflow: overflow,
  );
}
