# Devils Book - Codebase Reconnaissance
**Date:** 2026-03-30
**Stage:** 02 - Deep Architectural Recon

## 1. Main Files & Significance
- `lib/pages/editor/editor.dart`: The god-class for the writing experience. It handles tool state, gesture interception, file I/O, auto-saving, and undo/redo history.
- `lib/data/editor/editor_core_info.dart`: The root serialization and document model. Everything is saved from here.
- `lib/data/editor/page.dart`: The local state of a single manuscript page.
- `lib/components/canvas/_stroke.dart`: Computes geometry for pen inputs (Beziefication, simplification, serialization).
- `lib/components/canvas/_canvas_painter.dart`: The root visual renderer. Uses low-level `Canvas` APIs to draw strokes.

## 2. Current Document Model
- Encapsulated in `EditorCoreInfo`.
- Saved as `.sbn2` (BSON format, or optionally zipped into `.sba` for assets).
- Contains global metadata like `backgroundColor`, `backgroundPattern`, `lineHeight`, `lineThickness`, and a `List<EditorPage>`.

## 3. Current Page Model
- Encapsulated in `EditorPage`.
- Stores `List<Stroke>`, `images`, `quill` (rich text layer for typing), and active `laserStrokes`.
- Has an intrinsic `.size` (default 1000x1400) and an optional `backgroundImage` that overrides the document-level thematic background.

## 4. Page Insertion Logic
- Insertion is heavily automated in `editor.dart` via `createPage(int pageIndex)`. 
- If a user draws near the bottom or writes past the end of the existing page array, the god-class automatically creates missing pages.
- `removeExcessPages()` strips trailing blank pages to conserve memory when strokes are erased or undone.

## 5. Page Style: Document vs Page-Level
- Current styling is **split**. 
- Thematic elements like paper grid (`backgroundPattern`) and paper color are defined at the **document** level in `EditorCoreInfo`.
- Specific image backgrounds or PDF page plates are stored at the **page** level in `EditorPage.backgroundImage`.

## 6. Rendering Pipeline
- Handled by `CanvasPainter`, a Flutter `CustomPainter`.
- The draw order introduces forced Z-indexing: Highlighters (blended) -> General Strokes (ink) -> Laser Pointer (effect) -> Current Active Stroke -> Active Selection.
- The pipeline physically hardcodes tool behaviors inside the draw loop (e.g., checking `if (stroke.toolId == .pencil)` to inject shaders).

## 7. Stroke Pipeline
- Points are captured from gestures in `interactive_canvas.dart`.
- They are funneled into `Stroke.addPoint()`.
- Based on a zoom Threshold, `Stroke` provides a `lowQualityPath` (straight lines) or a `highQualityPath` (smoothed quadratic beziers via `perfect_freehand` profile).
- Snap-to-shape logic evaluates raw point clouds using `one_dollar_unistroke_recognizer` upon drag-end.

## 8. Shader Usage
- A custom fragment shader is explicitly used for the pencil tool (`shaders/pencil.frag`).
- Loaded inside `EditorPage`, it is pumped with the stroke color and applied via `paint.shader = ...`. It is bypassed if the user zooms out too far to maintain framerates.

## 9. Stylus Hooks
- Stylus and Inverted Stylus (eraser side) inputs are natively detected natively in `editor.dart`.
- Pen pressure profiles are read via `currentPressure`.
- The physical stylus button is hooked into `onStylusButtonChanged()` explicitly to temporarily switch the active tool to the Eraser, then pop back to the previous tool once released.

## 10. Biggest Architectural Gaps (Relative to Devils Book Vision)
- **High Coupling:** The `editor.dart` file spans ~2100 lines and mixes file architecture, hardware input, UI scaling, and business logic.
- **No Ink/Theme Separation:** The renderer hardcodes visual ink styles (`CanvasPainter` directly interprets `toolId`). A premium drawing instrument requires an abstract `InkRenderer` separated from the core loop.
- **Bloat:** The heavy reliance on Quill (rich text formatting) and generic image manipulations violates the "minimalist writing instrument" ethos. 

---

## Concrete Intervention Map

### 1. Refactor First (The Decoupling Layer)
- **`_canvas_painter.dart`**: Must be refactored to consume a polymorphic `Ink` interface rather than hardcoding `.pencil` vs `.highlighter` logic. We need a clean `ThemePainter`, `InkPainter`, and `EffectPainter`.
- **`editor.dart` (Tool Management)**: Extract the `currentTool` switch/case logic into a dedicated input router to separate stylus behavior from file saving logic.

### 2. Remain Intact (The Engine)
- **`_stroke.dart` / Geometry**: The raw `perfect_freehand` spline smoothing and point decimation is robust and should not be tampered with.
- **Serialization (`editor_core_info.dart`)**: We can preserve the BSON format and schema so we don't have to build a new save manager immediately.

### 3. Dangerous / Tightly Coupled
- **`editor.dart` (History & Gestures)**: Undo/Redo is intricately tied across page creation, image shifting, and tool states. We must map new stylus interactions into the existing `EditorHistoryItem` structs carefully, or risk breaking the entire state machine.
