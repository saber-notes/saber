import 'dart:async';

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
  ShapePen(): super(
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

  static RecognizedUnistroke<DefaultUnistrokeNames>? detectedShape;
  void _detectShape() {
    detectedShape = Pen.currentStroke?.detectShape();
  }

  static Timer? _detectShapeDebouncer;
  static const _debounceDuration = Duration(milliseconds: 100);

  @override
  void onDragUpdate(Offset position, double? pressure) {
    super.onDragUpdate(position, pressure);

    if (_detectShapeDebouncer == null || !_detectShapeDebouncer!.isActive) {
      _detectShapeDebouncer = Timer(_debounceDuration, _detectShape);
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
        final (firstPoint, lastPoint) = detectedShape.convertToLine();
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
}
