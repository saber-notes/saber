# Writing Modes Architecture
**Date:** 2026-03-30
**Stage:** 12 - UX Modulation

## 1. What Each Mode Changes
We implemented 4 strict runtime Modes to protect the note-taking utility of Devils Book from collapsing into pure novelty. The `WritingMode` abstraction controls rendering parameters outside the Ink domain entirely:

- **Clean:**
  Disables all GPU-heavy overlays (`GhostNib`, `LiveEffectEngine`). Leaves maximum CPU headroom available for raw 120hz interaction latency.
- **Performance Saver:**
  Leaves Live FX disabled, but restores `GhostNib`. This offers premium orientation awareness without allocating background tick-loops for embers.
- **Ritual (Default):**
  The baseline Devils Book visual identity. Subtle ignition flashes on contact with trailing embers that rapidly face out. Max limits are hardcapped (150 particles, standard 800ms fade).
- **Infernal:**
  Pure theatricality. Particle limits are vastly inflated (400), particles spawn visibly larger (1.5x scale multiplier), and linger profoundly longer (2.5x cooldown multiplier).

## 2. What Each Mode Intentionally Does Not Change
`WritingMode` explicitly does **not** override the `ThemePreset`, `InkPreset`, or `EffectPreset`.
If the user is using Blue Ink atop Grid Paper, switching the Mode simply removes/amplifies the *glow* and the *sparks*.
The written document exported as PDF remains mathematically and visually identical regardless of whether it was penned in "Clean" or "Infernal" mode.

## 3. UI and Performance Implications
- We swapped a stubbed button in the `SqueezePalette` to an active `onCycleMode` trigger. Tapping the "sparkles" icon loops through modes, instantly reacting via `AnimatedBuilder`.
- Because the parameters directly manipulate the `LiveEffectEngine` tick lifecycle, culling limits behave automatically. If the user flips from Infernal down to Clean mid-stroke, the `AnimatedBuilder` simply strips the `LiveEffectOverlay` from the widget tree entirely, saving battery dynamically without a single orphaned particle.
