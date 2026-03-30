import 'package:flutter/material.dart';
import 'package:sbn/canvas_background_pattern.dart';
import '../../models/theme_preset.dart';
import '../pack_manifest.dart';
import '../pack_category.dart';
import '../content_pack.dart';

/// Dark & Premium themes for serious, focused writing.
class DarkPremiumThemePack {
  static final _manifest = PackManifest(
    id: 'pack_themes_dark_premium',
    name: 'Dark Premium',
    description: 'Professional dark environments for focused, distraction-free writing.',
    categories: {PackCategory.themes},
    isBuiltIn: true,
  );

  static final _themes = [
    ThemePreset(
      id: 'theme_dark_premium',
      name: 'Dark Premium',
      backgroundColor: Color(0xFF141414),
      lineColor: Color(0x22FFFFFF),
      accentGlow: Color(0xFF888888),
      surfaceColor: Color(0xFF1E1E1E),
      packId: 'pack_themes_dark_premium',
    ),
    ThemePreset(
      id: 'theme_midnight_void',
      name: 'Midnight Void',
      backgroundColor: Color(0xFF080810),
      lineColor: Color(0x18AAAAFF),
      accentGlow: Color(0xFF4444AA),
      surfaceColor: Color(0xFF101018),
      packId: 'pack_themes_dark_premium',
    ),
    ThemePreset(
      id: 'theme_charcoal_slate',
      name: 'Charcoal Slate',
      backgroundColor: Color(0xFF1C1C1C),
      pattern: CanvasBackgroundPattern.dots,
      lineColor: Color(0x22999999),
      accentGlow: Color(0xFF777777),
      surfaceColor: Color(0xFF252525),
      packId: 'pack_themes_dark_premium',
    ),
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
  );
}

/// Antique & Old-Soul themes evoking heritage and handcraft.
class AntiqueSoulThemePack {
  static final _manifest = PackManifest(
    id: 'pack_themes_antique_soul',
    name: 'Antique Soul',
    description: 'Warm, aged papers inspired by historical manuscripts and journals.',
    categories: {PackCategory.themes},
    isBuiltIn: true,
  );

  static final _themes = [
    ThemePreset(
      id: 'theme_antique_soul',
      name: 'Parchment',
      backgroundColor: Color(0xFFE8E0D2),
      pattern: CanvasBackgroundPattern.lined,
      lineColor: Color(0x33A09070),
      accentGlow: Color(0xFFB8A080),
      surfaceColor: Color(0xFFF5EDE0),
      packId: 'pack_themes_antique_soul',
    ),
    ThemePreset(
      id: 'theme_vellum_cream',
      name: 'Vellum Cream',
      backgroundColor: Color(0xFFF7F0E3),
      lineColor: Color(0x22C0A880),
      accentGlow: Color(0xFFD4B896),
      surfaceColor: Color(0xFFFFF8EE),
      packId: 'pack_themes_antique_soul',
    ),
    ThemePreset(
      id: 'theme_foxed_manuscript',
      name: 'Foxed Manuscript',
      backgroundColor: Color(0xFFD8CBAD),
      pattern: CanvasBackgroundPattern.grid,
      lineColor: Color(0x33907050),
      accentGlow: Color(0xFF9A7B5B),
      surfaceColor: Color(0xFFE5D8C0),
      packId: 'pack_themes_antique_soul',
    ),
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
  );
}

/// Infernal & Ritual themes for theatrical, atmospheric sessions.
class InfernalThemePack {
  static final _manifest = PackManifest(
    id: 'pack_themes_infernal',
    name: 'Infernal',
    description: 'Blood-soaked altars and ember-lit chambers for ritualistic writing.',
    categories: {PackCategory.themes},
    isBuiltIn: true,
  );

