# Squeeze Palette UI Implementation
**Date:** 2026-03-30
**Stage:** 08 - Floating Palette

## 1. What Actions Are Exposed and Why
The `SqueezePalette` acts as the primary "Head-Up Display" (HUD) for the user while actively writing. We built a minimal, polished, animated floating "pill" that grants immediate access to:
- **The Devil's Pen:** The primary drawing instrument (`ToolId.fountainPen` mapping mapped over for MVP validation).
- **Eraser:** Immediate corrective action (`ToolId.eraser`).
- **Live Effects (Stub):** A fast-path button for toggling ephemeral shader overlays.
- **Seals & Runes (Stub):** Future access to stylized stamps or document seals, functioning as the evolution of "Insert Image/Sticker".

We actively avoided making this a colossal, multi-row dropdown menu. The goal is flow-state preservation. 

## 2. Current Trigger Path (Debug)
Because standard builds running in simulators lack hardware sensors for Apple Pencil Pro's analog *Squeeze*, we cannot cleanly rely on a raw `PointerEvent` threshold being mapped yet.
Instead, we implemented a **Debug Squeeze Trigger**. A floating action button (`Icons.touch_app`) exists exclusively in the bottom-left corner of the editor `Stack` (isolated perfectly from the actual editor tools). Tapping it manually mimics discovering a squeeze callback, popping the `SqueezePalette` directly in the center of the screen, or dismissing it if actively open.

## 3. Future Real-Device Trigger Path
The `StylusState` component built in Stage 7 contains the `isSqueezing` boolean. In the final production binary, `InteractiveCanvas` will inject coordinate data into `SqueezePaletteController.showAt(stylus.position)` specifically the moment `StylusState.isSqueezing` goes from `false -> true`. The debug FAB can simply be deleted.

## 4. UX Constraints & Behavior
- The palette animates in with a premium elastic curve (`Curves.easeOutBack`).
- Tapping any option explicitly mutates the global weapon state (`stows.lastTool.value`) and then immediately commands the controller to `hide()`.
- The palette handles boundary clamping. If the squeeze happens aggressively near the bezel, the rendering math halts the pill from rendering off-screen.
