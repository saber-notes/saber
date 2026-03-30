# Live Writing FX Architecture
**Date:** 2026-03-30
**Stage:** 11 - Ignition and Ember

## 1. The Layering Model
The `LiveEffectOverlay` exists in the `editor.dart` runtime `Stack` entirely independently of the core Ink `CanvasPainter`.
It sits explicitly *above* the permanent document but *below* the `GhostNib` and `SqueezePalette`. This guarantees that the glowing embers appear to literally ignite from the interaction point, resting atop the dried ink without obstructing the user's immediate UI controls.

## 2. What Persists vs What Does Not
**Transience by Design:** The `LiveEffectEngine` operates entirely in RAM within a `ChangeNotifier` bound to a high-framerate `Ticker`. 
These floating particles are intentionally **omitted** from the `SaberSyncFile` or BSON serialization payloads. The core thesis is that Effects are for the feeling of *writing*, while Ink is for the feeling of *reading*. The exported PDF or saved note remains pristine and professional, completely uncontaminated by the live magical FX.

## 3. Performance Caps & Safeties
We instituted strict safeguards to prevent battery drain and frame dips:
1. **Ticker Pruning:** The widget's internal `Ticker` pauses itself completely (`_ticker.stop()`) the millisecond the active particle array hits 0 length. It is not blindly running 60fps in the background while the user is just reading.
2. **Hard Arrays:** The engine enforces a `maxParticles` cap (set to 150 presently). If the user physically scrubs the screen excessively fast, it gracefully culls the oldest particles instead of overflowing the heap.
3. **Graceful Degradation:** The entire system can be bypassed trivially via `isEnabled = false;` in the `LiveEffectEngine` state.

## 4. What Subtle vs Heavy Can Mean Later
Currently, the "Devil's Pen" preset spawns simple `EmberParticle` instances. The baseline is a wide, bright "Ignition" flash on `onDrawStart`, trailing off into smaller embers during `onDrawUpdate` which slowly expand, blur, and fade out over `cooldownMs`.
In the future:
- **Subtle Mode** might only use minute sparks *strictly* on Ignition, fading immediately.
- **Heavy Mode** could spawn secondary "smoke" particles moving physically upwards using an integrated gravity vector against the device's gyro.
