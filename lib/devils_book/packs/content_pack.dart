import '../models/theme_preset.dart';
import '../models/ink_preset.dart';
import '../models/effect_preset.dart';
import '../models/loadout.dart';
import '../models/relic_element.dart';
import 'pack_manifest.dart';

/// The concrete payload a content pack contributes.
/// Each field is optional; a pack only populates the categories it ships.
class ContentPack {
  final PackManifest manifest;

  final List<ThemePreset> themes;
  final List<InkPreset> inks;
  final List<EffectPreset> effects;
  final List<Loadout> loadouts;
  final List<RelicElement> seals;
  // Future slots:
  // final List<TemplatePreset> templates;
  // final List<AmbiencePreset> ambience;

  ContentPack({
    required this.manifest,
    this.themes = const [],
    this.inks = const [],
    this.effects = const [],
    this.loadouts = const [],
    this.seals = const [],
  });
}
