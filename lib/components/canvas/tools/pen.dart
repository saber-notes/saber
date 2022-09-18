
import 'package:flutter/material.dart';
import 'package:saber/data/editor/editor_core_info.dart';

import '../_stroke.dart';
import 'stroke_properties.dart';
import '_tool.dart';

class Pen extends Tool {

  Pen.fountainPen();

  Stroke? currentStroke;
  StrokeProperties strokeProperties = StrokeProperties();

  static late Pen currentPen;

  onDragStart(EditorCoreInfo context, Offset position, int pageIndex, double? pressure) {
    currentStroke = Stroke(
      strokeProperties: strokeProperties.copy(),
      pageIndex: pageIndex,
    )..addPoint(context, position, pressure);
  }

  onDragUpdate(EditorCoreInfo context, Offset position, double? pressure) {
    currentStroke!.addPoint(context, position, pressure);
  }

  Stroke onDragEnd() {
    final Stroke stroke = currentStroke!..isComplete = true;
    currentStroke = null;
    return stroke;
  }

  getCurrentStroke() {
    return currentStroke;
  }
}
