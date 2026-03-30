# Replay/Memory Layer
**Date:** 2026-03-30
**Stage:** 29 - Replay Foundation

## 1. Design Philosophy
Devils Book aims to treat notes not just as static finals, but as living sessions that can be revisited. The **Replay Memory Layer** is designed to reconstruct how a page was built, stroke by stroke, allowing for emotional review, study, and presentation loops without gamifying or requiring fake "nib ink levels."

## 2. Decoupled Data Model
The replay pipeline uses completely decoupled data structures, allowing it to scrub without mutating the live editor state:
- **`ReplayEvent`** — An atomic action (stroke, image, erase) with a relative `offsetMs` and serialized JSON payload.
- **`ReplayTimeline`** — A chronological collection of `ReplayEvent`s forming a single page's history.

## 3. Playback Controller
A custom `PlaybackController` wraps a Flutter `Ticker` to drive playback:
- Tracks `_elapsed` state.
- Supports variable speed (1x, 2x, 4x) and pause/play.
- Given a `totalMs` fraction, it isolates the `visibleState` subset of the timeline for rendering.

## 4. UI Integration
- **`ReplayOverlay`** — A dark glassmorphic modal sitting above the editor that houses the timeline scrubber, time codes (mm:ss), and playback controls.
- **Squeeze Palette Trigger** — A new History icon triggers the extraction of the current page's stroke data into a temporary `ReplayTimeline` and launches the overlay.

## 5. What's Deferred
- Full bi-directional payload serialization (e.g., mapping live `Stroke` objects back and forth to JSON).
- The "Canvas Render Overlay" that actually consumes `_activeReplayController!.visibleState` to draw the scrubbing strokes. (Currently, the timeline scrubs in the UI, but the background canvas remains static).
- File storage of timelines.
