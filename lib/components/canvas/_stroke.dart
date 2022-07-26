
import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

class Stroke {
  List<Point> points = [];
  Color color;
  double strokeWidth;
  bool isComplete = false;

  Stroke({
    required this.color,
    required this.strokeWidth,
  });

  addPoint(Offset offset, [ double pressure = 0.5 ]) {
    points.add(Point(offset.dx, offset.dy, pressure));
  }

  List<Offset> getPolygon() {
    return getStroke(
      points,
      size: strokeWidth,
      isComplete: isComplete,
    )
      .map((Point point) => Offset(point.x, point.y))
      .toList(growable: false);
  }
}
