# Theme Pack System
**Date:** 2026-03-30
**Stage:** 22 - Visual Identity Families

## 1. ThemePreset Expansion
The `ThemePreset` model was upgraded with 4 new ambient fields:
- **`lineColor`** — Color of grid lines, ruled lines, and dot patterns on the canvas
- **`accentGlow`** — Accent tint for toolbar highlights, selection rings, and UI emphasis
- **`surfaceColor`** — Background for floating panels, sheets, and overlays
- **`packId`** — Groups themes into browsable families in the selector UI

These fields give each theme authority over the entire visual atmosphere without touching Ink rendering or Effect behavior.

## 2. Built-In Theme Packs (15 Themes)
| Pack | Identity | Themes |
|------|----------|--------|
| **Dark Premium** | Professional focus | Dark Premium, Midnight Void, Charcoal Slate |
| **Antique Soul** | Heritage & warmth | Parchment, Vellum Cream, Foxed Manuscript |
| **Infernal** | Theatrical ritual | Infernal Altar, Ember Cavern, Obsidian Sanctum |
| **Cyber** | Technical neon | Cyber Core, Neon Grid, Terminal |
| **Focus** | Maximum readability | Pure White, Sepia Focus, Cool Grey |

Each pack is a self-registering `ContentPack` that feeds into the `PackRegistry`.

## 3. Theme Selection UX
A new **palette icon** in the Squeeze Palette opens the `ThemeSelectorSheet`. Themes are presented grouped by pack family as horizontal-scrolling swatches showing real background colors, line pattern previews, and accent glow highlighting. The sheet itself renders using the current theme's `surfaceColor`.

## 4. Independence Rules
- Selecting a theme does **not** change your Ink or Effect
- Selecting a Loadout sets a theme, but the theme can be independently overridden afterward
- Themes never hardcode live effect behavior or ink properties
