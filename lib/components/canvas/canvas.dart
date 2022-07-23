
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
  Stroke? currentStroke;

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
      child: CustomPaint(
        painter: CanvasPainter(
          strokes: strokes,
          currentStroke: currentStroke,
        ),
        child: Container(),
      ),
    );
  }
}
