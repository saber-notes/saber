import 'package:flutter/material.dart';

/// Categories for organizing and filtering elements in the selector.
enum SealCategory {
  seal,
  signature,
  sigil,
  marker,
  stamp,
  symbol,
}

/// Represents a reusable "Seal", "Signature", "Sigil", or "Symbol" inside Devils Book.
/// Unlike transient Live FX, Relics are permanent, manipulable document assets.
class RelicElement {
  final String id;
  final String name;
  final String assetPath;
  final bool isVector;

  /// Visual category for filtering and display.
  final SealCategory category;

  /// The icon codepoint to display when the real asset is unavailable.
  final IconData fallbackIcon;

  /// Optional pack ID for grouping in selectors.
  final String? packId;

  /// Short description of the element's purpose.
  final String? description;

  /// Whether the user has marked this as a favorite.
  bool isFavorite;

  const RelicElement({
    required this.id,
    required this.name,
    required this.assetPath,
    this.isVector = true,
    this.category = SealCategory.seal,
    this.fallbackIcon = Icons.local_fire_department,
    this.packId,
    this.description,
    this.isFavorite = false,
  });
}

class RelicCollection {
  final String id;
  final String name;
  final List<RelicElement> elements;

  const RelicCollection({
    required this.id,
    required this.name,
    required this.elements,
  });
}
