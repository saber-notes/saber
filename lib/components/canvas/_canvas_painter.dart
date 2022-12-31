
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';

import '_stroke.dart';

class CanvasPainter extends CustomPainter {
  const CanvasPainter({
    this.invert = false,
    required this.strokes,
    this.currentStroke,
  });

  final bool invert;
  final List<Stroke> strokes;
  final Stroke? currentStroke;

  @override
  void paint(Canvas canvas, Size size) {
    Rect canvasRect = Offset.zero & size;
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round;

    // highlighter
    Paint highlighterLayerPaint = Paint()
      ..color = Colors.white.withAlpha(Highlighter.alpha);
    canvas.saveLayer(canvasRect, highlighterLayerPaint);
    {
      /// sorted by color
      Iterable<Stroke> strokes = this.strokes
          .where((stroke) => stroke.penType == (Highlighter).toString())
          .toList(growable: false)
          ..sort((a, b) => a.strokeProperties.color.value - b.strokeProperties.color.value);
      Color? lastColor = strokes.isNotEmpty ? strokes.first.strokeProperties.color : null;
      for (final Stroke stroke in strokes) {
        if (stroke.strokeProperties.color != lastColor) { // new layer for each color
          lastColor = stroke.strokeProperties.color;
          canvas.restore();
          canvas.saveLayer(canvasRect, highlighterLayerPaint);
        }
        paint.color = stroke.strokeProperties.color.withAlpha(255).withInversion(invert);
        canvas.drawPath(stroke.path, paint);
      }
    }
    canvas.restore();

    // pen
    for (final Stroke stroke in strokes) {
      if (stroke.penType == (Highlighter).toString()) continue;
      paint.color = stroke.strokeProperties.color.withInversion(invert);
      canvas.drawPath(stroke.path, paint);
    }

    if (currentStroke != null) {
      paint.color = currentStroke!.strokeProperties.color.withInversion(invert);
      canvas.drawPath(currentStroke!.path, paint);
    }
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) {
    return currentStroke != null
        || strokes.length != oldDelegate.strokes.length;
  }
}
