# Page-Level Template Refactor
**Date:** 2026-03-30
**Stage:** 05 - Page Model Refactoring

## 1. Old Model vs New Model
**Old Model:** The Saber app persisted `backgroundPattern`, `backgroundColor`, `lineHeight`, and `lineThickness` exclusively at the top-level `EditorCoreInfo` document root. The only way to override a page visually was via an absolute `backgroundImage` (e.g., an imported PDF).
**New Model:** We introduced `PageStyle`, a dedicated struct containing these four properties + an optional `templateRef` identifier. The `EditorPage` class now requires a `PageStyle` on construction. `EditorCoreInfo` still retains the top-level properties but now uses them exclusively as a "Notebook Default" (`defaultStyle`) for fallback handling.

## 2. Migration Strategy
To ensure older notes load correctly without corruption:
1. When `EditorCoreInfo.fromJson` is invoked, it parses the legacy document-level styling from the root JSON.
2. It packages these into a `fallbackStyle` (`PageStyle`) and hands them down into `_parsePagesJson`.
3. If an individual page doesn't have its own localized styling JSON object (which all old notes won't), the page constructor gracefully assumes the `fallbackStyle`.
4. Any new pages inserted via the Editor UI look at the preceding page's style to inherit it; if there is no preceding page, it falls back to the notebook default.

## 3. Persistence / Versioning Notes
- The file format strictly retains BSON/JSON compatibility. We did *not* bump `EditorCoreInfo.sbnVersion` because the new `EditorPage` parser simply treats the properties as optional keys (`p`, `b`, `l`, `lt`) within the page `z` array.
- To prevent file bloat, `PageStyle.toJsonDiff` compares itself against the notebook default and only serializes properties that mathematically mismatch. A note where all pages cleanly inherit the notebook style will retain exactly the same disk size as before.

## 4. What User-Visible Behavior Has Improved
Conceptually, if we inject different page styles programmatically, appending new pages (`editor.dart: createPage`) will now correctly duplicate the specific active internal page's atmosphere rather than resetting to a global default. This lays the groundwork for heterogeneous notebooks (e.g., mixing grid-paper calculation pages with blank sketching pages inside one Devils Book).

## 5. What Still Needs UI Work
- **Template Chooser:** There is no UI hooked up yet to allow the user to select `PageStyle` presets when clicking "Add Page". The app still blindly mimics the previous page.
- **Background Renderer Migration:** `_canvas_background_painter.dart` will eventually need routing to observe `page.style.backgroundColor` instead of `coreInfo.backgroundColor`. This will be handled in a dedicated rendering refactoring stage.
