import '../pack_manifest.dart';
import '../pack_category.dart';
import '../content_pack.dart';
import '../../registry/devils_catalog.dart';

/// Rivers of Hades — Thematic environments for deep focus.
class RiversOfHadesThemePack {
  static final _manifest = PackManifest(
    id: 'pack_themes_rivers_of_hades',
    name: 'Rivers of Hades',
    description: 'Ancient environments named after the five rivers of the underworld. Deep atmosphere and ritual focus.',
    categories: {PackCategory.themes},
    isBuiltIn: true,
  );

  static final _themes = [
    DevilsCatalog.themeRiverStyx,
    DevilsCatalog.themeRiverAcheron,
    DevilsCatalog.themeRiverPhlegethon,
    DevilsCatalog.themeRiverCocytus,
  ];

  static ContentPack create() => ContentPack(
    manifest: _manifest,
    themes: _themes,
  );
}
