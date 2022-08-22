
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';

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
  final int pageIndex = 0;

  final double? height;
  final Iterable<Stroke> strokes;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "inner-canvas-$path-page$pageIndex",

      child: InteractiveCanvasViewer(
        maxScale: 5,

        child: FittedBox(
          child: InnerCanvas(
            width: Canvas.canvasWidth,
            height: height ?? Canvas.canvasHeight * 0.1,
            strokes: strokes,
            currentStroke: null,
          ),
        ),
      ),
    );
  }
}
