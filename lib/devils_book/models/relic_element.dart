import 'package:flutter/material.dart';

enum RelicType {
  seal(label: 'Ritual Seal'),
  signature(label: 'Signature'),
  sigil(label: 'Sigil'),
  pentagram(label: 'Pentagram'),
  alchemy(label: 'Alchemic Symbol'),
  rune(label: 'Rune'),
  stamp(label: 'Stamp'),
  marker(label: 'Marker'),
  symbol(label: 'Symbol');

  final String label;
  const RelicType({required this.label});
}

enum SealCategory {
  ritual,
  cleric,
  alchemist,
  voidWalker,
  ancient,
  favorites,
  seal,
  signature,
  stamp,
  marker,
  sigil,
  symbol
}

class RitualModifier {
  final double particleMultiplier;
  final double fadeDurationMultiplier;
  final double intensityGainMultiplier;
  final bool isEvanescent; // Ink fades faster if stopped
  final double distortionStrength;

  const RitualModifier({
    this.particleMultiplier = 1.0,
    this.fadeDurationMultiplier = 1.0,
    this.intensityGainMultiplier = 1.0,
    this.isEvanescent = false,
    this.distortionStrength = 0.0,
  });

  static const none = RitualModifier();
  static const hellfire = RitualModifier(particleMultiplier: 1.8, intensityGainMultiplier: 1.5);
  static const voidWalker = RitualModifier(isEvanescent: true, distortionStrength: 1.2);
  static const cleric = RitualModifier(fadeDurationMultiplier: 2.0, particleMultiplier: 0.5);
}

class RelicElement {
  final String id;
  final String name;
  final RelicType type;
  final SealCategory category;
  
  /// Asset path to the SVG/Image represention of the relic.
  final String assetPath;
  
  /// Default size for insertion.
  final Size defaultSize;
  
  /// The color to tint this relic with when inserted.
  final Color? defaultTint;
  
  /// Flavor text describing the relic's "power" or "focus".
  final String? description;
  final IconData? fallbackIcon;
  bool isFavorite;
  
  /// Functional modifier for the ritual engine.
  final RitualModifier modifier;

  /// Pack ID for grouping in selectors.
  final String? packId;

  RelicElement({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.assetPath,
    this.defaultSize = const Size(150, 150),
    this.defaultTint,
    this.description,
    this.fallbackIcon,
    this.isFavorite = false,
    this.modifier = RitualModifier.none,
    this.packId,
  });
}
