import 'dart:math';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';

class CircleStroke extends Stroke {
  Offset center;
  double radius;

  CircleStroke({
    required super.color,
    required super.pressureEnabled,
    required super.options,
    required super.pageIndex,
    required super.page,
    required super.toolId,
    required this.center,
    required this.radius,
  }) {
    options.isComplete = true;
  }

  factory CircleStroke.fromJson(
    Map<String, dynamic> json, {
    required int fileVersion,
    required int pageIndex,
    required HasSize page,
  }) {
    assert(json['shape'] == 'circle');
    assert(json['i'] == pageIndex || json['i'] == null);

    final Color color;
    switch (json['c']) {
      case (final int value):
        color = Color(value);
      case (final Int64 value):
        color = Color(value.toInt());
      case null:
        color = Stroke.defaultColor;
      default:
        throw Exception(
          'Invalid color value: (${json['c'].runtimeType}) ${json['c']}',
        );
    }

    return CircleStroke(
      color: color,
      pressureEnabled: json['pe'] ?? Stroke.defaultPressureEnabled,
      options: StrokeOptions.fromJson(json),
      pageIndex: pageIndex,
      page: page,
      toolId: .parsePenType(json['ty'], fallback: .shapePen),
      center: Offset(json['cx'] ?? 0, json['cy'] ?? 0),
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
      'c': color.toARGB32(),
    }..addAll(options.toJson());
  }

  @override
  bool get isEmpty => radius <= 0;
  @override
  int get length => 25;

  /// A list of 24/N points that form a circle
  /// with [center] and [radius].
  @override
  List<Offset> getPolygon({required StrokeQuality quality}) {
    final numPoints = 24 ~/ quality.N;
    return List.generate(numPoints, (i) => i / numPoints * 2 * pi)
        .map((radians) => Offset(cos(radians), sin(radians)))
        .map((unitDir) => unitDir * radius + center)
        .toList();
  }

  /// Returns a [Path] that forms a circle with [center] and [radius].
  @override
  Path getPath(List<Offset> polygon, {bool smooth = true}) =>
      Path()..addOval(Rect.fromCircle(center: center, radius: radius));

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
  String toSvgPath() {
    return 'M${center.dx},${center.dy} m${-radius},0 a$radius,$radius 0 1,0 ${radius * 2},0 a$radius,$radius 0 1,0 ${-radius * 2},0';
  }

  @override
  double get maxY {
    return center.dy + radius;
  }

  @override
  void shift(Offset offset) {
    center += offset;
    super.shift(offset);
  }

  @override
  @Deprecated('We already know the shape is a circle.')
  RecognizedUnistroke detectShape() {
    return RecognizedUnistroke(
      DefaultUnistrokeNames.circle,
      1,
      originalPoints: lowQualityPolygon,
      referenceUnistrokes: default$1Unistrokes,
    );
  }

  @override
  @Deprecated('We already know the shape is a circle.')
  bool isStraightLine([int minLength = 0]) => false;

  @override
  CircleStroke copy() => CircleStroke(
    color: color,
    pressureEnabled: pressureEnabled,
    options: options.copyWith(),
    pageIndex: pageIndex,
    page: page,
    toolId: toolId,
    center: center,
    radius: radius,
  );
}
