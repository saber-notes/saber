/// 🤖 Generated with Claude Code; Google Antigravity
library;

import 'dart:math';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:sbn/has_size.dart';

class EllipseStroke extends Stroke {
  Offset center;
  double radiusX;
  double radiusY;

  EllipseStroke({
    required super.color,
    required super.pressureEnabled,
    required super.options,
    required super.pageIndex,
    required super.page,
    required super.toolId,
    required this.center,
    required this.radiusX,
    required this.radiusY,
  }) {
    options.isComplete = true;
  }

  factory EllipseStroke.fromJson(
    Map<String, dynamic> json, {
    required int fileVersion,
    required int pageIndex,
    required HasSize page,
  }) {
    assert(json['shape'] == 'ellipse');
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

    return EllipseStroke(
      color: color,
      pressureEnabled: json['pe'] ?? Stroke.defaultPressureEnabled,
      options: StrokeOptions.fromJson(json),
      pageIndex: pageIndex,
      page: page,
      toolId: .parsePenType(json['ty'], fallback: .shapePen),
      center: Offset(json['cx'] ?? 0, json['cy'] ?? 0),
      radiusX: json['rx'] ?? 0,
      radiusY: json['ry'] ?? 0,
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'shape': 'ellipse',
      'i': pageIndex,
      'cx': center.dx,
      'cy': center.dy,
      'rx': radiusX,
      'ry': radiusY,
      'pe': pressureEnabled,
      'c': color.toARGB32(),
    }..addAll(options.toJson());
  }

  @override
  bool get isEmpty => radiusX <= 0 || radiusY <= 0;
  @override
  int get length => 25;

  /// A list of 24/N points that form an ellipse
  /// with [center], [radiusX] and [radiusY].
  @override
  List<Offset> getPolygon({required StrokeQuality quality}) {
    final numPoints = 24 ~/ quality.N;
    return List.generate(numPoints, (i) => i / numPoints * 2 * pi)
        .map((radians) => Offset(cos(radians), sin(radians)))
        .map((unitDir) => Offset(
              unitDir.dx * radiusX + center.dx,
              unitDir.dy * radiusY + center.dy,
            ))
        .toList();
  }

  /// Returns a [Path] that forms an ellipse with [center], [radiusX] and [radiusY].
  @override
  Path getPath(List<Offset> polygon, {bool smooth = true}) =>
      Path()..addOval(Rect.fromCenter(
        center: center,
        width: radiusX * 2,
        height: radiusY * 2,
      ));

  @override
  @Deprecated('Cannot add points to an ellipse stroke.')
  void addPoint(Offset point, [double? pressure]) {
    throw UnsupportedError('Cannot add points to an ellipse stroke.');
  }

  @override
  @Deprecated('Cannot pop points from an ellipse stroke.')
  void popFirstPoint() {
    throw UnsupportedError('Cannot pop points from an ellipse stroke.');
  }

  @override
  void optimisePoints({double thresholdMultiplier = 0}) {
    // no-op
  }

  @override
  String toSvgPath() {
    return 'M${center.dx},${center.dy} '
        'm${-radiusX},0 '
        'a$radiusX,$radiusY 0 1,0 ${radiusX * 2},0 '
        'a$radiusX,$radiusY 0 1,0 ${-radiusX * 2},0';
  }

  @override
  double get maxY {
    return center.dy + radiusY;
  }

  @override
  void shift(Offset offset) {
    center += offset;
    super.shift(offset);
  }

  @override
  @Deprecated('We already know the shape is an ellipse.')
  RecognizedUnistroke detectShape() {
    return RecognizedUnistroke(
      DefaultUnistrokeNames.circle,
      1,
      originalPoints: lowQualityPolygon,
      referenceUnistrokes: default$1Unistrokes,
    );
  }

  @override
  @Deprecated('We already know the shape is an ellipse.')
  bool isStraightLine([int minLength = 0]) => false;

  @override
  EllipseStroke copy() => EllipseStroke(
    color: color,
    pressureEnabled: pressureEnabled,
    options: options.copyWith(),
    pageIndex: pageIndex,
    page: page,
    toolId: toolId,
    center: center,
    radiusX: radiusX,
    radiusY: radiusY,
  );
}