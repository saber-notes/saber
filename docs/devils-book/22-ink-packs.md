# Ink Pack System
**Date:** 2026-03-30
**Stage:** 23 - Material Identity

## 1. InkPreset Expansion
The `InkPreset` model was upgraded with 6 character trait fields:
- **`edgeColor`** — Darker tone for stroke edge rendering (oxidized/darkened borders)
- **`sheenIntensity`** — 0–1 scale controlling center-to-edge contrast (sheen/shimmer)
- **`dryness`** — 0–1 scale for smoky/chalky diffusion at stroke borders
- **`warmth`** — 0–1 scale for ember-like warm glow personality
- **`packId`** — Groups inks into browsable families
- **`character`** — Flavor text describing the ink's material identity

Computed getters `effectiveEdgeColor` and `sheenHighlight` give downstream renderers ready-to-use colors.

## 2. Built-In Ink Packs (17 Inks)
| Pack | Identity | Inks |
|------|----------|------|
| **Classic Writing** | Reliable, serious | Obsidian Black, Ash Dry, Midnight Sheen, Iron Gall |
| **Heritage & Patina** | Warm, oxidized | Copper Oxide, Sepia Walnut, Verdigris |
| **Infernal** | Ceremonial fire | Blood Resin, Infernal Gold, Ember Ash, Brimstone |
| **Cyber Reactive** | Neon synthetic | Neon Cyan, Plasma Magenta, Acid Green |
| **Refined** | Quiet elegance | Slate Blue, Forest Deep, Burgundy |

## 3. Selection UX
A **water-drop icon** in the Squeeze Palette opens the `InkSelectorSheet`. Inks are shown grouped by pack family. Each ink displays a radial gradient swatch previewing the real sheen → base → edge color transition, along with trait indicator icons (✨ sheen, grain dryness, 🔥 warmth) and one-line character descriptions.

## 4. What Is Real Now vs Future Rendering
**Now:** Selecting an ink immediately writes its `baseColor` and `defaultThickness` into the active Pen's `stows` memory. The swatch preview authentically renders the radial gradient using `sheenHighlight`, `baseColor`, and `effectiveEdgeColor`.

**Future (Stage 24+):** The `edgeColor`, `sheenIntensity`, `dryness`, and `warmth` fields are fully stored and queryable but await a custom `CanvasPainter` rewrite to consume them during actual stroke rendering. Until fragment shader integration, on-canvas strokes render with flat `baseColor`.
