import 'package:flutter/material.dart';
import 'package:interactive_shape_recognition/interactive_shape_recognition.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/tools/shape_pen.dart';
import 'package:saber/data/tools/stroke_properties.dart';

class CircleStroke extends Stroke {
  final Offset center;
  final double radius;

  CircleStroke({
    required super.strokeProperties,
    required super.pageIndex,
    required super.penType,
    required this.center,
    required this.radius,
  }) {
    isComplete = true;
  }

  factory CircleStroke.fromJson(Map<String, dynamic> json, int fileVersion) {
    assert(json['shape'] == 'circle');
    return CircleStroke(
      strokeProperties: StrokeProperties.fromJson(json),
      pageIndex: json['i'] ?? 0,
      penType: json['ty'] ?? (ShapePen).toString(),
      center: Offset(
        json['cx'] ?? 0,
        json['cy'] ?? 0,
      ),
      radius: json['r'] ?? 0,
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'shape': 'circle',
      'i': pageIndex,
      'cx': center.dx,
      'cy': center.dy,
      'r': radius,
    }..addAll(strokeProperties.toJson());
  }

  @override
  bool get isEmpty => radius <= 0;
  @override
  int get length => 100;

  @override
  @Deprecated('Cannot add points to a circle stroke.')
  void addPoint(Offset point, [double? pressure]) {
    throw UnsupportedError('Cannot add points to a circle stroke.');
  }

  @override
  @Deprecated('Cannot pop points from a circle stroke.')
  void popFirstPoint() {
    throw UnsupportedError('Cannot pop points from a circle stroke.');
  }

  @override
  void optimisePoints({double thresholdMultiplier = 0}) {
    // no-op
  }

  @override
  String toSvgPath(Size pageSize) {
    return 'M${center.dx},${center.dy} m${-radius},0 a$radius,$radius 0 1,0 ${radius * 2},0 a$radius,$radius 0 1,0 ${-radius * 2},0';
  }

  @override
  double get maxY {
    return center.dy + radius;
  }

  @override
  @Deprecated('We already know the shape is a circle.')
  DetectedShape getDetectedShape() {
    final rect = Rect.fromCircle(center: center, radius: radius);
    return DetectedShape(
      shape: Shape.circle,
      maybeCircle: true,
      maybeLine: false,
      maybeRectangle: false,
      enclosingRect: [
        rect.topLeft,
        rect.topRight,
        rect.bottomRight,
        rect.bottomLeft,
      ],
      convexHull: [
        rect.topLeft,
        rect.topRight,
        rect.bottomRight,
        rect.bottomLeft,
      ],
      firstPoint: rect.topCenter,
      lastPoint: rect.bottomCenter,
      rLenPch: 0,
      rThinness: 0,
      rAltAch: 0,
      rPchPer: 0,
    );
  }

  @override
  CircleStroke copy() => CircleStroke(
    strokeProperties: strokeProperties.copy(),
    pageIndex: pageIndex,
    penType: penType,
    center: center,
    radius: radius,
  );

  // TODO(adil192): Add HighlighterStroke class and move canvas drawing logic to Stroke.
}
