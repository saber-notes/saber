import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/laser_pointer.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/data/tools/shape_pen.dart';
import 'package:sbn/tool_id.dart';

class CanvasPainter extends CustomPainter {
  final bool invert;
  final List<Stroke> strokes;
  final List<LaserStroke> laserStrokes;
  final Stroke? currentStroke;
  final SelectResult? currentSelection;
  final Color primaryColor;
  final EditorPage page;
  final bool showPageIndicator;
  final int pageIndex;
  final int totalPages;
  final double currentScale;
  final TextStyle defaultTextStyle;
  final double voidMeditationIntensity;
  final bool voidMeditationEnabled;
  final double bloodPactIntensity;
  final bool bloodPactEnabled;
  final bool isFadingActive;

  const CanvasPainter({
    super.repaint,
    this.invert = false,
    required this.strokes,
    required this.laserStrokes,
    required this.currentStroke,
    required this.currentSelection,
    required this.primaryColor,
    required this.page,
    required this.showPageIndicator,
    required this.pageIndex,
    required this.totalPages,
    required this.currentScale,
    required this.defaultTextStyle,
    this.voidMeditationIntensity = 0.0,
    this.voidMeditationEnabled = false,
    this.bloodPactIntensity = 0.0,
    this.bloodPactEnabled = false,
    this.isFadingActive = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final canvasRect = Offset.zero & size;

    _drawHighlighterStrokes(canvas, canvasRect);
    _drawNonHighlighterStrokes(canvas);
    for (final stroke in laserStrokes) _drawLaserStroke(canvas, stroke);
    _drawCurrentStroke(canvas);
    _drawDetectedShape(canvas);
    _drawSelection(canvas);
    _drawPageIndicator(canvas, size);
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) {
    return false ||
        // Current stroke is being drawn, so always repaint if present
        (currentStroke != null || oldDelegate.currentStroke != null) ||
        // Laser strokes are always fading out, so always repaint if present
        (laserStrokes.isNotEmpty || oldDelegate.laserStrokes.isNotEmpty) ||
        // Check for any other changes
        invert != oldDelegate.invert ||
        strokes.length != oldDelegate.strokes.length ||
        currentSelection != oldDelegate.currentSelection ||
        primaryColor != oldDelegate.primaryColor ||
        page != oldDelegate.page ||
        showPageIndicator != oldDelegate.showPageIndicator ||
        pageIndex != oldDelegate.pageIndex ||
        totalPages != oldDelegate.totalPages ||
        currentScale != oldDelegate.currentScale ||
        voidMeditationIntensity != oldDelegate.voidMeditationIntensity ||
        isFadingActive != oldDelegate.isFadingActive ||
        // If fading is active anywhere, we must repaint continuously to animate the fade
        isFadingActive;
  }

  void _drawHighlighterStrokes(Canvas canvas, Rect canvasRect) {
    final layerPaint = Paint()
      ..blendMode = invert ? BlendMode.lighten : BlendMode.darken
      ..color = Colors.white.withAlpha(Highlighter.alpha);
    bool needToRestoreCanvasLayer = false;

    Color? lastColor;
    final now = DateTime.now();

    for (final stroke in strokes) {
      if (stroke.toolId != ToolId.highlighter) continue;

      final opacity = stroke.getOpacity(now);
      if (opacity <= 0.0) continue;

      final color = stroke.color
          .withValues(alpha: 1.0 * opacity)
          .withInversion(invert);

      if (color != lastColor) {
        // new layer for each color
        if (needToRestoreCanvasLayer) canvas.restore();
        canvas.saveLayer(canvasRect, layerPaint);

        needToRestoreCanvasLayer = true;
        lastColor = color;
      }

      canvas.drawPath(_selectPath(stroke), Paint()..color = color);
    }

    if (needToRestoreCanvasLayer) canvas.restore();
  }

  void _drawNonHighlighterStrokes(Canvas canvas) {
    final paint = Paint();

    for (final stroke in strokes) {
      if (stroke.toolId == ToolId.highlighter) continue;

      var color = stroke.color.withInversion(invert);
      if (currentSelection?.strokes.contains(stroke) ?? false) {
        color = Color.lerp(color, primaryColor, 0.5)!;
      }

      // DEVILS BOOK: Session Pass - Blood Pact (Ink Intensification)
      if (bloodPactEnabled) {
        color = Color.lerp(
          color,
          const Color(0xFF800000).withInversion(invert),
          bloodPactIntensity * 0.4,
        )!;
      }

      paint.color = color;
      paint.shader = null;
      paint.maskFilter = null;

      if (stroke.toolId == ToolId.pencil) {
        if (shouldUsePencilShader(stroke.options.size)) {
          paint.color = Colors.white;
          paint.shader = page.pencilShader
            ..setFloat(0, color.r)
            ..setFloat(1, color.g)
            ..setFloat(2, color.b);
          paint.maskFilter = _getPencilMaskFilter(stroke.options.size);
        } else {
          final background = invert ? Colors.black : Colors.white;
          paint.color = Color.lerp(background, color, 0.6)!;
        }
      }

      // DEVILS BOOK: Material Pass - Shading
      if (stroke.shadingAmount > 0) {
        paint.color = color.withValues(
          alpha: (color.a * (1.0 - (stroke.shadingAmount * 0.4))).clamp(0.1, 1.0),
        );
      }

      // DEVILS BOOK: Ephemeral Logic - Dynamic Fading
      final now = DateTime.now();
      final opacity = stroke.getOpacity(now);
      if (opacity < 1.0) {
        paint.color = paint.color.withValues(alpha: paint.color.a * opacity);

        // DEVILS BOOK: Void Meditation Jitter
        if (voidMeditationEnabled && opacity < 0.5) {
          final jitterAmount = (1.0 - opacity) * voidMeditationIntensity * 2.0;
          canvas.save();
          canvas.translate(
            (Random().nextDouble() - 0.5) * jitterAmount,
            (Random().nextDouble() - 0.5) * jitterAmount,
          );
        }
      }
      if (paint.color.a <= 0.0) continue;

      final shapePaint = Paint()
        ..color = paint.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke.options.size;

      if (stroke is CircleStroke) {
        canvas.drawCircle(stroke.center, stroke.radius, shapePaint);
      } else if (stroke is RectangleStroke) {
        final strokeSize = stroke.options.size;
        canvas.drawRRect(
          RRect.fromRectAndRadius(stroke.rect, Radius.circular(strokeSize / 4)),
          shapePaint,
        );
      } else {
        final path = _selectPath(stroke);

        // DEVILS BOOK: Material Pass - Sheen
        if (stroke.sheenIntensity > 0 && stroke.sheenColor != null) {
          final sheenPaint = Paint()
            ..color = stroke.sheenColor!
                .withInversion(invert)
                .withValues(alpha: stroke.sheenIntensity * 0.5)
            ..maskFilter =
                MaskFilter.blur(BlurStyle.normal, stroke.options.size * 0.3)
            ..style = PaintingStyle.fill;
          canvas.drawPath(path, sheenPaint);
        }

        // DEVILS BOOK: Session Pass - Secondary Ritual Glow
        if (bloodPactEnabled && bloodPactIntensity > 0.6) {
          final glowPaint = Paint()
            ..color =
                const Color(0xFFFF2200).withValues(alpha: (bloodPactIntensity - 0.6) * 0.5)
            ..style = PaintingStyle.stroke
            ..strokeWidth = stroke.options.size + (bloodPactIntensity * 4.0)
            ..maskFilter =
                MaskFilter.blur(BlurStyle.normal, bloodPactIntensity * 10.0);
          canvas.drawPath(path, glowPaint);
        }

        canvas.drawPath(path, paint);

        // DEVILS BOOK: Material Pass - Shimmer (Sparkles)
        if (stroke.shimmerIntensity > 0 &&
            stroke.shimmerColor != null &&
            currentScale > 1.2) {
          final shimmerPaint = Paint()
            ..color = (stroke.shimmerColor ?? Colors.white).withInversion(invert)
            ..style = PaintingStyle.fill;

          final random = Random(stroke.hashCode);
          for (int i = 0; i < stroke.points.length; i += 4) {
            if (random.nextDouble() < stroke.shimmerIntensity * 0.5) {
              final p = stroke.points[i];
              canvas.drawCircle(
                Offset(p.x, p.y),
                random.nextDouble() * 1.5 * currentScale,
                shimmerPaint,
              );
            }
          }
        }
      }

      if (voidMeditationEnabled && opacity < 0.5) {
        canvas.restore(); // End Jitter
      }
    }
  }

  void _drawCurrentStroke(Canvas canvas) {
    if (currentStroke == null) return;

    if (currentStroke! is LaserStroke) {
      return _drawLaserStroke(canvas, currentStroke as LaserStroke);
    }

    final color = currentStroke!.color.withInversion(invert);
    final paint = Paint();

    paint.color = color;
    paint.shader = null;
    paint.maskFilter = null;
    if (currentStroke!.toolId == ToolId.pencil) {
      paint.color = Colors.white;
      paint.shader = page.pencilShader
        ..setFloat(0, color.r)
        ..setFloat(1, color.g)
        ..setFloat(2, color.b);
      paint.maskFilter = _getPencilMaskFilter(currentStroke!.options.size);
    }

    // Current stroke always uses high quality
    canvas.drawPath(currentStroke!.highQualityPath, paint);
  }

  void _drawLaserStroke(Canvas canvas, LaserStroke stroke) {
    canvas.drawPath(
      _selectPath(stroke),
      Paint()
        ..color = stroke.color.withInversion(invert)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.solid,
          stroke.options.size * 0.4,
        ),
    );
    canvas.drawPath(stroke.innerPath, Paint()..color = const Color(0xDDffffff));
  }

