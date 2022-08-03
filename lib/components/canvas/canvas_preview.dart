
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas.dart';

import '_stroke.dart';
import 'inner_canvas.dart';

class CanvasPreview extends StatelessWidget {
  const CanvasPreview({
    Key? key,
    required this.path,
    required this.height,
    required this.strokes,
  }) : super(key: key);

  final String path;

  final double? height;
  final List<Stroke> strokes;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "inner-canvas-$path",

      child: InteractiveViewer(
        maxScale: 5,

        child: FittedBox(
          child: InnerCanvas(
            width: Canvas.canvasWidth,
            height: height ?? Canvas.canvasHeight,
            strokes: strokes,
            currentStroke: null,
          ),
        ),
      ),
    );
  }
}
