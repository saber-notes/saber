import 'dart:math' hide atan2;

import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/data/extensions/point_extensions.dart';
import 'package:saber/data/fast_math.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/data/tools/stroke_properties.dart';

class Stroke {
  @visibleForTesting
  final List<Point> points = [];

  /// Note that [isEmpty] is also true if there is only one point,
  /// since it was just initially added in [onDrawStart].
  bool get isEmpty => points.length <= 1;

  int pageIndex;
  final String penType;

  late final StrokeProperties strokeProperties;

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

  void shift(Offset offset) {
    if (offset == Offset.zero) return;

    for (int i = 0; i < points.length; i++) {
      points[i] += offset;
    }

    _polygonNeedsUpdating = true;
  }

  Stroke({
    required this.strokeProperties,
    required this.pageIndex,
    required this.penType,
  });

  Stroke.fromJson(Map<String, dynamic> json, int fileVersion) :
        _isComplete = json['f'],
        pageIndex = json['i'] ?? 0,
        penType = json['ty'] ?? (Pen).toString() {
    strokeProperties = StrokeProperties.fromJson(json);

    final offset = Offset(json['ox'] ?? 0, json['oy'] ?? 0);
    final pointsJson = json['p'] as List<dynamic>;
    if(fileVersion >= 13) {
      points.insertAll(0, pointsJson.map((point) => PointExtensions.fromBsonBinary(
        json: point,
        offset: offset,
      )).toList());
    } else {
      // ignore: deprecated_member_use_from_same_package
      points.insertAll(0, pointsJson.map((point) => PointExtensions.fromJson(
        json: Map<String, dynamic>.from(point),
        offset: offset,
      )).toList());
    }
  }
  // json keys should not be the same as the ones in the StrokeProperties class
  Map<String, dynamic> toJson() {
    return {
      'f': isComplete,
      'p': (){
        if (isStraightLine && points.length > 1) {
          Point last = snapLineToRightAngle(points.first, points.last);
          return [
            points.first.toBsonBinary(),
            last.toBsonBinary(),
            last.toBsonBinary(),
          ];
        }
        return points.map((Point point) => point.toBsonBinary()).toList();
      }(),
      'i': pageIndex,
      'ty': penType.toString(),
    }..addAll(strokeProperties.toJson());
  }

  void addPoint(Offset point, [ double? pressure ]) {
    if (!strokeProperties.pressureEnabled) pressure = null;

    if (pressure != null) strokeProperties.simulatePressure = false;

    points.add(Point(point.dx, point.dy, pressure ?? 0.5));
    _polygonNeedsUpdating = true;
  }

  void popFirstPoint() {
    points.removeAt(0);
    _polygonNeedsUpdating = true;
  }

  /// Points that are closer than this
  /// threshold multiplied by the stroke's size
  /// will be counted as duplicates.
  static const double _optimisePointsThreshold = 0.1;
  /// Removes points that are too close together. See [_optimisePointsThreshold].
  /// 
  /// This function is idempotent, so running it multiple times
  /// will not change the result.
  /// 
  /// This function does not change [_polygonNeedsUpdating].
  void optimisePoints({double thresholdMultiplier = _optimisePointsThreshold}) {
    if (points.length <= 3) return;

    final minDistance = strokeProperties.size * _optimisePointsThreshold;

    for (int i = 1; i < points.length - 1; i++) {
      final point = points[i];
      final prev = points[i - 1];
      final next = points[i + 1];

      if (sqrDistBetweenPoints(prev, point) < minDistance * minDistance &&
          sqrDistBetweenPoints(point, next) < minDistance * minDistance) {
        points.removeAt(i);
        i--;
      }
    }
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

    final simulatePressure = strokeProperties.simulatePressure && strokeProperties.pressureEnabled;
    final rememberSimulatedPressure = simulatePressure && isComplete;

    final polygon = getStroke(
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
      simulatePressure: simulatePressure,
      rememberSimulatedPressure: rememberSimulatedPressure,
    )
      .map((Point point) => Offset(point.x, point.y))
      .toList(growable: false);

    if (rememberSimulatedPressure) {
      strokeProperties.simulatePressure = false;
      // Remove points with pressure 0.5 because they're not needed anymore
      points.removeWhere((point) => point.p == 0.5);
      // Remove points that are too close together
      optimisePoints();
      // Get polygon again with slightly different input
      return _getPolygon();
    }

    return polygon;
  }

  String toSvgPath(Size pageSize) {
    String toSvgPoint(Offset point) {
      return '${point.dx} '
          '${pageSize.height - point.dy}';
    }

    if (polygon.isEmpty) {
      return '';
    } else {
      return "M${polygon.map((point) => toSvgPoint(point)).join("L")}";
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

  bool isLineRoughlyStraight() => deviationFromStraightLine() < 0.5;

  /// Calculates something like the RMSD (root mean square deviation) of the
  /// points from a straight line between the first and last points.
  ///
  /// The lower the value, the more straight the line is.
  ///
  /// Note that we've taken some shortcuts for performance:
  ///  - We don't take the square root at the end.
  ///  - We ignore [offset] since it makes no difference.
  @visibleForTesting
  double deviationFromStraightLine() {
    if (points.length < 2) return double.infinity;

    final start = points.first;
    final end = points.last;

    final dx = end.x - start.x;
    final dy = end.y - start.y;
    if (dx == 0 && dy == 0) {
      // TODO: check if the stroke is a polygon if the start and end points are close together
      return double.infinity;
    }

    final length = sqrt(dx * dx + dy * dy);
    final unit = Offset(dx / length, dy / length);

    double sum = 0;
    for (final point in points) {
      final t = (point.x - start.x) * unit.dx + (point.y - start.y) * unit.dy;
      final projected = Offset(start.x + t * unit.dx, start.y + t * unit.dy);
      final distance = pow(point.x - projected.dx, 2) + pow(point.y - projected.dy, 2);
      sum += distance;
    }
    return sum / points.length / strokeProperties.size / strokeProperties.size;
  }

  Stroke copy() => Stroke(
    strokeProperties: strokeProperties.copy(),
    pageIndex: pageIndex,
    penType: penType,
  )..points.addAll(points);
}
