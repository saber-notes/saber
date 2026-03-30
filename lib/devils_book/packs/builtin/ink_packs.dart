import 'package:flutter/material.dart';
import '../models/ink_preset.dart';
import 'pack_manifest.dart';
import 'pack_category.dart';
import 'content_pack.dart';

/// Classic writing inks — serious, reliable, professional.
class ClassicInkPack {
  static const _manifest = PackManifest(
    id: 'pack_inks_classic',
    name: 'Classic Writing',
    description: 'Time-tested inks for serious note-taking and everyday writing.',
    categories: {PackCategory.inks},
    isBuiltIn: true,
  );

  static const _inks = [
    InkPreset(
      id: 'ink_obsidian', name: 'Obsidian Black',
      baseColor: Color(0xFF111111), defaultThickness: 3.0,
      sheenIntensity: 0.05, dryness: 0.0, warmth: 0.0,
      character: 'Dense, absolute black. Zero personality, maximum authority.',
      packId: 'pack_inks_classic',
    ),
    InkPreset(
      id: 'ink_ash_black', name: 'Ash Dry',
      baseColor: Color(0xFF4A4A4A), defaultThickness: 2.5,
      sheenIntensity: 0.0, dryness: 0.7, warmth: 0.1,
      character: 'Chalky, matte grey. Whispers instead of shouts.',
      packId: 'pack_inks_classic',
    ),
    InkPreset(
      id: 'ink_midnight_sheen', name: 'Midnight Sheen',
      baseColor: Color(0xFF1A1A40),
      edgeColor: Color(0xFF0D0D20),
      defaultThickness: 4.0,
      sheenIntensity: 0.6, dryness: 0.0, warmth: 0.0,
      character: 'Deep indigo with visible sheen contrast. Confident and expressive.',
      packId: 'pack_inks_classic',
    ),
    InkPreset(
      id: 'ink_iron_gall', name: 'Iron Gall',
      baseColor: Color(0xFF2C2C3A),
      edgeColor: Color(0xFF1A1A28),
      defaultThickness: 3.0,
      sheenIntensity: 0.15, dryness: 0.3, warmth: 0.1,
      character: 'Historic blue-black. Edges darken like aged manuscripts.',
      packId: 'pack_inks_classic',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, inks: _inks);
}

/// Oxidized and heritage-toned inks — warm, weathered, scholarly.
class HeritageInkPack {
  static const _manifest = PackManifest(
    id: 'pack_inks_heritage',
    name: 'Heritage & Patina',
    description: 'Warm, oxidized inks that evoke aged documents and copper engravings.',
    categories: {PackCategory.inks},
    isBuiltIn: true,
  );

  static const _inks = [
    InkPreset(
      id: 'ink_copper_oxide', name: 'Copper Oxide',
      baseColor: Color(0xFFB87333),
      edgeColor: Color(0xFF8B5A2B),
      defaultThickness: 3.5,
      sheenIntensity: 0.35, dryness: 0.2, warmth: 0.7,
      character: 'Warm copper with oxidized edge darkening. Feels hand-forged.',
      packId: 'pack_inks_heritage',
    ),
    InkPreset(
      id: 'ink_sepia_walnut', name: 'Sepia Walnut',
      baseColor: Color(0xFF704214),
      edgeColor: Color(0xFF4A2A0A),
      defaultThickness: 3.0,
      sheenIntensity: 0.1, dryness: 0.4, warmth: 0.8,
      character: 'Rich walnut brown. Dried earth and old leather.',
      packId: 'pack_inks_heritage',
    ),
    InkPreset(
      id: 'ink_verdigris', name: 'Verdigris',
      baseColor: Color(0xFF43B3AE),
      edgeColor: Color(0xFF2A7A76),
      defaultThickness: 3.0,
      sheenIntensity: 0.4, dryness: 0.15, warmth: 0.2,
      character: 'Teal-green patina. Copper left in rain for a century.',
      packId: 'pack_inks_heritage',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, inks: _inks);
}

/// Infernal and ritual inks — blood, ember, gold, ceremonial weight.
class InfernalInkPack {
  static const _manifest = PackManifest(
    id: 'pack_inks_infernal',
    name: 'Infernal',
    description: 'Inks forged in fire. Blood, ember, and molten gold.',
    categories: {PackCategory.inks},
    isBuiltIn: true,
  );

