
import 'package:flutter/material.dart';

import '../_stroke.dart';
import 'stroke_properties.dart';
import '_tool.dart';

class Pen extends Tool {
  Stroke? currentStroke;
  StrokeProperties strokeProperties = StrokeProperties();

  Pen.fountainPen();

  onDragStart(Offset position) {
    currentStroke = Stroke(
      strokeProperties: strokeProperties,
    )..addPoint(position);
  }

  onDragUpdate(Offset position) {
    currentStroke!.addPoint(position);
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
