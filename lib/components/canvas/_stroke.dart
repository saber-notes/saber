
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

import 'canvas.dart';

class Stroke {
  List<Point> _points = [];
  Color color;
  double strokeWidth;
  bool isComplete = false;

  Stroke({
    required this.color,
    required this.strokeWidth,
  });

  addPoint(Offset offset, [ double pressure = 0.5 ]) {
    double x = max(min(offset.dx, Canvas.canvasWidth), 0);
    double y = max(min(offset.dy, Canvas.canvasHeight), 0);
    _points.add(Point(x, y, pressure));
  }

  List<Offset> getPolygon() {
    return getStroke(
      _points,
      size: strokeWidth,
      isComplete: isComplete,
    )
      .map((Point point) => Offset(point.x, point.y))
      .toList(growable: false);
  }
}
