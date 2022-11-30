
import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// Inverts the color's HSL lightness if [invert] is true.
  /// This does not affect the hue or saturation.
  withInversion([bool invert = true]) {
    if (!invert) return this;

    final HSLColor hsl = HSLColor.fromColor(this);
    return hsl.withLightness(1 - hsl.lightness).toColor();
  }

  /// Multiplies the color's HSL saturation by [saturationMultiplier].
  withSaturation(double saturationMultiplier) {
    final HSLColor hsl = HSLColor.fromColor(this);
    return hsl.withSaturation(hsl.saturation * saturationMultiplier).toColor();
  }
}
