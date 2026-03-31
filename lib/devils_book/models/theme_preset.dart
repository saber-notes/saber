import 'package:flutter/material.dart';
import 'package:sbn/canvas_background_pattern.dart';

/// Represents the static, underlying environment of the page.
/// Controls paper look, grid/line styling, and ambient UI atmosphere.
/// Strictly independent from Ink and Effect behavior.
class ThemePreset {
  final String id;
  final String name;
  /// Background color for the canvas.
  final Color backgroundColor;

  /// Secondary background color for gradients and highlights.
  final Color secondaryColor;

  /// Pattern to draw on the background.
  final CanvasBackgroundPattern pattern;

  /// Color used for grid lines, ruled lines, and dot patterns.
  final Color lineColor;

  /// Accent color for ambient UI glow (toolbar tint, selection highlights).
  final Color accentGlow;

  /// Surface color for floating panels, sheets, and overlays.
  final Color surfaceColor;

  /// Optional gradient for atmospheric depth (Center to Edge).
  final List<Color>? backgroundGradient;

  /// Optional asset path for surface material textures (e.g. Parchment, Obsidian).
  final String? texturePath;

  /// Opacity of the surface material texture.
  final double textureOpacity;

  /// Blend mode for the surface material texture.
  final BlendMode textureBlendMode;

  /// Intensity of the dark peripheral vignette (0.0 to 1.0).
  final double vignetteIntensity;

  /// Intensity of the paper grain/noise texture (0.0 to 1.0).
  final double grainIntensity;

  /// Optional ID of an ambient soundscape to trigger with this theme.
  final String? ambientId;

  /// Optional override for the Hades Aura glow color.
  final Color? customAuraColor;

  /// Optional pack ID this theme belongs to (for grouping in selectors).
  final String? packId;

  ThemePreset({
    required this.id,
    required this.name,
    required this.backgroundColor,
    this.secondaryColor = const Color(0xFF000000),
    this.pattern = CanvasBackgroundPattern.none,
    this.lineColor = const Color(0x33888888),
    this.accentGlow = const Color(0xFF666666),
    this.surfaceColor = const Color(0xFF2A2A2A),
    this.backgroundGradient,
    this.texturePath,
    this.textureOpacity = 0.1,
    this.textureBlendMode = BlendMode.multiply,
    this.vignetteIntensity = 0.0,
    this.grainIntensity = 0.0,
    this.ambientId,
    this.customAuraColor,
    this.packId,
  });
}
