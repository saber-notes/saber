import 'package:flutter/material.dart';
import 'package:sbn/canvas_background_pattern.dart';

/// Represents the static, underlying environment of the page.
/// Controls paper look, grid/line styling, and ambient UI atmosphere.
/// Strictly independent from Ink and Effect behavior.
class ThemePreset {
  final String id;
  final String name;
  final Color backgroundColor;
  final CanvasBackgroundPattern pattern;

  /// Color used for grid lines, ruled lines, and dot patterns.
  final Color lineColor;

  /// Accent color for ambient UI glow (toolbar tint, selection highlights).
  final Color accentGlow;

  /// Surface color for floating panels, sheets, and overlays.
  final Color surfaceColor;

  /// Optional pack ID this theme belongs to (for grouping in selectors).
  final String? packId;

  const ThemePreset({
    required this.id,
    required this.name,
    required this.backgroundColor,
    this.pattern = CanvasBackgroundPattern.none,
    this.lineColor = const Color(0x33888888),
    this.accentGlow = const Color(0xFF666666),
    this.surfaceColor = const Color(0xFF2A2A2A),
    this.packId,
  });
}