  static const _inks = [
    InkPreset(
      id: 'ink_blood_resin', name: 'Blood Resin',
      baseColor: Color(0xFF8A0303),
      edgeColor: Color(0xFF550000),
      defaultThickness: 3.5,
      sheenIntensity: 0.3, dryness: 0.1, warmth: 0.9,
      character: 'Thick, coagulating crimson. Urgent and irreversible.',
      packId: 'pack_inks_infernal',
    ),
    InkPreset(
      id: 'ink_infernal_gold', name: 'Infernal Gold',
      baseColor: Color(0xFFD4AF37),
      edgeColor: Color(0xFFAA8820),
      defaultThickness: 4.5,
      sheenIntensity: 0.7, dryness: 0.0, warmth: 0.6,
      character: 'Molten gold with high sheen. Seals decrees and binds oaths.',
      packId: 'pack_inks_infernal',
    ),
    InkPreset(
      id: 'ink_ember_ash', name: 'Ember Ash',
      baseColor: Color(0xFF8B4513),
      edgeColor: Color(0xFF5C2D0A),
      defaultThickness: 3.0,
      sheenIntensity: 0.15, dryness: 0.6, warmth: 0.95,
      character: 'Smoldering burnt sienna. Dry heat radiating from every stroke.',
      packId: 'pack_inks_infernal',
    ),
    InkPreset(
      id: 'ink_brimstone', name: 'Brimstone',
      baseColor: Color(0xFFCC6600),
      edgeColor: Color(0xFF994400),
      defaultThickness: 3.5,
      sheenIntensity: 0.4, dryness: 0.2, warmth: 0.85,
      character: 'Sulfuric orange. Writing with the smell of consequence.',
      packId: 'pack_inks_infernal',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, inks: _inks);
}

/// Cyber and reactive inks — neon, electric, synthetic.
class CyberInkPack {
  static const _manifest = PackManifest(
    id: 'pack_inks_cyber',
    name: 'Cyber Reactive',
    description: 'Neon-bright synthetic inks for digital minds and dark canvases.',
    categories: {PackCategory.inks},
    isBuiltIn: true,
  );

  static const _inks = [
    InkPreset(
      id: 'ink_neon_cyber', name: 'Neon Cyan',
      baseColor: Color(0xFF00FFCC),
      edgeColor: Color(0xFF00AA88),
      defaultThickness: 3.0,
      sheenIntensity: 0.5, dryness: 0.0, warmth: 0.0,
      character: 'Eye-burning teal. Demands attention on dark surfaces.',
      packId: 'pack_inks_cyber',
    ),
    InkPreset(
      id: 'ink_plasma_magenta', name: 'Plasma Magenta',
      baseColor: Color(0xFFFF00FF),
      edgeColor: Color(0xFFAA00AA),
      defaultThickness: 3.0,
      sheenIntensity: 0.6, dryness: 0.0, warmth: 0.3,
      character: 'Electric magenta. Synthetic and unapologetic.',
      packId: 'pack_inks_cyber',
    ),
    InkPreset(
      id: 'ink_acid_green', name: 'Acid Green',
      baseColor: Color(0xFF00FF00),
      edgeColor: Color(0xFF00AA00),
      defaultThickness: 2.5,
      sheenIntensity: 0.45, dryness: 0.0, warmth: 0.0,
      character: 'Terminal phosphor. Raw data rendered visible.',
      packId: 'pack_inks_cyber',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, inks: _inks);
}

/// Subtle and refined inks — for quiet, focused, premium writing.
class RefinedInkPack {
  static const _manifest = PackManifest(
    id: 'pack_inks_refined',
    name: 'Refined',
    description: 'Quiet, composed inks for deep focus and understated elegance.',
    categories: {PackCategory.inks},
    isBuiltIn: true,
  );

  static const _inks = [
    InkPreset(
      id: 'ink_slate_blue', name: 'Slate Blue',
      baseColor: Color(0xFF4A6080),
      edgeColor: Color(0xFF344558),
      defaultThickness: 3.0,
      sheenIntensity: 0.2, dryness: 0.15, warmth: 0.1,
      character: 'Cool, understated blue-grey. Professional restraint.',
      packId: 'pack_inks_refined',
    ),
    InkPreset(
      id: 'ink_forest_deep', name: 'Forest Deep',
      baseColor: Color(0xFF1B4332),
      edgeColor: Color(0xFF0F2A1F),
      defaultThickness: 3.5,
      sheenIntensity: 0.25, dryness: 0.2, warmth: 0.3,
      character: 'Dark emerald. Ancient canopy blocking all light.',
      packId: 'pack_inks_refined',
    ),
    InkPreset(
      id: 'ink_burgundy', name: 'Burgundy',
      baseColor: Color(0xFF722F37),
      edgeColor: Color(0xFF4A1A20),
      defaultThickness: 3.0,
      sheenIntensity: 0.3, dryness: 0.1, warmth: 0.5,
      character: 'Deep wine red. Formal, warm, with quiet authority.',
      packId: 'pack_inks_refined',
    ),
  ];

  static ContentPack create() => const ContentPack(manifest: _manifest, inks: _inks);
}
