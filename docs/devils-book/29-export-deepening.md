# Export Deepening Path
**Date:** 2026-03-30
**Stage:** 30 - Export Architecture

## 1. Design Philosophy
Exporting must remain a highly pragmatic, trustworthy process. However, to fully capture the identity of Devils Book, users must have the option to bake atmosphere into their final documents. The **Export Deepening Path** provides a structured choice between clean utility and stylistic capture, explicitly preventing transient reading/writing FX from silently corrupting standard outputs.

## 2. Export Variants
The `ExportVariant` enum defines distinct structural and aesthetic guarantees for the rendering pipeline:

1. **Clean Document** (`clean`)
   - *Purpose:* Standard sharing, printing, or formal distribution.
   - *Guarantees:* Strips all transient live FX (sparks/embers). Uses a neutral or basic patterned background. Renders ink with maximum legibility.
   - *Status:* Available.

2. **Stylized Capture** (`stylized`)
   - *Purpose:* Sharing the emotional context of the note.
   - *Guarantees:* Bakes the active `ThemePreset` background (e.g., *Shadow Ledger* void or *Travel Folio* canvas), rich ambient UI colors, and advanced ink traits (sheens/darkening) directly into the rasterized output.
   - *Status:* Available (instructs the canvas to rasterize with background).

3. **Ceremonial Folio** (`ceremonial`)
   - *Purpose:* Extremely formal presentation exports.
   - *Guarantees:* Auto-generates a title page based on notebook metadata. Injects a discrete watermark of the user's primary Seal/Relic. Uses highest-fidelity rendering.
   - *Status:* Deferred (Roadmap feature).

4. **Time-Lapse Memory** (`lapse`)
   - *Purpose:* Sharing the chronological construction of an idea.
   - *Guarantees:* Connects to the Stage 29 `PlaybackController` to output a video/GIF of the page being written over time.
   - *Status:* Deferred (Roadmap feature).

## 3. Configuration & UI
The `ExportConfig` model bundles the chosen `ExportFormat` (PDF, PNG, SBA), the `ExportVariant`, and granular toggles (e.g., `includeBackground`).

This is exposed via the **ExportOptionsSheet**, launched from the `ios_share` icon in the Squeeze Palette. It presents the four variants as rich, selectable cards with clear descriptions of what will be baked into the final file.

## 4. Integration & Constraints
Currently, selecting PDF or PNG routes directly to Saber's existing `EditorExporter` methods. 
To fully realize the Stylized constraint, `EditorExporter` will need to accept the `ExportConfig` argument so that the `CanvasPainter` knows whether to respect or ignore the `LoadoutManager`'s active theme colors during off-screen rendering. 
**Crucially: Live interaction FX (e.g., `LiveEffectEngine` particle spawns) are explicitly blocked from all export buffers.**
