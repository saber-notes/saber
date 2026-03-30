# Archive/Library Deepening Layer
**Date:** 2026-03-30
**Stage:** 27 - Collection Identity

## 1. Design Philosophy
The Devils Book library should feel like a personal archive — a curated collection of tomes, not a flat file picker. We achieve this through **metadata overlay**, never replacing Saber's underlying file system but wrapping it with rich organizational concepts.

## 2. Three-Part Model

### Shelf
Named visual grouping. Each shelf has a color accent and icon. Two built-in shelves ship by default:
- **Recent** — automatically populated by last-opened timestamps
- **Favorites** — populated by explicit user action

Users can create custom shelves (e.g., "Study Notes", "Project X", "Archive 2025").

### TomeMetadata
Rich wrapper layered onto existing Saber notebook files:
- `shelfId` — which shelf it lives on (null = unshelved inbox)
- `isPinned` — pinned to the top of its shelf
- `isFavorite` — appears in the Favorites shelf
- `series` + `seriesOrder` — groups related tomes into ordered collections (e.g., "Calculus I", "Calculus II", "Calculus III")
- `tags` — user-assigned labels for filtering
- `coverTemplateId` — links to the Stage 26 NotebookTemplate system
- `lastWritingSession` — last meaningful writing timestamp
- `pageCount` — cached for quick display

Full JSON serialization for persistence.

### PageBookmark
Points to a specific important page within a tome:
- `pageIndex`, optional `label`, colored tab indicator
- Enables "highlighted pages" concept

## 3. ArchiveManager
Singleton orchestrator providing:
- Shelf CRUD
- Tome assignment, pinning, favoriting, series grouping, tagging
- Shelf-scoped queries (pin-first sorting)
- Series grouping queries
- Bookmark management

## 4. What's Deferred
- Visual shelf browser UI (the models and manager are ready; the library page redesign requires consuming Saber's `HomeScreen` which is outside the `devils_book/` boundary)
- Persistence to disk (JSON structure defined; file I/O wiring deferred)
- Search/filter UI across tags and series
