# Ritual Session System
**Date:** 2026-03-30
**Stage:** 28 - Intentional Sessions

## 1. Design Philosophy
Devils Book transforms writing from a passive utility into an intentional act. The **Ritual Session** system allows users to explicitly declare their writing intention (e.g., "Focus", "Archive Review", "Night Writing"). Sessions apply visual and atmospheric consistency and produce lightweight summaries, without gamifying or locking the core editor.

## 2. Session Data Model
- **`SessionType` Enum** — The archetypes (`focus`, `study`, `lecture`, `nightWriting`, `ritual`, `archiveReview`), each with an icon, description, and accent color.
- **`SessionConfig`** — The session's atmospheric binding (eventually configuring loadouts, modes, or notebooks, plus an optional time goal).
- **`ActiveSession`** — Live state tracking start time, stroke count, and page visits.
- **`SessionSummary`** — A lightweight immutable receipt produced when a session ends.

## 3. SessionController
A singleton that manages the lifecycle:
- Begins sessions (and safely terminates any pre-existing one).
- Receives telemetry (`recordStroke`, `recordPageVisit`) from the editor.
- Ends sessions, archives a `SessionSummary` into history, and notifies listeners.

## 4. UI Integration
- **Squeeze Palette Trigger** — A new hourglass `hourglass_empty` icon allows launching a session right from the canvas.
- **SessionStartSheet** — A rich bottom sheet presenting the session archetypes as animated, color-coded cards alongside quick duration chips (Open, 15m, 30m, 1h). 
- **Editor Telemetry** — `editor.dart` now calls `SessionController().recordStroke()` when a drawing gesture completes, and `recordPageVisit()` upon initial load and pagination (to be expanded).

## 5. What's Deferred
- Automatic loadout switching (the config model supports it, but wiring is deferred to deeply integrate with the Loadout Manager).
- End-of-session summary dashboard UI.
- Persistence of session history to disk.
