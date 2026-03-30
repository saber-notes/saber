# Notebook/Template Pack System
**Date:** 2026-03-30
**Stage:** 26 - Notebook Identity

## 1. Three-Layer Model
- **`CoverStyle`** — Visual identity (primaryColor, accentColor, optional asset path, description)
- **`PageTemplate`** — Default page look (backgroundColor, pattern, lineColor, description)
- **`NotebookTemplate`** — Bundles cover + default page + list of available page variants

## 2. Built-In Notebook Packs
| Pack | Notebooks | Default Pages |
|------|-----------|---------------|
| **Professional** | Daily Journal, Dot Planner, Engineering Pad | Classic Ruled, Dot Grid, Light Grid |
| **Heritage** | Scholar's Journal, Travel Folio | Parchment Ruled, Blank Parchment |
| **Infernal** | Grimoire, Shadow Ledger | Altar Grid, Dark Void |
| **Cyber** | Data Core, Terminal Log | Neon Grid, Terminal Lines |

9 notebook templates with 13 unique page templates across 4 families.

## 3. Selection UX
`NotebookTemplateSelectorSheet` shows horizontal-scrolling mini-notebook previews per pack. Each preview displays:
- Real cover color with an initial monogram
- Miniature page with line color/pattern preview
- Named footer in cover accent

## 4. Page-Level Flexibility
Each notebook provides `availablePages` — a list of page templates users can insert. Selecting a notebook sets the *default* page but does not lock all pages to one style. Individual pages retain full override capability.

## 5. What's Deferred
- Cover asset rendering (SVG/image covers) — currently color + monogram
- Notebook creation flow integration with Saber's `EditorCoreInfo` — currently a standalone selector
- Template persistence to notebook metadata
