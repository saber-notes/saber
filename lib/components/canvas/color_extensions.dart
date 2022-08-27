
import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  withInversion([bool invert = true]) {
    if (!invert) return this;

    final HSLColor hsl = HSLColor.fromColor(this);
    return hsl.withLightness(1 - hsl.lightness).toColor();
  }
}
