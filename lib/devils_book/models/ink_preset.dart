import 'package:flutter/material.dart';

/// Represents the permanent stroke geometry and material personality.
/// Strictly independent from live transients (Effect) and environments (Theme).
class InkPreset {
  final String id;
  final String name;
  final Color baseColor;
  final double defaultThickness;
  final bool simulatesPressure;

  /// Secondary color for edge darkening / sheen contrast.
  /// When non-null, edges of the stroke render with this darker tone.
  final Color? edgeColor;

  /// 0.0 = matte flat, 1.0 = maximum sheen/shimmer personality.
  /// Controls visual contrast between stroke center and edges.
  final double sheenIntensity;

  /// 0.0 = crisp edges, 1.0 = maximum smoky/dry diffusion at stroke borders.
  final double dryness;

  /// 0.0 = cool/neutral, 1.0 = warm ember-like glow personality.
  final double warmth;

  /// Optional pack ID for grouping in selectors.
  final String? packId;

  /// Short flavor text describing the ink's character.
  final String? character;

  const InkPreset({
    required this.id,
    required this.name,
    required this.baseColor,
    this.defaultThickness = 3.0,
    this.simulatesPressure = true,
    this.edgeColor,
    this.sheenIntensity = 0.0,
    this.dryness = 0.0,
    this.warmth = 0.0,
    this.packId,
    this.character,
  });

  /// Computes the effective edge color, falling back to a darkened baseColor.
  Color get effectiveEdgeColor =>
      edgeColor ?? Color.lerp(baseColor, Colors.black, 0.35)!;

  /// Computes a sheen highlight color for stroke centers.
  Color get sheenHighlight =>
      Color.lerp(baseColor, Colors.white, sheenIntensity * 0.25)!;
}
