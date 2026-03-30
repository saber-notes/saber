# Page Insertion Flow
**Date:** 2026-03-30
**Stage:** 06 - Page Manager UX Refactor

## 1. What Insertion Modes Exist Now
We introduced a semantic `PageInsertionMode` enum to distinguish the user's intent when creating new pages in a heterogeneous document. The `EditorPageManager` (the side/bottom popup used to view and organize all pages) now implements a `PopupMenuButton` instead of a plain generic "Add" button.

The available modes are:
- **`inherit`**: Creates a structurally blank page but enforces visually copying the `PageStyle` of the preceding page. This is the simplest way to continue writing on "dotted" paper if the preceding page was dotted, ignoring the global notebook default.
- **`notebookDefault`**: Forces the new page to use `EditorCoreInfo.defaultStyle`. Useful for reverting to the overarching theme of the digital book.
- **`customStyle`**: Explicitly passes a standalone `PageStyle` to the constructor. This is the entry point for applying Templates.
- **`duplicate`**: Relies on the legacy `duplicatePage` deep-copy logic (copying strokes and images byte-by-byte while shifting coordinates and preserving style).

## 2. What is Deferred
- **Template Chooser UI**: The `customStyle` menu option is currently visible but is technically stubbed to just fall back to the notebook default until a dedicated Template Carousel UI is built for Devils Book.
- **Quick-Add Shortcut**: An explicit floating "Add blank page quickly" button was merged into the popup for cleanliness. Depending on playtesting, we may need to pull `inherit` out as a 1-tap quick action, leaving the popup for the customized modes.

## 3. How This Relates to Notebook Defaults and Page-Level Styles
Because we completed the `PageStyle` separation in Stage 5, the insertion logic in `editor.dart` (`insertPageAfter`) now cleanly determines *what* visual environment to spawn inside the `EditorPage` memory block. Because `Strokes` and `Effects` render transparently over the underlying `PageStyle`, changing the template on insertion fundamentally alters the feel of writing on that specific page without breaking any adjacent pages.
