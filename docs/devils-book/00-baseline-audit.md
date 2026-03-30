# Devils Book - Baseline Audit
**Date:** 2026-03-30
**Stage:** 00 - Acquisition & Baseline

## 1. Source & Workspace
- **Origin / Remote:** `https://github.com/saber-notes/saber`
- **Branch:** `devils-book-foundation`
- **Workspace Status:** Cloned successfully into `/media/yusuf/Data/DevilsBook/saber`. Working tree is completely clean and on the new branch.

## 2. Architecture Summary
- **Type:** Multi-platform Flutter Application (Android, iOS, Linux, MacOS, Windows).
- **Core Dependencies:**
  - `perfect_freehand` (stylus geometry)
  - `onyxsdk_pen` (hardware stylus SDK)
  - Custom fragment shaders (`shaders/pencil.frag`) and a `rust-toolchain.toml` indicating deeper performance/rendering optimizations.
- **Structure:**
  - `lib/pages/`: Top-level navigational views, containing the core `editor/`, `home/`, and `user/` pages.
  - `lib/components/`: Reusable UI pieces. Specifically, `canvas/`, `editor/`, `theming/`, and `toolbar/` will be central to our decoupling efforts.
  - `lib/data/`: App state and models.

## 3. Main Editor-Related Files
Based on directory structures, the primary focus areas for the Devils Book writing experience are:
- `lib/pages/editor/`: Coordinates the main writing screen.
- `lib/components/canvas/`: Likely contains the raw input handling and stroke rendering layers.
- `lib/components/editor/`: Sub-components of the writing interface.
- `lib/components/theming/`: Theming engine to be separated from ink and effects.
- `shaders/pencil.frag`: Core visual rendering logic for the stylus ink.

## 4. Build, Test & Analyze Status
- **Status:** SKIPPED.
- **Reason:** The Flutter SDK is not currently installed or available in the PATH (`zsh: command not found: flutter`).
- **Impact:** We cannot verify local compilation or run automated linting at this exact moment.

## 5. Risks & Environment Limitations
- **Missing Toolchain:** Without Flutter installed on this environment, we cannot preview visual changes natively or run unit tests. We will need to either install Flutter or rely purely on static codebase modifications for now.
- **Upstream Complexity:** Saber is a large, heavily-featured app (syncing, Nextcloud, PDF features) which we'll need to carefully tame without entirely breaking the app to meet the "premium stylus-first" constraint.

## 6. Suitability for Devils Book
Saber is an **excellent** starting point. Its use of `perfect_freehand`, active stylus SDKs (`onyxsdk_pen`), and custom shaders shows it's already optimized for low-latency, high-fidelity pen input. It separates the canvas from the UI relatively well. Moving forward, the main challenge won't be building a performant writing engine from scratch, but rather shedding generic "productivity app" cruft and enforcing a rigorous boundary between the ephemeral Effects, Ink properties, and the Theme, to ensure it feels like a focused, premium instrument.
