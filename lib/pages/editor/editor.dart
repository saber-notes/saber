
import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/data/file_manager.dart';
import 'package:uuid/uuid.dart';

import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/toolbar.dart';
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
  }) : initialPath = path ?? uuid.v1(), super(key: key);

  final String initialPath;

  static const String extension = '.sbn';

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final GlobalKey<State<InnerCanvas>> innerCanvasKey = GlobalKey<State<InnerCanvas>>();

  late String path;

  late Pen currentPen;
  late Tool currentTool;

  List<Stroke> strokes = [];
  List<Stroke> strokesRedoStack = [];
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
    super.initState();

    path = widget.initialPath;

    currentPen = Pen.fountainPen();
    currentTool = currentPen;

    _initStrokes();
  }
  // initState can't be async
  void _initStrokes() async {
    strokes = await loadFromFile();
    setState(() {});
  }

  undo() {
    if (strokes.isNotEmpty) {
      if (!isRedoPossible && strokesRedoStack.isNotEmpty) {
        strokesRedoStack = [];
      }
      setState(() {
        strokesRedoStack.add(strokes.removeLast());
        isRedoPossible = true;
      });
      autosaveAfterDelay();
    }
  }

  redo() {
    if (isRedoPossible) {
      setState(() {
        strokes.add(strokesRedoStack.removeLast());
        isRedoPossible = strokesRedoStack.isNotEmpty;
      });
      autosaveAfterDelay();
    }
  }

  RenderBox? innerCanvasRenderObject;
  bool dragStarted = false;
  onScaleStart(ScaleStartDetails details) {
    if (lastSeenPointerCount >= 2) { // was a zoom gesture, ignore
      lastSeenPointerCount = lastSeenPointerCount;
      return;
    } else if (details.pointerCount >= 2) { // is a zoom gesture, remove accidental stroke
      if (lastSeenPointerCount == 1) {
        strokes.removeLast();
        isRedoPossible = strokesRedoStack.isNotEmpty;
      }
      _lastSeenPointerCount = details.pointerCount;
      return;
    } else { // is a stroke
      _lastSeenPointerCount = details.pointerCount;
    }

    final renderObject = innerCanvasKey.currentState!.context.findRenderObject();
    if (renderObject != null) {
      innerCanvasRenderObject = renderObject as RenderBox;
    }
    if (innerCanvasRenderObject == null) return;

    dragStarted = true;

    Offset position = innerCanvasRenderObject!.globalToLocal(details.focalPoint);
    if (currentTool is Pen) {
      (currentTool as Pen).onDragStart(position);
    } else if (currentTool is Eraser) {
      for (int i in (currentTool as Eraser).checkForOverlappingStrokes(position, strokes)) {
        strokes.removeAt(i);
      }
    }

    isRedoPossible = false;
  }
  onScaleUpdate(ScaleUpdateDetails details) {
    if (!dragStarted) return;

    Offset position = innerCanvasRenderObject!.globalToLocal(details.focalPoint);
    setState(() {
      if (currentTool is Pen) {
        (currentTool as Pen).onDragUpdate(position);
      } else if (currentTool is Eraser) {
        for (int i in (currentTool as Eraser).checkForOverlappingStrokes(position, strokes)) {
          strokes.removeAt(i);
        }
      }
    });

  }
  onScaleEnd(ScaleEndDetails details) {
    if (!dragStarted) return;
    dragStarted = false;
    setState(() {
      if (currentTool is Pen) {
        strokes.add((currentTool as Pen).onDragEnd());
      }
    });
    autosaveAfterDelay();
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


  late final filenameTextEditingController = TextEditingController(
    text: _filename,
  );
  Future renameFile(newName) async {
    if (newName.contains("/") || newName.isEmpty) {
      filenameTextEditingController.text = _filename;
      return;
    }
    path = await FileManager.moveFile(path + Editor.extension, newName + Editor.extension);
    path = path.substring(0, path.lastIndexOf(Editor.extension));
    if (filenameTextEditingController.text != _filename) {
      filenameTextEditingController.text = _filename;
      filenameTextEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _filename.length));
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          controller: filenameTextEditingController,
          onChanged: (newName) {
            renameFile(newName);
          },
        ),
      ),
      body: Column(
        children: [
          Toolbar(
            setTool: (tool) {
              currentTool = tool;
            },
            undo: undo,
            redo: redo,
            isUndoPossible: strokes.isNotEmpty,
            isRedoPossible: isRedoPossible,
          ),
          Expanded(child: Canvas(
            innerCanvasKey: innerCanvasKey,
            undo: undo,
            redo: redo,
            strokes: strokes,
            currentStroke: currentPen.currentStroke,
            onScaleStart: onScaleStart,
            onScaleUpdate: onScaleUpdate,
            onScaleEnd: onScaleEnd,
          )),
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
