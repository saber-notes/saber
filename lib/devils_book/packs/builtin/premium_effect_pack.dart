import 'package:flutter/material.dart';
import '../../models/effect_preset.dart';
import '../pack_manifest.dart';
import '../pack_category.dart';
import '../content_pack.dart';

/// Elite, high-performance visual ritual components for premium users.
class PremiumEffectPack {
  static final _manifest = PackManifest(
    id: 'pack_effects_premium_ritual',
    name: 'Premium Rituals',
    description: 'High-frequency particle systems and realistic physics for deep writing sessions.',
    categories: {PackCategory.effects},
    isBuiltIn: true,
  );

  static final _effects = [
    EffectPreset(
      id: 'effect_true_flame',
      name: 'True Inferno',
      particleType: ParticleType.flame,
      ignitionColor: Color(0xFFFFFFFF),
      trailColor: Color(0xFFFFCC00),
      secondaryColor: Color(0xFFFF4400),
      fadeColor: Color(0xFF222222),
      cooldownMs: 1200,
      trailDensity: 0.8,
      particleScale: 1.2,
      character: 'Realistic combustion with 3-stage cooling and smoke trails.',
      packId: 'pack_effects_premium_ritual',
    ),
    EffectPreset(
      id: 'effect_digital_glitch',
      name: 'Cyber Glitch',
      particleType: ParticleType.pixel,
      ignitionColor: Color(0xFF00FFFF),
      trailColor: Color(0xFFFF00FF),
      fadeColor: Color(0xFF00FF00),
      cooldownMs: 400,
      trailDensity: 0.6,
      particleScale: 0.8,
      character: 'Quantized neon data fragments with unstable teleportation.',
      packId: 'pack_effects_premium_ritual',
    ),
    EffectPreset(
      id: 'effect_void_tendrils',
      name: 'Void Tendrils',
      particleType: ParticleType.plasma,
      ignitionColor: Color(0xFFA020F0),
      trailColor: Color(0xFF4B0082),
      fadeColor: Color(0xFF000000),
      cooldownMs: 1500,
      trailDensity: 0.4,
      particleScale: 1.5,
      character: 'Dark mass that swirls and orbits in a gravitational vortex.',
      packId: 'pack_effects_premium_ritual',
    ),
    EffectPreset(
      id: 'effect_holy_stardust',
      name: 'Holy Stardust',
      particleType: ParticleType.spark,
      ignitionColor: Color(0xFFFFFFFF),
      trailColor: Color(0xFFFFD700),
      fadeColor: Color(0xFFAAAAAA),
      cooldownMs: 600,
      trailDensity: 0.9,
      particleScale: 0.5,
      character: 'Shimmering white-gold particles that cascade from the nib.',
      packId: 'pack_effects_premium_ritual',
    ),
  ];

  static ContentPack create() => ContentPack(manifest: _manifest, effects: _effects);
}
