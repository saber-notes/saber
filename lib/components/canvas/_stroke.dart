
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/point_extensions.dart';

import 'canvas.dart';

class Stroke {
  final List<Point> _points = [];

  Color _color;
  Color get color => _color;
  set color(Color value) { _color = value; _polygonNeedsUpdating = true; }
  double _strokeWidth;
  double get strokeWidth => _strokeWidth;
  set strokeWidth(double value) { _strokeWidth = value; _polygonNeedsUpdating = true; }
  bool _isComplete = false;
  bool get isComplete => _isComplete;
  set isComplete(bool value) { _isComplete = value; _polygonNeedsUpdating = true; }

  bool _polygonNeedsUpdating = true;

  List<Offset>? _polygon;
  List<Offset> get polygon {
    if (_polygonNeedsUpdating) {
      _polygon = _getPolygon();
      _polygonNeedsUpdating = false;
    }
    return _polygon!;
  }

  Stroke({
    required Color color,
    required double strokeWidth,
  }): _color = color, _strokeWidth = strokeWidth;

  Stroke.fromJson(Map<String, dynamic> json) :
        _color = Color(json['c']),
        _strokeWidth = json['w'],
        _isComplete = json['f']
  {
    final List<dynamic> pointsJson = json['p'] as List<dynamic>;
    _points.insertAll(0, pointsJson.map(
      (point) => PointExtensions.fromJson(Map<String, dynamic>.from(point))
    ).toList());
  }
  Map<String, dynamic> toJson() => {
    'c': color.value,
    'w': strokeWidth,
    'f': isComplete,
    'p': _points.map((Point point) => point.toJson()).toList(),
  };

  addPoint(Offset offset, [ double pressure = 0.5 ]) {
    double x = max(min(offset.dx, Canvas.canvasWidth), 0);
    double y = max(min(offset.dy, Canvas.canvasHeight), 0);
    Point point = Point(x, y, pressure);

    _points.add(point);
    _polygonNeedsUpdating = true;
  }

  List<Offset> _getPolygon() {
    return getStroke(
      _points,
      size: strokeWidth,
      isComplete: isComplete,
      smoothing: 0,
    )
      .map((Point point) => Offset(point.x, point.y))
      .toList(growable: false);
  }

  static sqrDistBetweenPoints(Point p1, Point p2) {
    return pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2);
  }
}
