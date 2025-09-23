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
  ShapePen()
      : super(
          name: t.editor.pens.shapePen,
          sizeMin: 1,
          sizeMax: 25,
          sizeStep: 1,
          icon: shapePenIcon,
          options: stows.lastShapePenOptions.value,
          pressureEnabled: false,
          color: Color(stows.lastShapePenColor.value),
          toolId: ToolId.shapePen,
        );

  static final log = Logger('ShapePen');

  static const IconData shapePenIcon = FontAwesomeIcons.shapes;

  static RecognizedUnistroke? detectedShape;
  void _detectShape() {
    detectedShape = Pen.currentStroke?.detectShape();
  }

  static Timer? _detectShapeDebouncer;
  static var debounceDuration = getDebounceFromPref();
  static Duration getDebounceFromPref() {
    assert(stows.shapeRecognitionDelay.loaded);
    final ms = stows.shapeRecognitionDelay.value;
    if (ms < 0) {
      return const Duration(hours: 1);
    } else {
      return Duration(milliseconds: ms);
    }
  }

  @override
  void onDragUpdate(Offset position, double? pressure) {
    super.onDragUpdate(position, pressure);

    final isPreviewEnabled = debounceDuration < const Duration(hours: 1);
    final isTimerActive = _detectShapeDebouncer?.isActive ?? false;
    if (isPreviewEnabled && !isTimerActive) {
      _detectShapeDebouncer = Timer(debounceDuration, _detectShape);
    }
  }

  @override
  Stroke? onDragEnd() {
    _detectShapeDebouncer?.cancel();
    _detectShapeDebouncer = null;
    _detectShape();

    final rawStroke = super.onDragEnd();
    if (rawStroke == null) return null;
    assert(rawStroke.options.isComplete == true);

    final detectedShape = ShapePen.detectedShape;
    ShapePen.detectedShape = null;

    if (detectedShape == null) return rawStroke;

    switch (detectedShape.name) {
      case null:
        log.info('Detected unknown shape');
        return rawStroke;
      case DefaultUnistrokeNames.line:
        log.info('Detected line');
        return rawStroke..convertToLine();
      case DefaultUnistrokeNames.rectangle:
        final rect = detectedShape.convertToRect();
        log.info('Detected rectangle: $rect');
        return RectangleStroke(
          color: color,
          pressureEnabled: pressureEnabled,
          options: rawStroke.options,
          pageIndex: rawStroke.pageIndex,
          page: rawStroke.page,
          penType: rawStroke.penType,
          rect: rect,
        );
      case DefaultUnistrokeNames.circle:
        final (center, radius) = detectedShape.convertToCircle();
        log.info('Detected circle: c=$center, r=$radius');
        return CircleStroke(
          color: color,
          pressureEnabled: pressureEnabled,
          options: rawStroke.options,
          pageIndex: rawStroke.pageIndex,
          page: rawStroke.page,
          penType: rawStroke.penType,
          radius: radius,
          center: center,
        );
      case DefaultUnistrokeNames.triangle:
      case DefaultUnistrokeNames.star:
        final polygon = detectedShape.convertToCanonicalPolygon();
        log.info('Detected ${detectedShape.name}');
        return Stroke(
          color: color,
          pressureEnabled: pressureEnabled,
          options: rawStroke.options,
          pageIndex: rawStroke.pageIndex,
          page: rawStroke.page,
          penType: rawStroke.penType,
        )..addPoints(polygon);
    }
  }
}
