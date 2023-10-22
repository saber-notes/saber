import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interactive_shape_recognition/interactive_shape_recognition.dart';
import 'package:logging/logging.dart';
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

  static DetectedShape? detectedShape;
  void _detectShape() {
    detectedShape = Pen.currentStroke?.getDetectedShape();
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

    switch (detectedShape.shape) {
      case Shape.unknown:
        log.info('Detected unknown shape');
        return rawStroke;
      case Shape.line:
        log.info('Detected line: ${detectedShape.firstPoint} -> ${detectedShape.lastPoint}');
        return Stroke(
          strokeProperties: rawStroke.strokeProperties,
          pageIndex: rawStroke.pageIndex,
          penType: rawStroke.penType,
        )
          ..addPoint(detectedShape.firstPoint)
          ..addPoint(detectedShape.lastPoint)
          ..addPoint(detectedShape.lastPoint)
          ..isComplete = true;
      case Shape.rectangle:
        final rect = detectedShape.generateRectangle();
        log.info('Detected rectangle: $rect');
        return RectangleStroke(
          strokeProperties: rawStroke.strokeProperties,
          pageIndex: rawStroke.pageIndex,
          penType: rawStroke.penType,
          rect: rect,
        );
      case Shape.circle:
        final circle = detectedShape.generateCircle();
        log.info('Detected circle: $circle');
        return CircleStroke(
          strokeProperties: rawStroke.strokeProperties,
          pageIndex: rawStroke.pageIndex,
          penType: rawStroke.penType,
          radius: circle.$1,
          center: circle.$2,
        );
    }
  }
}
