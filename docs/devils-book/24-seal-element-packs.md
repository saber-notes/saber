# Seal/Element Pack System
**Date:** 2026-03-30
**Stage:** 25 - Identity Insertables

## 1. RelicElement Expansion
The `RelicElement` model was upgraded with:
- **`SealCategory` enum** — `seal`, `signature`, `sigil`, `marker`, `stamp`, `symbol` for filtering
- **`fallbackIcon`** — Material icon displayed when the SVG asset isn't available yet
- **`packId`** — Groups elements into browsable families
- **`description`** — Purpose text shown in tooltips
- **`isFavorite`** — Runtime toggle for quick-access favorites strip

## 2. Built-In Seal Packs (16 Elements)
| Pack | Identity | Elements |
|------|----------|----------|
| **Ceremonial Seals** | Ritual, authoritative | Seal of Lucifer, Red Wax Seal, Binding Ring, Pentacle |
| **Signatures & Marks** | Authorship, workflow | Signature Placeholder, Approved, Draft, Confidential |
| **Scholarly Markers** | Study, annotation | Important, Question, Reference, Eureka |
| **Arcane Sigils** | Mystical, decorative | Fire Element, Water Element, All-Seeing Eye, Infinity Knot |

## 3. Selection UX
The `RelicSelectorSheet` was rebuilt as a `StatefulWidget` with:
- **Category filter chips** — Toggle between All/Seals/Signatures/Stamps/Markers/Sigils/Symbols
- **Favorites strip** — Horizontal quick-access row of long-press-favorited elements
- **Pack-grouped grid** — Elements organized by pack family using `Wrap` layout
- **Long-press to favorite** — Toggles the amber border and adds to the favorites strip

## 4. Interaction Rules
- Elements are **permanent document content** — distinct from transient live FX
- Insertion may trigger optional brief FX (future), but the element itself persists in the saved file
- Favorites are currently runtime-only; persistence to prefs is deferred
