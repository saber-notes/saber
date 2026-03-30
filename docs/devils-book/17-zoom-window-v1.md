# Zoom Window (Writing Strip) Architecture V1
**Date:** 2026-03-30
**Stage:** 18 - Focus Mode

## 1. The UX Concept
Rather than forcing users to completely pinch-zoom and re-anchor constantly to write small legible strings, we introduced a structured "Writing Strip". 
- **ZoomWindowTarget:** A targeted, draggable hit-box overlay highlighting the physical region of the page currently under magnification. 
- **ZoomWindowStrip:** Operating independently, this UI bounds itself permanently to the bottom 250 pixels of the device screen, supplying a massively scaled, distraction-free viewport of that exact bounded territory.

## 2. Shared Data Flow
To ensure the premium `InkPreset` color identities, `Calligraphy NibProfile` scaling, and `LiveEffectEngine` recoil physics behave identically inside the magnified strip, we explicitly **re-use the same Editor canvas**. 
The `ZoomWindowStrip` component accepts `canvasSubtree` (passing the heavy-weight main Editor `body` structure) directly as a cached subtree reference. It then executes a pure-hardware GPU `Transform.scale` operation mapping the pixel bounding matrices natively. The user effectively sees their actual document, perfectly rendering all live FX and custom shaders transparently, not an independently isolated state machine copy.

## 3. Stage 18 Architecture Stub & Gesture Piping
When a user drags their stylus across the bottom isolated window, the `ZoomWindowStrip` intercepts the physical event blindly and executes an offset calculation back into global logical coordinates:
`globalOffset = targetLeft + (localX / stripWidth * targetWidth);`

In this **V1**, the callback correctly pumps the mathematically translated `Offset` directly into the `editor.dart` execution loop logic structure. 
**We explicitly deferred** the complex construction of the required `ScaleUpdateDetails` required by the final bezier `Pen.onDragUpdate` handler. Attempting to artificially spoof raw `PointerData` structures into Saber's monolithic drawing loop immediately invites history/latency collision errors and requires surgically decoupling the gesture detector from the interactive scaling history cache. This decoupling is explicitly flagged globally as the purview of **Stage 19**.

## 4. Defined Boundaries and Limitations
- Dragging the target box heavily across the main canvas dynamically corrects the Strip's rendered viewpoint identically. However, natively scrolling the massive parent `InteractiveCanvas` vertically beneath it will currently skew the relative vector anchor technically, since `Matrix4.identity()` mapping inside the Strip operates off raw window ratios without yet intersecting the active ScrollController offset.
- The `advanceTarget()` mechanism evaluates perfectly inside the `ZoomWindowController` code block dynamically shifting bounds to the right, but it is intentionally un-bound to any concrete UI button presently until the primary drawing spool successfully accepts incoming gestural offsets seamlessly.
