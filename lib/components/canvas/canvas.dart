
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:saber/components/canvas/_canvas_painter.dart';
import '_stroke.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    Key? key,
    required this.undo,
    required this.redo,
    required this.strokes,
    required this.currentStroke,
    required this.onScaleStart,
    required this.onScaleUpdate,
    required this.onScaleEnd,
    required this.transformationController,
  }) : super(key: key);

  static const double canvasWidth = 1000;
  static const double canvasHeight = canvasWidth * 1.4;

  final VoidCallback undo;
  final VoidCallback redo;

  final ValueChanged<ScaleStartDetails> onScaleStart;
  final ValueChanged<ScaleUpdateDetails> onScaleUpdate;
  final ValueChanged<ScaleEndDetails> onScaleEnd;

  final TransformationController transformationController;

  final List<Stroke> strokes;
  final Stroke? currentStroke;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onSecondaryTapUp: (TapUpDetails details) => undo(),
        onTertiaryTapUp: (TapUpDetails details) => redo(),
        child: InteractiveViewer(
          transformationController: transformationController,
          panEnabled: false,

          onInteractionStart: onScaleStart,
          onInteractionUpdate: onScaleUpdate,
          onInteractionEnd: onScaleEnd,

          child: CustomPaint(
            foregroundPainter: CanvasPainter(
              strokes: strokes,
              currentStroke: currentStroke,
            ),
            isComplex: true,
            willChange: currentStroke != null,
            child: Container(
              width: Canvas.canvasWidth,
              height: Canvas.canvasHeight,
              color: const Color.fromRGBO(245, 245, 245, 1),
            ),
          ),
        ),
      ),
    );
  }
}
