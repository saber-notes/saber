
import 'package:flutter/material.dart' hide Image;
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/components/canvas/tools/pen.dart';

import '_stroke.dart';

class CanvasPainter extends CustomPainter {
  const CanvasPainter({
    this.invert = false,
    required this.strokes,
    required this.images,
    this.currentStroke,
  });

  final bool invert;
  final Iterable<Stroke> strokes;
  final Iterable<EditorImage> images;
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
    for (final Stroke stroke in strokes) {
      if (stroke.penType != (Highlighter).toString()) continue;
      paint.color = stroke.strokeProperties.color.withAlpha(255).withInversion(invert);
      Path path = Path();
      path.addPolygon(stroke.polygon, true);
      canvas.drawPath(path, paint);
    }
    canvas.restore();

    // images
    for (final EditorImage editorImage in images) {
      if (editorImage.image == null) continue;
      canvas.drawImageRect(
        editorImage.image!,
        editorImage.srcRect,
        editorImage.dstRect,
        paint,
      );
    }

    // pen
    for (final Stroke stroke in strokes) {
      if (stroke.penType != (Pen).toString()) continue;
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
