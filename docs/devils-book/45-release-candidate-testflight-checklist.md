# 45 — Release-Candidate TestFlight Checklist (iPad)

This checklist defines the "Manual Smoke Test" battery for the first **Devils Book** delivery to TestFlight. Perform these steps on a physical iPad (preferably Pro with Apple Pencil) to validate the "Sky Forge" build integrity.

## 1. Core Launch & Persistence
- [ ] **Cold Start:** App launches to the main notebook list without an immediate crash.
- [ ] **First Note:** Create a new note from the "Devils Book" template.
- [ ] **Save/Reopen:** Close the app, reopen, and verify the note exists.
- [ ] **Sync Check:** Change a page style, exit, and verify the style persisted.

## 2. Editor & Writing Engine
- [ ] **Latency Pass:** Draw a single line with a standard pen style. Verify no "stutter" or offset.
- [ ] **Pressure/Tilt:** Verify that varying pressure and tilt changes the stroke width/opacity as expected.
- [ ] **Page Insertion:** Use the "Insert Page" flow. Verify the new page correctly adopts the template style.
- [ ] **Zoom Window:** Enter the zoom writing strip. Verify the view focuses on the target area and follows the pen.

## 3. Devils Book Extension Layer
- [ ] **Squeeze Palette Trigger:**
    - [ ] Hardware: Squeeze Apple Pencil Pro (if available).
    - [ ] Fallback: Long-press on the canvas (if implemented) or use the toolbar icon.
- [ ] **Inks & Effects:**
    - [ ] Apply "Obsidian Ink." Verify visual rendering.
    - [ ] Toggle "Fire effect." Verify stroke-trailing particles.
- [ ] **Dynamic Loadouts:** Change pen loadouts via the palette. Verify the icon updates in the strip.
- [ ] **Scribble Erase:** Use the "Scribble to Erase" gesture (if enabled). Verify stroke deletion.

## 4. Hardware Specifics (iPad Pro/Pencil Pro)
- [ ] **Hover Preview:** Move the Pencil tip close to the screen (1-2cm). Verify any available "shadow" or preview UI.
- [ ] **Barrel Roll:** Rotate the Pencil. Verify any responsive nib/ink behavior.
- [ ] **Haptics:** Verify subtle motor feedback upon palette trigger (if native bridge is active).

## 5. Export & Stability
- [ ] **PDF Export:** Export a note with a "Devils Book" theme to PDF. Verify readable output.
- [ ] **Crash Loop Check:** Perform 5-10 rapid mode-switches between Pen and Eraser. Verify no UI freeze.

---

**Tester Notes:**
- Device: ________________
- iPadOS Version: ________
- Apple Pencil Model: ____
