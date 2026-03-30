# Loadout Substrate
**Date:** 2026-03-30
**Stage:** 15 - Editable Profiles

## 1. How Loadouts Work
A `Loadout` in Devils Book operates like a "Writing Instrument Case". It bundles a physical pen (`InkPreset`), the magical resonance of that pen (`EffectPreset`), the paper/atmosphere (`ThemePreset`), and optionally an overriding user preference for the ambiance (`WritingMode`). 

## 2. What They Store & Persistence
Loadouts are stored fundamentally by their String IDs physically mapped into the `Stows` global preferences container (`stows.activeLoadoutId`). This guarantees that upon restarting the application, the Editor seamlessly reassembles the exact instrument config you left on the desk at exactly 120hz frame readiness during the synchronous UI boots.

## 3. What Remains Independently Editable
Crucially, applying a Loadout does **not** lock the application into a rigid "Skin".
Applying "The Devil's Pen" loads the presets into the active `EditorState` during `initState()`. After initialization, the user remains totally free to use the `SqueezePalette` to toggle the `WritingMode` to "Infernal" individually without mutating the original saved Loadout definition. Themes and Inks can be independently bypassed per-page (from Stage 5 Page Inheritance) despite the Loadout baseline overriding global scopes.

## 4. Immediate Entry Point UX
Instead of crowding the primary interface with generic floating buttons or stealing space in the already-optimized toolbar layouts, we explicitly anchored the `LoadoutSelectorSheet` to a highly intuitive, tactile hidden gesture constraint: 
**Long-Pressing the primary Pen button** inside the `SqueezePalette` instantly collapses the radial menu and slides up the full catalog list of instruments. Users expecting just a standard pen switch seamlessly discover the deeper Loadout context.
