
import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager.dart';
import 'package:saber/data/prefs.dart';

import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/toolbar/toolbar.dart';
import 'package:saber/components/canvas/canvas.dart';

class Editor extends StatefulWidget {
  Editor({
    super.key,
    String? path,
  }) : initialPath = path != null ? Future.value(path) : FileManager.newFilePath("/"),
        needsNaming = path == null;

  final Future<String> initialPath;
  final bool needsNaming;

  static const String extension = '.sbn';

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final List<EditorPage> pages = [];

  EditorCoreInfo coreInfo = EditorCoreInfo();

  String path = "";
  late bool needsNaming = widget.needsNaming;

  late Tool currentTool = (){
    int? lastUsedColor = int.tryParse(Prefs.recentColorsChronological.value.last);

    Pen.currentPen = Pen.fountainPen()
      ..strokeProperties.color = Color(lastUsedColor ?? 0xFF000000);

    return Pen.currentPen;
  }();

  final List<Stroke> strokesRedoStack = [];
  bool isRedoPossible = false;
  Timer? _delayedSaveTimer;

  // used to prevent accidentally drawing when pinch zooming
  int _lastSeenPointerCount = 0;
  Timer? _lastSeenPointerCountTimer;
  int get lastSeenPointerCount => _lastSeenPointerCount;
  set lastSeenPointerCount(int value) {
    _lastSeenPointerCount = value;

    // reset after 1ms to keep track of the same gesture only
    _lastSeenPointerCountTimer?.cancel();
    _lastSeenPointerCountTimer = Timer(const Duration(milliseconds: 1), () {
      _lastSeenPointerCount = 0;
    });
  }

  @override
  void initState() {
    _initAsync();
    _assignKeybindings();

    super.initState();
  }
  void _initAsync() async {
    path = await widget.initialPath;
    filenameTextEditingController.text = _filename;
    setState(() {});

    if (needsNaming) {
      filenameTextEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: filenameTextEditingController.text.length,
      );
    }

