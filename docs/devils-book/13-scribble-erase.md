# Scribble-To-Erase Implementation
**Date:** 2026-03-30
**Stage:** 14 - Intuitive Corrections

## 1. Recognition Strategy
Devils Book implements a heuristic vector analyzer (`ScribbleRecognizer`) rather than relying on heavy Machine Learning models, maintaining flawless offline 120hz frame rates. 
When `onDrawEnd` evaluates a finalized stroke, the analyzer strips the micro-jitters out of the point array and calculates explicitly sharp axis reversals (`dx.sign != lastDx.sign` or `dy.sign != lastDy.sign`).
If a stroke rapidly rebounds its own vector at least 4 times within a strict bounding box of 200 spatial points, it registers definitively as a "Scratch-Out / Scribble".

## 2. Interaction Rules & Editor Integration
If the `isEraseScribble` trigger passes true:
1. The engine completely aborts the normal insertion of the drawn stroke (the scribble does not persist or serialize to disk).
2. The engine calculates an explicit radius sweep (`pow(dx, 2) + pow(dy, 2) < 400`) iterating over all intersecting boundaries inside the current page against the scribble bounds.
3. Matching strokes are systematically plucked and discarded.
4. **Live FX Feedback:** Upon a successful deletion payload, the `LiveEffectEngine` forcefully detonates a double-strength Ignition Flash (`pressure: 2.0`) acting as visual "Ash/Dissolve" feedback. This perfectly grounds the physical deletion in tangible UI friction.

## 3. Current Limitations
Because the algorithm enforces a 200px max bounding box, drawing massive zig-zags spanning the entirety of the iPad glass will mathematically bypass the deletion protocols. This serves explicitly as a **false-positive safeguard**, assuming large sweeps are intentional geometry drawing or calligraphy art, preventing catastrophic accidental mass-erasures.

## 4. Future Expandability
With the V1 logic fully segmented, "Brutal vs Soft" erase personalities are trivial to embed. Future updates into `docs/devils-book/11-writing-modes.md` will see the `WritingMode` abstraction passed explicitly to the `_eraseStrokesUnderScribble()` method, throttling the spatial proximity radii (a "Soft Erase" might require dead-center accuracy tracking, while "Brutal Erase" deletes any path occupying the same generic quadrant).
