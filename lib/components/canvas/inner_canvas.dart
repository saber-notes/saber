
import 'package:flutter/material.dart';

import '_canvas_painter.dart';
import '_stroke.dart';
import 'canvas.dart';

class InnerCanvas extends StatefulWidget {
  const InnerCanvas({
    Key? key,
    required this.strokes,
    required this.currentStroke,
    this.onRenderObjectChange,
  }) : super(key: key);

  final List<Stroke> strokes;
  final Stroke? currentStroke;
  final ValueChanged<RenderObject>? onRenderObjectChange;

  @override
  State<InnerCanvas> createState() => _InnerCanvasState();
}

class _InnerCanvasState extends State<InnerCanvas> {

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CanvasPainter(
        strokes: widget.strokes,
        currentStroke: widget.currentStroke,
      ),
      isComplex: true,
      willChange: widget.currentStroke != null,
      child: Container(
        width: Canvas.canvasWidth,
        height: Canvas.canvasHeight,
        color: const Color.fromRGBO(245, 245, 245, 1),
      ),
    );
  }
}
