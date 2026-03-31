import 'package:flutter/material.dart';
import 'package:sbn/canvas_background_pattern.dart';
import '../../models/notebook_template.dart';
import '../pack_manifest.dart';
import '../pack_category.dart';

/// Premium Mystic and Celestial notebook families.
class MysticNotebookPack {
  static final manifest = PackManifest(
    id: 'pack_notebooks_mystic',
    name: 'Mystic Collection',
    description: 'High-fidelity textures and ritualistic covers for deep creative work.',
    categories: {PackCategory.templates},
    isBuiltIn: true,
  );

  static final _ancientVellum = PageTemplate(
    id: 'page_mystic_vellum',
    name: 'Ancient Vellum',
    backgroundColor: Color(0xFFF2EBDC),
    texturePath: 'assets/textures/ancient_vellum_texture.png',
    description: 'Aged, translucent parchment for timeless notes.',
  );

  static final _obsidianSlate = PageTemplate(
    id: 'page_mystic_slate',
    name: 'Obsidian Slate',
    backgroundColor: Color(0xFF121212),
    pattern: CanvasBackgroundPattern.grid,
    lineColor: Color(0x11FFFFFF),
    texturePath: 'assets/textures/obsidian_slate_texture.png',
    description: 'Dark stone surface for high-contrast white or metallic ink.',
  );

  static final _gitTerminal = PageTemplate(
    id: 'page_mystic_git',
    name: 'Commit Log',
    backgroundColor: Color(0xFF0A0A0A),
    pattern: CanvasBackgroundPattern.lined,
    lineColor: Color(0x3300FF44),
    texturePath: 'assets/textures/git_log_texture.png',
    description: 'Technical green phosphor lines on deep black.',
  );

  static final List<NotebookTemplate> templates = [
    NotebookTemplate(
      id: 'notebook_void_grimoire',
      name: "Void's Grimoire",
      cover: CoverStyle(
        id: 'cover_void_grimoire',
        name: 'Void Leather',
        primaryColor: Color(0xFF1A1025),
        accentColor: Color(0xFF9146FF),
        coverAssetPath: 'assets/covers/void_grimoire_cover.png',
        description: 'Nebulous purple and black leather with obsidian clasps.',
      ),
      defaultPage: _obsidianSlate,
      availablePages: [_obsidianSlate, _gitTerminal],
      packId: manifest.id,
      description: 'A high-contrast notebook for writing into the void.',
    ),
    NotebookTemplate(
      id: 'notebook_cursed_alchemy',
      name: 'Cursed Alchemy',
      cover: CoverStyle(
        id: 'cover_cursed_alchemy',
        name: 'Emerald Alchemist',
        primaryColor: Color(0xFF0D2B1D),
        accentColor: Color(0xFFD4AF37),
        coverAssetPath: 'assets/covers/cursed_alchemy_cover.png',
        description: 'Deep green leather with gold alchemical seals.',
      ),
      defaultPage: _ancientVellum,
      availablePages: [_ancientVellum],
      packId: manifest.id,
      description: 'Ancient manuscript feel for experimental thoughts.',
    ),
    NotebookTemplate(
      id: 'notebook_fallen_angel',
      name: 'Fallen Angel',
      cover: CoverStyle(
        id: 'cover_fallen_angel',
        name: 'Broken Marble',
        primaryColor: Color(0xFFE5E5E5),
        accentColor: Color(0xFFB8860B),
        coverAssetPath: 'assets/covers/fallen_angel_cover.png',
        description: 'Polished white stone with gold-veined cracks.',
      ),
      defaultPage: _ancientVellum,
      availablePages: [_ancientVellum, _obsidianSlate],
      packId: manifest.id,
      description: 'An ethereal, premium stone notebook.',
    ),
    NotebookTemplate(
      id: 'notebook_forgotten_archive',
      name: 'Forgotten Archive',
      cover: CoverStyle(
        id: 'cover_forgotten_archive',
        name: 'Sealed History',
        primaryColor: Color(0xFF3E2723),
        accentColor: Color(0xFFE64A19),
        coverAssetPath: 'assets/covers/forgotten_archive_cover.png',
        description: 'Cracked brown leather with a glowing red wax seal.',
      ),
      defaultPage: _ancientVellum,
      availablePages: [_ancientVellum],
      packId: manifest.id,
      description: 'A weathered journal for archival records and secrets.',
    ),
  ];
}