  void _drawDetectedShape(Canvas canvas) {
    final shape = ShapePen.detectedShape;
    if (shape == null) return;

    final color = currentStroke?.color.withInversion(invert) ?? Colors.black;
    final shapePaint = Paint()
      ..color = Color.lerp(color, primaryColor, 0.5)!.withValues(alpha: 0.7)
      ..style = .stroke
      ..strokeWidth = currentStroke?.options.size ?? 3;

    switch (shape.name) {
      case null:
        break;
      case DefaultUnistrokeNames.line:
        var (firstPoint, lastPoint) = shape.convertToLine();
        (firstPoint, lastPoint) = Stroke.snapLine(
          firstPoint is PointVector
              ? firstPoint
              : PointVector.fromOffset(offset: firstPoint),
          lastPoint is PointVector
              ? lastPoint
              : PointVector.fromOffset(offset: lastPoint),
        );
        canvas.drawLine(firstPoint, lastPoint, shapePaint);
      case DefaultUnistrokeNames.rectangle:
        final rect = shape.convertToRect();
        canvas.drawRect(rect, shapePaint);
      case DefaultUnistrokeNames.circle:
        final (center, radius) = shape.convertToCircle();
        canvas.drawCircle(center, radius, shapePaint);
      case DefaultUnistrokeNames.triangle:
      case DefaultUnistrokeNames.star:
        final polygon = shape.convertToCanonicalPolygon();
        canvas.drawPath(Path()..addPolygon(polygon, true), shapePaint);
    }
  }

