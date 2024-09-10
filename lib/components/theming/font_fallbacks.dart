import 'package:flutter/material.dart';

extension FallbackTextTheme on TextTheme {
  TextTheme withFallbacks() => copyWith(
        displayLarge: displayLarge?.withFallbacks(),
        displayMedium: displayMedium?.withFallbacks(),
        displaySmall: displaySmall?.withFallbacks(),
        headlineLarge: headlineLarge?.withFallbacks(),
        headlineMedium: headlineMedium?.withFallbacks(),
        headlineSmall: headlineSmall?.withFallbacks(),
        titleLarge: titleLarge?.withFallbacks(),
        titleMedium: titleMedium?.withFallbacks(),
        titleSmall: titleSmall?.withFallbacks(),
        bodyLarge: bodyLarge?.withFallbacks(),
        bodyMedium: bodyMedium?.withFallbacks(),
        bodySmall: bodySmall?.withFallbacks(),
        labelLarge: labelLarge?.withFallbacks(),
        labelMedium: labelMedium?.withFallbacks(),
        labelSmall: labelSmall?.withFallbacks(),
      );
}

extension FallbackTextStyle on TextStyle {
  static const sansSerifFallbacks = [
    'Inter',
    'Noto Sans',
    'Roboto',
    'Droid Sans',
    'Liberation Sans',
    'Fira Sans',
    'Cantarell',
    'Sans',
    'system-ui',
    'sans-serif',
    'Neucha',
    'Dekko',
  ];

  TextStyle withFallbacks() => copyWith(
        fontFamilyFallback: fontFamilyFallback == null
            ? sansSerifFallbacks
            : [...fontFamilyFallback!, ...sansSerifFallbacks],
      );
}
