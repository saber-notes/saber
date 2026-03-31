import 'package:flutter/material.dart';
import 'package:saber/devils_book/models/relic_element.dart';
import 'package:sbn/canvas_background_pattern.dart';

import '../models/theme_preset.dart';
import '../models/ink_preset.dart';
import '../models/effect_preset.dart';
import '../models/writing_mode.dart';
import '../models/loadout.dart';

class DevilsCatalog {
  // THEMES
  static final ThemePreset themeDarkPremium = ThemePreset(
    id: 'theme_dark_premium',
    name: 'Dark Premium',
    backgroundColor: Color(0xFF141414),
    pattern: CanvasBackgroundPattern.none,
    lineColor: Color(0x33666666),
    accentGlow: Color(0xFF444444),
  );

  static final ThemePreset themeAntiqueSoul = ThemePreset(
    id: 'theme_antique_soul',
    name: 'Antique Soul',
    backgroundColor: Color(0xFFE8E0D2),
    pattern: CanvasBackgroundPattern.collegeLtr,
    lineColor: Color(0x448B4513),
    accentGlow: Color(0xFFC0A080),
  );

  static final ThemePreset themeInfernalAltar = ThemePreset(
    id: 'theme_infernal_altar',
    name: 'Infernal Altar',
    backgroundColor: Color(0xFF2C0B0B),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: Color(0x668A0303),
    accentGlow: Color(0xFFFF2200),
    surfaceColor: Color(0xFF3D0E0E),
  );

  static final ThemePreset themeGamerMatrix = ThemePreset(
    id: 'theme_gamer_matrix',
    name: 'Cyber Core',
    backgroundColor: Color(0xFF0D1B2A),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: Color(0x6600FFCC),
    accentGlow: Color(0xFF00FFEE),
    surfaceColor: Color(0xFF1B263B),
  );

  static final ThemePreset themeHighContrast = ThemePreset(
    id: 'theme_high_contrast',
    name: 'Focus Contrast',
    backgroundColor: Color(0xFFFFFFFF),
    pattern: CanvasBackgroundPattern.none,
  );

  static final ThemePreset themeObsidianSanctum = ThemePreset(
    id: 'theme_obsidian_sanctum',
    name: 'Obsidian Sanctum',
    backgroundColor: Color(0xFF050505),
    pattern: CanvasBackgroundPattern.grid,
    lineColor: Color(0x22FFFFFF),
    accentGlow: Color(0xFF505050),
    surfaceColor: Color(0xFF111111),
  );

  // INKS
  static final InkPreset inkObsidian = InkPreset(
    id: 'ink_obsidian',
    name: 'Ritual Obsidian',
    baseColor: Color(0xFF0A0A0A),
    edgeColor: Color(0xFF000000),
    defaultThickness: 3.5,
    shadingAmount: 0.8,
    sheenIntensity: 0.2,
    character: 'A dense, ritualistic black that pools and shades with pressure.',
  );

  static final InkPreset inkCopperOxide = InkPreset(
    id: 'ink_copper_oxide',
    name: 'Oxidized Copper',
    baseColor: Color(0xFFB87333),
    edgeColor: Color(0xFF43695E),
    sheenIntensity: 0.7,
    defaultThickness: 3.5,
    shimmerColor: Color(0xFFCD7F32),
    shimmerIntensity: 0.3,
    character: 'A metallic core that sheens into teal oxidation at the edges.',
  );

  static final InkPreset inkMidnightSheen = InkPreset(
    id: 'ink_midnight_sheen',
    name: 'Midnight Sheen',
    baseColor: Color(0xFF1A1A40),
    defaultThickness: 4.0,
    sheenIntensity: 0.5,
  );

  static final InkPreset inkAshBlack = InkPreset(
    id: 'ink_ash_black',
    name: 'Ash Dry',
    baseColor: Color(0xFF4A4A4A),
    defaultThickness: 2.5,
    dryness: 0.8,
  );

  static final InkPreset inkBloodResin = InkPreset(
    id: 'ink_blood_resin',
    name: 'Fresh Blood Resin',
    baseColor: Color(0xFF990000),
    edgeColor: Color(0xFF440000),
    sheenIntensity: 0.5,
    shadingAmount: 0.6,
    defaultThickness: 4.0,
    character: 'Thick, viscous ink that pools into deep maroons.',
  );

