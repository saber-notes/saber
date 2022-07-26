
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/toolbar.dart';
import 'package:saber/components/canvas/canvas.dart';

class Editor extends StatefulWidget {
  const Editor({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String? path;

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  List<Stroke> strokes = [];
  List<Stroke> strokesRedoStack = [];
  Stroke? currentStroke;

  final TransformationController _transformationController = TransformationController();

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

  undo() {
    if (strokes.isNotEmpty) {
      setState(() {
        strokesRedoStack.add(strokes.removeLast());
      });
    }
  }

  redo() {
    if (strokesRedoStack.isNotEmpty) {
      setState(() {
        strokes.add(strokesRedoStack.removeLast());
      });
    }
  }

  onScaleStart(ScaleStartDetails details) {
    if (lastSeenPointerCount >= 2) { // was a zoom gesture, ignore
      lastSeenPointerCount = lastSeenPointerCount;
      return;
    } else if (details.pointerCount >= 2) { // is a zoom gesture, remove accidental stroke
      if (lastSeenPointerCount == 1) {
        strokes.removeLast();
      }
      _lastSeenPointerCount = details.pointerCount;
      return;
    } else { // is a stroke
      _lastSeenPointerCount = details.pointerCount;
    }

    currentStroke = Stroke(
      color: Colors.black,
      strokeWidth: 2,
    )..addPoint(_transformationController.toScene(details.localFocalPoint));
  }
  onScaleUpdate(ScaleUpdateDetails details) {
    if (currentStroke == null) return;
    setState(() {
      currentStroke!.addPoint(_transformationController.toScene(details.localFocalPoint));
    });
  }
  onScaleEnd(ScaleEndDetails details) {
    if (currentStroke == null) return;
    setState(() {
      strokes.add(currentStroke!..isComplete = true);
      currentStroke = null;
    });
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
            text: widget.path ?? "New note",
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
          ),
          Expanded(child: Canvas(
            undo: undo,
            redo: redo,
            strokes: strokes,
            currentStroke: currentStroke,
            onScaleStart: onScaleStart,
            onScaleUpdate: onScaleUpdate,
            onScaleEnd: onScaleEnd,
            transformationController: _transformationController,
          )),
        ],
      )
    );
  }
}
