
import 'package:flutter/material.dart';

import '../_stroke.dart';
import 'stroke_properties.dart';
import '_tool.dart';

class Pen extends Tool {
  Stroke? currentStroke;
  StrokeProperties strokeProperties = StrokeProperties();

  Pen.fountainPen();

  onDragStart(Offset position, int pageIndex, double? pressure) {
    currentStroke = Stroke(
      strokeProperties: strokeProperties,
      pageIndex: pageIndex,
    )..addPoint(position, pressure);
  }

  onDragUpdate(Offset position, double? pressure) {
    currentStroke!.addPoint(position, pressure);
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
