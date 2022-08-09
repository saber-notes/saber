
import 'package:flutter/material.dart';

import '_canvas_painter.dart';
import '_stroke.dart';
import 'canvas.dart';

class InnerCanvas extends StatefulWidget {
  InnerCanvas({
    Key? key,
    this.pageIndex = 0,
    required this.width,
    required this.height,
    required List<Stroke> strokes,
    required this.currentStroke,
    this.onRenderObjectChange,
  }) : super(key: key) {
    this.strokes = strokes.where((stroke) => isStrokeInPage(stroke)).toList();
  }

  final int pageIndex;
  final double width;
  final double height;

  late final List<Stroke> strokes;
  final Stroke? currentStroke;
  final ValueChanged<RenderObject>? onRenderObjectChange;

  bool isStrokeInPage(Stroke stroke) {
    final maxY = stroke.maxY;
    final startOfPageY = height * pageIndex;
    return maxY >= startOfPageY && maxY <= startOfPageY + height;
  }

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
        width: widget.width,
        height: widget.height,
        color: const Color.fromRGBO(245, 245, 245, 1),
      ),
    );
  }
}
