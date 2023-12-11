import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logging/logging.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/i18n/strings.g.dart';

class ShapePen extends Pen {
  ShapePen()
      : super(
          name: t.editor.pens.shapePen,
          sizeMin: 1,
          sizeMax: 25,
          sizeStep: 1,
          icon: shapePenIcon,
          toolId: ToolId.shapePen,
        ) {
    strokeProperties = Prefs.lastShapePenProperties.value;
  }

  static final log = Logger('ShapePen');

  static const IconData shapePenIcon = FontAwesomeIcons.shapes;

  static RecognizedUnistroke? detectedShape;
  void _detectShape() {
    detectedShape = Pen.currentStroke?.detectShape();
  }

  static Timer? _detectShapeDebouncer;
  static var debounceDuration = getDebounceFromPref();
  static Duration getDebounceFromPref() {
    assert(Prefs.shapeRecognitionDelay.loaded);
    final ms = Prefs.shapeRecognitionDelay.value;
    if (ms < 0) {
      return const Duration(seconds: 10);
    } else {
      return Duration(milliseconds: ms);
    }
  }

  @override
  void onDragUpdate(Offset position, double? pressure) {
    super.onDragUpdate(position, pressure);

    if (_detectShapeDebouncer == null || !_detectShapeDebouncer!.isActive) {
      _detectShapeDebouncer = Timer(debounceDuration, _detectShape);
    }
  }

  @override
  Stroke onDragEnd() {
    _detectShapeDebouncer?.cancel();
    _detectShapeDebouncer = null;
    _detectShape();

    final rawStroke = super.onDragEnd();
    final detectedShape = ShapePen.detectedShape;
    ShapePen.detectedShape = null;

    if (detectedShape == null) return rawStroke;

    switch (detectedShape.name) {
      case null:
        log.info('Detected unknown shape');
        return rawStroke;
      case DefaultUnistrokeNames.line:
        var (firstPoint, lastPoint) = detectedShape.convertToLine();
        (firstPoint, lastPoint) = snapLine(firstPoint, lastPoint);
        log.info('Detected line: $firstPoint -> $lastPoint');
        return Stroke(
          strokeProperties: rawStroke.strokeProperties,
          pageIndex: rawStroke.pageIndex,
          penType: rawStroke.penType,
        )
          ..addPoint(firstPoint)
          ..addPoint(lastPoint)
          ..addPoint(lastPoint)
          ..isComplete = true;
      case DefaultUnistrokeNames.rectangle:
        final rect = detectedShape.convertToRect();
        log.info('Detected rectangle: $rect');
        return RectangleStroke(
          strokeProperties: rawStroke.strokeProperties,
          pageIndex: rawStroke.pageIndex,
          penType: rawStroke.penType,
          rect: rect,
        );
      case DefaultUnistrokeNames.circle:
        final (center, radius) = detectedShape.convertToCircle();
        log.info('Detected circle: c=$center, r=$radius');
        return CircleStroke(
          strokeProperties: rawStroke.strokeProperties,
          pageIndex: rawStroke.pageIndex,
          penType: rawStroke.penType,
          radius: radius,
          center: center,
        );
      case DefaultUnistrokeNames.triangle:
        final polygon = detectedShape.convertToCanonicalPolygon();
        log.info('Detected triangle');
        return Stroke(
          strokeProperties: rawStroke.strokeProperties,
          pageIndex: rawStroke.pageIndex,
          penType: rawStroke.penType,
        )
          ..addPoints(polygon)
          ..isComplete = true;
    }
  }

  /// Snaps a line to either horizontal or vertical
  /// if the angle is close enough.
  static (Offset firstPoint, Offset lastPoint) snapLine(
    Offset firstPoint,
    Offset lastPoint,
  ) {
    final dx = (lastPoint.dx - firstPoint.dx).abs();
    final dy = (lastPoint.dy - firstPoint.dy).abs();
    final angle = math.atan2(dy, dx);

    const snapAngle = 5 * math.pi / 180; // 5 degrees
    if (angle < snapAngle) {
      // snap to horizontal
      return (firstPoint, Offset(lastPoint.dx, firstPoint.dy));
    } else if (angle > math.pi / 2 - snapAngle) {
      // snap to vertical
      return (firstPoint, Offset(firstPoint.dx, lastPoint.dy));
    } else {
      return (firstPoint, lastPoint);
    }
  }
}
