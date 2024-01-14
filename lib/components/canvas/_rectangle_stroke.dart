import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/tools/shape_pen.dart';

class RectangleStroke extends Stroke {
  Rect rect;

  RectangleStroke({
    required super.color,
    required super.pressureEnabled,
    required super.options,
    required super.pageIndex,
    required super.penType,
    required this.rect,
  }) {
    options.isComplete = true;
  }

  factory RectangleStroke.fromJson(Map<String, dynamic> json, int fileVersion) {
    assert(json['shape'] == 'rect');

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

    return RectangleStroke(
      color: color,
      pressureEnabled: json['pe'] ?? Stroke.defaultPressureEnabled,
      options: StrokeOptions.fromJson(json),
      pageIndex: json['i'] ?? 0,
      penType: json['ty'] ?? (ShapePen).toString(),
      rect: Rect.fromLTWH(
        json['rl'] ?? 0,
        json['rt'] ?? 0,
        json['rw'] ?? 0,
        json['rh'] ?? 0,
      ),
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'shape': 'rect',
      'i': pageIndex,
      'rl': rect.left,
      'rt': rect.top,
      'rw': rect.width,
      'rh': rect.height,
      'pe': pressureEnabled,
      'c': color.value,
    }..addAll(options.toJson());
  }

  @override
  bool get isEmpty => rect.isEmpty;
  @override
  int get length => 4;

  bool _polygonNeedsUpdating = true;
  late List<Offset> _polygon = const [];
  late Path _path = Path();

  /// A list of points that form the
  /// rectangle's perimeter.
  /// Each side has 25 points.
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
    _polygon = _getPolygon();
    _path = Path()..addPolygon(_polygon, true);
    _polygonNeedsUpdating = false;
  }

  List<Offset> _getPolygon() {
    final polygon = <Offset>[];
    for (int i = 0; i < 25; ++i) {
      // left side
      polygon.add(Offset(rect.left, rect.top + rect.height * i / 25));
    }
    for (int i = 0; i < 25; ++i) {
      // bottom side
      polygon.add(Offset(rect.left + rect.width * i / 25, rect.bottom));
    }
    for (int i = 0; i < 25; ++i) {
      // right side
      polygon.add(Offset(rect.right, rect.bottom - rect.height * i / 25));
    }
    for (int i = 0; i < 25; ++i) {
      // top side
      polygon.add(Offset(rect.right - rect.width * i / 25, rect.top));
    }
    return polygon;
  }

  @override
  @Deprecated('Cannot add points to a rectangle stroke.')
  void addPoint(Offset point, [double? pressure]) {
    throw UnsupportedError('Cannot add points to a rectangle stroke.');
  }

  @override
  @Deprecated('Cannot pop points from a rectangle stroke.')
  void popFirstPoint() {
    throw UnsupportedError('Cannot pop points from a rectangle stroke.');
  }

  @override
  void optimisePoints({double thresholdMultiplier = 0}) {
    // no-op
  }

  @override
  String toSvgPath(Size pageSize) {
    return 'M${rect.left},${rect.top} '
        'L${rect.right},${rect.top} '
        'L${rect.right},${rect.bottom} '
        'L${rect.left},${rect.bottom} '
        'Z';
  }

  @override
  double get maxY {
    return rect.bottom;
  }

  @override
  void shift(Offset offset) {
    rect = rect.shift(offset);
    _polygonNeedsUpdating = true;
  }

  @override
  @Deprecated('We already know the shape is a rectangle.')
  RecognizedUnistroke detectShape() {
    return RecognizedUnistroke(
      DefaultUnistrokeNames.rectangle,
      1,
      originalPoints: polygon,
      referenceUnistrokes: default$1Unistrokes,
    );
  }

  @override
  RectangleStroke copy() => RectangleStroke(
        color: color,
        pressureEnabled: pressureEnabled,
        options: options.copyWith(),
        pageIndex: pageIndex,
        penType: penType,
        rect: rect,
      );
}
