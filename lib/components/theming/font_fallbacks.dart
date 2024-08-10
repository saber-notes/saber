import 'package:flutter/material.dart';

extension FallbackTextTheme on TextTheme {
  static const sansSerifFallbacks = [
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

  TextTheme withFallbacks() {
    return copyWith(
      displayLarge:
          displayLarge?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      displayMedium:
          displayMedium?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      displaySmall:
          displaySmall?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      headlineLarge:
          headlineLarge?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      headlineMedium:
          headlineMedium?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      headlineSmall:
          headlineSmall?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      titleLarge: titleLarge?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      titleMedium:
          titleMedium?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      titleSmall: titleSmall?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      bodyLarge: bodyLarge?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      bodyMedium: bodyMedium?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      bodySmall: bodySmall?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      labelLarge: labelLarge?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      labelMedium:
          labelMedium?.copyWith(fontFamilyFallback: sansSerifFallbacks),
      labelSmall: labelSmall?.copyWith(fontFamilyFallback: sansSerifFallbacks),
    );
  }
}
