# Elements & Seals Substrate
**Date:** 2026-03-30
**Stage:** 13 - Permanent Relics

## 1. The Model
We introduced the `RelicElement` and `RelicCollection` domain structures. Unlike the transient embers in the Live FX engine, Relics are permanent, manipulative document assets meant for persistence. 
A `RelicElement` points directly to an `assetPath` (ideally an infinitely-scaling SVG) and carries strong product identity (referring to insertions as "Seals", "Signatures", or "Runes" rather than generic "Stickers").

## 2. Insertion Flow
The `SqueezePalette` natively exposes a fast-path trigger to launch the `RelicSelectorSheet`. Calling this action pauses the writing flow seamlessly without requiring navigation deep into generic toolbars at the top of the interface. The selection sheet acts as a clean, curated BottomSheet highlighting categorized assets.

## 3. Difference from Ordinary Stickers
Generic note-taking ecosystems treat stickers strictly as decorative scrapbooking images. Devils Book is designed as a serious writing instrument. Relics are treated as formal document markers—author signatures, wax seals, paragraph runes, or sign-off embellishments. They are explicitly organized in high-contrast curated grid catalogs rather than chaotic user image albums.

## 4. Deferred Polish & Stage Constraints
Currently, the selection logic successfully reads the `RelicCatalog` models and propagates the user's explicit intent back into `editor.dart`. 
We **deferred** actually mounting the asset bytes onto the visual Canvas layer today. Because Saber's native `EditorImage` renderer is tightly coupled to `coreInfo.assetCache` and deep BSON payload loaders, completing the visual injection relies on tools we plan to heavily hack apart in the final surgical excision operations. Passing the structural data back to the Editor asynchronously acts as the finalized foundation.
