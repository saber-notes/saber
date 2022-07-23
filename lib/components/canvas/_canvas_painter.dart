
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '_stroke.dart';

class CanvasPainter extends CustomPainter {
  const CanvasPainter({
    required this.strokes,
    this.currentStroke,
  });

  final List<Stroke> strokes;
  final Stroke? currentStroke;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;
    for (final Stroke stroke in strokes) {
      Path path = Path();
      path.addPolygon(stroke.getPolygon(), true);
      canvas.drawPath(path, paint);
    }
    if (currentStroke != null) {
      Path path = Path();
      path.addPolygon(currentStroke!.getPolygon(), true);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) => true;
}
