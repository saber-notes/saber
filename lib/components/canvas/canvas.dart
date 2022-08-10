
import 'package:flutter/material.dart';

import '_stroke.dart';
import 'inner_canvas.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    Key? key,
    required this.path,
    required this.innerCanvasKey,
    required this.undo,
    required this.redo,
    required this.strokes,
    required this.currentStroke,

    required this.onScaleStart,
    required this.onScaleUpdate,
    required this.onScaleEnd,
    required this.onPressureChanged,
  }) : super(key: key);

  static const double canvasWidth = 1000;
  static const double canvasHeight = canvasWidth * 1.4;

  final String path;

  final VoidCallback undo;
  final VoidCallback redo;

  final ValueChanged<ScaleStartDetails> onScaleStart;
  final ValueChanged<ScaleUpdateDetails> onScaleUpdate;
  final ValueChanged<ScaleEndDetails> onScaleEnd;
  final ValueChanged<double> onPressureChanged;

  final List<Stroke> strokes;
  final Stroke? currentStroke;

  final GlobalKey<State<InnerCanvas>>? innerCanvasKey;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "inner-canvas-$path",
      
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        child: Listener(
          onPointerDown: (PointerDownEvent event) {
            onPressureChanged(event.pressure);
          },
          onPointerMove: (PointerMoveEvent event) {
            onPressureChanged(event.pressure);
          },
          child: GestureDetector(
            onSecondaryTapUp: (TapUpDetails details) => undo(),
            onTertiaryTapUp: (TapUpDetails details) => redo(),
            child: InteractiveViewer(
              panEnabled: false,
              maxScale: 5,
              clipBehavior: Clip.none,

              onInteractionStart: onScaleStart,
              onInteractionUpdate: onScaleUpdate,
              onInteractionEnd: onScaleEnd,

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
          ),
        ),
      ),
    );
  }
}
