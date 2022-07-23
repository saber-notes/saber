
import 'package:flutter/material.dart';

import 'package:saber/components/canvas/_canvas_painter.dart';
import '_stroke.dart';

class Canvas extends StatefulWidget {
  const Canvas({Key? key}) : super(key: key);

  @override
  State<Canvas> createState() => _CanvasState();

}

class _CanvasState extends State<Canvas> {
  List<Stroke> strokes = [];
  List<Stroke> strokesRedoStack = [];
  Stroke? currentStroke;

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        currentStroke = Stroke(
          points: [],
          color: Colors.black,
          strokeWidth: 10,
        )
        ..addPoint(details.localPosition);
      },
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          currentStroke!.addPoint(details.localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) {
        strokes.add(currentStroke!);
        currentStroke = null;
      },
      onSecondaryTapUp: (TapUpDetails details) {
        undo();
      },
      onTertiaryTapUp: (TapUpDetails details) {
        redo();
      },
      child: FittedBox(
        child: CustomPaint(
          foregroundPainter: CanvasPainter(
            strokes: strokes,
            currentStroke: currentStroke,
          ),
          isComplex: true,
          willChange: currentStroke != null,
          child: Container(
            width: 1000,
            height: 1000 * 1.4,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 245, 245, 1)
            ),
          ),
        ),
      ),
    );
  }
}
