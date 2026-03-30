import 'package:flutter/material.dart';
import 'package:sbn/canvas_background_pattern.dart';
import '../../models/notebook_template.dart';
import '../pack_manifest.dart';
import '../pack_category.dart';
import '../content_pack.dart';

/// Professional and minimalist notebook families.
class ProfessionalNotebookPack {
  static final _manifest = PackManifest(
    id: 'pack_notebooks_professional',
    name: 'Professional',
    description: 'Clean, distraction-free notebooks for meetings, study, and daily writing.',
    categories: {PackCategory.templates},
    isBuiltIn: true,
  );

  static final _blankPage = PageTemplate(
    id: 'page_blank_white', name: 'Blank White',
    backgroundColor: Color(0xFFFFFFFF),
    description: 'Pure empty canvas.',
  );
  static final _ruledPage = PageTemplate(
    id: 'page_ruled_classic', name: 'Classic Ruled',
    backgroundColor: Color(0xFFFFFFFF),
    pattern: CanvasBackgroundPattern.lined,
    lineColor: Color(0x22AABBCC),
    description: 'Traditional lined paper.',
  );
  static final _dottedPage = PageTemplate(
    id: 'page_dotted_grey', name: 'Dot Grid',
    backgroundColor: Color(0xFFF8F8F8),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: Color(0x22888888),
    description: 'Subtle dot grid for flexible layouts.',
  );
  static final _gridPage = PageTemplate(
    id: 'page_grid_light', name: 'Light Grid',
    backgroundColor: Color(0xFFFFFFFF),
    pattern: CanvasBackgroundPattern.grid,
    lineColor: Color(0x15888888),
    description: 'Fine engineering grid.',
  );

  static final List<NotebookTemplate> templates = [
    NotebookTemplate(
      id: 'notebook_daily_journal', name: 'Daily Journal',
      cover: CoverStyle(id: 'cover_charcoal', name: 'Charcoal', primaryColor: Color(0xFF2A2A2A), accentColor: Color(0xFFCCCCCC), description: 'Understated dark leather.'),
      defaultPage: _ruledPage,
      availablePages: [_blankPage, _ruledPage, _dottedPage, _gridPage],
      packId: 'pack_notebooks_professional',
      description: 'A ruled daily journal for focused note-taking.',
    ),
    NotebookTemplate(
      id: 'notebook_dot_planner', name: 'Dot Planner',
      cover: CoverStyle(id: 'cover_navy', name: 'Navy', primaryColor: Color(0xFF1B2838), accentColor: Color(0xFF88AACC), description: 'Deep navy cloth binding.'),
      defaultPage: _dottedPage,
      availablePages: [_blankPage, _dottedPage, _gridPage],
      packId: 'pack_notebooks_professional',
      description: 'Dot grid for bullet journaling and flexible layouts.',
    ),
    NotebookTemplate(
      id: 'notebook_engineering', name: 'Engineering Pad',
      cover: CoverStyle(id: 'cover_green_tech', name: 'Tech Green', primaryColor: Color(0xFF1A3A2A), accentColor: Color(0xFF66CC88), description: 'Technical green hardcover.'),
      defaultPage: _gridPage,
      availablePages: [_blankPage, _gridPage, _dottedPage],
      packId: 'pack_notebooks_professional',
      description: 'Grid paper for diagrams, circuits, and technical sketches.',
    ),
  ];
}

/// Antique and heritage-inspired notebook families.
class HeritageNotebookPack {
  static final _manifest = PackManifest(
    id: 'pack_notebooks_heritage',
    name: 'Heritage',
    description: 'Aged papers and warm tones for classical writing and journaling.',
    categories: {PackCategory.templates},
    isBuiltIn: true,
  );

  static final _parchmentPage = PageTemplate(
    id: 'page_parchment', name: 'Parchment',
    backgroundColor: Color(0xFFE8E0D2),
    description: 'Warm aged parchment.',
  );
  static final _parchmentRuled = PageTemplate(
    id: 'page_parchment_ruled', name: 'Parchment Ruled',
    backgroundColor: Color(0xFFE8E0D2),
    pattern: CanvasBackgroundPattern.lined,
    lineColor: Color(0x33A09070),
    description: 'Ruled lines on warm parchment.',
  );
  static final _vellumDotted = PageTemplate(
    id: 'page_vellum_dotted', name: 'Vellum Dotted',
    backgroundColor: Color(0xFFF7F0E3),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: Color(0x22C0A880),
    description: 'Cream vellum with faint dot grid.',
  );

  static final List<NotebookTemplate> templates = [
    NotebookTemplate(
      id: 'notebook_scholars_journal', name: "Scholar's Journal",
      cover: CoverStyle(id: 'cover_oxblood', name: 'Oxblood Leather', primaryColor: Color(0xFF5C1A1A), accentColor: Color(0xFFD4A070), description: 'Deep red leather with gold detailing.'),
      defaultPage: _parchmentRuled,
      availablePages: [_parchmentPage, _parchmentRuled, _vellumDotted],
      packId: 'pack_notebooks_heritage',
      description: 'Classical ruled journal on warm parchment.',
    ),
    NotebookTemplate(
      id: 'notebook_travel_folio', name: 'Travel Folio',
      cover: CoverStyle(id: 'cover_tan_canvas', name: 'Tan Canvas', primaryColor: Color(0xFF8B7355), accentColor: Color(0xFFD4C4A8), description: 'Weathered canvas field cover.'),
      defaultPage: _parchmentPage,
      availablePages: [_parchmentPage, _vellumDotted],
      packId: 'pack_notebooks_heritage',
      description: 'Blank pages for sketching and unstructured thought.',
    ),
  ];
}

