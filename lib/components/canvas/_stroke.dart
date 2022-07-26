
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

import 'canvas.dart';

class Stroke {
  double minSqrDistBetweenPoints = 50;
  bool wasLastPointExtraneous = false;

  final List<Point> _points = [];
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
    Point point = Point(x, y, pressure);

    if (wasLastPointExtraneous) {
      _points.removeLast();
      wasLastPointExtraneous = false;
    }
    if (_points.isNotEmpty && sqrDistBetweenPoints(_points.last, point) < minSqrDistBetweenPoints) {
      // If the point is too close to the last point, add it for now but remove it next time.
      // This helps performance while reducing the gap between the line and user's finger.
      wasLastPointExtraneous = true;
    }

    _points.add(point);
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

  static sqrDistBetweenPoints(Point p1, Point p2) {
    return pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2);
  }
}
