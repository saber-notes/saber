# Premium Stylus Interaction Substrate
**Date:** 2026-03-30
**Stage:** 07 - Hardware Interfaces

## 1. Current Platform Reality
Flutter natively parses standard tablet-pen inputs via `PointerEvent`, successfully capturing basic attributes like `pressure`, `tilt`, and `orientation`. However, **Devils Book** requires a richer set of inputs to fuel its atmospheric interaction model – specifically Apple Pencil Pro's continuous squeeze force and barrel roll rotation, or similar advanced Wacom tablet signals. Because Flutter channels do not uniformly surface these niche axes across platforms yet, we cannot rely solely on raw `PointerEvent` objects flowing directly into the canvas.

## 2. What Is Implemented Now
To safely isolate the application from Flutter's native limits, we constructed the **Stylus Domain Substrate**:
- **`DevilsStylusEvent`**: An enriched event wrapper that maps Flutter's baseline `PointerEvent` into Devils-Book specific terminology (azimuth, altitude) while exposing strictly nullable slots for `barrelRoll` and `squeeze`.
- **`StylusCapabilities`**: A structured capability flag manifest defining exactly what the current instrument can physically do.
- **`StylusState`**: A globally observable state orchestrator that caches the immediate physical reality of the pen. It exposes clean boolean flags like `isHovering` and `isSqueezing`.

## 3. What Is Scaffolded (Stubbed)
- **`StylusBridge`**: A `MethodChannel` class designed to talk directly to Swift/Kotlin backend layers. The `getCapabilities()` query is currently mocked returning safe generic parameters (Pressure: true, Squeeze: false). Real Apple Pencil Pro API queries will be implemented here safely outside of the Flutter UI tree.
- **Squeeze Gesture UI**: `StylusState` emits updates upon the `isSqueezing` flag crossing a threshold, but no palette or popup watches this yet.

## 4. What Later Stages Will Plug Into
By abstracting `PointerEvent` into `DevilsStylusEvent` and caching it in `StylusState`, the decoupled render engines we created in Stage 4 can freely sample the pen's physical condition without being tightly coupled to `interactive_canvas.dart`'s gesture detector.
- The **EffectEngine** will bind to `StylusState` to draw glowing embers continuously beneath a hovering nib before the nib even touches the glass.
- The **ThemeEngine** could dim the page background purely when `isSqueezing` fires true, focusing the writer.  
- The **InkEngine** will eventually consume `DevilsStylusEvent.barrelRoll` to deform calligraphy brush tips organically.
