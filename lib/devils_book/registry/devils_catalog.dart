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
    vignetteIntensity: 0.35,
    grainIntensity: 0.04,
    backgroundGradient: [Color(0xFF1A1A1A), Color(0xFF0D0D0D)],
    packId: 'pack_notebooks_mystic',
  );

  static final ThemePreset themeAntiqueSoul = ThemePreset(
    id: 'theme_antique_soul',
    name: 'Antique Soul',
    backgroundColor: Color(0xFFE8E0D2),
    pattern: CanvasBackgroundPattern.collegeLtr,
    lineColor: Color(0x448B4513),
    accentGlow: Color(0xFFC0A080),
    vignetteIntensity: 0.2,
    grainIntensity: 0.18,
    backgroundGradient: [Color(0xFFF5F0E1), Color(0xFFE8E0D2)],
    ambientId: 'ambience_library_quiet',
    packId: 'pack_notebooks_mystic',
  );

  static final ThemePreset themeInfernalAltar = ThemePreset(
    id: 'theme_infernal_altar',
    name: 'Infernal Altar',
    backgroundColor: Color(0xFF2C0B0B),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: Color(0x668A0303),
    accentGlow: Color(0xFFFF2200),
    surfaceColor: Color(0xFF3D0E0E),
    vignetteIntensity: 0.75,
    grainIntensity: 0.12,
    backgroundGradient: [Color(0xFF4A0000), Color(0xFF2C0B0B)],
    customAuraColor: Color(0xFFFF0000),
    ambientId: 'ambience_blood_ritual',
    packId: 'pack_notebooks_mystic',
  );

  static final ThemePreset themeGamerMatrix = ThemePreset(
    id: 'theme_gamer_matrix',
    name: 'Cyber Core',
    backgroundColor: Color(0xFF0D1B2A),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: Color(0x6600FFCC),
    accentGlow: Color(0xFF00FFEE),
    surfaceColor: Color(0xFF1B263B),
    vignetteIntensity: 0.45,
    backgroundGradient: [Color(0xFF1B263B), Color(0xFF0D1B2A)],
    ambientId: 'ambience_digital_hum',
    packId: 'pack_notebooks_mystic',
  );

  static final ThemePreset themeHighContrast = ThemePreset(
    id: 'theme_high_contrast',
    name: 'Focus Contrast',
    backgroundColor: Color(0xFFFFFFFF),
    pattern: CanvasBackgroundPattern.none,
    vignetteIntensity: 0.0,
    grainIntensity: 0.0,
    packId: 'pack_notebooks_mystic',
  );

  static final ThemePreset themeObsidianSanctum = ThemePreset(
    id: 'theme_obsidian_sanctum',
    name: 'Obsidian Sanctum',
    backgroundColor: Color(0xFF050505),
    pattern: CanvasBackgroundPattern.grid,
    lineColor: Color(0x22FFFFFF),
    accentGlow: Color(0xFF505050),
    surfaceColor: Color(0xFF111111),
    vignetteIntensity: 0.85,
    grainIntensity: 0.05,
    backgroundGradient: [Color(0xFF111111), Color(0xFF050505)],
    customAuraColor: Color(0xFF333333),
    packId: 'pack_notebooks_mystic',
  );
  
  static final ThemePreset themeAncientVellum = ThemePreset(
    id: 'theme_ancient_vellum',
    name: 'Ancient Vellum',
    backgroundColor: Color(0xFFF2EBDC),
    texturePath: 'assets/textures/ancient_vellum_texture.png',
    lineColor: Color(0x228B4513),
    accentGlow: Color(0xFFC0A080),
    vignetteIntensity: 0.15,
    grainIntensity: 0.2,
    packId: 'pack_notebooks_mystic',
  );

  static final ThemePreset themeObsidianDeep = ThemePreset(
    id: 'theme_obsidian_deep',
    name: 'Obsidian Deep',
    backgroundColor: Color(0xFF121212),
    texturePath: 'assets/textures/obsidian_slate_texture.png',
    lineColor: Color(0x33FFFFFF),
    accentGlow: Color(0xFF333333),
    vignetteIntensity: 0.6,
    grainIntensity: 0.1,
    packId: 'pack_notebooks_mystic',
  );

  static final ThemePreset themeGitTerminal = ThemePreset(
    id: 'theme_git_terminal',
    name: 'Git Console',
    backgroundColor: Color(0xFF0A0A0A),
    texturePath: 'assets/textures/git_log_texture.png',
    lineColor: Color(0x4400FF44),
    accentGlow: Color(0xFF003300),
    vignetteIntensity: 0.4,
    grainIntensity: 0.05,
    packId: 'pack_notebooks_mystic',
  );

  static final ThemePreset themeRiverStyx = ThemePreset(
    id: 'theme_river_styx',
    name: 'Styx: The Oath',
    backgroundColor: const Color(0xFF000011),
    pattern: CanvasBackgroundPattern.none,
    lineColor: const Color(0x3300FFFF),
    accentGlow: const Color(0xFF00BFFF),
    vignetteIntensity: 0.9,
    grainIntensity: 0.02,
    backgroundGradient: [const Color(0xFF000022), const Color(0xFF000005)],
    customAuraColor: const Color(0xFF00FFFF),
    texturePath: 'assets/textures/styx_void.png',
    textureOpacity: 0.12,
    textureBlendMode: BlendMode.screen,
    packId: 'pack_themes_rivers_of_hades',
  );

  static final ThemePreset themeRiverAcheron = ThemePreset(
    id: 'theme_river_acheron',
    name: 'Acheron: Woe',
    backgroundColor: const Color(0xFF121212),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: const Color(0x22FFFFFF),
    accentGlow: const Color(0xFF8A2BE2),
    vignetteIntensity: 0.6,
    grainIntensity: 0.15,
    backgroundGradient: [const Color(0xFF1A1A1A), const Color(0xFF0A0A0A)],
    customAuraColor: const Color(0xFF4B0082),
    texturePath: 'assets/textures/acheron_mist.png',
    textureOpacity: 0.2,
    textureBlendMode: BlendMode.multiply,
    packId: 'pack_themes_rivers_of_hades',
  );

  static final ThemePreset themeRiverPhlegethon = ThemePreset(
    id: 'theme_river_phlegethon',
    name: 'Phlegethon: Fire',
    backgroundColor: const Color(0xFF050505),
    secondaryColor: const Color(0xFF1A0500),
    surfaceColor: const Color(0xFF150A00),
    pattern: CanvasBackgroundPattern.grid,
    lineColor: const Color(0x33FF4500),
    accentGlow: const Color(0xFFFF2200),
    vignetteIntensity: 0.8,
    grainIntensity: 0.1,
    backgroundGradient: [const Color(0xFF1A0500), const Color(0xFF050000)],
    customAuraColor: const Color(0xFFFF4500),
    texturePath: 'assets/textures/phlegethon_lava.png',
    textureOpacity: 0.25,
    textureBlendMode: BlendMode.screen,
    packId: 'pack_themes_rivers_of_hades',
  );

  static final ThemePreset themeRiverCocytus = ThemePreset(
    id: 'theme_river_cocytus',
    name: 'Cocytus: Lament',
    backgroundColor: const Color(0xFF0A1F1F),
    pattern: CanvasBackgroundPattern.none,
    lineColor: const Color(0x4400CED1),
    accentGlow: const Color(0xFFE0FFFF),
    surfaceColor: const Color(0xFF102A2A),
    vignetteIntensity: 0.5,
    grainIntensity: 0.05,
    backgroundGradient: [const Color(0xFF102F2F), const Color(0xFF051515)],
    customAuraColor: const Color(0xFF00CED1),
    texturePath: 'assets/textures/cocytus_ice.png',
    textureOpacity: 0.15,
    textureBlendMode: BlendMode.overlay,
    packId: 'pack_themes_rivers_of_hades',
  );
  
  static final ThemePreset themeCircleLimbo = ThemePreset(
    id: 'theme_circle_limbo',
    name: 'Limbo: The Waiting',
    backgroundColor: const Color(0xFF1B1B1B),
    secondaryColor: const Color(0xFF2C2C2C),
    pattern: CanvasBackgroundPattern.none,
    lineColor: const Color(0x22AAAAAA),
    accentGlow: const Color(0xFF666666),
    vignetteIntensity: 0.4,
    grainIntensity: 0.1,
    backgroundGradient: [const Color(0xFF222222), const Color(0xFF111111)],
    texturePath: 'assets/textures/limbo_fog.png',
    textureOpacity: 0.1,
    textureBlendMode: BlendMode.screen,
    packId: 'pack_themes_circles_of_hell',
  );

  static final ThemePreset themeCircleLust = ThemePreset(
    id: 'theme_circle_lust',
    name: 'Lust: The Storm',
    backgroundColor: const Color(0xFF1A001A),
    secondaryColor: const Color(0xFF300030),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: const Color(0x33FF00FF),
    accentGlow: const Color(0xFFDDA0DD),
    vignetteIntensity: 0.6,
    grainIntensity: 0.05,
    backgroundGradient: [const Color(0xFF200020), const Color(0xFF000000)],
    customAuraColor: const Color(0xFFEE82EE),
    texturePath: 'assets/textures/lust_wind.png',
    textureOpacity: 0.15,
    textureBlendMode: BlendMode.plus,
    packId: 'pack_themes_circles_of_hell',
  );

  static final ThemePreset themeCircleGluttony = ThemePreset(
    id: 'theme_circle_gluttony',
    name: 'Gluttony: The Rain',
    backgroundColor: const Color(0xFF0A1A0A),
    secondaryColor: const Color(0xFF051005),
    pattern: CanvasBackgroundPattern.grid,
    lineColor: const Color(0x2200FF00),
    accentGlow: const Color(0xFF32CD32),
    vignetteIntensity: 0.7,
    grainIntensity: 0.2,
    backgroundGradient: [const Color(0xFF0F200F), const Color(0xFF000000)],
    texturePath: 'assets/textures/gluttony_mud.png',
    textureOpacity: 0.25,
    textureBlendMode: BlendMode.multiply,
    packId: 'pack_themes_circles_of_hell',
  );

  static final ThemePreset themeCircleGreed = ThemePreset(
    id: 'theme_circle_greed',
    name: 'Greed: The Weight',
    backgroundColor: const Color(0xFF1A1500),
    secondaryColor: const Color(0xFF2A2000),
    pattern: CanvasBackgroundPattern.lined,
    lineColor: const Color(0x33D4AF37),
    accentGlow: const Color(0xFFFFD700),
    vignetteIntensity: 0.5,
    grainIntensity: 0.08,
    backgroundGradient: [const Color(0xFF2A2000), const Color(0xFF0D0D00)],
    customAuraColor: const Color(0xFFDAA520),
    texturePath: 'assets/textures/greed_gold.png',
    textureOpacity: 0.12,
    textureBlendMode: BlendMode.colorDodge,
    packId: 'pack_themes_circles_of_hell',
  );

  static final ThemePreset themeCircleAnger = ThemePreset(
    id: 'theme_circle_anger',
    name: 'Anger: The Styx',
    backgroundColor: const Color(0xFF2A0000),
    secondaryColor: const Color(0xFF4A0000),
    pattern: CanvasBackgroundPattern.none,
    lineColor: const Color(0x44FF0000),
    accentGlow: const Color(0xFFFF4500),
    vignetteIntensity: 0.8,
    grainIntensity: 0.15,
    backgroundGradient: [const Color(0xFF3A0000), const Color(0xFF000000)],
    customAuraColor: const Color(0xFFFF2200),
    texturePath: 'assets/textures/anger_blood.png',
    textureOpacity: 0.2,
    textureBlendMode: BlendMode.softLight,
    packId: 'pack_themes_circles_of_hell',
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

  static final InkPreset inkSheenMachine = InkPreset(
    id: 'ink_sheen_machine',
    name: 'KWZ Sheen Machine',
    baseColor: Color(0xFF004B57), // Deep Teal
    edgeColor: Color(0xFFFF007F), // Magenta Sheen
    sheenIntensity: 0.95,
    defaultThickness: 3.8,
    character: 'Famous for its machine-like magenta sheen over a deep teal base.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkEmeraldChivor = InkPreset(
    id: 'ink_emerald_chivor',
    name: 'Émeraude de Chivor',
    baseColor: Color(0xFF006D6F), // Dark Teal
    edgeColor: Color(0xFF800000), // Dark Red Sheen
    shimmerColor: Color(0xFFD4AF37), // Gold Shimmer
    shimmerIntensity: 0.7,
    sheenIntensity: 0.6,
    defaultThickness: 4.0,
    character: 'A legendary trilogy of teal ink, red sheen, and gold shimmer.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkOsNitrogen = InkPreset(
    id: 'ink_os_nitrogen',
    name: 'O.S. Nitrogen',
    baseColor: Color(0xFF0047AB), // Royal Blue
    edgeColor: Color(0xFFFF1493), // Pink/Magenta Sheen
    sheenIntensity: 1.0,
    defaultThickness: 3.5,
    character: 'Extreme royal blue that dries into a solid pink crystalline sheen.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkYamaBudo = InkPreset(
    id: 'ink_yama_budo',
    name: 'Iroshizuku Yama-Budo',
    baseColor: Color(0xFF800040), // Deep Magenta/Purple
    edgeColor: Color(0xFFAABB00), // Gold/Green Sheen
    sheenIntensity: 0.45,
    shadingAmount: 0.5,
    defaultThickness: 3.2,
    character: 'Crimson Glory Vine. Refined purple with an elegant gold flash.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkApacheSunset = InkPreset(
    id: 'ink_apache_sunset',
    name: 'Apache Sunset',
    baseColor: Color(0xFFFFB300), // Yellow-Orange
    edgeColor: Color(0xFFFF4500), // Burning Orange Shading
    shadingAmount: 1.0,
    sheenIntensity: 0.2, // Subtle warmth
    defaultThickness: 4.5,
    character: 'The king of shading. Flows from bright yellow to deep burnt orange.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkBlueLightning = InkPreset(
    id: 'ink_blue_lightning',
    name: 'Blue Lightning',
    baseColor: Color(0xFF00BFFF), // Light Blue
    shimmerColor: Color(0xFFC0C0C0), // Silver Shimmer
    shimmerIntensity: 0.9,
    defaultThickness: 3.5,
    character: 'Electric blue sky filled with a storm of silver lightning particles.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkOxblood = InkPreset(
    id: 'ink_oxblood',
    name: 'Diamine Oxblood',
    baseColor: Color(0xFF4A0404), // Dried Blood Red
    edgeColor: Color(0xFF2A0101),
    shadingAmount: 0.65,
    defaultThickness: 3.0,
    character: 'The classic, moody, deep red preferred by dark scholars.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkManyoHaha = InkPreset(
    id: 'ink_manyo_haha',
    name: 'Sailor Manyo Haha',
    baseColor: Color(0xFFADD8E6), // Pale Blue
    edgeColor: Color(0xFF9370DB), // Lavender shading hints
    shadingAmount: 0.8,
    dryness: 0.3,
    defaultThickness: 5.0,
    character: 'Chromatic shading. Pale blue with whispers of lavender and green.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkFireIce = InkPreset(
    id: 'ink_fire_ice',
    name: 'Robert Oster Fire & Ice',
    baseColor: Color(0xFF008B8B), // Turquoise
    edgeColor: Color(0xFFDC143C), // Red sheen
    sheenIntensity: 0.55,
    defaultThickness: 3.5,
    character: 'Cool turquoise water meeting a burning red horizon.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkJackFrost = InkPreset(
    id: 'ink_jack_frost',
    name: 'Diamine Jack Frost',
    baseColor: Color(0xFF1E90FF), // Bright Blue
    edgeColor: Color(0xFFFF69B4), // Pink sheen
    shimmerColor: Color(0xFFE5E4E2), // Silver/Frost Shimmer
    shimmerIntensity: 0.8,
    sheenIntensity: 0.7,
    defaultThickness: 3.8,
    character: 'A winter sky shimmering with frost and glowing pink highlights.',
    packId: 'pack_inks_premium_vault',
  );

  static final InkPreset inkStardustSilver = InkPreset(
    id: 'ink_stardust_silver',
    name: 'Celestial Stardust',
    baseColor: Color(0xFFC0C0C0), // Silver
    shimmerColor: Color(0xFFFFFFFF), // White shimmer
    shimmerIntensity: 1.0,
    sheenIntensity: 0.3,
    defaultThickness: 3.5,
    character: 'High-frequency silver particles that glisten like distant galaxies.',
  );

  // RELICS (SEALS / SIGNATURES)
  static final RelicElement relicPentagram = RelicElement(
    id: 'relic_pentagram',
    name: 'Pentagram of Focus',
    type: RelicType.pentagram,
    category: SealCategory.ritual,
    assetPath: 'assets/relics/pentagram.svg',
    description: 'Draws ambient energy into the current page for deep ritual work.',
    modifier: RitualModifier.hellfire,
  );

  static final RelicElement relicRuneClarity = RelicElement(
    id: 'relic_rune_clarity',
    name: 'Rune of Clarity',
    type: RelicType.rune,
    category: SealCategory.ancient,
    assetPath: 'assets/relics/rune_clarity.svg',
    description: 'A high-frequency rune that stabilizes chaotic thoughts.',
    modifier: RitualModifier.cleric,
  );

  static final RelicElement relicSealAbyss = RelicElement(
    id: 'relic_seal_abyss',
    name: 'Seal of the Abyss',
    type: RelicType.seal,
    category: SealCategory.voidWalker,
    assetPath: 'assets/relics/seal_abyss.svg',
    description: 'A dark flourish for finalizing deep communion notes.',
    modifier: RitualModifier.voidWalker,
  );

  // EFFECTS
  static final EffectPreset effectDyingEmber = EffectPreset(
    id: 'effect_ember',
    name: 'Dying Ember',
    shaderId: 'shaders/pencil.frag',
    cooldownMs: 800,
    packId: 'pack_effects_subtle',
  );

  static final EffectPreset effectTrueFlame = EffectPreset(
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
    character: 'A multi-stage, realistic flame that cools into smoke as it rises.',
    packId: 'pack_effects_premium',
  );

  static final EffectPreset effectDigitalGlitch = EffectPreset(
    id: 'effect_digital_glitch',
    name: 'Cyber Glitch',
    particleType: ParticleType.pixel,
    ignitionColor: Color(0xFF00FFFF),
    trailColor: Color(0xFFFF00FF),
    fadeColor: Color(0xFF00FF00),
    cooldownMs: 400,
    trailDensity: 0.6,
    particleScale: 0.8,
    character: 'Quantized, neon-pixel data fragments from a fractured reality.',
    packId: 'pack_effects_premium',
  );

  static final EffectPreset effectVoidTendrils = EffectPreset(
    id: 'effect_void_tendrils',
    name: 'Void Tendrils',
    particleType: ParticleType.plasma,
    ignitionColor: Color(0xFFA020F0),
    trailColor: Color(0xFF4B0082),
    fadeColor: Color(0xFF000000),
    cooldownMs: 1500,
    trailDensity: 0.4,
    particleScale: 1.5,
    character: 'Dark mass that swirls and orbits the nib with magnetic gravity.',
    packId: 'pack_effects_premium',
  );

  static final EffectPreset effectHolyStardust = EffectPreset(
    id: 'effect_holy_stardust',
    name: 'Holy Stardust',
    particleType: ParticleType.spark,
    ignitionColor: Color(0xFFFFFFFF),
    trailColor: Color(0xFFFFD700),
    fadeColor: Color(0xFFAAAAAA),
    cooldownMs: 600,
    trailDensity: 0.9,
    particleScale: 0.5,
    character: 'High-frequency shimmering particles that fall with grace.',
    packId: 'pack_effects_premium',
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
    effect: effectTrueFlame,
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
    effect: effectDigitalGlitch,
    preferredMode: WritingMode.ritual,
  );

  static final Loadout loadoutEmeraldRitual = Loadout(
    id: 'loadout_emerald_ritual',
    name: 'Emerald Ritual',
    theme: themeObsidianSanctum,
    ink: inkEmeraldChivor,
    effect: effectDyingEmber,
    preferredMode: WritingMode.ritual,
  );

  static final Loadout loadoutIndigoMachine = Loadout(
    id: 'loadout_indigo_machine',
    name: 'Indigo Machine',
    theme: themeDarkPremium,
    ink: inkSheenMachine,
    effect: effectDyingEmber,
    preferredMode: WritingMode.ritual,
  );

  static final Loadout loadoutUnderworld = Loadout(
    id: 'loadout_king_underworld',
    name: 'King of the Underworld',
    theme: themeRiverStyx,
    ink: inkOsNitrogen,
    effect: effectVoidTendrils,
    preferredMode: WritingMode.infernal,
  );

  static final Loadout loadoutAstralResonance = Loadout(
    id: 'loadout_astral_resonance',
    name: 'Astral Resonance',
    theme: themeRiverCocytus, // Using Cocytus as base for celestial theme for now
    ink: inkStardustSilver,
    effect: effectHolyStardust,
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
    themeRiverStyx.id: themeRiverStyx,
    themeRiverAcheron.id: themeRiverAcheron,
    themeRiverPhlegethon.id: themeRiverPhlegethon,
    themeRiverCocytus.id: themeRiverCocytus,
    themeCircleLimbo.id: themeCircleLimbo,
    themeCircleLust.id: themeCircleLust,
    themeCircleGluttony.id: themeCircleGluttony,
    themeCircleGreed.id: themeCircleGreed,
    themeCircleAnger.id: themeCircleAnger,
    themeAncientVellum.id: themeAncientVellum,
    themeObsidianDeep.id: themeObsidianDeep,
    themeGitTerminal.id: themeGitTerminal,
  };

  static final Map<String, InkPreset> inks = {
    inkObsidian.id: inkObsidian,
    inkCopperOxide.id: inkCopperOxide,
    inkMidnightSheen.id: inkMidnightSheen,
    inkAshBlack.id: inkAshBlack,
    inkBloodResin.id: inkBloodResin,
    inkInfernalGold.id: inkInfernalGold,
    inkNeonCyber.id: inkNeonCyber,
    inkSheenMachine.id: inkSheenMachine,
    inkEmeraldChivor.id: inkEmeraldChivor,
    inkOsNitrogen.id: inkOsNitrogen,
    inkYamaBudo.id: inkYamaBudo,
    inkApacheSunset.id: inkApacheSunset,
    inkBlueLightning.id: inkBlueLightning,
    inkOxblood.id: inkOxblood,
    inkManyoHaha.id: inkManyoHaha,
    inkFireIce.id: inkFireIce,
    inkJackFrost.id: inkJackFrost,
    inkStardustSilver.id: inkStardustSilver,
  };

  static final Map<String, RelicElement> relics = {
    relicPentagram.id: relicPentagram,
    relicRuneClarity.id: relicRuneClarity,
    relicSealAbyss.id: relicSealAbyss,
  };

  static final Map<String, EffectPreset> effects = {
    effectDyingEmber.id: effectDyingEmber,
    effectTrueFlame.id: effectTrueFlame,
    effectDigitalGlitch.id: effectDigitalGlitch,
    effectVoidTendrils.id: effectVoidTendrils,
    effectHolyStardust.id: effectHolyStardust,
  };

  static final Map<String, Loadout> loadouts = {
    loadoutDevilsPen.id: loadoutDevilsPen,
    loadoutBloodRitual.id: loadoutBloodRitual,
    loadoutAntiqueScholar.id: loadoutAntiqueScholar,
    loadoutCyberPunk.id: loadoutCyberPunk,
    loadoutEmeraldRitual.id: loadoutEmeraldRitual,
    loadoutIndigoMachine.id: loadoutIndigoMachine,
    loadoutUnderworld.id: loadoutUnderworld,
    loadoutAstralResonance.id: loadoutAstralResonance,
  };

  static void seedDefaults() {
    // Seed logic here if needed
  }
}