  static final _themes = [
    ThemePreset(
      id: 'theme_infernal_altar',
      name: 'Infernal Altar',
      backgroundColor: Color(0xFF2C0B0B),
      pattern: CanvasBackgroundPattern.grid,
      lineColor: Color(0x33FF2222),
      accentGlow: Color(0xFFCC3333),
      surfaceColor: Color(0xFF3A1515),
      packId: 'pack_themes_infernal',
    ),
    ThemePreset(
      id: 'theme_ember_cavern',
      name: 'Ember Cavern',
      backgroundColor: Color(0xFF1A0A00),
      lineColor: Color(0x22FF6600),
      accentGlow: Color(0xFFFF6A00),
      surfaceColor: Color(0xFF2A1200),
      packId: 'pack_themes_infernal',
    ),
    ThemePreset(
      id: 'theme_obsidian_sanctum',
      name: 'Obsidian Sanctum',
      backgroundColor: Color(0xFF0A0A0A),
      pattern: CanvasBackgroundPattern.dots,
      lineColor: Color(0x15FF4444),
      accentGlow: Color(0xFF992222),
      surfaceColor: Color(0xFF151010),
      packId: 'pack_themes_infernal',
    ),
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
  );
}

/// Gamer & Cyber themes for technical, high-energy diagramming.
class CyberThemePack {
  static final _manifest = PackManifest(
    id: 'pack_themes_cyber',
    name: 'Cyber',
    description: 'Neon-lit circuits and dark synthwave grids for digital minds.',
    categories: {PackCategory.themes},
    isBuiltIn: true,
  );

  static final _themes = [
    ThemePreset(
      id: 'theme_gamer_matrix',
      name: 'Cyber Core',
      backgroundColor: Color(0xFF0D1B2A),
      pattern: CanvasBackgroundPattern.dots,
      lineColor: Color(0x2200FFCC),
      accentGlow: Color(0xFF00FFCC),
      surfaceColor: Color(0xFF132638),
      packId: 'pack_themes_cyber',
    ),
    ThemePreset(
      id: 'theme_neon_grid',
      name: 'Neon Grid',
      backgroundColor: Color(0xFF0A0A1A),
      pattern: CanvasBackgroundPattern.grid,
      lineColor: Color(0x22FF00FF),
      accentGlow: Color(0xFFFF00FF),
      surfaceColor: Color(0xFF121225),
      packId: 'pack_themes_cyber',
    ),
    ThemePreset(
      id: 'theme_terminal_green',
      name: 'Terminal',
      backgroundColor: Color(0xFF0A0F0A),
      pattern: CanvasBackgroundPattern.lined,
      lineColor: Color(0x2200FF00),
      accentGlow: Color(0xFF00CC00),
      surfaceColor: Color(0xFF0F180F),
      packId: 'pack_themes_cyber',
    ),
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
  );
}

/// Focus & High-Contrast themes for maximum readability.
class FocusThemePack {
  static final _manifest = PackManifest(
    id: 'pack_themes_focus',
    name: 'Focus',
    description: 'Clean, high-contrast environments optimized for readability and study.',
    categories: {PackCategory.themes},
    isBuiltIn: true,
  );

  static final _themes = [
    ThemePreset(
      id: 'theme_high_contrast',
      name: 'Pure White',
      backgroundColor: Color(0xFFFFFFFF),
      lineColor: Color(0x22000000),
      accentGlow: Color(0xFF333333),
      surfaceColor: Color(0xFFF5F5F5),
      packId: 'pack_themes_focus',
    ),
    ThemePreset(
      id: 'theme_sepia_focus',
      name: 'Sepia Focus',
      backgroundColor: Color(0xFFF5F0E8),
      pattern: CanvasBackgroundPattern.lined,
      lineColor: Color(0x33BBAA88),
      accentGlow: Color(0xFF887755),
      surfaceColor: Color(0xFFFFF8F0),
      packId: 'pack_themes_focus',
    ),
    ThemePreset(
      id: 'theme_cool_grey',
      name: 'Cool Grey',
      backgroundColor: Color(0xFFE8EBF0),
      pattern: CanvasBackgroundPattern.dots,
      lineColor: Color(0x228899AA),
      accentGlow: Color(0xFF6688AA),
      surfaceColor: Color(0xFFF0F2F8),
      packId: 'pack_themes_focus',
    ),
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
  );
}
