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
    this.packId,
  });
}
