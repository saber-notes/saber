# Heavy Reactive Mode (Power Mode)
**Date:** 2026-03-30
**Stage:** 17 - Infernal Escalation

## 1. What This Mode Does
We introduced `comboScalingEnabled` and `shakeEnabled` into the core `WritingMode` abstraction. When these flags are active (e.g., inside **Infernal Mode**):
- **Momentum Combos:** The `LiveEffectEngine` tracks continuous strokes. Drawing rapidly without lifting the pen for more than 2 seconds accumulates momentum, exponentially scaling particle size and emission limits up to `1.50x`.
- **Canvas Recoil (Screen Shake):** When the pressure of the stroke or the combo scaler eclipses a critical threshold, the engine evaluates a `screenShakeOffset` spring vector. The entire Editor UI and Canvas translates forcefully up to 4-5 pixels diagonally in random bursts, actively shuddering under the physical pressure of the user's calligraphy.
- **Spring Physics:** A constant 120hz ticker exponentially decays the shuddering back to `Offset.zero`, guaranteeing the canvas springs beautifully to rest without breaking UI alignment long-term.

## 2. Why It Remains Optional
This is purely theatrical. Devils Book is a note-taking application. We intentionally encapsulated the Screen Shake and Combo escalators rigidly inside physical `WritingMode` configurations (defaulting to Infernal).
Applying the "Antique Scholar" setup or sliding down to "Clean" physically suppresses the Shake logic, bypassing the matrix math routines completely.

## 3. How It Differs From Ritual Mode
**Ritual Mode** exists to add *subtle mood* to notes. A quiet flare, a short trailing ember.
**Infernal Mode** exists to *break the glass*. It aggressively multiplies particle counts to 400, scales visual emission bodies, and physically assaults the editor's alignment matrices on hard strokes. It bridges the gap between "Digital Notebook" and "Interactive Experience".

## 4. Performance Safeguards
Wrapping an entire Flutter `Scaffold` or heavy Canvas `Stack` inside an `AnimatedBuilder` running at 120 ticks per second would traditionally crater battery life and tear frames into the high-teens.
We bypassed this identically by isolating the `Stack` and supplying it explicitly into the `child` paremeter of the `AnimatedBuilder`.
Only the hyper-efficient `Transform.translate` node is rebuilt per-tick, preserving the massive immutable subtree. Additionally, the Ticker itself safely terminates the exact frame `screenShakeOffset` stabilizes at `< 0.1` proximity, never idling uselessly in the background.
