
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/color_extensions.dart';

import '_stroke.dart';

class CanvasPainter extends CustomPainter {
  const CanvasPainter({
    this.invert = false,
    required this.strokes,
    this.currentStroke,
  });

  final bool invert;
  final Iterable<Stroke> strokes;
  final Stroke? currentStroke;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round;
    for (final Stroke stroke in strokes) {
      paint.color = stroke.strokeProperties.color.withInversion(invert);
      Path path = Path();
      path.addPolygon(stroke.polygon, true);
      canvas.drawPath(path, paint);
    }
    if (currentStroke != null) {
      paint.color = currentStroke!.strokeProperties.color.withInversion(invert);
      Path path = Path();
      path.addPolygon(currentStroke!.polygon, true);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) => true;
}
