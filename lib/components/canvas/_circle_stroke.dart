import 'dart:math';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/tools/shape_pen.dart';

class CircleStroke extends Stroke {
  Offset center;
  double radius;

  CircleStroke({
    required super.color,
    required super.pressureEnabled,
    required super.options,
    required super.pageIndex,
    required super.penType,
    required this.center,
    required this.radius,
  }) {
    options.isComplete = true;
  }

  factory CircleStroke.fromJson(Map<String, dynamic> json, int fileVersion) {
    assert(json['shape'] == 'circle');

    final Color color;
    switch (json['c']) {
      case (int value):
        color = Color(value);
      case (Int64 value):
        color = Color(value.toInt());
      case null:
        color = Stroke.defaultColor;
      default:
        throw Exception(
            'Invalid color value: (${json['c'].runtimeType}) ${json['c']}');
    }

    return CircleStroke(
      color: color,
      pressureEnabled: json['pe'] ?? Stroke.defaultPressureEnabled,
      options: StrokeOptions.fromJson(json),
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
      'pe': pressureEnabled,
      'c': color.value,
    }..addAll(options.toJson());
  }

  @override
  bool get isEmpty => radius <= 0;
  @override
  int get length => 100;

  bool _polygonNeedsUpdating = true;
  late List<Offset> _polygon = const [];
  late Path _path = Path();

  /// A list of 25 points that form a circle
  /// with [center] and [radius].
  @override
  List<Offset> get polygon {
    if (_polygonNeedsUpdating) _updatePolygon();
    return _polygon;
  }

  @override
  Path get path {
    if (_polygonNeedsUpdating) _updatePolygon();
    return _path;
  }

  void _updatePolygon() {
    _polygon = List.generate(25, (i) => i / 25 * 2 * pi)
        .map((radians) => Offset(cos(radians), sin(radians)))
        .map((unitDir) => unitDir * radius + center)
        .toList();
    _path = Path()..addPolygon(_polygon, true);
    _polygonNeedsUpdating = false;
  }

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
  void shift(Offset offset) {
    center += offset;
    _polygonNeedsUpdating = true;
  }

  @override
  @Deprecated('We already know the shape is a circle.')
  RecognizedUnistroke detectShape() {
    return RecognizedUnistroke(
      DefaultUnistrokeNames.circle,
      1,
      originalPoints: polygon,
      referenceUnistrokes: default$1Unistrokes,
    );
  }

  @override
  CircleStroke copy() => CircleStroke(
        color: color,
        pressureEnabled: pressureEnabled,
        options: options.copyWith(),
        pageIndex: pageIndex,
        penType: penType,
        center: center,
        radius: radius,
      );
}
