
import 'package:flutter/material.dart';

import '_stroke.dart';
import 'inner_canvas.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    Key? key,
    required this.path,
    required this.pageIndex,
    required this.innerCanvasKey,
    required this.strokes,
    required this.currentStroke,
  }) : super(key: key);

  static const double canvasWidth = 1000;
  static const double canvasHeight = canvasWidth * 1.4;

  final String path;
  final int pageIndex;

  final Iterable<Stroke> strokes;
  final Stroke? currentStroke;

  final GlobalKey<State<InnerCanvas>>? innerCanvasKey;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "inner-canvas-$path-page$pageIndex",

      child: ClipRect(
        child: Center(
          child: FittedBox(
            child: InnerCanvas(
              key: innerCanvasKey,
              width: canvasWidth,
              height: canvasHeight,
              strokes: strokes,
              currentStroke: currentStroke,
            ),
          ),
        ),
      ),
    );
  }
}
