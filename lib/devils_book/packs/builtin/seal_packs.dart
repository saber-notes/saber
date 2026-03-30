import 'package:flutter/material.dart';
import '../../models/relic_element.dart';
import '../pack_manifest.dart';
import '../pack_category.dart';
import '../content_pack.dart';

/// Ceremonial seals and ritual marks.
class CeremonialSealPack {
  static final _manifest = PackManifest(
    id: 'pack_seals_ceremonial',
    name: 'Ceremonial Seals',
    description: 'Wax seals, ritual marks, and binding symbols for important documents.',
    categories: {PackCategory.seals},
    isBuiltIn: true,
  );

  static final _seals = [
    RelicElement(
      id: 'seal_of_lucifer', name: 'Seal of Lucifer',
      assetPath: 'assets/relics/seal_lucifer.svg',
      category: SealCategory.seal,
      fallbackIcon: Icons.brightness_7,
      description: 'The classic lightbringer sigil. Marks pages of consequence.',
      packId: 'pack_seals_ceremonial',
    ),
    RelicElement(
      id: 'seal_wax_red', name: 'Red Wax Seal',
      assetPath: 'assets/relics/seal_wax_red.svg',
      category: SealCategory.seal,
      fallbackIcon: Icons.circle,
      description: 'Traditional crimson wax impression. Finality and authority.',
      packId: 'pack_seals_ceremonial',
    ),
    RelicElement(
      id: 'seal_binding_ring', name: 'Binding Ring',
      assetPath: 'assets/relics/seal_binding_ring.svg',
      category: SealCategory.sigil,
      fallbackIcon: Icons.all_inclusive,
      description: 'An ouroboros loop. Marks documents as sealed and complete.',
      packId: 'pack_seals_ceremonial',
    ),
    RelicElement(
      id: 'seal_pentacle', name: 'Pentacle',
      assetPath: 'assets/relics/seal_pentacle.svg',
      category: SealCategory.sigil,
      fallbackIcon: Icons.star,
      description: 'Five-pointed protective ward. Marks important boundaries.',
      packId: 'pack_seals_ceremonial',
    ),
  ];

  static ContentPack create() => ContentPack(manifest: _manifest, seals: _seals);
}

/// Signatures and authorship marks.
class SignaturePack {
  static final _manifest = PackManifest(
    id: 'pack_seals_signatures',
    name: 'Signatures & Marks',
    description: 'Personal authorship stamps, initials, and completion markers.',
    categories: {PackCategory.seals},
    isBuiltIn: true,
  );

  static final _seals = [
    RelicElement(
      id: 'sig_placeholder', name: 'Signature Placeholder',
      assetPath: 'assets/relics/sig_placeholder.svg',
      category: SealCategory.signature,
      fallbackIcon: Icons.draw,
      description: 'A reserved space for your handwritten signature.',
      packId: 'pack_seals_signatures',
    ),
    RelicElement(
      id: 'sig_approved', name: 'Approved',
      assetPath: 'assets/relics/sig_approved.svg',
      category: SealCategory.stamp,
      fallbackIcon: Icons.check_circle,
      description: 'Mark a document or section as reviewed and approved.',
      packId: 'pack_seals_signatures',
    ),
    RelicElement(
      id: 'sig_draft', name: 'Draft',
      assetPath: 'assets/relics/sig_draft.svg',
      category: SealCategory.stamp,
      fallbackIcon: Icons.edit_note,
      description: 'Mark as work-in-progress. Not yet final.',
      packId: 'pack_seals_signatures',
    ),
    RelicElement(
      id: 'sig_confidential', name: 'Confidential',
      assetPath: 'assets/relics/sig_confidential.svg',
      category: SealCategory.stamp,
      fallbackIcon: Icons.lock,
      description: 'Marks sensitive content. Visual privacy indicator.',
      packId: 'pack_seals_signatures',
    ),
  ];

  static ContentPack create() => ContentPack(manifest: _manifest, seals: _seals);
}

/// Subject markers for study and annotation.
class ScholarlyMarkerPack {
  static final _manifest = PackManifest(
    id: 'pack_seals_scholarly',
    name: 'Scholarly Markers',
    description: 'Subject indicators, priority flags, and study annotations.',
    categories: {PackCategory.seals},
    isBuiltIn: true,
  );

  static final _seals = [
    RelicElement(
      id: 'marker_important', name: 'Important',
      assetPath: 'assets/relics/marker_important.svg',
      category: SealCategory.marker,
      fallbackIcon: Icons.priority_high,
      description: 'Flag critical content. Visual importance anchor.',
      packId: 'pack_seals_scholarly',
    ),
    RelicElement(
      id: 'marker_question', name: 'Question',
      assetPath: 'assets/relics/marker_question.svg',
      category: SealCategory.marker,
      fallbackIcon: Icons.help_outline,
      description: 'Mark unclear content for later review.',
      packId: 'pack_seals_scholarly',
    ),
    RelicElement(
      id: 'marker_reference', name: 'Reference',
      assetPath: 'assets/relics/marker_reference.svg',
      category: SealCategory.marker,
      fallbackIcon: Icons.bookmark,
      description: 'Annotate source material and citations.',
      packId: 'pack_seals_scholarly',
    ),
    RelicElement(
      id: 'marker_eureka', name: 'Eureka',
      assetPath: 'assets/relics/marker_eureka.svg',
      category: SealCategory.marker,
      fallbackIcon: Icons.lightbulb,
      description: 'Mark breakthrough insights and key discoveries.',
      packId: 'pack_seals_scholarly',
    ),
  ];

  static ContentPack create() => ContentPack(manifest: _manifest, seals: _seals);
}

/// Arcane symbols and decorative sigils.
class ArcaneSigilPack {
  static final _manifest = PackManifest(
    id: 'pack_seals_arcane',
    name: 'Arcane Sigils',
    description: 'Mystical symbols, alchemical marks, and decorative occult geometry.',
    categories: {PackCategory.seals},
    isBuiltIn: true,
  );

  static final _seals = [
    RelicElement(
      id: 'sigil_alchemy_fire', name: 'Fire Element',
      assetPath: 'assets/relics/sigil_alchemy_fire.svg',
      category: SealCategory.sigil,
      fallbackIcon: Icons.change_history,
      description: 'Upward triangle. Classical element of transformation.',
      packId: 'pack_seals_arcane',
    ),
    RelicElement(
      id: 'sigil_alchemy_water', name: 'Water Element',
      assetPath: 'assets/relics/sigil_alchemy_water.svg',
      category: SealCategory.sigil,
      fallbackIcon: Icons.change_history,
      description: 'Inverted triangle. Classical element of intuition.',
      packId: 'pack_seals_arcane',
    ),
    RelicElement(
      id: 'sigil_eye', name: 'All-Seeing Eye',
      assetPath: 'assets/relics/sigil_eye.svg',
      category: SealCategory.symbol,
      fallbackIcon: Icons.visibility,
      description: 'Watchful awareness. Marks pages under scrutiny.',
      packId: 'pack_seals_arcane',
    ),
    RelicElement(
      id: 'sigil_infinity', name: 'Infinity Knot',
      assetPath: 'assets/relics/sigil_infinity.svg',
      category: SealCategory.symbol,
      fallbackIcon: Icons.all_inclusive,
      description: 'Endless continuation. Marks ongoing projects.',
      packId: 'pack_seals_arcane',
    ),
  ];

  static ContentPack create() => ContentPack(manifest: _manifest, seals: _seals);
}
