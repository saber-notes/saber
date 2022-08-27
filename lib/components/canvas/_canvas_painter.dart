
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '_stroke.dart';

class CanvasPainter extends CustomPainter {
  const CanvasPainter({
    this.darken = false,
    required this.strokes,
    this.currentStroke,
  });

  final bool darken;
  final Iterable<Stroke> strokes;
  final Stroke? currentStroke;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round;
    for (final Stroke stroke in strokes) {
      paint.color = autoDarken(stroke.strokeProperties.color);
      Path path = Path();
      path.addPolygon(stroke.polygon, true);
      canvas.drawPath(path, paint);
    }
    if (currentStroke != null) {
      paint.color = autoDarken(currentStroke!.strokeProperties.color);
      Path path = Path();
      path.addPolygon(currentStroke!.polygon, true);
      canvas.drawPath(path, paint);
    }
  }

  Color autoDarken(Color color) {
    if (!darken) return color;

    final HSLColor hsl = HSLColor.fromColor(color);
    return hsl.withLightness(1 - hsl.lightness).toColor();
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) => true;
}
