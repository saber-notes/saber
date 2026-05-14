/// 🤖 Generated with Claude Code
library;

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:sbn/has_size.dart';

class PolygonStroke extends Stroke {
  final List<Offset> vertices;

  PolygonStroke({
    required super.color,
    required super.pressureEnabled,
    required super.options,
    required super.pageIndex,
    required super.page,
    required super.toolId,
    required this.vertices,
  }) : assert(vertices.length >= 3) {
    options.isComplete = true;
  }

  factory PolygonStroke.fromJson(
    Map<String, dynamic> json, {
    required int fileVersion,
    required int pageIndex,
    required HasSize page,
  }) {
    assert(json['shape'] == 'polygon');
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

    final verticesJson = json['v'] as List<dynamic>;
    final offset = Offset(json['ox'] ?? 0, json['oy'] ?? 0);
    final vertices = verticesJson.map((point) {
      if (point is List<dynamic> && point.length >= 2) {
        return Offset(
          (point[0] as num).toDouble() + offset.dx,
          (point[1] as num).toDouble() + offset.dy,
        );
      }
      return Offset.zero;
    }).toList();

    return PolygonStroke(
      color: color,
      pressureEnabled: json['pe'] ?? Stroke.defaultPressureEnabled,
      options: StrokeOptions.fromJson(json),
      pageIndex: pageIndex,
      page: page,
      toolId: .parsePenType(json['ty'], fallback: .shapePen),
      vertices: vertices,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'shape': 'polygon',
      'i': pageIndex,
      'v': vertices
          .map((vertex) => [vertex.dx, vertex.dy])
          .toList(),
      'pe': pressureEnabled,
      'c': color.toARGB32(),
    }..addAll(options.toJson());
  }

  @override
  bool get isEmpty => vertices.isEmpty;
  @override
  int get length => vertices.length;

  @override
  List<Offset> getPolygon({required StrokeQuality quality}) {
    // Return vertices directly — polygons have too few vertices
    // to meaningfully skip any (triangles have only 3).
    return List.from(vertices);
  }

  /// Returns a [Path] that draws straight lines between vertices,
  /// forming a closed polygon.
  @override
  Path getPath(List<Offset> polygon, {bool smooth = true}) {
    return Path()..addPolygon(polygon, true);
  }

  @override
  @Deprecated('Cannot add points to a polygon stroke.')
  void addPoint(Offset point, [double? pressure]) {
    throw UnsupportedError('Cannot add points to a polygon stroke.');
  }

  @override
  @Deprecated('Cannot pop points from a polygon stroke.')
  void popFirstPoint() {
    throw UnsupportedError('Cannot pop points from a polygon stroke.');
  }

  @override
  void optimisePoints({double thresholdMultiplier = 0}) {
    // no-op
  }

  @override
  String toSvgPath() {
    if (vertices.isEmpty) return '';
    final buffer = StringBuffer()
      ..write('M${vertices[0].dx},${vertices[0].dy}');
    for (int i = 1; i < vertices.length; i++) {
      buffer.write(' L${vertices[i].dx},${vertices[i].dy}');
    }
    buffer.write(' Z');
    return buffer.toString();
  }

  @override
  double get maxY {
    return vertices.fold<double>(0, (max, v) => v.dy > max ? v.dy : max);
  }

  @override
  void shift(Offset offset) {
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = vertices[i] + offset;
    }
    super.shift(offset);
  }

  @override
  @Deprecated('We already know the shape is a polygon.')
  RecognizedUnistroke detectShape() {
    return RecognizedUnistroke(
      vertices.length == 3
          ? DefaultUnistrokeNames.triangle
          : DefaultUnistrokeNames.star,
      1,
      originalPoints: lowQualityPolygon,
      referenceUnistrokes: default$1Unistrokes,
    );
  }

  @override
  @Deprecated('We already know the shape is a polygon.')
  bool isStraightLine([int minLength = 0]) => false;

  @override
  PolygonStroke copy() => PolygonStroke(
    color: color,
    pressureEnabled: pressureEnabled,
    options: options.copyWith(),
    pageIndex: pageIndex,
    page: page,
    toolId: toolId,
    vertices: List.from(vertices),
  );
}