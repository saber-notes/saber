import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keybinder/keybinder.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/data/extensions/matrix4_extensions.dart';
import 'package:saber/components/canvas/save_indicator.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/toolbar/toolbar.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/devils_book/stylus/squeeze_palette_controller.dart';
import 'package:saber/devils_book/stylus/stylus_state.dart';
import 'package:saber/devils_book/stylus/devils_stylus_event.dart';
import 'package:saber/devils_book/effects/live_effect_engine.dart';
import 'package:saber/devils_book/components/live_effect_overlay.dart';
import 'package:saber/devils_book/components/squeeze_palette.dart';
import 'package:saber/devils_book/models/writing_mode.dart';
import 'package:saber/devils_book/models/relic_element.dart';
import 'package:saber/devils_book/components/relic_selector_sheet.dart';
import 'package:saber/devils_book/components/ghost_nib.dart';
import 'package:saber/devils_book/ink/scribble_recognizer.dart';
import 'package:saber/devils_book/models/loadout_manager.dart';
import 'package:saber/devils_book/zoom_window/zoom_window_controller.dart';
import 'package:saber/devils_book/zoom_window/zoom_window_strip.dart';
import 'package:saber/devils_book/zoom_window/zoom_window_target.dart';
import 'package:saber/devils_book/components/ink_selector_sheet.dart';
import 'package:saber/devils_book/components/session_overlay.dart';
import 'package:saber/devils_book/components/atmosphere_overlay.dart';
import 'package:saber/devils_book/components/ritual_background.dart';
import 'package:saber/devils_book/audio/ambient_controller.dart';
import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/devils_book/sessions/session_models.dart';
import 'package:saber/devils_book/models/theme_preset.dart';
import 'package:saber/devils_book/components/effect_selector_sheet.dart';
import 'package:saber/devils_book/components/theme_selector_sheet.dart';
import 'package:sbn/tool_id.dart';
import 'package:saber/data/editor/editor_history.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/data/tools/pen.dart';

class Editor extends StatefulWidget {
  Editor({super.key, String? path, this.customTitle, this.pdfPath, this.isWhiteboard = false})
    : initialPath = path != null ? Future.value(path) : FileManager.newFilePath('/'),
      needsNaming = path == null && !isWhiteboard;

  final Future<String> initialPath;
  final bool needsNaming;
  final String? customTitle;
  final String? pdfPath;
  final bool isWhiteboard;
  
  static const extension = '.sbn2';
  static const extensionOldJson = '.sbn';
  static const gapBetweenPages = 16.0;
  static bool canRasterPdf = true;

  static bool isReservedPath(String path) => path.contains('whiteboard');

  @override
  State<Editor> createState() => EditorState();
}

class EditorState extends State<Editor> {
  final SqueezePaletteController squeezeController = SqueezePaletteController();
  final StylusState stylusState = StylusState();
  final WritingModeState writingModeState = WritingModeState();
  final LoadoutManager loadoutManager = LoadoutManager();
  final LiveEffectEngine fxEngine = LiveEffectEngine();
  final ZoomWindowController zoomController = ZoomWindowController();
  final log = Logger('EditorState');

  late var coreInfo = EditorCoreInfo.placeholder;
  final _canvasGestureDetectorKey = GlobalKey<CanvasGestureDetectorState>();
  final _transformationController = TransformationController();
  
  var history = EditorHistory();
  late bool needsNaming = widget.needsNaming && stows.editorPromptRename.value;

  late Tool _currentTool = () {
    switch (stows.lastTool.value) {
      case ToolId.fountainPen: return Pen.currentPen;
      case ToolId.eraser: return Eraser();
      default: return Pen.currentPen;
    }
  }();

  Tool get currentTool => _currentTool;
  set currentTool(Tool tool) {
    _currentTool = tool;
    stows.lastTool.value = tool.toolId;
  }

  ValueNotifier<SavingState> savingState = ValueNotifier(SavingState.saved);
  Timer? _delayedSaveTimer;
  var lastSeenPointerCount = 0;
  Timer? _lastSeenPointerCountTimer;
  Tool? tmpTool;
  var stylusButtonPressed = false;

