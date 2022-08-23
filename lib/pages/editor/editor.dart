
import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager.dart';
import 'package:uuid/uuid.dart';

import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/toolbar/toolbar.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/inner_canvas.dart';

const Uuid uuid = Uuid();

Future<List<Stroke>> loadStrokesFromPath(String path) async {
  String? json = await FileManager.readFile(path + Editor.extension);
  if (json == null) return [];

  try {
    final List<dynamic> parsed = jsonDecode(json);
    return parsed
        .map((dynamic stroke) => Stroke.fromJson(stroke as Map<String, dynamic>))
        .toList();
  } catch (e) {
    if (kDebugMode) print('Error parsing json: $e');
    return [];
  }
}

class Editor extends StatefulWidget {
  Editor({
    Key? key,
    String? path,
  }) : initialPath = path != null ? Future.value(path) : FileManager.newFilePath("/"),
        needsNaming = path == null,
        super(key: key);

  final Future<String> initialPath;
  final bool needsNaming;

  static const String extension = '.sbn';

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final List<EditorPage> pages = [];

  String path = "";
  late bool needsNaming;

  late Tool currentTool;

  final List<Stroke> strokes = [];
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
    needsNaming = widget.needsNaming;

    Pen.currentPen = Pen.fountainPen();
    currentTool = Pen.currentPen;

    _awaitPath();
    _initStrokes();

    super.initState();
  }
  void _awaitPath() async {
    path = await widget.initialPath;
    filenameTextEditingController.text = _filename;
    setState(() {});

    if (needsNaming) {
      filenameTextEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: filenameTextEditingController.text.length,
      );
    }
  }
  void _initStrokes() async {
    List<Stroke> strokes = await loadFromFile();
    if (strokes.isEmpty) {
      pages.add(EditorPage());
    } else {
      for (Stroke stroke in strokes) {
        this.strokes.add(stroke);
        createPageOfStroke(stroke);
      }
    }

    setState(() {});
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
      final pageEmpty = !strokes.any((stroke) => stroke.pageIndex == i || stroke.pageIndex == i - 1);
      if (pageEmpty) pages.removeAt(i);
    }
  }

  undo() {
    if (strokes.isNotEmpty) {
      if (!isRedoPossible && strokesRedoStack.isNotEmpty) {
        // no redo is possible, clear the redo stack
        strokesRedoStack.clear();
      }
      setState(() {
        Stroke undoneStroke = strokes.removeLast();
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
        strokes.add(redoneStroke);
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
  bool isFingerDrawingEnabled = true;
  bool isDrawGesture(ScaleStartDetails details) {
    if (lastSeenPointerCount >= 2) { // was a zoom gesture, ignore
      lastSeenPointerCount = lastSeenPointerCount;
      return false;
    } else if (details.pointerCount >= 2) { // is a zoom gesture, remove accidental stroke
      if (lastSeenPointerCount == 1) {
        Stroke accident = strokes.removeLast();
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

    if (isFingerDrawingEnabled || currentPressure != null) {
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
      for (int i in (currentTool as Eraser).checkForOverlappingStrokes(position, strokes).reversed) {
        Stroke removed = strokes.removeAt(i);
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
        for (int i in (currentTool as Eraser).checkForOverlappingStrokes(position, strokes).reversed) {
          Stroke removed = strokes.removeAt(i);
          removeExcessPagesAfterStroke(removed);
        }
      }
    });
  }
  onDrawEnd(ScaleEndDetails details) {
    setState(() {
      if (currentTool is Pen) {
        Stroke newStroke = (currentTool as Pen).onDragEnd();
        strokes.add(newStroke);
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
  Future<List<Stroke>> loadFromFile() async => loadStrokesFromPath(path);
  void saveToFile() async {
    String toSave = json.encode(strokes);
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
        children: [
          Toolbar(
            setTool: (tool) {
              setState(() {
                currentTool = tool;
              });
            },
            currentTool: currentTool,
            undo: undo,
            isUndoPossible: strokes.isNotEmpty,
            redo: redo,
            isRedoPossible: isRedoPossible,
            toggleFingerDrawing: () {
              setState(() {
                isFingerDrawingEnabled = !isFingerDrawingEnabled;
                _lastSeenPointerCount = 0;
              });
            },
            isFingerDrawingEnabled: isFingerDrawingEnabled,
          ),

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
                      strokes: strokes.where((stroke) => stroke.pageIndex == pageIndex),
                      currentStroke: (Pen.currentPen.currentStroke?.pageIndex == pageIndex) ? Pen.currentPen.currentStroke : null,
                    ),
                    const SizedBox(height: 16),
                  ]
                ],
              ),
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

    saveToFile();

    super.dispose();
  }
}
