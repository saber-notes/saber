# 46 — Known TestFlight Risks

This document outlines the current state of the **Devils Book** release candidate. It identifies potential failure points and provides context for testers on what to expect during the first iPad TestFlight validation phase.

---

## 1. Probable Stability (High Confidence)
-   **Core Canvas Rendering**: The standard pen and eraser engines are stable.
-   **Note Persistence**: Creating and saving notebooks remains reliable.
-   **Zoom Writing**: The zoom window logic for precise note-taking is well-tested.

## 2. Partial Implementations (Moderate Confidence)
-   **Squeeze Force Detection**: The native Apple Pencil Pro "Squeeze" event is still behind a `MethodChannel` stub. Emulation via long-press is provided but may not feel as responsive.
-   **Live Effects (Particles)**: High-density stroke effects (e.g., "Fire") may cause frame drops on older iPads (A12X/A12Z).
-   **Theme Palettes**: Some "Atmosphere" layers (Dynamic HSL) might shift slightly during page transitions.

## 3. High-Risk Items (Needs Real-Device Confirmation)
-   **Apple Pencil Hover**: Predicting exactly how the 1-2cm hover preview behaves on M2/M4 iPads vs Older iPads.
-   **Pencil Double-Tap vs Squeeze**: Conflicting gesture recognition logic (native iOS tap vs Devils Book hook).
-   **Memory Overhead**: Heavy usage of "Devils Book" Ink effects on a 4GB RAM iPad Air vs 16GB RAM iPad Pro.

## 4. Non-Blocking Issues for First TestFlight
The following should *not* prevent a successful TestFlight submission:
-   **Minor Translation Gaps**: Some tooltips in the Squeeze Palette might still use generic "Saber" terminology.
-   **Static Analysis Warnings**: Non-error warnings (Deprecated member use, unnecessary breaks) in the `devils_book` lib.
-   **Placeholder Assets**: Icons that are not yet final "Devils Book" custom designs.

---

## 5. Critical Fallbacks
If the app experiences an infinite startup loop or crash, the tester should:
1.  **Force-Quit**: Swipe up from the iPad app switcher.
2.  **Toggle Safe-Mode**: Use the "Devils Book" toggle in the main settings (if implemented) to disable the extension layer and recover the notebook.

---

**Next Steps:** Proceed to "Stage 6: Final Verification" and the "Sky Forge" push.