/// Dark and infernal notebook families.
class InfernalNotebookPack {
  static final _manifest = PackManifest(
    id: 'pack_notebooks_infernal',
    name: 'Infernal',
    description: 'Dark pages and ember-lit grids for ritualistic and atmospheric writing.',
    categories: {PackCategory.templates},
    isBuiltIn: true,
  );

  static final _darkPage = PageTemplate(
    id: 'page_dark_void', name: 'Dark Void',
    backgroundColor: Color(0xFF141414),
    description: 'Pure black canvas.',
  );
  static final _altarGrid = PageTemplate(
    id: 'page_altar_grid', name: 'Altar Grid',
    backgroundColor: Color(0xFF2C0B0B),
    pattern: CanvasBackgroundPattern.grid,
    lineColor: Color(0x33FF2222),
    description: 'Blood-red grid on dark crimson.',
  );
  static final _emberDots = PageTemplate(
    id: 'page_ember_dots', name: 'Ember Dots',
    backgroundColor: Color(0xFF1A0A00),
    pattern: CanvasBackgroundPattern.dots,
    lineColor: Color(0x22FF6600),
    description: 'Smoldering orange dots in darkness.',
  );

  static final List<NotebookTemplate> templates = [
    NotebookTemplate(
      id: 'notebook_grimoire', name: 'Grimoire',
      cover: CoverStyle(id: 'cover_black_iron', name: 'Black Iron', primaryColor: Color(0xFF0A0A0A), accentColor: Color(0xFFCC3333), description: 'Matte black with crimson embossing.'),
      defaultPage: _altarGrid,
      availablePages: [_darkPage, _altarGrid, _emberDots],
      packId: 'pack_notebooks_infernal',
      description: 'A ritual grimoire with blood-red grid pages.',
    ),
    NotebookTemplate(
      id: 'notebook_shadow_ledger', name: 'Shadow Ledger',
      cover: CoverStyle(id: 'cover_obsidian', name: 'Obsidian', primaryColor: Color(0xFF080808), accentColor: Color(0xFF666666), description: 'Impenetrable matte black.'),
      defaultPage: _darkPage,
      availablePages: [_darkPage, _emberDots],
      packId: 'pack_notebooks_infernal',
      description: 'Blank dark pages. Writing into the void.',
    ),
  ];
}

/// Cyber and technical notebook families.
class CyberNotebookPack {
  static final _manifest = PackManifest(
    id: 'pack_notebooks_cyber',
    name: 'Cyber',
    description: 'Neon-lit pages for technical writing and digital brainstorming.',
    categories: {PackCategory.templates},
    isBuiltIn: true,
  );

  static final _darkBluePage = PageTemplate(
    id: 'page_cyber_blank', name: 'Cyber Blank',
    backgroundColor: Color(0xFF0D1B2A),
    description: 'Deep navy digital canvas.',
  );
  static final _neonGrid = PageTemplate(
    id: 'page_neon_grid', name: 'Neon Grid',
    backgroundColor: Color(0xFF0A0A1A),
    pattern: CanvasBackgroundPattern.grid,
    lineColor: Color(0x22FF00FF),
    description: 'Magenta grid on dark purple.',
  );
  static final _terminalRuled = PageTemplate(
    id: 'page_terminal_ruled', name: 'Terminal Lines',
    backgroundColor: Color(0xFF0A0F0A),
    pattern: CanvasBackgroundPattern.lined,
    lineColor: Color(0x2200FF00),
    description: 'Green phosphor lines on black.',
  );

  static final List<NotebookTemplate> templates = [
    NotebookTemplate(
      id: 'notebook_data_core', name: 'Data Core',
      cover: CoverStyle(id: 'cover_circuit', name: 'Circuit Board', primaryColor: Color(0xFF0D1B2A), accentColor: Color(0xFF00FFCC), description: 'Dark blue with cyan circuit traces.'),
      defaultPage: _neonGrid,
      availablePages: [_darkBluePage, _neonGrid, _terminalRuled],
      packId: 'pack_notebooks_cyber',
      description: 'Neon grid notebook for diagrams and technical notes.',
    ),
    NotebookTemplate(
      id: 'notebook_terminal', name: 'Terminal Log',
      cover: CoverStyle(id: 'cover_matte_black_green', name: 'Terminal Black', primaryColor: Color(0xFF0A0F0A), accentColor: Color(0xFF00CC00), description: 'Matte black with green accent.'),
      defaultPage: _terminalRuled,
      availablePages: [_darkBluePage, _terminalRuled],
      packId: 'pack_notebooks_cyber',
      description: 'Green-line notebook for command logs and code notes.',
    ),
  ];
}
