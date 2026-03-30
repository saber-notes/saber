# Devils Book: Shipping Gap Audit

## 1. Current Branch Health Summary
The `experimental-mission-impossible` / Devils Book branch sits atop a hefty new scaffolding footprint in `lib/devils_book/`. Most structural components (Themes, Inks, Effects, Loadouts) are conceptually present as data models and empty UI sheets. 

Crucially, **the core editor (`lib/pages/editor/editor.dart`) has already received thick "kitchen-sink" integration** for these features:
- `LiveEffectEngine` is actively catching `onDrawStart` and `onDrawUpdate` signals.
- `ScribbleRecognizer` is aggressively intercepting `onDrawEnd`.
- `LoadoutManager` overrides default configurations in `editor.dart`’s `initState`.
- Sessions, Replay, and Zoom Window controllers have been declared but their deeper lifecycle hooks are mostly static or missing.

The state of the codebase is **"highly scaffolded with aggressive, optimistic surface-level wiring"**. It avoids tearing up `EditorCoreInfo`, which is excellent for stability, but bolts a huge amount of new state directly onto `EditorState`.

## 2. Compile Risk Assessment
**Risk Level: Moderate to High.**
- **Imports:** I observed correct `package:saber/devils_book/...` usage inside `editor.dart`, but because of the vast amount of new files (59+ dart files), there's a strong likelihood of subtle type mismatches, missing cascade operators, or unimplemented abstract methods once the analyzer fully maps the tree.
- **Null Safety / Types:** Features like `ScribbleRecognizer` and `fxEngine` are injected into highly sensitive, type-strict areas of the core gesture loop. Any `null` pressure variables, unhandled hover states, or mismatched `PointerDeviceKind` logic will cause the paint loop to crash.
- **Dependencies:** The branch likely needs a `dart pub get` and full `flutter clean`.

## 3. Integration Risk Assessment
**Risk Level: High.**
- **History Integrity (Scribble-Erase):** `ScribbleRecognizer.isEraseScribble(newStroke)` executes at `onDrawEnd` and artificially injects an `.erase` `EditorHistoryItem`. If the user hits undo, they will undo the "fake" erase, but the scribble itself was aborted from saving. This breaks the 1:1 user action invariant of the redo stack.
- **Performance (Live FX):** `fxEngine.spawnTrail` is called on *every* `ScaleUpdateDetails` tick. Without throttling, dirty-rect tracking, or asynchronous offloading, this will decimate the 120Hz ink rendering goal on weaker devices.
- **State Clashes (Loadouts vs Preferences):** `LoadoutManager` actively rewrites `stows.lastFountainPenOptions.value` within `editor.dart`'s `initState()`. Modifying global persistent preferences aggressively on screen load can trigger rapid rebuilds and race conditions with the `SharedPreferences` database.

## 4. Feature-by-Feature Status Matrix

| Feature | State | Notes / Missing Implementation |
| :--- | :--- | :--- |
| **Theme/Ink/Effect Systems** | Scaffolded / Partial UI | Data models exist; sheets exist; effect engine hooked in but render pipelines likely incomplete. |
| **Page-level style/template** | Implemented | `EditorPageManager` explicitly includes `insertPageAfter` with `PageInsertionMode`s (duplicate, notebookDefault, customStyle). |
| **Hover Ghost Nib** | Scaffolded | `GhostNib` component exists but `editor.dart` lacks the `onPointerHover` gesture wiring to drive its coordinates. |
| **Ignition + Live FX (Ember/Fade)** | Wired (Dangerously) | Hooked into `onDraw*` events. High risk of frame dropping. Ephemeral layer compositing unknown. |
| **Writing Modes** | Scaffolded | `WritingModeState` tracks it, but `Tool` engine does not yet restrict behaviors based on mode. |
| **Scribble-to-Erase** | Wired | Logic exists in `onDrawEnd`. High risk to history logic. |
| **Seals/Elements/Relics** | Scaffolded | Models and UI sheets are present, but canvas drag-and-drop / stamp placement logic is missing. |
| **Squeeze Palette** | Scaffolded | Controller instantiated in editor. Stylus native bridge hooks for barrel squeeze hardware events are missing. |
| **Loadout System** | Partial | Tied to `initState`. Fails to account for mid-session loadout swapping or `stows` thrashing. |
| **Ritual Sessions** | Partial / Scaffolded | `recordPageVisit()` and `recordStroke()` wired. Session pacing/timer logic not hooked to UI. |
| **Replay / Zoom Window** | Scaffolded | Controllers are instantiated in `EditorState` but their core geometry/time loops are not injecting into the Canvas. |
| **Community Packs (Hooks)** | Scaffolded | Structure exists. |

## 5. Top 10 Blockers to Building and Shipping
1. **Unoptimized Live FX Loop:** `fxEngine.spawnTrail` firing every pointer tick without throttling will destroy framerates.
2. **Scribble History Desync:** Erase-injection breaks standard undo-redo invariants; it needs a customized `EditorHistoryItem` or atomic grouping.
3. **Ghost Nib Tracking Void:** No `Listener(onPointerHover: ...)` catches stylus proximity hover events to feed the `GhostNib` overlay.
4. **Loadout State Thrashing:** Directly modifying `stows` from `initState` bypasses the user's expected preference isolation.
5. **Replay Time Granularity:** Native `Stroke` objects in `saber` do not store per-point timestamps, making accurate "replay" functionally impossible without model modifications.
6. **No PointerDeviceKind Filtering:** The `LiveEffectEngine` might try to spawn sparks on touch/finger scrolling if not carefully guarded, corrupting the UX.
7. **Squeeze Event Bridge:** Flutter lacks native squeeze palette hooks; `saber` needs platform channel additions or it’ll be dark logic.
8. **Missing Stylus Azimuth/Tilt:** Barrel-roll mechanics need `PointerEvent.orientation` mapping, currently dormant.
9. **UI Dialog Overflow:** The new `devils_book` bottom sheets likely lack safe-area padding or keyboard-avoidance logic, failing TestFlight standards.
10. **Dead Exports:** `Export models` exist but the `EditorExporter` in `saber` is completely unaware of them.

## 6. Recommended Fix Order (Next Stages)

**Phase 1: Solidify the Shell (Compile & Protect)**
1. Cleanse imports, resolve null-safety errors in `lib/devils_book/`, and ensure a pristine Linux compile.
2. Decouple `LoadoutManager` and `stows` to prevent database thrashing on load.

**Phase 2: Stabilize the Paint**
3. Optimize the `LiveEffectEngine` hooks in `editor.dart` to use throttled, ephemeral overlays. Ensure they filter `PointerDeviceKind.stylus` exclusively.
4. Fix the `ScribbleRecognizer` undo/redo history footprint.

**Phase 3: Deepen the Features**
5. Implement `onPointerHover` to breathe life into the `GhostNib`.
6. Audit Timestamp readiness for Replays / Ritual Sessions.

---

### End of Stage 1 Audit
- **Most Dangerous File:** `lib/pages/editor/editor.dart` (The sheer volume of new class instances and gesture-loop interceptions creates massive stability risks for standard writing).
- **Next Stage Recommendation:** Move to **Phase 1: Solidify the Shell**. We should run the analyzer, fix self-imports, decouple the `LoadoutManager` from `initState`, and reach an unbreakable Linux compilation state before fixing the feature-level logic.
