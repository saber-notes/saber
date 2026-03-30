# Hover Ghost Nib Preview
**Date:** 2026-03-30
**Stage:** 09 - Intent Projection

## 1. Visual Behavior
We have replaced the lack of interactive hovering with a dedicated `GhostNib` overlay that lives in the absolute upper-most UI layer above the Canvas. 
- It actively listens to the `StylusState` object built in Stage 7.
- When `PointerHoverEvent` fires across the glass, the `GhostNib` draws an ellipse representing the theoretical contact patch of the pen.
- **Dynamic Stretching:** If the user tilts the stylus back (decreasing `altitude`), the `GhostNib` mathematically stretches into a longer oval using `sin(altitude)`. 

## 2. Fallback Behavior
Because pure Flutter limits access to raw orientation geometry occasionally (depending on the tablet), we built math fallbacks explicitly preventing NaN crashes. If `altitude` is reported accurately as exactly `0.0` (which is physically impossible without laying the glass flat against the table edge), we fall back safely to a 60-degree projection (`pi / 3`), preventing the stretch calculations (`1.0/sin(angle)`) from snapping to infinity.

## 3. Relationship to Future Barrel Roll Support
Flutter defines azimuth/orientation but completely lacks native `barrelRoll`. The current `GhostNib` component's rotation math is hardcoded to:
`final rotation = event.azimuth + (event.barrelRoll ?? 0.0);`
Tomorrow, when native bridging correctly pipes `barrelRoll` across the Swift channel, this single line of code will naturally inherit the organic 6-DOF spinning of the hardware brush without rewriting the widget layer whatsoever.

## 4. Relationship to Future Live Effects
The `GhostNib` represents "Before-Contact". `EffectEngine` represents "During-Contact" and "After-Contact" cooldowns. Currently, the `baseColor` of the ghost nib is a hardcoded translucent white. In later architectures, the `GhostNib` constructor will be handed the active user `Loadout`, and its core color and drop-shadow radius will dynamically sync with the active *Dying Ember* or *Frost* effect parameters to telegraph the atmospheric output perfectly.