    await _initStrokes();
  }
  Future _initStrokes() async {
    coreInfo = await EditorCoreInfo.loadFromFilePath(path);
    if (coreInfo.strokes.isEmpty) {
      pages.add(EditorPage());
    } else {
      for (Stroke stroke in coreInfo.strokes) {
        createPageOfStroke(stroke);
      }
    }

    setState(() {});
  }

  Keybinding? _ctrlZ;
  Keybinding? _ctrlY;
  Keybinding? _ctrlShiftZ;
  _assignKeybindings() {
    _ctrlZ = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyZ)], inclusive: true);
    _ctrlY = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyY)], inclusive: true);
    _ctrlShiftZ = Keybinding([KeyCode.ctrl, KeyCode.shift, KeyCode.from(LogicalKeyboardKey.keyZ)], inclusive: true);

    Keybinder.bind(_ctrlZ!, undo);
    Keybinder.bind(_ctrlY!, redo);
    Keybinder.bind(_ctrlShiftZ!, redo);
  }
  _removeKeybindings() {
    if (_ctrlZ != null) Keybinder.remove(_ctrlZ!);
    if (_ctrlY != null) Keybinder.remove(_ctrlY!);
    if (_ctrlShiftZ != null) Keybinder.remove(_ctrlShiftZ!);
  }

  void createPageOfStroke(Stroke stroke) {
    while (stroke.pageIndex >= pages.length) {
      pages.add(EditorPage());
    }
    if (stroke.pageIndex == pages.length - 1) {
      pages.add(EditorPage());
    }
  }
  void removeExcessPagesAfterStroke(Stroke stroke) {
    // remove excess pages if all pages >= this one are empty
    for (int i = pages.length - 1; i >= stroke.pageIndex + 1; --i) {
      final pageEmpty = !coreInfo.strokes.any((stroke) => stroke.pageIndex == i || stroke.pageIndex == i - 1);
      if (pageEmpty) pages.removeAt(i);
    }
  }

  undo() {
    if (coreInfo.strokes.isNotEmpty) {
      if (!isRedoPossible && strokesRedoStack.isNotEmpty) {
        // no redo is possible, clear the redo stack
        strokesRedoStack.clear();
      }
      setState(() {
        Stroke undoneStroke = coreInfo.strokes.removeLast();
        strokesRedoStack.add(undoneStroke);
        removeExcessPagesAfterStroke(undoneStroke);
        isRedoPossible = true;
      });
      autosaveAfterDelay();
    }
  }

  redo() {
    if (isRedoPossible) {
      setState(() {
        Stroke redoneStroke = strokesRedoStack.removeLast();
        coreInfo.strokes.add(redoneStroke);
        createPageOfStroke(redoneStroke);
        isRedoPossible = strokesRedoStack.isNotEmpty;
      });
      autosaveAfterDelay();
    }
  }

  int? onWhichPageIsFocalPoint(Offset focalPoint) {
    Rect pageBounds = const Rect.fromLTWH(0, 0, Canvas.canvasWidth, Canvas.canvasHeight);
    for (int i = 0; i < pages.length; ++i) {
      if (pages[i].renderBox == null) continue;
      if (pageBounds.contains(pages[i].renderBox!.globalToLocal(focalPoint))) return i;
    }
    return null;
  }

  int? dragPageIndex;
  double? currentPressure;
  bool isDrawGesture(ScaleStartDetails details) {
    if (lastSeenPointerCount >= 2) { // was a zoom gesture, ignore
      lastSeenPointerCount = lastSeenPointerCount;
      return false;
    } else if (details.pointerCount >= 2) { // is a zoom gesture, remove accidental stroke
      if (lastSeenPointerCount == 1) {
        Stroke accident = coreInfo.strokes.removeLast();
        removeExcessPagesAfterStroke(accident);

        isRedoPossible = strokesRedoStack.isNotEmpty;
      }
      _lastSeenPointerCount = details.pointerCount;
      return false;
    } else { // is a stroke
      _lastSeenPointerCount = details.pointerCount;
    }

    dragPageIndex = onWhichPageIsFocalPoint(details.focalPoint);
    if (dragPageIndex == null) return false;

    if (Prefs.editorFingerDrawing.value || currentPressure != null) {
      return true;
    } else {
      if (kDebugMode) print("Non-stylus found, rejected stroke");
      return false;
    }
  }
  onDrawStart(ScaleStartDetails details) {
    Offset position = pages[dragPageIndex!].renderBox!.globalToLocal(details.focalPoint);
    if (currentTool is Pen) {
      (currentTool as Pen).onDragStart(position, dragPageIndex!, currentPressure);
    } else if (currentTool is Eraser) {
      for (int i in (currentTool as Eraser).checkForOverlappingStrokes(position, coreInfo.strokes).reversed) {
        Stroke removed = coreInfo.strokes.removeAt(i);
        removeExcessPagesAfterStroke(removed);
      }
    }

    isRedoPossible = false;
  }
  onDrawUpdate(ScaleUpdateDetails details) {
    Offset position = pages[dragPageIndex!].renderBox!.globalToLocal(details.focalPoint);
    setState(() {
      if (currentTool is Pen) {
        (currentTool as Pen).onDragUpdate(position, currentPressure);
      } else if (currentTool is Eraser) {
        for (int i in (currentTool as Eraser).checkForOverlappingStrokes(position, coreInfo.strokes).reversed) {
          Stroke removed = coreInfo.strokes.removeAt(i);
          removeExcessPagesAfterStroke(removed);
        }
      }
    });
  }
  onDrawEnd(ScaleEndDetails details) {
    setState(() {
      if (currentTool is Pen) {
        Stroke newStroke = (currentTool as Pen).onDragEnd();
        coreInfo.strokes.add(newStroke);
        createPageOfStroke(newStroke);
      }
    });
    autosaveAfterDelay();
  }
  onPressureChanged(double? pressure) {
    currentPressure = pressure == 0.0 ? null : pressure;
  }

  autosaveAfterDelay() {
    _delayedSaveTimer?.cancel();
    _delayedSaveTimer = Timer(const Duration(milliseconds: 1000), () {
      saveToFile();
    });
  }


  String get _filename => path.substring(path.lastIndexOf('/') + 1);
  void saveToFile() async {
    String toSave = json.encode(coreInfo);
    await FileManager.writeFile(path + Editor.extension, toSave);
  }


  late final filenameTextEditingController = TextEditingController();
  Timer? _renameTimer;
  void renameFile(String newName) {
    _renameTimer?.cancel();

    if (newName.contains("/") || newName.isEmpty) { // if invalid name, don't rename
      _renameTimer = Timer(const Duration(milliseconds: 5000), () {
        filenameTextEditingController.text = _filename;
        filenameTextEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _filename.length));
      });
    } else { // rename after a delay
      _renameTimer = Timer(const Duration(milliseconds: 500), () {
        _renameFileNow(newName);
      });
    }
  }
  Future _renameFileNow(String newName) async {
    path = await FileManager.moveFile(path + Editor.extension, newName + Editor.extension);
    path = path.substring(0, path.lastIndexOf(Editor.extension));
    needsNaming = false;
  }

  void updateColorBar(Color color) {
    final String newColorString = color.value.toString();

    // migrate from old pref format
    if (Prefs.recentColorsChronological.value.length != Prefs.recentColorsPositioned.value.length) {
      if (kDebugMode) print("MIGRATING recentColors: ${Prefs.recentColorsChronological.value.length} vs ${Prefs.recentColorsPositioned.value.length}");
      Prefs.recentColorsChronological.value = List.of(Prefs.recentColorsPositioned.value);
    }

    if (Prefs.recentColorsPositioned.value.contains(newColorString)) {
      // if the color is already in the list, move it to the top
      Prefs.recentColorsChronological.value.remove(newColorString);
      Prefs.recentColorsChronological.value.add(newColorString);
      Prefs.recentColorsChronological.notifyListeners();
    } else {
      if (Prefs.recentColorsPositioned.value.length >= 5) {
        // if full, replace the oldest color with the new one
        final String removedColorString = Prefs.recentColorsChronological.value.removeAt(0);
        Prefs.recentColorsChronological.value.add(newColorString);
        final int removedColorPosition = Prefs.recentColorsPositioned.value.indexOf(removedColorString);
        Prefs.recentColorsPositioned.value[removedColorPosition] = newColorString;
      } else {
        // if not full, add the new color to the end
        Prefs.recentColorsChronological.value.add(newColorString);
        Prefs.recentColorsPositioned.value.add(newColorString);
      }
      Prefs.recentColorsChronological.notifyListeners();
      Prefs.recentColorsPositioned.notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          controller: filenameTextEditingController,
          onChanged: renameFile,
          autofocus: needsNaming,
        ),
      ),
      body: Column(
        verticalDirection: Prefs.editorToolbarOnBottom.value ? VerticalDirection.down : VerticalDirection.up,
        children: [
          Expanded(
            child: CanvasGestureDetector(
              isDrawGesture: isDrawGesture,
              onDrawStart: onDrawStart,
              onDrawUpdate: onDrawUpdate,
              onDrawEnd: onDrawEnd,
              onPressureChanged: onPressureChanged,

              undo: undo,
              redo: redo,

              child: Column(
                children: [
                  for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) ...[
                    Canvas(
                      path: path,
                      pageIndex: pageIndex,
                      innerCanvasKey: pages[pageIndex].innerCanvasKey,
                      coreInfo: coreInfo.copyWith(
                        strokes: coreInfo.strokes.where((stroke) => stroke.pageIndex == pageIndex).toList()
                      ),
                      currentStroke: (Pen.currentPen.currentStroke?.pageIndex == pageIndex) ? Pen.currentPen.currentStroke : null,
                    ),
                    const SizedBox(height: 16),
                  ]
                ],
              ),
            ),
          ),

          SafeArea(
            child: Toolbar(
              setTool: (tool) {
                setState(() {
                  currentTool = tool;
                });
              },
              currentTool: currentTool,
              setColor: (color) {
                setState(() {
                  updateColorBar(color);

                  Pen.currentPen.strokeProperties.color = color;
                });
              },
              undo: undo,
              isUndoPossible: coreInfo.strokes.isNotEmpty,
              redo: redo,
              isRedoPossible: isRedoPossible,
              toggleFingerDrawing: () {
                setState(() {
                  Prefs.editorFingerDrawing.value = !Prefs.editorFingerDrawing.value;
                  _lastSeenPointerCount = 0;
                });
              },
            ),
          ),
        ],
      )
    );
  }

  @override
  void dispose() {
    _delayedSaveTimer?.cancel();
    _lastSeenPointerCountTimer?.cancel();

    _removeKeybindings();

    saveToFile();

    super.dispose();
  }
}
