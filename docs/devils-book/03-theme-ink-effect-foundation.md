# Theme, Ink, and Effect Foundation
**Date:** 2026-03-30
**Stage:** 04 - Boundaries Implementation

## 1. What Was Introduced
We have introduced a core data model mirroring the decoupled vision for Devils Book. The domain has been split into:
- `ThemePreset` (`lib/devils_book/models/theme_preset.dart`): Static environment definition.
- `InkPreset` (`lib/devils_book/models/ink_preset.dart`): Permanent geometry profile definition.
- `EffectPreset` (`lib/devils_book/models/effect_preset.dart`): Live rendering overlay.
- `Loadout` (`lib/devils_book/models/loadout.dart`): A combined bridge linking all three concepts under a single identity (e.g., "The Devil's Pen").

A global registry (`DevilsCatalog` in `lib/devils_book/registry/devils_catalog.dart`) was established to serve these presets safely without forcing disk serializations of complex UI state.

**Plumbing into the core Editor:**
We wired `activeLoadoutId` directly into `lib/data/prefs.dart`'s `Stows` class. This provides a persistent hook that `editor.dart` and `CanvasPainter` can listen to when determining the visual context of the application. The system can just save the string ID `'loadout_the_devils_pen'` without rewriting the serialization logic of the notes just yet.

## 2. What Is Intentionally Still Stubbed
- **Rich Customization UI:** There is no UI to switch Themes/Inks/Effects yet. The active loadout defaults to `'loadout_the_devils_pen'` safely behind the scenes.
- **Visual Application:** The `CanvasPainter` has not yet been rewritten to consume these modules. It still uses its legacy hardcoded branches (e.g., `stroke.toolId == .pencil`).
- **File Serialization Overwrite:** `EditorCoreInfo` continues to save the legacy `backgroundPattern` instead of our new `ThemePreset`. We mapped the architecture boundaries in code before performing the destructive engine rendering surgery.

## 3. How Later Stages Will Consume These Systems
In future implementation stages:
- The **ThemeEngine** will listen to `stows.activeLoadoutId`, fetch the associated `ThemePreset` from `DevilsCatalog`, and forcefully paint the `backgroundColor` beneath the canvas.
- The **InkPainter** will map the default stroke geometry logic based on the `InkPreset` parameters (`baseColor`, `defaultThickness`).
- The **EffectEngine** (hooked into `InteractiveCanvas`) will read the `EffectPreset` and generate an ephemeral shader overlay (e.g., sparks) whose lifetime is governed by the preset's `cooldownMs`.
