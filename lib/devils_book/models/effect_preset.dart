import 'package:flutter/material.dart';

enum ParticleType {
  ember,
  pixel,
  flame,
  spark,
  plasma,
  ash,
  voidMatter,
}

/// Represents ephemeral, live visual feedback during active writing gestures.
/// This data is NEVER serialized into the saved document.
/// Strictly independent from Theme (environment) and Ink (permanent stroke).
class EffectPreset {
  final String id;
  final String name;

  /// Fragment shader identifier, e.g. "shaders/ember.frag"
  final String? shaderId;

  /// How long particles persist after the stroke finishes (ms).
  final int cooldownMs;

  // --- Interaction Phase Colors ---

  /// Color of the ignition flash on pen-down contact.
  final Color ignitionColor;

  /// Color of trail embers during pen movement.
  final Color trailColor;

  /// Secondary color for multi-stage transitions (e.g. fire cooling).
  final Color? secondaryColor;

  /// Color of fade-out particles when motion stops.
  final Color fadeColor;

  /// Color of erase/dissolve feedback particles.
  final Color eraseColor;

  // --- Intensity Tuning ---

  /// 0.0 = invisible ignition, 1.0 = maximum flash radius.
  final double ignitionIntensity;

  /// 0.0 = no trail, 1.0 = dense ember trail.
  final double trailDensity;

  /// 0.0 = instant vanish, 1.0 = long, lingering fade.
  final double fadeDuration;

  /// Base particle size multiplier for this effect family.
  final double particleScale;

  /// The visual shape and physics type of the particle.
  final ParticleType particleType;

  /// Optional pack ID for grouping in selectors.
  final String? packId;

  /// Short flavor text describing the effect personality.
  final String? character;

  EffectPreset({
    required this.id,
    required this.name,
    this.shaderId,
    this.cooldownMs = 800,
    this.ignitionColor = const Color(0xFFFFAA00),
    this.trailColor = const Color(0xFFFF6600),
    this.secondaryColor,
    this.fadeColor = const Color(0xFF883300),
    this.eraseColor = const Color(0xFF888888),
    this.ignitionIntensity = 0.5,
    this.trailDensity = 0.5,
    this.fadeDuration = 0.5,
    this.particleScale = 1.0,
    this.particleType = ParticleType.ember,
    this.packId,
    this.character,
  });
}
