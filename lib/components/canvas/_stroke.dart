import 'dart:math';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/data/extensions/point_extensions.dart';
import 'package:saber/data/tools/pen.dart';

class Stroke {
  static final log = Logger('Stroke');

  @visibleForTesting
  final List<PointVector> points = [];

  /// Note that [isEmpty] is also true if there is only one point,
  /// since it was just initially added in [onDrawStart].
  bool get isEmpty => points.length <= 1;
  int get length => points.length;

  int pageIndex;
  final String penType;

  static const defaultColor = Colors.black;
  static const defaultPressureEnabled = true;

  Color color;
  bool pressureEnabled;
  final StrokeOptions options;

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

  void markPolygonNeedsUpdating() {
    _polygonNeedsUpdating = true;
  }

  Stroke({
    required this.color,
    required this.pressureEnabled,
    required this.options,
    required this.pageIndex,
    required this.penType,
  });

  factory Stroke.fromJson(Map<String, dynamic> json, int fileVersion) {
    switch (json['shape'] as String?) {
      case null:
        break;
      case 'circle':
        return CircleStroke.fromJson(json, fileVersion);
      case 'rect':
        return RectangleStroke.fromJson(json, fileVersion);
      default:
        log.severe('Unknown shape: ${json['shape']}');
    }

    final options = StrokeOptions.fromJson(json);
    final pressureEnabled = json['pe'] ?? defaultPressureEnabled;

    final Color color;
    switch (json['c']) {
      case (int value):
        color = Color(value);
      case (Int64 value):
        color = Color(value.toInt());
      case null:
        color = defaultColor;
      default:
        throw Exception(
            'Invalid color value: (${json['c'].runtimeType}) ${json['c']}');
    }

    final offset = Offset(json['ox'] ?? 0, json['oy'] ?? 0);
    final pointsJson = json['p'] as List<dynamic>;
    final Iterable<PointVector> points;
    if (fileVersion >= 13) {
      points = pointsJson.map((point) => PointExtensions.fromBsonBinary(
            json: point,
            offset: offset,
          ));
    } else {
      // ignore: deprecated_member_use_from_same_package
      points = pointsJson.map((point) => PointExtensions.fromJson(
            json: Map<String, dynamic>.from(point),
            offset: offset,
          ));
    }

    return Stroke(
      color: color,
      pressureEnabled: pressureEnabled,
      options: options,
      pageIndex: json['i'] ?? 0,
      penType: json['ty'] ?? (Pen).toString(),
    )..points.addAll(points);
  }
  // json keys should not be the same as the ones in the StrokeProperties class
  Map<String, dynamic> toJson() {
    return {
      'shape': null,
      'p': points.map((PointVector point) => point.toBsonBinary()).toList(),
      'i': pageIndex,
      'ty': penType,
      'pe': pressureEnabled,
      'c': color.value,
    }..addAll(options.toJson());
  }

  void addPoint(Offset point, [double? pressure]) {
    if (!pressureEnabled) {
      pressure = null;
    } else if (pressure != null) {
      options.simulatePressure = false;
    }

    points.add(PointVector(point.dx, point.dy, pressure));
    _polygonNeedsUpdating = true;
  }

  void addPoints(List<Offset> points) {
    for (final point in points) {
      addPoint(point);
    }
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

    final minDistance = options.size * thresholdMultiplier;

    // Remove points with null pressure because they were duplicates
    points.removeWhere((point) => point.pressure == null);

    for (int i = 1; i < points.length - 1; i++) {
      final point = points[i];
      final prev = points[i - 1];
      final next = points[i + 1];

      if (prev.distanceSquaredTo(point) < minDistance * minDistance &&
          point.distanceSquaredTo(next) < minDistance * minDistance) {
        points.removeAt(i);
        i--;
      }
    }
  }

  List<Offset> _getPolygon() {
    if (!pressureEnabled) {
      options.simulatePressure = false;
    }
    final rememberSimulatedPressure =
        options.simulatePressure && options.isComplete;

    final polygon = getStroke(
      points,
      options: options,
      rememberSimulatedPressure: rememberSimulatedPressure,
    ).toList(growable: false);

    if (rememberSimulatedPressure) {
      // Ensure we don't simulate pressure again
      options.simulatePressure = false;
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
    return points.isEmpty ? 0 : points.map((point) => point.y).reduce(max);
  }

  RecognizedUnistroke? detectShape() {
    if (points.length < 3) return null;
    return recognizeUnistroke(
      points.map((point) => Offset(point.x, point.y)).toList(),
    );
  }

  Stroke copy() => Stroke(
        color: color,
        pressureEnabled: pressureEnabled,
        options: options.copyWith(),
        pageIndex: pageIndex,
        penType: penType,
      )..points.addAll(points);
}
