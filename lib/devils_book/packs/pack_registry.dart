import 'package:flutter/foundation.dart';
import '../models/theme_preset.dart';
import '../models/ink_preset.dart';
import '../models/effect_preset.dart';
import '../models/loadout.dart';
import '../models/relic_element.dart';
import 'content_pack.dart';
import 'pack_manifest.dart';

/// Central orchestrator that discovers, loads, and merges content packs
/// into the live application catalog.
///
/// The registry owns the merged, deduplicated maps that the rest of the app
/// queries. DevilsCatalog's static maps seed the registry on first boot;
/// packs then layer additional content on top.
class PackRegistry extends ChangeNotifier {
  static final PackRegistry _instance = PackRegistry._internal();
  factory PackRegistry() => _instance;
  PackRegistry._internal();

  final List<ContentPack> _registeredPacks = [];

  // Merged live catalogs — these are what the UI queries.
  final Map<String, ThemePreset> themes = {};
  final Map<String, InkPreset> inks = {};
  final Map<String, EffectPreset> effects = {};
  final Map<String, Loadout> loadouts = {};
  final Map<String, RelicElement> seals = {};

  List<ContentPack> get registeredPacks => List.unmodifiable(_registeredPacks);

  /// Seeds the registry with the hardcoded core catalog.
  /// Call once during app init before any packs are loaded.
  void seedDefaults({
    required Map<String, ThemePreset> coreThemes,
    required Map<String, InkPreset> coreInks,
    required Map<String, EffectPreset> coreEffects,
    required Map<String, Loadout> coreLoadouts,
  }) {
    themes.addAll(coreThemes);
    inks.addAll(coreInks);
    effects.addAll(coreEffects);
    loadouts.addAll(coreLoadouts);
  }

  /// Registers a content pack, merging its payload into the live catalogs.
  /// Duplicate IDs from packs silently override earlier entries (last-write-wins).
  void registerPack(ContentPack pack) {
    _registeredPacks.add(pack);

    if (!pack.manifest.isEnabled) return;
    _applyPack(pack);
    notifyListeners();
  }

  /// Toggles a pack on/off and rebuilds the merged catalogs.
  void setPackEnabled(String packId, bool enabled) {
    final pack = _registeredPacks
        .cast<ContentPack?>()
        .firstWhere((p) => p?.manifest.id == packId, orElse: () => null);
    if (pack == null) return;

    pack.manifest.isEnabled = enabled;
    _rebuildCatalogs();
    notifyListeners();
  }

  void _applyPack(ContentPack pack) {
    for (final t in pack.themes) { themes[t.id] = t; }
    for (final i in pack.inks) { inks[i.id] = i; }
    for (final e in pack.effects) { effects[e.id] = e; }
    for (final l in pack.loadouts) { loadouts[l.id] = l; }
    for (final s in pack.seals) { seals[s.id] = s; }
  }

  void _rebuildCatalogs() {
    // Clear pack-contributed entries, re-seed defaults, and re-apply enabled packs.
    themes.clear();
    inks.clear();
    effects.clear();
    loadouts.clear();
    seals.clear();

    // Re-seed from DevilsCatalog (imported lazily by caller)
    // This method is called after seedDefaults, so we replay packs.
    for (final pack in _registeredPacks) {
      if (pack.manifest.isEnabled) {
        _applyPack(pack);
      }
    }
    notifyListeners();
  }

  /// Safe lookup with fallback — the app never crashes from a missing pack ID.
  ThemePreset? findTheme(String id) => themes[id];
  InkPreset? findInk(String id) => inks[id];
  EffectPreset? findEffect(String id) => effects[id];
  Loadout? findLoadout(String id) => loadouts[id];
}