  static final InkPreset inkInfernalGold = InkPreset(
    id: 'ink_infernal_gold',
    name: 'Hellfire Gold',
    baseColor: Color(0xFFFFD700),
    edgeColor: Color(0xFFB8860B),
    shimmerColor: Color(0xFFFFFFFF),
    shimmerIntensity: 0.9,
    sheenIntensity: 0.4,
    defaultThickness: 4.5,
    character: 'Blindingly metallic gold that glitters with infernal energy.',
  );

  static final InkPreset inkNeonCyber = InkPreset(
    id: 'ink_neon_cyber',
    name: 'Grid Runner Cyan',
    baseColor: Color(0xFF00FFFF),
    edgeColor: Color(0xFF0099FF),
    sheenIntensity: 0.9,
    warmth: 0.8,
    defaultThickness: 3.0,
    character: 'A synthetic, high-frequency glow from the cyber-void.',
  );

  // RELICS (SEALS / SIGNATURES)
  static final RelicElement relicPentagram = RelicElement(
    id: 'relic_pentagram',
    name: 'Pentagram of Focus',
    type: RelicType.pentagram,
    category: SealCategory.ritual,
    assetPath: 'assets/relics/pentagram.svg',
    description: 'Draws ambient energy into the current page for deep ritual work.',
  );

  static final RelicElement relicRuneClarity = RelicElement(
    id: 'relic_rune_clarity',
    name: 'Rune of Clarity',
    type: RelicType.rune,
    category: SealCategory.ancient,
    assetPath: 'assets/relics/rune_clarity.svg',
    description: 'A high-frequency rune that stabilizes chaotic thoughts.',
  );

  static final RelicElement relicSealAbyss = RelicElement(
    id: 'relic_seal_abyss',
    name: 'Seal of the Abyss',
    type: RelicType.seal,
    category: SealCategory.voidWalker,
    assetPath: 'assets/relics/seal_abyss.svg',
    description: 'A dark flourish for finalizing deep communion notes.',
  );

  // EFFECTS
  static final EffectPreset effectDyingEmber = EffectPreset(
    id: 'effect_ember',
    name: 'Dying Ember',
    shaderId: 'shaders/pencil.frag',
    cooldownMs: 800,
  );

  // LOADOUTS
  static final Loadout loadoutDevilsPen = Loadout(
    id: 'loadout_the_devils_pen',
    name: 'The Devil\'s Pen',
    theme: themeDarkPremium,
    ink: inkObsidian,
    effect: effectDyingEmber,
    preferredMode: WritingMode.ritual,
  );

  static final Loadout loadoutBloodRitual = Loadout(
    id: 'loadout_blood_ritual',
    name: 'Blood Ritual',
    theme: themeInfernalAltar,
    ink: inkBloodResin,
    effect: effectDyingEmber,
    preferredMode: WritingMode.infernal,
  );

  static final Loadout loadoutAntiqueScholar = Loadout(
    id: 'loadout_antique_scholar',
    name: 'Antique Scholar',
    theme: themeAntiqueSoul,
    ink: inkCopperOxide,
    effect: effectDyingEmber,
    preferredMode: WritingMode.clean,
  );

  static final Loadout loadoutCyberPunk = Loadout(
    id: 'loadout_cyber_punk',
    name: 'Cyber Deck',
    theme: themeGamerMatrix,
    ink: inkNeonCyber,
    effect: effectDyingEmber,
    preferredMode: WritingMode.ritual,
  );

  static final Loadout defaultLoadout = loadoutDevilsPen;

  // REGISTRIES
  static final Map<String, ThemePreset> themes = {
    themeDarkPremium.id: themeDarkPremium,
    themeAntiqueSoul.id: themeAntiqueSoul,
    themeInfernalAltar.id: themeInfernalAltar,
    themeGamerMatrix.id: themeGamerMatrix,
    themeHighContrast.id: themeHighContrast,
    themeObsidianSanctum.id: themeObsidianSanctum,
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

  static final Map<String, RelicElement> relics = {
    relicPentagram.id: relicPentagram,
    relicRuneClarity.id: relicRuneClarity,
    relicSealAbyss.id: relicSealAbyss,
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

  static void seedDefaults() {
    // Seed logic here if needed
  }
}
