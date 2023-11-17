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

    _drawHighlighterStrokes(canvas, canvasRect);
    _drawNonHighlighterStrokes(canvas);
    _drawCurrentStroke(canvas);
    _drawDetectedShape(canvas);
    _drawSelection(canvas);
    _drawPageIndicator(canvas, size);
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) {
    return currentStroke != null
      || oldDelegate.currentStroke != null
      || strokes.length != oldDelegate.strokes.length;
  }

  void _drawHighlighterStrokes(Canvas canvas, Rect canvasRect) {
    final layerPaint = Paint()
      ..blendMode = invert ? BlendMode.lighten : BlendMode.darken
      ..color = Colors.white.withAlpha(Highlighter.alpha);
    bool needToRestoreCanvasLayer = false;

    Color? lastColor;
    for (Stroke stroke in strokes) {
      if (stroke.penType != (Highlighter).toString()) continue;

      final color = stroke.strokeProperties.color.withOpacity(1).withInversion(invert);

      if (color != lastColor) { // new layer for each color
        if (needToRestoreCanvasLayer) canvas.restore();
        canvas.saveLayer(canvasRect, layerPaint);

        needToRestoreCanvasLayer = true;
        lastColor = color;
      }

      canvas.drawPath(stroke.path, Paint()..color = color);
    }

    if (needToRestoreCanvasLayer) canvas.restore();
  }

  void _drawNonHighlighterStrokes(Canvas canvas) {
    late final paint = Paint();

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
  }

  void _drawCurrentStroke(Canvas canvas) {
    if (currentStroke == null) return;

    final paint = Paint()
        ..color = currentStroke!.strokeProperties.color.withInversion(invert);

    if (currentStroke!.length <= 2) { // a dot
      final bounds = currentStroke!.path.getBounds();
      final radius = max(bounds.size.width, currentStroke!.strokeProperties.size * 0.5) / 2;
      canvas.drawCircle(bounds.center, radius, paint);
    } else {
      canvas.drawPath(currentStroke!.path, paint);
    }
  }

  void _drawDetectedShape(Canvas canvas) {
    if (ShapePen.detectedShape == null) return;
    if (ShapePen.detectedShape!.shape == Shape.unknown) return;

    final color = currentStroke?.strokeProperties.color.withInversion(invert)
        ?? Colors.black;
    final shapePaint = Paint()
        ..color = Color.lerp(color, primaryColor, 0.5)!.withOpacity(0.7)
        ..style = PaintingStyle.stroke
        ..strokeWidth = currentStroke?.strokeProperties.size ?? 3;

    switch (ShapePen.detectedShape!.shape) {
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
      case Shape.unknown:
        throw StateError('Shape.unknown should have an early return');
    }
  }

  void _drawSelection(Canvas canvas) {
    if (currentSelection == null) return;

    // draw translucent fill
    canvas.drawPath(
      currentSelection!.path,
      Paint()..color = primaryColor.withOpacity(0.1),
    );

    // draw dashed stroke
    canvas.drawPath(
      dashPath(
        currentSelection!.path,
        dashArray: CircularIntervalList([10, 10]),
      ),
      Paint()
          ..color = primaryColor
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke,
    );
  }

  static const double _pageIndicatorFontSize = 20;
  static const double _pageIndicatorPadding = 5;
  void _drawPageIndicator(Canvas canvas, Size pageSize) {
    if (!showPageIndicator) return;

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
      width: pageSize.width - 2 * _pageIndicatorPadding,
    ));

    canvas.drawParagraph(
      paragraph,
      Offset(
        _pageIndicatorPadding,
        pageSize.height - _pageIndicatorPadding - _pageIndicatorFontSize * 1.2,
      ),
    );
  }
}
