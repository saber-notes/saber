import 'dart:math' hide atan2;

import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/data/extensions/point_extensions.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';
import 'package:saber/data/fast_math.dart';

class Stroke {
  @visibleForTesting
  final List<Point> points = [];
  int pageIndex;
  final String penType;

  late final StrokeProperties strokeProperties;

  /// All points are translated by this offset.
  Offset offset = Offset.zero;

  bool _isComplete = false;
  bool get isComplete => isStraightLine || _isComplete;
  set isComplete(bool value) {
    if (value == _isComplete) return;
    _isComplete = value;
    _polygonNeedsUpdating = true;
  }

  /// Whether to draw a straight line from the first point to the last point.
  bool _isStraightLine = false;
  bool get isStraightLine => _isStraightLine;
  set isStraightLine(bool value) {
    if (value == _isStraightLine) return;
    _isStraightLine = value;
    _polygonNeedsUpdating = true;
  }

  bool _polygonNeedsUpdating = true;

  late List<Offset> _polygon = const [];
  late Path _path = Path();
  List<Offset> get polygon {
    if (_polygonNeedsUpdating) _updatePolygon();
    return _polygon;
  }
  Path get path {
    if (_polygonNeedsUpdating) _updatePolygon();
    return _path;
  }
  void _updatePolygon() {
    _polygon = _getPolygon();
    _path = Path()..addPolygon(_polygon, true);
    _polygonNeedsUpdating = false;
  }

  Stroke({
    required this.strokeProperties,
    required this.pageIndex,
    required this.penType,
  });

  Stroke.fromJson(Map<String, dynamic> json) :
        _isComplete = json['f'],
        pageIndex = json['i'] ?? 0,
        penType = json['ty'] ?? (Pen).toString(),
        offset = Offset(json['ox'] ?? 0, json['oy'] ?? 0) {
    strokeProperties = StrokeProperties.fromJson(json);

    final List<dynamic> pointsJson = json['p'] as List<dynamic>;
    points.insertAll(0, pointsJson.map(
      (point) => PointExtensions.fromJson(Map<String, dynamic>.from(point))
    ).toList());
  }
  // json keys should not be the same as the ones in the StrokeProperties class
  Map<String, dynamic> toJson() => {
    'f': isComplete,
    'p': (){
      if (isStraightLine && points.length > 1) {
        Point last = snapLineToRightAngle(points.first, points.last);
        return [
          points.first.toJson(),
          last.toJson(),
          last.toJson(),
        ];
      }
      return points.map((Point point) => point.toJson()).toList();
    }(),
    'i': pageIndex,
    'ty': penType.toString(),
    'ox': offset.dx,
    'oy': offset.dy,
  }..addAll(strokeProperties.toJson());

  void addPoint(Size pageSize, Offset offset, [ double? pressure ]) {
    if (!strokeProperties.pressureEnabled) pressure = null;

    double size = strokeProperties.size;

    double x = max(min(offset.dx, pageSize.width + size), -size);
    double y = max(min(offset.dy, pageSize.height + size), -size);
    Point point = Point(x, y, pressure ?? 0.5);

    if (pressure != null) strokeProperties.simulatePressure = false;

    points.add(point);
    _polygonNeedsUpdating = true;
  }

  List<Offset> _getPolygon() {
    final List<Point> points;
    if (isStraightLine) {
      Point last = snapLineToRightAngle(this.points.first, this.points.last);
      points = [
        this.points.first,
        last,
        last,
      ];
    } else {
      points = this.points;
    }

    return getStroke(
      points,
      isComplete: isComplete,

      size: strokeProperties.size,
      thinning: strokeProperties.thinning,
      smoothing: strokeProperties.smoothing,
      streamline: strokeProperties.streamline,
      taperStart: strokeProperties.taperStart,
      taperEnd: strokeProperties.taperEnd,
      capStart: strokeProperties.capStart,
      capEnd: strokeProperties.capEnd,
      simulatePressure: strokeProperties.simulatePressure && strokeProperties.pressureEnabled,
    )
      .map((Point point) => Offset(point.x, point.y))
      .toList(growable: false);
  }

  String toSvgPath(Size pageSize) {
    String toSvgPoint(Offset offset) {
      return '${offset.dx} ${pageSize.height - offset.dy}';
    }

    if (polygon.isEmpty) {
      return '';
    } else {
      return "M${polygon.map((offset) => toSvgPoint(offset)).join("L")}";
    }
  }

  double get maxY {
    return points.isEmpty ? 0 : points.map((Point point) => point.y).reduce(max);
  }

  static num sqrDistBetweenPoints(Point p1, Point p2) {
    return pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2);
  }

  /// The maximum angle away from a right angle for a line to be snapped to a right angle.
  static const rightAngleThreshold = 0.1;
  /// The minimum length for a line to be snapped to a right angle.
  static const rightAngleMinLength = 10;
  /// Transforms the [last] point to be at a right angle to [first].
  static Point snapLineToRightAngle(Point first, Point last) {
    double dx = (last.x - first.x).abs(),
        dy = (last.y - first.y).abs();
    if (dx < rightAngleMinLength && dy < rightAngleMinLength) {
      return last;
    }

    double angle = diffToRightAngle(dy, dx);
    if (angle > rightAngleThreshold) {
      return last;
    } else if (dx > dy) {
      return Point(last.x, first.y);
    } else {
      return Point(first.x, last.y);
    }
  }
}