  void _drawSelection(Canvas canvas) {
    if (currentSelection == null) return;

    // draw translucent fill
    canvas.drawPath(
      currentSelection!.path,
      Paint()..color = primaryColor.withValues(alpha: 0.1),
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
        ..style = .stroke,
    );
  }

  static const double _pageIndicatorFontSize = 20;
  static const double _pageIndicatorPadding = 5;
  void _drawPageIndicator(Canvas canvas, Size pageSize) {
    if (!showPageIndicator) return;

    final style = ui.ParagraphStyle(
      textAlign: .end,
      textDirection: .ltr,
      maxLines: 1,
    );

    final builder = ui.ParagraphBuilder(style)
      ..pushStyle(
        ui.TextStyle(
          color: Colors.black.withInversion(invert).withValues(alpha: 0.5),
          fontSize: _pageIndicatorFontSize,
          fontFamily: defaultTextStyle.fontFamily,
          fontFamilyFallback: defaultTextStyle.fontFamilyFallback,
        ),
      )
      ..addText('${pageIndex + 1} / $totalPages');

    final paragraph = builder.build();
    paragraph.layout(
      ui.ParagraphConstraints(
        width: pageSize.width - 2 * _pageIndicatorPadding,
      ),
    );

    canvas.drawParagraph(
      paragraph,
      Offset(
        _pageIndicatorPadding,
        pageSize.height - _pageIndicatorPadding - _pageIndicatorFontSize * 1.2,
      ),
    );
  }

  static MaskFilter _getPencilMaskFilter(double size) =>
      MaskFilter.blur(BlurStyle.normal, min(size * 0.2, 3));
  bool shouldUsePencilShader(double strokeSize) =>
      currentScale >= _zoomThreshold && (strokeSize * currentScale) >= 3;

  static const _zoomThreshold = 0.9;
  Path _selectPath(Stroke stroke) => switch (currentScale) {
    < _zoomThreshold => stroke.lowQualityPath,
    _ => stroke.highQualityPath,
  };
}
