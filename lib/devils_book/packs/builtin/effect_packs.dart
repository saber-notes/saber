import 'package:flutter/material.dart';
import '../models/effect_preset.dart';
import 'pack_manifest.dart';
import 'pack_category.dart';
import 'content_pack.dart';

/// Subtle, controlled effects for serious writing.
class SubtleEffectPack {
  static const _manifest = PackManifest(
    id: 'pack_effects_subtle',
    name: 'Subtle',
    description: 'Quiet, professional feedback. Present but never distracting.',
    categories: {PackCategory.effects},
    isBuiltIn: true,
  );

  static const _effects = [
    EffectPreset(
      id: 'effect_ember', name: 'Dying Ember',
      cooldownMs: 800,
      ignitionColor: Color(0xFFFFAA00),
      trailColor: Color(0xFFFF6600),
      fadeColor: Color(0xFF883300),
      eraseColor: Color(0xFF666666),
      ignitionIntensity: 0.4, trailDensity: 0.3, fadeDuration: 0.5, particleScale: 0.8,
      character: 'Warm, fading glow. The default Devils Book heartbeat.',
      packId: 'pack_effects_subtle',
    ),
    EffectPreset(
      id: 'effect_ink_bloom', name: 'Ink Bloom',
      cooldownMs: 600,
      ignitionColor: Color(0xFF4444AA),
      trailColor: Color(0xFF333388),
      fadeColor: Color(0xFF222255),
      eraseColor: Color(0xFF555577),
      ignitionIntensity: 0.3, trailDensity: 0.2, fadeDuration: 0.6, particleScale: 0.7,
      character: 'Quiet indigo diffusion. Ink spreading into parchment.',
      packId: 'pack_effects_subtle',
    ),
    EffectPreset(
      id: 'effect_frost_breath', name: 'Frost Breath',
      cooldownMs: 700,
      ignitionColor: Color(0xFFCCEEFF),
      trailColor: Color(0xFF88BBDD),
      fadeColor: Color(0xFF446688),
      eraseColor: Color(0xFF99AABB),
      ignitionIntensity: 0.35, trailDensity: 0.25, fadeDuration: 0.7, particleScale: 0.9,
      character: 'Cool mist at the nib. Writing in cold morning air.',
      packId: 'pack_effects_subtle',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, effects: _effects);
}

/// Infernal, theatrical effects for maximum atmosphere.
class InfernalEffectPack {
  static const _manifest = PackManifest(
    id: 'pack_effects_infernal',
    name: 'Infernal',
    description: 'Fire, brimstone, and consequence. Writing that burns.',
    categories: {PackCategory.effects},
    isBuiltIn: true,
  );

  static const _effects = [
    EffectPreset(
      id: 'effect_hellfire', name: 'Hellfire',
      cooldownMs: 1200,
      ignitionColor: Color(0xFFFF4400),
      trailColor: Color(0xFFFF2200),
      fadeColor: Color(0xFFAA1100),
      eraseColor: Color(0xFFFF6600),
      ignitionIntensity: 0.9, trailDensity: 0.8, fadeDuration: 0.8, particleScale: 1.5,
      character: 'Aggressive combustion. Every stroke ignites the page.',
      packId: 'pack_effects_infernal',
    ),
    EffectPreset(
      id: 'effect_molten_gold', name: 'Molten Gold',
      cooldownMs: 1000,
      ignitionColor: Color(0xFFFFDD44),
      trailColor: Color(0xFFDDAA22),
      fadeColor: Color(0xFFAA8811),
      eraseColor: Color(0xFFBB9933),
      ignitionIntensity: 0.7, trailDensity: 0.6, fadeDuration: 0.7, particleScale: 1.3,
      character: 'Liquid gold dripping from the nib. Sealing oaths.',
      packId: 'pack_effects_infernal',
    ),
    EffectPreset(
      id: 'effect_ash_fall', name: 'Ash Fall',
      cooldownMs: 1400,
      ignitionColor: Color(0xFF997755),
      trailColor: Color(0xFF776644),
      fadeColor: Color(0xFF554433),
      eraseColor: Color(0xFF443322),
      ignitionIntensity: 0.5, trailDensity: 0.7, fadeDuration: 0.9, particleScale: 1.1,
      character: 'Slow grey ash drifting down. The aftermath of burning.',
      packId: 'pack_effects_infernal',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, effects: _effects);
}

/// Cyber/reactive effects for technical, high-energy sessions.
class CyberEffectPack {
  static const _manifest = PackManifest(
    id: 'pack_effects_cyber',
    name: 'Cyber',
    description: 'Electric pulses and data sparks for digital minds.',
    categories: {PackCategory.effects},
    isBuiltIn: true,
  );

  static const _effects = [
    EffectPreset(
      id: 'effect_electric_pulse', name: 'Electric Pulse',
      cooldownMs: 500,
      ignitionColor: Color(0xFF00FFFF),
      trailColor: Color(0xFF00CCCC),
      fadeColor: Color(0xFF006666),
      eraseColor: Color(0xFF00AAAA),
      ignitionIntensity: 0.8, trailDensity: 0.4, fadeDuration: 0.3, particleScale: 0.9,
      character: 'Sharp, fast electric crackle. Data packets rendered visible.',
      packId: 'pack_effects_cyber',
    ),
    EffectPreset(
      id: 'effect_neon_bleed', name: 'Neon Bleed',
      cooldownMs: 900,
      ignitionColor: Color(0xFFFF00FF),
      trailColor: Color(0xFFCC00CC),
      fadeColor: Color(0xFF660066),
      eraseColor: Color(0xFFAA00AA),
      ignitionIntensity: 0.6, trailDensity: 0.5, fadeDuration: 0.6, particleScale: 1.2,
      character: 'Magenta light bleeding through glass. Synthwave resonance.',
      packId: 'pack_effects_cyber',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, effects: _effects);
}

/// Clean/silent — deliberately no effects.
class SilentEffectPack {
  static const _manifest = PackManifest(
    id: 'pack_effects_silent',
    name: 'Silent',
    description: 'No live effects. Pure ink, zero distraction.',
    categories: {PackCategory.effects},
    isBuiltIn: true,
  );

  static const _effects = [
    EffectPreset(
      id: 'effect_none', name: 'None',
      cooldownMs: 0,
      ignitionColor: Color(0x00000000),
      trailColor: Color(0x00000000),
      fadeColor: Color(0x00000000),
      eraseColor: Color(0x00000000),
      ignitionIntensity: 0.0, trailDensity: 0.0, fadeDuration: 0.0, particleScale: 0.0,
      character: 'Absolute silence. The pen writes, nothing else happens.',
      packId: 'pack_effects_silent',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, effects: _effects);
}
