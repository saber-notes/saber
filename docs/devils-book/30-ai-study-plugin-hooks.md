# AI/Study Plugin Hooks
**Date:** 2026-03-30
**Stage:** 31 - Extensibility 

## 1. Design Philosophy
Devils Book fundamentally respects the privacy and integrity of the user's notes. While AI and study assistants (like OCR, summary extraction, or flashcard generation) are powerful, they must never be silently baked into the core application. 

Instead, the **Study Plugin Architecture** enforces a strict opt-in, provider-agnostic boundary. The core app remains local-first and perfectly functional without any AI.

## 2. The Plugin Interface
Extensions implement the `StudyPlugin` interface, requiring them to declare:
- A clear name, description, and icon.
- `requiresNetwork: bool` — Distinguishes between local TFLite models and cloud APIs.
- `requiredAccess: StudyDataAccessLevel` — The strict scope of notebook data the plugin needs.

### Data Access Levels
1. **`visiblePageRaster`** — Can only request a static PNG screenshot of the current page. (Safe for basic OCR).
2. **`pageVectorData`** — Can read the raw stroke geometry. (Required for advanced handwriting-to-text algorithms).
3. **`fullTomeAccess`** — Can read every page in the notebook. (Required for full-document summaries or Q&A bots).

*Plugins attempting to read data beyond their declared access level will throw a runtime exception.*

## 3. The Study Context
When a user manually triggers a plugin, the editor injects a `StudyContext`. This is a scoped, read-only snapshot bridge that provides:
- `getPageRaster()` / `getPageVectors()` governed by the access level.
- `proposeInsertion(Widget preview, onConfirm)` — The only way a plugin can alter the notebook is by proposing an insertion (e.g., placing generated text or a flashcard widget on the canvas), which the user must explicitly confirm.

## 4. The Plugin Manager
The `StudyPluginManager` is a singleton registry. It validates user privacy preferences against the plugin's `requiredAccess` before ever executing the plugin's core logic.

## 5. What's Deferred
- Concrete implementations of plugins (e.g., `OcrPlugin_v1`).
- The user-facing "Plugin Market" or "Toolbox" UI to browse and install these hooks.
- Persisting API keys or user consent for network-based `fullTomeAccess` plugins.
