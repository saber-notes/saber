# Pack Architecture
**Date:** 2026-03-30
**Stage:** 21 - Modular Extensibility

## 1. Architecture Overview
Devils Book extensions are structured as **Content Packs**: self-contained bundles declared by a `PackManifest` and carrying typed payloads via `ContentPack`. A singleton `PackRegistry` owns the merged live catalogs that the entire UI queries.

```
PackManifest (who am I, what categories do I touch)
    └── ContentPack (typed lists of ThemePreset, InkPreset, EffectPreset, Loadout, RelicElement)
         └── PackRegistry.registerPack() → merges into live Maps
              └── UI (LoadoutSelectorSheet, SqueezePalette, etc.) queries PackRegistry
```

## 2. The Registration Flow
1. **App Boot:** `PackRegistry.seedDefaults()` is called with `DevilsCatalog`'s static maps. This seeds the merged catalogs with the hardcoded core content.
2. **Built-in Packs:** `CoreFoundationPack.create()` is registered. It re-declares the same core content as a formal `ContentPack`, proving the pack pipeline works end-to-end.
3. **Future User Packs:** Additional `ContentPack` instances can be constructed from local JSON manifests or asset bundles and registered identically. The registry merges them with last-write-wins semantics.

## 3. Pack Categories
The `PackCategory` enum defines 8 sanctioned extension vectors:
- `themes`, `inks`, `effects`, `seals`, `templates`, `loadouts` — immediate
- `ambience`, `archive`, `study` — future-reserved

## 4. Safe Defaults
- `PackRegistry.findTheme(id)` returns `null` if the ID is missing, never throws.
- The `LoadoutManager` falls back to `DevilsCatalog.defaultLoadout` if the persisted loadout ID is absent from the registry.
- Disabling a pack via `setPackEnabled(id, false)` triggers a full catalog rebuild, cleanly removing that pack's contributions.

## 5. What This Does NOT Include
- **No monetization or marketplace.** Packs are local code or asset bundles.
- **No remote discovery.** No network calls, no store UI.
- **No nib wear or pen decay.** Per the Extension Ecosystem Principles (Stage 20).
- **No community pack format spec yet.** The architecture supports it, but the serialization format for user-authored packs is deferred.

## 6. File Inventory
| File | Purpose |
|------|---------|
| `packs/pack_category.dart` | Enum of extension vectors |
| `packs/pack_manifest.dart` | Metadata envelope for packs |
| `packs/content_pack.dart` | Typed payload container |
| `packs/pack_registry.dart` | Singleton orchestrator with merge/toggle/rebuild |
| `packs/builtin/core_foundation_pack.dart` | First built-in pack proving the pipeline |
