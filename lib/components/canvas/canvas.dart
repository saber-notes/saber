
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

  final TransformationController _transformationController = TransformationController();

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
      onSecondaryTapUp: (TapUpDetails details) {
        undo();
      },
      onTertiaryTapUp: (TapUpDetails details) {
        redo();
      },
      child: InteractiveViewer(
        transformationController: _transformationController,
        panEnabled: false,

        onInteractionStart: (ScaleStartDetails details) {
          if (details.pointerCount > 1) return;

          currentStroke = Stroke(
            points: [],
            color: Colors.black,
            strokeWidth: 10,
          )..addPoint(_transformationController.toScene(details.localFocalPoint));
        },
        onInteractionUpdate: (ScaleUpdateDetails details) {
          if (details.pointerCount > 1) return;

          setState(() {
            currentStroke!.addPoint(_transformationController.toScene(details.localFocalPoint));
          });
        },
        onInteractionEnd: (ScaleEndDetails details) {
          if (currentStroke == null) return;
          strokes.add(currentStroke!);
          currentStroke = null;
        },

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
