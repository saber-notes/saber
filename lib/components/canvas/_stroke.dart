
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/point_extensions.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';

import 'canvas.dart';

class Stroke {
  final List<Point> _points = [];

  late final StrokeProperties strokeProperties;
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
    required this.strokeProperties,
  });

  Stroke.fromJson(Map<String, dynamic> json) : _isComplete = json['f'] {
    strokeProperties = StrokeProperties.fromJson(json);

    final List<dynamic> pointsJson = json['p'] as List<dynamic>;
    _points.insertAll(0, pointsJson.map(
      (point) => PointExtensions.fromJson(Map<String, dynamic>.from(point))
    ).toList());
  }
  // json keys should not be the same as the ones in the StrokeProperties class
  Map<String, dynamic> toJson() => {
    'f': isComplete,
    'p': _points.map((Point point) => point.toJson()).toList(),
  }..addAll(strokeProperties.toJson());

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
      isComplete: isComplete,

      size: strokeProperties.size,
      thinning: strokeProperties.thinning,
      smoothing: strokeProperties.smoothing,
      streamline: strokeProperties.streamline,
      taperStart: strokeProperties.taperStart,
      taperEnd: strokeProperties.taperEnd,
      capStart: strokeProperties.capStart,
      capEnd: strokeProperties.capEnd,
      simulatePressure: strokeProperties.simulatePressure,
    )
      .map((Point point) => Offset(point.x, point.y))
      .toList(growable: false);
  }

  double get maxY {
    return _points.isEmpty ? 0 : _points.map((Point point) => point.y).reduce(max);
  }

  static sqrDistBetweenPoints(Point p1, Point p2) {
    return pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2);
  }
}
