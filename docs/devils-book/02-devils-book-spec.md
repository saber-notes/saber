# Devils Book - Product & Architecture Specification
**Date:** 2026-03-30
**Stage:** 03 - Product Rulebook & Boundaries

---

## 1. Product Identity
**Devils Book** is a premium, highly atmospheric digital manuscript and writing instrument. It uses technology to elevate the sensation of writing, prioritizing aesthetics and feel over broad utility. It acts as an intimate space for thought, deeply characterized by its intense visual identity.

## 2. What Devils Book Is
- A stylus-first, dedicated drawing and writing instrument.
- An atmospheric workspace that reacts to the user's input with cinematic, high-fidelity visual feedback.
- A minimalist environment demanding focus over categorization. It produces beautiful, cleanly readable notes.

## 3. What Devils Book Is Not
- A productivity suite.
- A generic cross-platform text editor.
- A PDF annotator, task manager, or rich-text (`flutter_quill`) editor.
- A cluttered interface with dozens of toolbars, color wheels, and sync menus.

## 4. Core Principles
1. **Focus Over Features:** We strip away anything that breaks the immersion of writing.
2. **The Pen is Supreme:** All interactions, where possible, should be built exclusively around stylus pressure, tilt, and velocity. 
3. **Latency is Death:** Nothing is allowed to compromise the 120Hz delivery of ink to the screen. Visuals must be deeply optimized.
4. **Permanent Beauty:** The final, saved output must be as readable and classic as physical ink on paper.

## 5. Non-Negotiable Design Rules
- No interface clutter. The UI must dissolve when reading or writing.
- Generic productivity tools (typing keyboards, file attachments) must be entirely removed from the core editor.
- Performance cannot be sacrificed for visual flair. Flair must rely on hardware-accelerated shaders.

## 6. Theme / Ink / Effect Separation
The core rendering pipeline is strictly decoupled into three absolute domains:
1. **Theme:** The static, underlying environment. Dictates canvas background color, paper texture (`backgroundPattern`), and ambient lighting.
2. **Ink:** The permanent, saved geometry (`Stroke` / `PointVector`). Represents the enduring mark on the page. It dictates the base color and path.
3. **Effect:** The ephemeral, live visual feedback (e.g., sparks, flames, glowing trails). Effects occur *only* during the active stroke gesture or during a brief cooldown period. They are completely separated from the permanent note state.

## 7. Notebook / Page / Template Direction
- Pages mirror traditional physical paper constraints but allow infinite vertical scrolling. 
- Notebooks maintain a cohesive `Theme`. A user shouldn't mix drastically different thematic backgrounds within the same continuous manuscript unless logically separated by chapters.

## 8. Premium Stylus Interactions Direction
- Inputs are evaluated on continuous curves (`perfect_freehand`). 
- Velocity and pressure don't just dictate thickness; they will be routed to the `Effect` engine to dictate the intensity of the visual feedback (e.g., pressing harder causes brighter "sparks").
- The Stylus button serves as physical context-switching—likely invoking a specialized atmospheric eraser (e.g., a "burning away" effect).

## 9. Live Effects Philosophy
**"Ephemeral by Default."**
Writing should feel intense, but the result must be pristine. Live effects (e.g., an ember trail following the pen tip) exist to make the *act* of writing satisfying. They must cool down and fade out, leaving behind clean, high-contrast, easily readable `Ink`. Effects must never corrupt the resting legibility of the document.

## 10. Persistence Rules
- The BSON serialization (`.sbn2` via `EditorCoreInfo`) is strictly reserved for `Ink` and `Theme`. 
- `Effect` states, particle systems, and shader lifetimes are **never** persisted to disk. When a file is loaded, it is loaded as cold, resting ink.

## 11. Performance Rules
- Shaders (`FragmentShader`) are the primary vehicle for `Effects` to ensure GPU offloading. 
- Overdraw must be minimized. The existing Z-index layering in `_canvas_painter.dart` must be respected: Theme -> Ink -> Effect -> UI.
- Points simplification (`optimisePoints`) must aggressively cull redundant vertex data to keep document sizes small and render passes lightning fast.

## 12. MVP vs Post-MVP Thinking
**MVP:**
- Strip out generic Saber features (Quill, Nextcloud, PDF manipulation).
- Abstract the `CanvasPainter` to separate Ink from Theme.
- Build one primary "Devils Pen" with a simple ephemeral glowing tip effect.

**Post-MVP:**
- Introduce complex fluid/particle shaders for the `Effect` engine.
- Introduce highly textured `Theme` assets (parchment, leather).
- Add ambient audio feedback tied to stylus velocity.

---

## Implementation Architecture Preview

This preview maps the product vision to the existing Saber architecture, specifying the concrete intervention points.

### Proposed Modules
- **`ThemeEngine`**: Replaces the global `backgroundColor` logic. Manages active textures.
- **`InkEngine`**: Absorbs `_stroke.dart` and `perfect_freehand` usage.
- **`EffectEngine`**: A new, purely transient rendering loop that manages shader lifetimes synced to `interactive_canvas.dart` gestures.

### Data-Domain Separation
- `EditorCoreInfo` (Location: `lib/data/editor/editor_core_info.dart`) remains our permanent document schema, but we will strip out extraneous fields related to rich text and rich attachments. 
- New transient states (like active effect coordinates) will live *only* in the volatile `EditorState` and are barred from reaching `EditorCoreInfo`.

### Rendering Layer Separation
The monolithic `CanvasPainter` (`lib/components/canvas/_canvas_painter.dart`) will be decoupled:
1. `ThemePainter (Background)`
2. `InkPainter (Strokes)`
3. `EffectPainter (Transient Effects)`
These will be layered within Flutter's `CustomPaint` widget hierarchy, heavily utilizing `RepaintBoundary` to prevent Ink from redrawing when Effects animate.

### Interaction Layers
- **`editor.dart`**: Tool switching logic is significantly pruned. The UI overlays will be minimalized. 
- **`interactive_canvas.dart`**: Gesture events (`onDrawStart`, `onDrawUpdate`, `onDrawEnd`) are modified to simultaneously feed the `InkEngine` (for path recording) and the `EffectEngine` (for animation seeding).

### Feature Rollout Order
1. **Stage 4: Surgical Excision** - Rip out `flutter_quill`, text editing interfaces, and non-stylus productivity bloat from `editor.dart` and `page.dart`.
2. **Stage 5: Rendering Decoupling** - Break `CanvasPainter` into the Theme, Ink, and Effect painters. Validate using repaints.
3. **Stage 6: The Devils Pen** - Inject the first transient custom shader (`EffectEngine`) tied to stylus pressure during `ScaleUpdateDetails`.
4. **Stage 7: UI Minimalism** - Rebuild the toolbar as an atmospheric, auto-hiding mechanism.
