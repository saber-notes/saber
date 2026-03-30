import 'package:flutter/material.dart';
import 'package:sbn/canvas_background_pattern.dart';
import '../../models/theme_preset.dart';
import '../../models/ink_preset.dart';
import '../../models/effect_preset.dart';
import '../../models/writing_mode.dart';
import '../../models/loadout.dart';
import '../pack_manifest.dart';
import '../pack_category.dart';
import '../content_pack.dart';

/// The first built-in content pack shipping with Devils Book.
/// Contains the core identity presets that define the product out of the box.
class CoreFoundationPack {
  static final _manifest = PackManifest(
    id: 'pack_core_foundation',
    name: 'Core Foundation',
    description: 'The essential Devils Book writing instruments, papers, and inks.',
    version: '1.0.0',
    author: 'Devils Book',
    categories: {
      PackCategory.themes,
      PackCategory.inks,
      PackCategory.effects,
      PackCategory.loadouts,
    },
    isBuiltIn: true,
  );

  static final _themes = [
    ThemePreset(id: 'theme_dark_premium', name: 'Dark Premium', backgroundColor: Color(0xFF141414), pattern: CanvasBackgroundPattern.none),
    ThemePreset(id: 'theme_antique_soul', name: 'Antique Soul', backgroundColor: Color(0xFFE8E0D2), pattern: CanvasBackgroundPattern.lined),
    ThemePreset(id: 'theme_infernal_altar', name: 'Infernal Altar', backgroundColor: Color(0xFF2C0B0B), pattern: CanvasBackgroundPattern.grid),
    ThemePreset(id: 'theme_gamer_matrix', name: 'Cyber Core', backgroundColor: Color(0xFF0D1B2A), pattern: CanvasBackgroundPattern.dots),
    ThemePreset(id: 'theme_high_contrast', name: 'Focus Contrast', backgroundColor: Color(0xFFFFFFFF), pattern: CanvasBackgroundPattern.none),
  ];

  static final _inks = [
    InkPreset(id: 'ink_obsidian', name: 'Obsidian Black', baseColor: Color(0xFF111111), defaultThickness: 3.0),
    InkPreset(id: 'ink_copper_oxide', name: 'Copper Oxide', baseColor: Color(0xFFB87333), defaultThickness: 3.5),
    InkPreset(id: 'ink_midnight_sheen', name: 'Midnight Sheen', baseColor: Color(0xFF1A1A40), defaultThickness: 4.0),
    InkPreset(id: 'ink_ash_black', name: 'Ash Dry', baseColor: Color(0xFF4A4A4A), defaultThickness: 2.5),
    InkPreset(id: 'ink_blood_resin', name: 'Blood Resin', baseColor: Color(0xFF8A0303), defaultThickness: 3.5),
    InkPreset(id: 'ink_infernal_gold', name: 'Infernal Gold', baseColor: Color(0xFFD4AF37), defaultThickness: 4.5),
    InkPreset(id: 'ink_neon_cyber', name: 'Neon Cyber', baseColor: Color(0xFF00FFCC), defaultThickness: 3.0),
  ];

  static final _effects = [
    EffectPreset(id: 'effect_ember', name: 'Dying Ember', shaderId: 'shaders/pencil.frag', cooldownMs: 800),
  ];

  static final _loadouts = [
    Loadout(id: 'loadout_the_devils_pen', name: 'The Devil\'s Pen', theme: ThemePreset(id: 'theme_dark_premium', name: 'Dark Premium', backgroundColor: Color(0xFF141414)), ink: InkPreset(id: 'ink_obsidian', name: 'Obsidian Black', baseColor: Color(0xFF111111)), effect: EffectPreset(id: 'effect_ember', name: 'Dying Ember', shaderId: 'shaders/pencil.frag', cooldownMs: 800), preferredMode: WritingMode.ritual),
    Loadout(id: 'loadout_blood_ritual', name: 'Blood Ritual', theme: ThemePreset(id: 'theme_infernal_altar', name: 'Infernal Altar', backgroundColor: Color(0xFF2C0B0B), pattern: CanvasBackgroundPattern.grid), ink: InkPreset(id: 'ink_blood_resin', name: 'Blood Resin', baseColor: Color(0xFF8A0303), defaultThickness: 3.5), effect: EffectPreset(id: 'effect_ember', name: 'Dying Ember', shaderId: 'shaders/pencil.frag', cooldownMs: 800), preferredMode: WritingMode.infernal),
    Loadout(id: 'loadout_antique_scholar', name: 'Antique Scholar', theme: ThemePreset(id: 'theme_antique_soul', name: 'Antique Soul', backgroundColor: Color(0xFFE8E0D2), pattern: CanvasBackgroundPattern.lined), ink: InkPreset(id: 'ink_copper_oxide', name: 'Copper Oxide', baseColor: Color(0xFFB87333), defaultThickness: 3.5), effect: EffectPreset(id: 'effect_ember', name: 'Dying Ember', shaderId: 'shaders/pencil.frag', cooldownMs: 800), preferredMode: WritingMode.clean),
    Loadout(id: 'loadout_cyber_punk', name: 'Cyber Deck', theme: ThemePreset(id: 'theme_gamer_matrix', name: 'Cyber Core', backgroundColor: Color(0xFF0D1B2A), pattern: CanvasBackgroundPattern.dots), ink: InkPreset(id: 'ink_neon_cyber', name: 'Neon Cyber', baseColor: Color(0xFF00FFCC)), effect: EffectPreset(id: 'effect_ember', name: 'Dying Ember', shaderId: 'shaders/pencil.frag', cooldownMs: 800), preferredMode: WritingMode.ritual),
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
    inks: _inks,
    effects: _effects,
    loadouts: _loadouts,
  );
}
