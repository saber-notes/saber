import 'package:flutter/material.dart';
import 'package:sbn/canvas_background_pattern.dart';

import '../models/theme_preset.dart';
import '../models/ink_preset.dart';
import '../models/effect_preset.dart';
import '../models/writing_mode.dart';
import '../models/loadout.dart';

class DevilsCatalog {
  // THEMES
  static const ThemePreset themeDarkPremium = ThemePreset(
    id: 'theme_dark_premium',
    name: 'Dark Premium',
    backgroundColor: Color(0xFF141414),
    pattern: CanvasBackgroundPattern.none,
  );

  static const ThemePreset themeAntiqueSoul = ThemePreset(
    id: 'theme_antique_soul',
    name: 'Antique Soul',
    backgroundColor: Color(0xFFE8E0D2),
    pattern: CanvasBackgroundPattern.ruled,
  );

  static const ThemePreset themeInfernalAltar = ThemePreset(
    id: 'theme_infernal_altar',
    name: 'Infernal Altar',
    backgroundColor: Color(0xFF2C0B0B),
    pattern: CanvasBackgroundPattern.grid,
  );

  static const ThemePreset themeGamerMatrix = ThemePreset(
    id: 'theme_gamer_matrix',
    name: 'Cyber Core',
    backgroundColor: Color(0xFF0D1B2A),
    pattern: CanvasBackgroundPattern.dotted,
  );

  static const ThemePreset themeHighContrast = ThemePreset(
    id: 'theme_high_contrast',
    name: 'Focus Contrast',
    backgroundColor: Color(0xFFFFFFFF),
    pattern: CanvasBackgroundPattern.none,
  );

  // INKS
  static const InkPreset inkObsidian = InkPreset(
    id: 'ink_obsidian',
    name: 'Obsidian Black',
    baseColor: Color(0xFF111111),
    defaultThickness: 3.0,
  );

  static const InkPreset inkCopperOxide = InkPreset(
    id: 'ink_copper_oxide',
    name: 'Copper Oxide',
    baseColor: Color(0xFFB87333),
    defaultThickness: 3.5,
  );

  static const InkPreset inkMidnightSheen = InkPreset(
    id: 'ink_midnight_sheen',
    name: 'Midnight Sheen',
    baseColor: Color(0xFF1A1A40),
    defaultThickness: 4.0,
  );

  static const InkPreset inkAshBlack = InkPreset(
    id: 'ink_ash_black',
    name: 'Ash Dry',
    baseColor: Color(0xFF4A4A4A),
    defaultThickness: 2.5,
  );

  static const InkPreset inkBloodResin = InkPreset(
    id: 'ink_blood_resin',
    name: 'Blood Resin',
    baseColor: Color(0xFF8A0303),
    defaultThickness: 3.5,
  );

  static const InkPreset inkInfernalGold = InkPreset(
    id: 'ink_infernal_gold',
    name: 'Infernal Gold',
    baseColor: Color(0xFFD4AF37),
    defaultThickness: 4.5,
  );

  static const InkPreset inkNeonCyber = InkPreset(
    id: 'ink_neon_cyber',
    name: 'Neon Cyber',
    baseColor: Color(0xFF00FFCC),
    defaultThickness: 3.0,
  );

  // EFFECTS
  static const EffectPreset effectDyingEmber = EffectPreset(
    id: 'effect_ember',
    name: 'Dying Ember',
    shaderId: 'shaders/pencil.frag',
    cooldownMs: 800,
  );

  // LOADOUTS
  static const Loadout loadoutDevilsPen = Loadout(
    id: 'loadout_the_devils_pen',
    name: 'The Devil\'s Pen',
    theme: themeDarkPremium,
    ink: inkObsidian,
    effect: effectDyingEmber,
    preferredMode: WritingMode.ritual,
  );

  static const Loadout loadoutBloodRitual = Loadout(
    id: 'loadout_blood_ritual',
    name: 'Blood Ritual',
    theme: themeInfernalAltar,
    ink: inkBloodResin,
    effect: effectDyingEmber,
    preferredMode: WritingMode.infernal,
  );

  static const Loadout loadoutAntiqueScholar = Loadout(
    id: 'loadout_antique_scholar',
    name: 'Antique Scholar',
    theme: themeAntiqueSoul,
    ink: inkCopperOxide,
    effect: effectDyingEmber,
    preferredMode: WritingMode.clean,
  );

  static const Loadout loadoutCyberPunk = Loadout(
    id: 'loadout_cyber_punk',
    name: 'Cyber Deck',
    theme: themeGamerMatrix,
    ink: inkNeonCyber,
    effect: effectDyingEmber,
    preferredMode: WritingMode.ritual,
  );

  static const Loadout defaultLoadout = loadoutDevilsPen;

  // REGISTRIES
  static final Map<String, ThemePreset> themes = {
    themeDarkPremium.id: themeDarkPremium,
    themeAntiqueSoul.id: themeAntiqueSoul,
    themeInfernalAltar.id: themeInfernalAltar,
    themeGamerMatrix.id: themeGamerMatrix,
    themeHighContrast.id: themeHighContrast,
  };

  static final Map<String, InkPreset> inks = {
    inkObsidian.id: inkObsidian,
    inkCopperOxide.id: inkCopperOxide,
    inkMidnightSheen.id: inkMidnightSheen,
    inkAshBlack.id: inkAshBlack,
    inkBloodResin.id: inkBloodResin,
    inkInfernalGold.id: inkInfernalGold,
    inkNeonCyber.id: inkNeonCyber,
  };

  static final Map<String, EffectPreset> effects = {
    effectDyingEmber.id: effectDyingEmber,
  };

  static final Map<String, Loadout> loadouts = {
    loadoutDevilsPen.id: loadoutDevilsPen,
    loadoutBloodRitual.id: loadoutBloodRitual,
    loadoutAntiqueScholar.id: loadoutAntiqueScholar,
    loadoutCyberPunk.id: loadoutCyberPunk,
  };
}
