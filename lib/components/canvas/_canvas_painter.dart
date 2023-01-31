
import 'dart:ui';

import 'package:flutter/material.dart' hide TextStyle;
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';

import '_stroke.dart';

class CanvasPainter extends CustomPainter {
  const CanvasPainter({
    super.repaint,

    this.invert = false,
    required this.strokes,
    required this.currentStroke,

    required this.showPageIndicator,
    required this.pageIndex,
    required this.totalPages,
  });

  final bool invert;
  final List<Stroke> strokes;
  final Stroke? currentStroke;

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
      for (final Stroke stroke in strokes) {
        if (stroke.penType != (Highlighter).toString()) continue;
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
