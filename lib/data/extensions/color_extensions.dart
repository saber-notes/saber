import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// Inverts the color's HSL lightness if [invert] is true.
  /// This does not affect the hue or saturation.
  Color withInversion([bool invert = true]) {
    if (!invert) return this;

    // Shift to invert lightness:
    // This is the expanded form of `1 - 2L` where L is lightness defined as the midrange of the RGB components.
    // It is similar to the matrix from [InvertWidget] but the matrix inverts luma not lightness.
    // We prefer lightness over luma where possible, since luma turns a yellow highlighter brown.
    final shift = 1.0 - max(r, max(g, b)) - min(r, min(g, b));

    return Color.from(
      alpha: a,
      red: r + shift,
      green: g + shift,
      blue: b + shift,
      colorSpace: colorSpace,
    );
  }

  /// Multiplies the color's HSL saturation by [saturationMultiplier].
  Color withSaturation(double saturationMultiplier) {
    final HSLColor hsl = HSLColor.fromColor(this);
    return hsl.withSaturation(hsl.saturation * saturationMultiplier).toColor();
  }
}
