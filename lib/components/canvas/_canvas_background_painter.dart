
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/color_extensions.dart';

class CanvasBackgroundPainter extends CustomPainter {
  const CanvasBackgroundPainter({
    required this.invert,
    required this.backgroundColor,
  });

  final bool invert;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Rect canvasRect = Offset.zero & size;

    Paint paint = Paint()..color = backgroundColor.withInversion(invert);
    canvas.drawRect(canvasRect, paint);
  }

  @override
  bool shouldRepaint(CanvasBackgroundPainter oldDelegate) {
    return oldDelegate.invert != invert || oldDelegate.backgroundColor != backgroundColor;
  }
}
