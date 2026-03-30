# Community Pack Future Architecture
**Date:** 2026-03-30
**Stage:** 33 - User Extensibility

## 1. Design Philosophy
A premium identity product deepens when users can share their specific aesthetic interpretations (new inks, specific historical tomes, customized ambient rituals). 

However, building a centralized cloud marketplace immediately risks becoming a high-maintenance distraction. **The Community Pack Architecture focuses first on local file-system ingestions, strict validation sandboxing, and protecting the core product identity from gimickry.**

## 2. Pack File Format (`.dbp`)
We propose the `.dbp` (Devils Book Pack) file format. Under the hood, this is a standard Zip archive adhering to the `CommunityPackArchive` interface.
- `/manifest.json` — The `PackManifest` identifying the pack.
- `/themes.json`, `/inks.json`, etc. — Serialized model arrays.
- `/assets/` — Binary resources (SVGs for Relics, MP3s for ambience loops, PNG backgrounds).

## 3. Validation & Sandboxing
The `PackManifestValidator` is the gatekeeper. Before any pack is loaded into the `PackRegistry`, the validator enforces:
1. **Namespace Protection:** Custom packs cannot use the `builtin_` or `pack_` ID prefixes, reserving them for official content.
2. **Schema Consistency:** Pack schema versions must be `<= PackManifestValidator.currentSchemaVersion`.
3. **Identity Safety:** While optional to strictly enforce, the validator explicitly warns against pack descriptions involving "nib wear," "pen durability," or other gamified mechanics that violate Devils Book's core product philosophy.
4. **Asset Integrity:** Assures that all assets referenced in JSON exist in the `/assets/` directory before parsing begins.

## 4. The Pack Importer
The `PackImporter` orchestrates the flow. It accepts a `CommunityPackArchive`, validates it, parses the JSON, and safely pushes the sandboxed models into the `PackRegistry`.

Its primary intended operation mode is `syncLocalPackFolder()`. Users can simply drop `.dbp` files into a specific folder on their device (e.g., `Documents/DevilsBook/Packs`), and the app will automatically scan, validate, and register them on launch, requiring zero cloud infrastructure.

## 5. What's Deferred
- The concrete Zip abstraction library implementation.
- Real JSON parsing/deserialization logic for Themes, Inks, and Relics inside the sandbox loop.
- Conflict resolution UX (e.g., when a user imports an updated version of an existing pack).
- A Pack Builder UI for exporting a user's current Loadout/Custom Models into a shareable `.dbp` file.
