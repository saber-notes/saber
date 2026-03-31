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
      vignetteIntensity: 0.3,
      grainIntensity: 0.05,
      packId: 'pack_themes_dark_premium',
    ),
    ThemePreset(
      id: 'theme_midnight_void',
      name: 'Midnight Void',
      backgroundColor: Color(0xFF080810),
      lineColor: Color(0x18AAAAFF),
      accentGlow: Color(0xFF4444AA),
      surfaceColor: Color(0xFF101018),
      vignetteIntensity: 0.6,
      ambientId: 'ambience_deep_space',
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
      grainIntensity: 0.1,
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
      vignetteIntensity: 0.2,
      grainIntensity: 0.15,
      ambientId: 'ambience_library_quiet',
      packId: 'pack_themes_antique_soul',
    ),
    ThemePreset(
      id: 'theme_vellum_cream',
      name: 'Vellum Cream',
      backgroundColor: Color(0xFFF7F0E3),
      lineColor: Color(0x22C0A880),
      accentGlow: Color(0xFFD4B896),
      surfaceColor: Color(0xFFFFF8EE),
      grainIntensity: 0.08,
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
      vignetteIntensity: 0.4,
      grainIntensity: 0.25,
      ambientId: 'ambience_dusty_attic',
      packId: 'pack_themes_antique_soul',
    ),
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
  );
}

/// Forbidden & Ritual themes for ultimate immersion.
class ForbiddenLoreThemePack {
  static final _manifest = PackManifest(
    id: 'pack_themes_forbidden_lore',
    name: 'Forbidden Lore',
    description: 'Eldritch environments and blood-soaked ritual chambers.',
    categories: {PackCategory.themes},
    isBuiltIn: true,
  );

  static final _themes = [
    ThemePreset(
      id: 'theme_obsidian_requiem',
      name: 'Obsidian Requiem',
      backgroundColor: Color(0xFF050505),
      pattern: CanvasBackgroundPattern.dots,
      lineColor: Color(0x15FF0000),
      accentGlow: Color(0xFFCC0000),
      customAuraColor: Color(0xFFFF0000),
      surfaceColor: Color(0xFF0F0808),
      vignetteIntensity: 0.85,
      grainIntensity: 0.12,
      ambientId: 'ambience_blood_ritual',
      packId: 'pack_themes_forbidden_lore',
    ),
    ThemePreset(
      id: 'theme_aetherial_scroll',
      name: 'Aetherial Scroll',
      backgroundColor: Color(0xFFEDF2F4),
      pattern: CanvasBackgroundPattern.none,
      lineColor: Color(0x2200D4FF),
      accentGlow: Color(0xFF00D4FF),
      customAuraColor: Color(0xFF00FFFF),
      surfaceColor: Color(0xFFF1F8FB),
      vignetteIntensity: 0.15,
      grainIntensity: 0.02,
      ambientId: 'ambience_ethereal_wind',
      packId: 'pack_themes_forbidden_lore',
    ),
    ThemePreset(
      id: 'theme_cursed_papyrus',
      name: 'Cursed Papyrus',
      backgroundColor: Color(0xFFBCAD90),
      pattern: CanvasBackgroundPattern.lined,
      lineColor: Color(0x334E342E),
      accentGlow: Color(0xFFBF360C),
      surfaceColor: Color(0xFFD7CCC8),
      vignetteIntensity: 0.55,
      grainIntensity: 0.45,
      ambientId: 'ambience_flickering_candle',
      packId: 'pack_themes_forbidden_lore',
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
      vignetteIntensity: 0.4,
      ambientId: 'ambience_digital_hum',
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
      vignetteIntensity: 0.5,
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
      vignetteIntensity: 0.3,
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
      vignetteIntensity: 0.0,
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
      vignetteIntensity: 0.1,
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
      vignetteIntensity: 0.1,
      packId: 'pack_themes_focus',
    ),
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
  );
}
