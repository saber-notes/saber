# Theme and Ink Catalog V1
**Date:** 2026-03-30
**Stage:** 16 - Identity Metamorphosis

## 1. Catalog Breakdown: The Themes
Thematic environments define the emotional mood and active paper dimensions independent of the ink.
- **Dark Premium:** The professional classic. Perfect offset black `#141414` offering extremely focused low-light latency editing without blinding contrast clipping. (Loadout: The Devil's Pen).
- **Antique Soul:** Represents historical artifacts. Ruled guides laid over a warm, desaturated eggshell `#E8E0D2`. (Loadout: Antique Scholar).
- **Infernal Altar:** Maximum atmospheric pressure. Blood-drenched `#2C0B0B` grid-papers. Designed exclusively for chaotic, theatrical brainstorming phases where the user wants to explicitly break rules. (Loadout: Blood Ritual).
- **Cyber Core:** Dark neon synthwave dotted matrices `#0D1B2A`. Highly focused technical diagramming. (Loadout: Cyber Deck).
- **Focus Contrast:** Medical-grade, pure `#FFFFFF` blank voids meant strictly for mathematical proofs or external PDF parsing constraints.

## 2. Catalog Breakdown: The Inks
Ink models map thickness bounds, shader execution rules, and pressure-simulation curves.
- **Obsidian Black:** Deep, serious mapping ink explicitly bound 3.0 logical weight.
- **Copper Oxide:** Warm, oxidized browning ink (`#B87333`). Simulates aging notes and historical decay.
- **Midnight Sheen:** Dense, shimmering purple/blacks (`#1A1A40`). Professional but slightly arrogant and expressive.
- **Blood Resin:** `#8A0303`. Theatrical rendering for urgent edits or ritual notations.
- **Infernal Gold:** Highly visible `#D4AF37` wide 4.5 baseline thickness intended for signing documents.
- **Neon Cyber:** Eye-burning `#00FFCC` designed uniquely for interacting with dark `GamerMatrix` thematic environments.

## 3. Real vs Placeholder Renderers
### What we observe today:
The `DevilsCatalog` definitions are rigorously bound into the Editor context (`editor.dart`). Upon booting or explicitly Hot-Switching Loadouts from the bottom sheet:
- The `EditorState` directly intercepts the legacy Saber rendering layer and mathematically assigns the visual `Scaffold` bounding dimensions to the exact HEX footprint of the Theme.
- It intercepts the internal `stows` BSON parameter memory, overwriting the dynamic Pen instances (`lastFountainPenColor` and `lastFountainPenOptions`) allowing standard draw loops to consume our new `thickness` defaults alongside rigorous HEX coloring limits globally.

### Future Rich Renderers (Placeholders):
Saber's `InteractiveCanvas` does not natively support complex metallic sheen shaders out of the box. Currently, a configuration like "Infernal Gold" presents as flat dynamic bezier curves. In Stage 17+, `InkPreset` bindings will propagate deeper into custom fragment shaders, replacing the default drawing loop to literally process lighting normal maps calculating the orientation (`azimuth`/`altitude`) relative to the tablet glass for authentic physical material shine behavior.
