import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart' hide TextStyle;
import 'package:path_drawing/path_drawing.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/components/canvas/tools/select.dart';

class CanvasPainter extends CustomPainter {
  const CanvasPainter({
    super.repaint,

    this.invert = false,
    required this.strokes,
    required this.currentStroke,
    required this.currentSelection,
    required this.primaryColor,

    required this.showPageIndicator,
    required this.pageIndex,
    required this.totalPages,
  });

  final bool invert;
  final List<Stroke> strokes;
  final Stroke? currentStroke;
  final SelectResult? currentSelection;
  final Color primaryColor;

  final bool showPageIndicator;
  final int pageIndex;
  final int totalPages;

  @override
  void paint(Canvas canvas, Size size) {
    Rect canvasRect = Offset.zero & size;
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round;

    // highlighter
    Paint highlighterLayerPaint = Paint()
      ..blendMode = invert ? BlendMode.lighten : BlendMode.darken
      ..color = Colors.white.withAlpha(Highlighter.alpha);
    canvas.saveLayer(canvasRect, highlighterLayerPaint);
    {
      Color? lastColor = strokes.isNotEmpty ? strokes.first.strokeProperties.color : null;
      for (int i = 0; i < strokes.length; i++) {
        final Stroke stroke = strokes[i];
        if (stroke.penType != (Highlighter).toString()) continue;
        if (stroke.strokeProperties.color != lastColor) { // new layer for each color
          lastColor = stroke.strokeProperties.color;
          canvas.restore();
          canvas.saveLayer(canvasRect, highlighterLayerPaint);
        }
        if (currentSelection?.indices.contains(i) ?? false) {
          paint.color = primaryColor;
        } else {
          paint.color = stroke.strokeProperties.color.withAlpha(255).withInversion(invert);
        }
        canvas.drawPath(stroke.path.shift(stroke.offset), paint);
      }
    }
    canvas.restore();

    // pen
    for (int i = 0; i < strokes.length; i++) {
      final Stroke stroke = strokes[i];
      if (stroke.penType == (Highlighter).toString()) continue;
      if (currentSelection?.indices.contains(i) ?? false) {
        paint.color = primaryColor;
      } else {
        paint.color = stroke.strokeProperties.color.withInversion(invert);
      }

      if (stroke.polygon.length <= 13) { // a dot
        final bounds = stroke.path.shift(stroke.offset).getBounds();
        final radius = max(bounds.size.width, stroke.strokeProperties.size * 0.5) / 2;
        canvas.drawCircle(bounds.center, radius, paint);
      } else {
        canvas.drawPath(stroke.path.shift(stroke.offset), paint);
      }
    }

    if (currentStroke != null) {
      paint.color = currentStroke!.strokeProperties.color.withInversion(invert);

      if (currentStroke!.polygon.length <= 13) { // a dot
        final bounds = currentStroke!.path.shift(currentStroke!.offset).getBounds();
        final radius = max(bounds.size.width, currentStroke!.strokeProperties.size * 0.5) / 2;
        canvas.drawCircle(bounds.center, radius, paint);
      } else {
        canvas.drawPath(currentStroke!.path.shift(currentStroke!.offset), paint);
      }
    }

    if (currentSelection != null) {
      // draw translucent fill
      paint.color = primaryColor.withOpacity(0.1);
      canvas.drawPath(currentSelection!.path, paint);

      // draw dashed stroke
      paint.color = primaryColor;
      paint.strokeWidth = 3;
      paint.style = PaintingStyle.stroke;
      canvas.drawPath(dashPath(
        currentSelection!.path,
        dashArray: CircularIntervalList([10, 10]),
      ), paint);
    }

    if (showPageIndicator) {
      canvas.drawParagraph(
        _getPageIndicator(size.width),
        Offset(
          _pageIndicatorPadding,
          size.height - _pageIndicatorPadding - _pageIndicatorFontSize * 1.2,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) {
    return currentStroke != null
      || oldDelegate.currentStroke != null
      || strokes.length != oldDelegate.strokes.length;
  }

  static const double _pageIndicatorFontSize = 20;
  static const double _pageIndicatorPadding = 5;
  Paragraph _getPageIndicator(double pageWidth) {
    ParagraphStyle style = ParagraphStyle(
      textAlign: TextAlign.end,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    ParagraphBuilder builder = ParagraphBuilder(style)
      ..pushStyle(TextStyle(
        color: Colors.black.withInversion(invert).withOpacity(0.5),
        fontSize: _pageIndicatorFontSize,
      ))
      ..addText('${pageIndex + 1} / $totalPages');

    Paragraph paragraph = builder.build();
    paragraph.layout(ParagraphConstraints(
      width: pageWidth - 2 * _pageIndicatorPadding,
    ));

    return paragraph;
  }
}
