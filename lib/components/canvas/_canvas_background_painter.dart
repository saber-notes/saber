
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/color_extensions.dart';

class CanvasBackgroundPainter extends CustomPainter {
  const CanvasBackgroundPainter({
    required this.invert,
    required this.backgroundColor,
    this.backgroundPattern = CanvasBackgroundPatterns.none,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.red,
  });

  final bool invert;
  final Color backgroundColor;
  final String backgroundPattern;
  final Color primaryColor, secondaryColor;

  @override
  void paint(Canvas canvas, Size size) {
    Rect canvasRect = Offset.zero & size;
    Paint paint = Paint();

    paint.color = backgroundColor.withInversion(invert);
    canvas.drawRect(canvasRect, paint);

    int lineHeight = 40;
    paint.color = primaryColor.withOpacity(0.2);

    if (backgroundPattern == CanvasBackgroundPatterns.college || backgroundPattern == CanvasBackgroundPatterns.lined) {
      // horizontal lines
      for (double y = lineHeight * 2; y < size.height; y += lineHeight) {
        canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      }
      if (backgroundPattern == CanvasBackgroundPatterns.college) {
        // vertical line
        paint.color = secondaryColor.withOpacity(0.2);
        canvas.drawLine(Offset(lineHeight * 2, 0), Offset(lineHeight * 2, size.height), paint);
      }
    } else if (backgroundPattern == CanvasBackgroundPatterns.grid) {
      for (double y = lineHeight * 2; y < size.height; y += lineHeight) {
        canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      }
      for (double x = 0; x < size.width; x += lineHeight) {
        canvas.drawLine(Offset(x, lineHeight * 2), Offset(x, size.height), paint);
      }
    } else if (backgroundPattern == CanvasBackgroundPatterns.dots) {
      for (double y = lineHeight * 2; y <= size.height; y += lineHeight) {
        for (double x = 0; x <= size.width; x += lineHeight) {
          canvas.drawCircle(Offset(x, y), 2, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CanvasBackgroundPainter oldDelegate) => kDebugMode
        || oldDelegate.invert != invert
        || oldDelegate.backgroundColor != backgroundColor
        || oldDelegate.backgroundPattern != backgroundPattern
        || oldDelegate.primaryColor != primaryColor
        || oldDelegate.secondaryColor != secondaryColor;
}

abstract class CanvasBackgroundPatterns {
  /// College ruled paper: horizontal lines with one
  /// vertical line along the left margin
  static const String college = "college";

  /// Horizontal lines. This is the same as college ruled paper
  /// but without the vertical line
  static const String lined = "lined";

  /// A grid of squares
  static const String grid = "grid";

  /// A grid of dots. This is the same as "grid" except it has dots on the
  /// corners instead of the whole square border.
  static const String dots = "dots";

  /// No background pattern
  static const String none = "";
}