  @override
  void initState() {
    stylusState.addListener(() {
      if (stylusState.isSqueezing && !squeezeController.isVisible) {
        squeezeController.showAt(stylusState.currentEvent?.position ?? const Offset(200, 200));
      }
    });

    // DEVILS BOOK: Sync Effect Engine
    fxEngine.setPreset(loadoutManager.customEffect ?? loadoutManager.currentLoadout.effect);
    loadoutManager.addListener(_onLoadoutChanged);

    _initAsync();
    _assignKeybindings();
    _startFadingHeartbeat();
    _startIntensityHaptics();
    super.initState();
  }

  void _startIntensityHaptics() {
    SessionController().addListener(() {
      final intensity = SessionController().getSessionIntensity();
      if (intensity > 0.8) {
        HapticFeedback.lightImpact();
      } else if (intensity > 0.95) {
        HapticFeedback.heavyImpact();
      }
    });
  }

  Timer? _fadingTimer;
  void _startFadingHeartbeat() {
    _fadingTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;
      
      bool needsRedraw = false;
      final now = DateTime.now();
      
      for (final page in coreInfo.pages) {
        final expiredStrokes = page.strokes.where((s) => s.getOpacity(now) <= 0.0).toList();
        if (expiredStrokes.isNotEmpty) {
          for (final s in expiredStrokes) {
            page.strokes.remove(s);
          }
          page.redrawStrokes();
          needsRedraw = true;
        } else if (page.strokes.any((s) => s.expiry != null)) {
          // If any stroke has an expiry, we need to redraw to show the fading progress
          page.redrawStrokes();
          needsRedraw = true;
        }
      }
      
      if (needsRedraw) setState(() {});
    });
  }

  void _initAsync() async {
    final filePath = await widget.initialPath;
    filenameTextEditingController.text = p.basename(filePath);
    await _loadCoreInfo(filePath);
    if (widget.isWhiteboard) {
      _applyWhiteboardRitual();
    }
  }

  void _applyWhiteboardRitual() {
    // Default to the last used Devils loadout instead of forcing Obsidian
    final activeLoadout = loadoutManager.currentLoadout;
    final theme = activeLoadout.theme;
    
    // DEVILS BOOK: Auditory Sync
    AmbientController().playAmbient(theme.ambientId);
    
    // DEVILS BOOK: Update core background
    coreInfo.backgroundColor = theme.backgroundColor;
    coreInfo.backgroundPattern = theme.pattern;
    
    for (final p in coreInfo.pages) {
      p.style = p.style.copyWith(
        backgroundColor: theme.backgroundColor,
        pattern: theme.pattern,
        lineColor: theme.lineColor,
      );
    }
    
    if (currentTool is Pen) {
      (currentTool as Pen).color = activeLoadout.ink.baseColor;
    }
    
    filenameTextEditingController.text = 'VOICE OF THE VOID';
    setState(() {});
  }

  void _onLoadoutChanged() {
    final theme = loadoutManager.customTheme ?? loadoutManager.currentLoadout.theme;
    AmbientController().playAmbient(theme.ambientId);
    
    final effect = loadoutManager.customEffect ?? loadoutManager.currentLoadout.effect;
    fxEngine.setPreset(effect);
    setState(() {});
  }

  Future _loadCoreInfo(String filePath) async {
    coreInfo = await EditorCoreInfo.loadFromFilePath(filePath);
    if (coreInfo.isEmpty) createPage(-1);
    setState(() {});
  }

  void _assignKeybindings() {
    Keybinder.bind(Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyZ)], inclusive: true), undo);
  }

  void createPage(int pageIndex) {
    while (pageIndex >= coreInfo.pages.length - 1) {
      coreInfo.pages.add(EditorPage(style: coreInfo.pages.isNotEmpty ? coreInfo.pages.last.style : coreInfo.defaultStyle));
    }
  }

  void undo() { if (history.canUndo) setState(() { history.undo(); }); }
  void redo() { if (history.canRedo) setState(() { history.redo(); }); }

  int? onWhichPageIsFocalPoint(Offset focalPoint) {
    for (int i = 0; i < coreInfo.pages.length; ++i) {
      if (coreInfo.pages[i].renderBox == null) continue;
      if ((Offset.zero & coreInfo.pages[i].size).contains(coreInfo.pages[i].renderBox!.globalToLocal(focalPoint))) return i;
    }
    return null;
  }

  Offset previousPosition = Offset.zero;
  int? dragPageIndex;
  PointerDeviceKind? currentPointerKind;
  double? currentPressure;

  bool isDrawGesture(ScaleStartDetails details) {
    if (coreInfo.readOnly) return false;
    _lastSeenPointerCountTimer?.cancel();
    if (details.pointerCount >= 2) { lastSeenPointerCount = details.pointerCount; return false; }
    dragPageIndex = onWhichPageIsFocalPoint(details.focalPoint);
    return dragPageIndex != null;
  }

  void onDrawStart(ScaleStartDetails details) {
    if (dragPageIndex == null || dragPageIndex! >= coreInfo.pages.length) return;
    final page = coreInfo.pages[dragPageIndex!];
    final position = page.renderBox!.globalToLocal(details.focalPoint);
    
    // DEVILS BOOK: Apply expiry from current mode, active session, or active Relic
    final modeExpiry = writingModeState.currentMode.strokeExpiry;
    final sessionExpiry = SessionController().activeSession?.config.strokeExpiryOverride;
    
    // EVANESCENT INK: Void Walker Relic makes ink fade into nothingness
    final relicModifier = loadoutManager.customRelic?.modifier ?? RitualModifier.none;
    final relicExpiry = relicModifier.isEvanescent ? const Duration(seconds: 3) : null;

    final activeExpiry = sessionExpiry ?? modeExpiry ?? relicExpiry;
    
    if (currentTool is Pen) {
      (currentTool as Pen).onDragStart(
        position, 
        page, 
        dragPageIndex!, 
        currentPressure,
        expiry: activeExpiry,
      );
    }
    previousPosition = position;
    setState(() {});
  }

  void onDrawUpdate(ScaleUpdateDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    final position = page.renderBox!.globalToLocal(details.focalPoint);
    if (currentTool is Pen) { 
      (currentTool as Pen).onDragUpdate(position, currentPressure); 
      page.redrawStrokes(); 
    } else if (currentTool is Eraser) {
      final overlapping = (currentTool as Eraser).checkForOverlappingStrokes(position, page.strokes);
      if (overlapping.isNotEmpty) {
        final now = DateTime.now();
        for (final s in overlapping) {
          // DEVILS BOOK: Soft-erase (Banish) instead of hard-erase
          s.expiry = const Duration(milliseconds: 800);
          s.createdAt = now;
        }
        page.redrawStrokes();
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.erase, 
          pageIndex: dragPageIndex!, 
          strokes: overlapping, 
          images: []
        ));
      }
    }
    previousPosition = position;
  }

  void onDrawEnd(ScaleEndDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    setState(() {
      if (currentTool is Pen) {
        final ns = (currentTool as Pen).onDragEnd();
        if (ns == null || ns.isEmpty) return;
        if (currentPointerKind == PointerDeviceKind.stylus && SqueezePaletteController.isDevTriggerActive && ScribbleRecognizer.isEraseScribble(ns)) {
           _eraseStrokesUnderScribble(page, ns);
           return;
        }
        createPage(ns.pageIndex); page.insertStroke(ns);
        history.recordChange(EditorHistoryItem(type: EditorHistoryItemType.draw, pageIndex: dragPageIndex!, strokes: [ns], images: []));
      }
    });
    autosaveAfterDelay();
  }

  void _eraseStrokesUnderScribble(EditorPage page, Stroke scribble) {
    final offsets = scribble.points.map((p) => Offset(p.x, p.y)).toList();
    final now = DateTime.now();
    bool changed = false;

    for (final s in page.strokes) {
      if (s.expiry != null) continue; // Already dissolving
      
      bool collision = false;
      for (final sp in offsets) {
        for (final ep in s.points) { 
          if (pow(sp.dx - ep.x, 2) + pow(sp.dy - ep.y, 2) < 400) { 
            collision = true; 
            break; 
          } 
        }
        if (collision) break;
      }
      
      if (collision) {
        // DEVILS BOOK: Set short expiry for a "Banishing Dissolve" effect
        s.expiry = const Duration(milliseconds: 800);
        s.createdAt = now; 
        changed = true;
      }
    }
    
    if (changed) page.redrawStrokes();
  }

  void updatePointerData(PointerDeviceKind k, double? p) { currentPointerKind = k; currentPressure = p; }
  void onHovering() => stylusState.isHovering = true;
  void onHoveringEnd() => stylusState.isHovering = false;
  void onHoverEvent(PointerEvent e) => stylusState.updateEvent(DevilsStylusEvent.fromPointerEvent(e));
  void onStylusButtonChanged(bool b) {
    stylusButtonPressed = b;
    if (b && currentTool is! Eraser) { tmpTool = currentTool; currentTool = Eraser(); setState(() {}); }
    else if (!b && tmpTool != null) { currentTool = tmpTool!; tmpTool = null; setState(() {}); }
  }

  void autosaveAfterDelay() {
    if (history.isCurrentStateSaved) return;
    savingState.value = SavingState.waitingToSave;
    _delayedSaveTimer?.cancel();
    _delayedSaveTimer = Timer(const Duration(seconds: 2), saveToFile);
  }

  Future<void> saveToFile() async {
    if (coreInfo.readOnly || savingState.value == SavingState.saving) return;
    savingState.value = SavingState.saving;
    await _renameFileNow();
    savingState.value = SavingState.saved;
    history.markLastChangeAsSaved();
  }

  final filenameTextEditingController = TextEditingController();
  Future<void> _renameFileNow() async {
    if (widget.isWhiteboard) return; // Don't rename whiteboard ritual
    final n = filenameTextEditingController.text.trim();
    if (n == coreInfo.fileName) return;
    coreInfo.filePath = (await FileManager.moveFile(coreInfo.filePath + Editor.extension, n + Editor.extension)).replaceAll(Editor.extension, '');
  }

  void banishRitual() {
    setState(() {
      for (final p in coreInfo.pages) {
        p.strokes.clear();
        p.images.clear();
        p.redrawStrokes();
      }
      history.recordChange(EditorHistoryItem(type: EditorHistoryItemType.draw, pageIndex: 0, strokes: [], images: []));
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color(0xFF1A0000),
      content: Text('RITUAL BANISHED. THE VOID IS SEALED.', style: TextStyle(color: Color(0xFFFF4400), fontWeight: FontWeight.bold, letterSpacing: 2.0)),
    ));
    autosaveAfterDelay();
  }

  Future<int> _pickPhotos() async {
    if (coreInfo.readOnly) return 0;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final isToolbarVertical = stows.editorToolbarAlignment.value.index % 2 == 0;
    final Widget bodyContent = isToolbarVertical 
      ? Row(children: [toolbar(), Expanded(child: canvas())])
      : Column(children: [Expanded(child: canvas()), toolbar()]);

    return ValueListenableBuilder(
      valueListenable: savingState,
      builder: (context, state, child) => PopScope(
        canPop: state == SavingState.saved,
        onPopInvokedWithResult: (didPop, _) { if (state != SavingState.saved) { saveToFile(); snackBarNeedsToSaveBeforeExiting(); } },
        child: Scaffold(
          backgroundColor: Colors.transparent, // Let RitualBackground handle it
          drawer: drawer(),
          appBar: widget.isWhiteboard && DynamicMaterialApp.isFullscreen ? null : appBar(),
          body: ListenableBuilder(
            listenable: Listenable.merge([loadoutManager, SessionController(), writingModeState]),
            builder: (context, _) {
              final loadout = loadoutManager.currentLoadout;
              final theme = loadout.theme;
              final intensity = SessionController().getSessionIntensity();
              
              return Stack(
                children: [
                  RitualBackground(theme: theme, intensity: intensity),
                  bodyContent,
                  ZoomWindowTarget(controller: zoomController),
                  LiveEffectOverlay(engine: fxEngine, writingModeState: writingModeState),
                  GhostNib(stylusState: stylusState, writingModeState: writingModeState),
                  ZoomWindowStrip(controller: zoomController, canvasSubtree: bodyContent, onStripDragUpdate: (p) {}),
                  AnimatedBuilder(
                    animation: writingModeState,
                    builder: (c, _) => SqueezePalette(
                      controller: squeezeController,
                      currentModeName: writingModeState.currentMode.name,
                      onCycleMode: () => writingModeState.cycleMode(),
                      onSelectPen: () => setState(() => stows.lastTool.value = ToolId.fountainPen),
                      onSelectInk: () => showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (c) => InkSelectorSheet(currentInk: loadout.ink, onSelect: (ink) { setState(() { if (currentTool is Pen) (currentTool as Pen).color = ink.baseColor; }); })),
                      onSelectRelic: () async {
                        final relic = await showModalBottomSheet<RelicElement>(context: context, backgroundColor: Colors.transparent, builder: (c) => const RelicSelectorSheet());
                        if (relic != null) loadoutManager.setCustomRelic(relic);
                      },
                      onSelectEffect: () => showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (c) => EffectSelectorSheet(currentEffect: fxEngine.activePreset!, onSelect: (effect) => loadoutManager.setCustomEffect(effect))),
                      onSelectTheme: () => showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (c) => ThemeSelectorSheet(currentTheme: loadoutManager.customTheme ?? loadoutManager.currentLoadout.theme, onSelect: (theme) => loadoutManager.setCustomTheme(theme))),
                      onSelectTemplate: () {}, onLongPressPen: () {}, onSelectEraser: () {}, onToggleZoomWindow: () {}, onStartSession: () {}, onTriggerReplay: () {}, onTriggerExport: () {},
                    ),
                  ),
                  const SessionOverlay(),
                  AtmosphereOverlay(theme: theme),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    const ritualGold = Color(0xFFD4AF37);
    
    return AppBar(
      backgroundColor: widget.isWhiteboard ? Colors.transparent : const Color(0xFF070707),
      elevation: 0,
      centerTitle: widget.isWhiteboard,
      shape: widget.isWhiteboard ? null : const Border(bottom: BorderSide(color: ritualGold, width: 1.0)),
      title: widget.isWhiteboard 
        ? Text(filenameTextEditingController.text.toUpperCase(), 
            style: TextStyle(color: ritualGold.withOpacity(0.4), fontSize: 13, fontWeight: FontWeight.w300, letterSpacing: 8.0))
        : Row(children: [
            const Icon(Icons.auto_awesome_sharp, color: ritualGold, size: 18),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: filenameTextEditingController, 
                style: const TextStyle(color: ritualGold, fontWeight: FontWeight.w900, fontSize: 15, letterSpacing: 1.2), 
                decoration: InputDecoration(
                  border: InputBorder.none, 
                  hintText: 'UNNAMED RITUAL', 
                  hintStyle: TextStyle(color: ritualGold.withOpacity(0.2))
                )
              )
            ),
          ]),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SaveIndicator(savingState: savingState, triggerSave: saveToFile),
      ),
      actions: [ 
        if (widget.isWhiteboard) 
          IconButton(
            icon: const Icon(Icons.auto_delete_outlined, color: Color(0xFFBC0000)), 
            tooltip: 'BANISH RITUAL', 
            onPressed: banishRitual
          ),
        IconButton(
          icon: Icon(widget.isWhiteboard ? Icons.blur_on : Icons.rocket_launch_outlined, color: ritualGold), 
          onPressed: () => squeezeController.toggleDevTrigger(MediaQuery.sizeOf(context))
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget drawer() {
    const ritualGold = Color(0xFFD4AF37);
    const ritualScarlet = Color(0xFFFF2200);
    
    return Drawer(
      backgroundColor: const Color(0xFF0A0A0A),
      child: Column(children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color(0xFF050505), 
            border: Border(bottom: BorderSide(color: ritualGold, width: 1.0))
          ), 
          child: Center(
            child: Text(
              'DEVILS BOOK', 
              style: TextStyle(color: ritualGold, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 4.0)
            )
          )
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.history_edu, color: ritualGold), 
                title: const Text('RITUAL SESSIONS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13, letterSpacing: 1.0)), 
                onTap: () => Navigator.pop(context)
              ),
              const Divider(color: Colors.white10, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.logout, color: ritualScarlet), 
                title: const Text('LEAVE RITUAL', style: TextStyle(color: ritualScarlet, fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.0)), 
                onTap: () => Navigator.pop(context)
              ),
            ]
          )
        ),
      ])
    );
  }

  Widget canvas() => CanvasGestureDetector(
    key: _canvasGestureDetectorKey,
    filePath: coreInfo.filePath,
    isDrawGesture: isDrawGesture,
    onDrawStart: onDrawStart,
    onDrawUpdate: onDrawUpdate,
    onDrawEnd: onDrawEnd,
    onHovering: onHovering,
    onHoveringEnd: onHoveringEnd,
    onHoverEvent: onHoverEvent,
    onStylusButtonChanged: onStylusButtonChanged,
    updatePointerData: updatePointerData,
    undo: undo, redo: redo,
    pages: coreInfo.pages,
    initialPageIndex: coreInfo.initialPageIndex,
    pageBuilder: pageBuilder,
    placeholderPageBuilder: (c, i) => Container(),
    isTextEditing: () => false,
    transformationController: _transformationController,
  );

  Widget toolbar() => Toolbar(
    readOnly: coreInfo.readOnly,
    setTool: (t) => setState(() => currentTool = t),
    currentTool: currentTool,
    undo: undo, isUndoPossible: history.canUndo,
    redo: redo, isRedoPossible: history.canRedo,
    toggleFingerDrawing: () {}, pickPhoto: _pickPhotos, paste: () async {}, exportAsSba: (c) async {}, exportAsPdf: (c) async {}, exportAsPng: (c) async {},
    setColor: (c) => setState(() => (currentTool as Pen).color = c),
    quillFocus: ValueNotifier(null), textEditing: false, toggleTextEditing: () {},
    duplicateSelection: () {}, deleteSelection: () {},
  );

  int get currentPageIndex {
    final gestureDetector = _canvasGestureDetectorKey.currentState;
    return gestureDetector?.currentPageIndex ?? 0;
  }

  void snackBarNeedsToSaveBeforeExiting() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saving Ritual...')));
  }

  Widget pageBuilder(BuildContext context, int pageIndex) {
    final page = coreInfo.pages[pageIndex];
    return Canvas(
      path: coreInfo.filePath, page: page, pageIndex: pageIndex,
      textEditing: false, coreInfo: coreInfo,
      currentStroke: Pen.currentStroke?.pageIndex == pageIndex ? Pen.currentStroke : null,
      currentStrokeDetectedShape: null, currentSelection: null,
      setAsBackground: (img) {}, currentTool: currentTool, currentScale: _transformationController.value.approxScale,
      writingMode: writingModeState.currentMode,
    );
  }

  int getPageIndexFromScrollPosition(double scrollY) => CanvasGestureDetector.getPageIndex(scrollY: scrollY, pages: coreInfo.pages, screenWidth: MediaQuery.sizeOf(context).width);

  @override
  void dispose() {
    if (widget.isWhiteboard && stows.autoClearWhiteboardOnExit.value) {
      // Banish ritual on exit if preferred
      for (final p in coreInfo.pages) {
        p.strokes.clear();
        p.images.clear();
      }
      saveToFile();
    }
    
    _delayedSaveTimer?.cancel();
    _lastSeenPointerCountTimer?.cancel();
    _fadingTimer?.cancel();
    _transformationController.dispose();
    filenameTextEditingController.dispose();
    super.dispose();
  }
}
