# Ambience Extension Hooks
**Date:** 2026-03-30
**Stage:** 32 - Atmospheric Hooks

## 1. Design Philosophy
Devils Book fundamentally avoids creating noisy, distracting gimmicks. Ambience is introduced strictly as an **optional, atmospheric layer** separated entirely from the document model. It exists to complement the visual Theme and Ink environments, increasing immersion without degrading core usability or altering saved notes. 

## 2. Theoretical Ambience Packs
The architecture is pack-ready. Future "Ambience Packs" will define categories like:
- **monastery** (Echoing halls, subtle chant, stone drag)
- **archive** (Deep silence, old paper rustle, wooden creaks)
- **forge** (Warmth, subtle rhythmic hammering, heavy breathing)
- **storm** (Rain against glass, distant thunder)

## 3. The AmbiencePreset Model
Ambience extensions map to an `AmbiencePreset`. A preset binds:
- A category (`weather`, `interior`, `nature`, `industrial`, `abstract`).
- An audio loop asset path (e.g., `assets/audio/ambience_rain_heavy.mp3`).
- A `defaultVolume` to mix assets appropriately.
- `hasInteractiveSounds: bool` — Distinguishes between flat loops and rich environments that hook into UI events (like playing foley on a page turn or heavy bookmark placement).

## 4. Scaffolded Controller 
The `AmbientAudioController` manages global state:
- Tracks the `_activeAmbience`.
- Manages `_masterVolume` and global `_isMuted` toggles.
- Supports `playFoley(eventType)` for transient UX sounds.

## 5. Session Integration
The Stage 28 `SessionConfig` object was expanded to include an optional `ambienceId`. This creates the primary runway for the feature: when a user starts a "Night Writing" or "Ritual Session", the active Session controller can automatically instruct the `AmbientAudioController` to crossfade into the associated ambiance loop, then fade to silence when the session ends.

## 6. What's Deferred
- An actual audio engine dependency (e.g., `just_audio` or `audioplayers`).
- Wiring `playFoley` triggers into the actual page-turn gesture in `Saber`.
- Storing full audio assets (which will be substantial in file size).
