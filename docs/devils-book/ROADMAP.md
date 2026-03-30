# Devils Book Feature Roadmap

## Phase 1: Foundation (Completed)
- [x] Basic Saber fork established
- [x] Squeeze Palette UI built (`editor.dart` injection point)
- [x] Multi-phase Live Effect Engine architecture
- [x] Scribble-to-erase interception logic
- [x] Page template and cover override system

## Phase 2: Extension Ecosystem (Completed)
We have successfully decoupled the core experience into an extensible, registry-based ecosystem.
- [x] **Theme Packs:** UI/Canvas atmosphere. (Real UI, scaffolded core-render binding)
- [x] **Ink Packs:** Material traits (sheen, dry, warm). (Real models, scaffolded fragment shaders)
- [x] **Effect Packs:** Transient interactive FX. (Real state machine and preset routing)
- [x] **Relic/Element Packs:** Reusable stamp/seal inserts. (Real models and UI gallery)
- [x] **Notebook/Template Packs:** Cover and page identity. (Real models and UI)
- [x] **Archive Deepening:** Tying files into Shelves. (Real metadata overlay logic)
- [x] **Ritual Sessions:** Writing intent tracking. (Real controller and lifecycle)
- [x] **Replay Memory:** Decoupled stroke timeline. (Real models, playback controller, and overlay UI)
- [x] **Export Paths:** Clean vs Stylized output architectures. (Real variants and UI, relying on Saber's PDF baseline)
- [x] **AI/Study Hooks:** Safe data-access gates. (Scaffolded interfaces (`StudyPlugin`, `StudyContext`))
- [x] **Ambience Hooks:** Audio layer abstraction. (Scaffolded `AmbientAudioController` and presets)
- [x] **Community Packs:** `.dbp` ingestions. (Scaffolded validation and import interfaces)

*Core Rule Enforced: Zero presence of "nib wear", "depletion", or "tool degradation".*

## Phase 3: Hardware & Polish (Next Practical Milestones)
1. **Apple Pencil Pro Native Bridge:** 
   - Connect raw Swift Squeeze/Barrel Roll events directly to the `StylusBridge` bypassing Flutter's touch latency queue.
2. **Custom Shaders (Metal/OpenGL):** 
   - Migrate `CanvasPainter` to consume actual fragment shaders driven by our `InkPreset` material traits (implementing real sheen and dryness).
3. **Core Editor Excision:** 
   - Aggressively strip `flutter_quill`, legacy PDF tooling, and non-stylus cruft out of `editor.dart` to maximize performance.
4. **Data Persistence:** 
   - Wire the `SessionController` and `ArchiveManager` metadata overlays directly into the local SQLite database.

## Phase 4: Future Vision
- Native Cloud Sync layer (bypassing Nextcloud).
- First Real AI Implementation (Local handwriting parsing).
- Full Replay Stroke Render Engine (rebuilding the canvas visibly to match the timeline scrubber).
- Full Audio Extension Engine implementation backing the `AmbientAudioController`.
