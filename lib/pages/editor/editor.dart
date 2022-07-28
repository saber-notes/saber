
import 'dart:convert';
import 'dart:html' show AnchorElement;
import 'dart:io';
import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/toolbar.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/inner_canvas.dart';

const Uuid uuid = Uuid();

class Editor extends StatefulWidget {
  Editor({
    Key? key,
    String? path,
  }) : path = path ?? uuid.v1(), super(key: key);

  final String path;

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final GlobalKey<State<InnerCanvas>> innerCanvasKey = GlobalKey<State<InnerCanvas>>();

  List<Stroke> strokes = [];
  List<Stroke> strokesRedoStack = [];
  Stroke? currentStroke;
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
    }
  }

  redo() {
    if (isRedoPossible) {
      setState(() {
        strokes.add(strokesRedoStack.removeLast());
        isRedoPossible = strokesRedoStack.isNotEmpty;
      });
    }
  }

  RenderBox? innerCanvasRenderObject;
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

    currentStroke = Stroke(
      color: Colors.black,
      strokeWidth: 5,
    )..addPoint(innerCanvasRenderObject!.globalToLocal(details.focalPoint));
    isRedoPossible = false;
  }
  onScaleUpdate(ScaleUpdateDetails details) {
    if (currentStroke == null) return;
    setState(() {
      currentStroke!.addPoint(innerCanvasRenderObject!.globalToLocal(details.focalPoint));
    });
  }
  onScaleEnd(ScaleEndDetails details) {
    if (currentStroke == null) return;
    setState(() {
      strokes.add(currentStroke!..isComplete = true);
      currentStroke = null;
    });
    _delayedSaveTimer?.cancel();
    _delayedSaveTimer = Timer(const Duration(milliseconds: 1000), () {
      saveToFile();
    });
  }


  static const String extension = '.sbn';
  String get parentPath => widget.path.contains('/') ? widget.path.substring(0, widget.path.lastIndexOf('/')) : '';
  String get filename => widget.path.substring(widget.path.lastIndexOf('/') + 1);
  Future<String> get _documentsDirectory async => "${(await getApplicationDocumentsDirectory()).path}/Saber";
  Future<File> get _localFile async => File(await _documentsDirectory + widget.path + extension);
  Future<void> _createFileDirectory() async {
    await Directory(await _documentsDirectory + parentPath).create(recursive: true);
  }
  Future<List<Stroke>> loadFromFile() async {
    String? json;
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final path = File(widget.path).path;
      json = prefs.getString(path);
    } else {
      final file = await _localFile;
      json = await file.readAsString(encoding: utf8);
    }

    if (json == null) return [];
    List<dynamic> parsed = jsonDecode(json);
    return parsed
        .map((dynamic stroke) => Stroke.fromJson(stroke as Map<String, dynamic>))
        .toList();

  }
  void saveToFile() async {
    String toSave = json.encode(strokes);
    if (kIsWeb) { // path_provider doesn't support web, store in web's LocalStorage
      final prefs = await SharedPreferences.getInstance();
      final path = File(widget.path).path;
      prefs.setString(path, toSave);
      return;
    }
    final file = await _localFile;
    await _createFileDirectory();
    file.writeAsString(toSave, encoding: utf8);
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
          controller: TextEditingController(
            text: widget.path,
          ),
          onChanged: (text) {
            // todo: update note name
            print("Note name changed to: $text");
          },
        ),
      ),
      body: Column(
        children: [
          Toolbar(
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
            currentStroke: currentStroke,
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
