import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart' hide TextStyle;
import 'package:interactive_shape_recognition/interactive_shape_recognition.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/data/tools/shape_pen.dart';

class CanvasPainter extends CustomPainter {
  const CanvasPainter({
    super.repaint,

    this.invert = false,
    required this.strokes,
    required this.laserStrokes,
    required this.currentStroke,
    required this.currentSelection,
    required this.primaryColor,

    required this.showPageIndicator,
    required this.pageIndex,
    required this.totalPages,
  });

  final bool invert;
  final List<Stroke> strokes;
  final List<Stroke> laserStrokes;
  final Stroke? currentStroke;
  final SelectResult? currentSelection;
  final Color primaryColor;

  final bool showPageIndicator;
  final int pageIndex;
  final int totalPages;

  @override
  void paint(Canvas canvas, Size size) {
    Rect canvasRect = Offset.zero & size;
    Paint paint = Paint();

    // highlighter
    Paint highlighterLayerPaint = Paint()
      ..blendMode = invert ? BlendMode.lighten : BlendMode.darken
      ..color = Colors.white.withAlpha(Highlighter.alpha);
    bool needToRestoreCanvasLayer = false;
    {
      Color? lastColor;
      for (Stroke stroke in strokes) {
        if (stroke.penType != (Highlighter).toString()) continue;
        if (stroke.strokeProperties.color != lastColor) { // new layer for each color
          lastColor = stroke.strokeProperties.color;
          if (needToRestoreCanvasLayer) canvas.restore();
          canvas.saveLayer(canvasRect, highlighterLayerPaint);
          needToRestoreCanvasLayer = true;
        }
        final color = stroke.strokeProperties.color.withAlpha(255).withInversion(invert);
        if (currentSelection?.strokes.contains(stroke) ?? false) {
          paint.color = Color.lerp(color, primaryColor, 0.5)!;
        } else {
          paint.color = color;
        }
        canvas.drawPath(stroke.path, paint);
      }
    }
    if (needToRestoreCanvasLayer) canvas.restore();

    // pen
    for (Stroke stroke in [...strokes, ...laserStrokes]) {
      if (stroke.penType == (Highlighter).toString()) continue;
      final color = stroke.strokeProperties.color.withInversion(invert);
      if (currentSelection?.strokes.contains(stroke) ?? false) {
        paint.color = Color.lerp(color, primaryColor, 0.5)!;
      } else {
        paint.color = color;
      }

      late final shapePaint = Paint()
        ..color = paint.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke.strokeProperties.size;

      if (stroke is CircleStroke) {
        canvas.drawCircle(
          stroke.center,
          stroke.radius,
          shapePaint,
        );
      } else if (stroke is RectangleStroke) {
        final strokeSize = stroke.strokeProperties.size;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            stroke.rect,
            Radius.circular(strokeSize / 4),
          ),
          shapePaint,
        );
      } else if (stroke.length <= 2) { // a dot
        final bounds = stroke.path.getBounds();
        final radius = max(bounds.size.width, stroke.strokeProperties.size) / 2;
        canvas.drawCircle(bounds.center, radius, paint);
      } else {
        canvas.drawPath(stroke.path, paint);
      }
    }

    if (currentStroke != null) {
      paint.color = currentStroke!.strokeProperties.color.withInversion(invert);

      if (currentStroke!.length <= 2) { // a dot
        final bounds = currentStroke!.path.getBounds();
        final radius = max(bounds.size.width, currentStroke!.strokeProperties.size * 0.5) / 2;
        canvas.drawCircle(bounds.center, radius, paint);
      } else {
        canvas.drawPath(currentStroke!.path, paint);
      }
    }
    if (ShapePen.detectedShape != null) {
      final color = currentStroke?.strokeProperties.color.withInversion(invert) ?? Colors.black;
      final shapePaint = Paint()
        ..color = Color.lerp(color, primaryColor, 0.5)!.withOpacity(0.7)
        ..style = PaintingStyle.stroke
        ..strokeWidth = currentStroke?.strokeProperties.size ?? 3;
      switch (ShapePen.detectedShape!.shape) {
        case Shape.unknown:
          break;
        case Shape.line:
          canvas.drawLine(
            ShapePen.detectedShape!.firstPoint,
            ShapePen.detectedShape!.lastPoint,
            shapePaint,
          );
        case Shape.rectangle:
          canvas.drawRect(
            ShapePen.detectedShape!.generateRectangle(),
            shapePaint,
          );
        case Shape.circle:
          final circle = ShapePen.detectedShape!.generateCircle();
          canvas.drawCircle(
            circle.$2,
            circle.$1,
            shapePaint,
          );
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
