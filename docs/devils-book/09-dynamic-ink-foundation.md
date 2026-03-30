# Dynamic Ink Foundation
**Date:** 2026-03-30
**Stage:** 10 - Hardware Geometry Mapping

## 1. Old Stroke Model vs New Extended Model
**Old Model:** The Saber renderer relies intensely on `PointVector` and `Stroke`. A stroke is simply an array of `[x, y, pressure]` points mathematically scaled and run through `perfect_freehand` for automated variable line weights.
**New Extended Model:** We introduced `InkSample`, a memory-resident 6-DOF data struct capable of caching precise velocity offsets, bounding altitudes, azimuth, and crucially, `barrelRoll`. 

## 2. What Is Fully Implemented Now
- **Dynamic Nib Profiles (`NibProfile`):** The renderer baseline logic is no longer tied strictly to physical tablet pressure. We implemented `CalligraphicNibProfile` and `BallpointNibProfile`. 
- **Legacy Compatibility Engine (`DevilsStroke`):** We did not break the BSON `.sbn2` serializer. Instead, `DevilsStroke` acts as a high-fidelity RAM buffer. When the app requires saving or rendering via the current engine, `DevilsStroke.compileToLegacy()` crushes the advanced 6-DOF math back down into an array of simple points.
- **The "Calligraphy Trick":** By calculating the advanced width modulation using `profile.computeThickness()` *before* flattening the array, we successfully inject the aesthetics of premium calligraphy directly into the legacy renderer. The `stroke.dart` bezier pipelines think it's just raw hard/light pressure, but it's actually interpreting our complex tilt metrics!

## 3. What Is Staged For Later Hardware Validation
- `CalligraphicNibProfile.computeAngle()` actively requests `barrelRoll`, which we scaffolded via the MethodChannel bridge in Stage 7. Because iOS physical testing is absent in standard environments, it currently defaults safely to `0.0`, resulting purely in `azimuth` rotation (true to life orientation but missing 360-degree twist).
- The true `interactive_canvas.dart` pointer collector has not been refactored to spawn `DevilsStroke` yet, as we must cleanly excise generic "productivity" bloat from the codebase in the next stage to make room for the new Ink buffers.

## 4. How This Will Connect to Hover Preview and Live Effects (FX)
The `GhostNib` built in Stage 9 was mathematically identical to the logic now established in `CalligraphicNibProfile`. Future updates will merge the `GhostNib` directly to query `ActiveLoadout.nibProfile.computeThickness()` and `.computeAngle()` so that the hovering placeholder footprint is perfectly correlated to the stroke parameter logic constructed here. Live effects (flames, sparks) will spawn particle emitters by tracking the `timeOffset` and trailing edge of the `DevilsStroke` buffer in real time as the arrays expand.
