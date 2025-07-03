import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/binary_writer.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/tools/shape_pen.dart';

class RectangleStroke extends Stroke {
  Rect rect;

  RectangleStroke({
    required super.color,
    required super.pressureEnabled,
    required super.options,
    required super.pageIndex,
    required super.page,
    required super.penType,
    required this.rect,
  }) {
    options.isComplete = true;
  }

  factory RectangleStroke.fromJson(
    Map<String, dynamic> json, {
    required int fileVersion,
    required int pageIndex,
    required HasSize page,
  }) {
    assert(json['shape'] == 'rect');
    assert(json['i'] == pageIndex || json['i'] == null);

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
      pageIndex: pageIndex,
      page: page,
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
      'c': color.toARGB32(),
    }..addAll(options.toJson());
  }

  /// Serializes a Stroke object into a compact binary format.
  @override
  void toBinary(BinaryWriter writer) {
    writer.writeString(StrokeBinaryKeys.shape,"rect");
    writer.writeInt(StrokeBinaryKeys.pageIndex,pageIndex);
    writer.writeScaledFloat(StrokeBinaryKeys.left, rect.left);
    writer.writeScaledFloat(StrokeBinaryKeys.top, rect.top);
    writer.writeScaledFloat(StrokeBinaryKeys.width, rect.width);
    writer.writeScaledFloat(StrokeBinaryKeys.height, rect.height);
    writer.writeBool(StrokeBinaryKeys.pressureEnabled,pressureEnabled);
    writer.writeInt(StrokeBinaryKeys.color,color.toARGB32());
    BinaryOptions().optionsToBinary(writer,options); // store stroke options
    // TODO: Add serialization of StrokeOptions if needed
  }

  /// Deserializes a Stroke object from binary data starting at [offset].
  factory RectangleStroke.fromBinary(BinaryReader reader,
      {required HasSize page,
      }){
    int key;

    key = reader.readKey();
    if (key != StrokeBinaryKeys.pageIndex) {
      throw Exception('StrokefromBinary no pageIndex');
    }
    final int pageIndex= reader.readIntNoKey();

    key = reader.readKey();
    if (key != StrokeBinaryKeys.left) {
      throw Exception('StrokefromBinary no left');
    }
    final double left= reader.readScaledFloat();

    key = reader.readKey();
    if (key != StrokeBinaryKeys.top) {
      throw Exception('StrokefromBinary no top');
    }
    final double top= reader.readScaledFloat();

    key = reader.readKey();
    if (key != StrokeBinaryKeys.width) {
      throw Exception('StrokefromBinary no width');
    }
    final double width= reader.readScaledFloat();

    key = reader.readKey();
    if (key != StrokeBinaryKeys.height) {
      throw Exception('StrokefromBinary no height');
    }
    final double height= reader.readScaledFloat();

    key = reader.readKey();
    if (key != StrokeBinaryKeys.pressureEnabled) {
      throw Exception('StrokefromBinary no pressureEnabled');
    }
    final bool pressureEnabled = reader.readBoolNoKey();

    key=reader.readKey();
    if (key!=StrokeBinaryKeys.color) {
      throw Exception('StrokefromBinary no color');
    }
    final Color color = reader.readColor();

    final options = BinaryOptions().optionsFromBinary(reader); // adjust this as per your needs

    return RectangleStroke(
      color: color,
      pressureEnabled: pressureEnabled,
      options: options,
      pageIndex: pageIndex,
      page: page,
      penType: (ShapePen).toString(),
      rect: Rect.fromLTWH(
        left,
        top,
        width,
        height,
      ),
    );

  }


  @override
  bool get isEmpty => rect.isEmpty;
  @override
  int get length => 100;

  /// A list of points that form the rectangle's perimeter.
  /// Each side has 24/N points.
  @override
  List<Offset> getPolygon(int N) => [
        // left side
        for (int i = 0; i < 24 / N; ++i)
          Offset(rect.left, rect.top + rect.height * i / 24),
        // bottom side
        for (int i = 0; i < 24 / N; ++i)
          Offset(rect.left + rect.width * i / 24, rect.bottom),
        // right side
        for (int i = 0; i < 24 / N; ++i)
          Offset(rect.right, rect.bottom - rect.height * i / 24),
        // top side
        for (int i = 0; i < 24 / N; ++i)
          Offset(rect.right - rect.width * i / 24, rect.top),
      ];

  /// Returns a [Path] with four lines for each side of the rectangle.
  @override
  Path getPath(List<Offset> polygon, {bool smooth = true}) =>
      Path()..addRect(rect);

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
  String toSvgPath() {
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
    super.shift(offset);
  }

  @override
  @Deprecated('We already know the shape is a rectangle.')
  RecognizedUnistroke detectShape() {
    return RecognizedUnistroke(
      DefaultUnistrokeNames.rectangle,
      1,
      originalPoints: lowQualityPolygon,
      referenceUnistrokes: default$1Unistrokes,
    );
  }

  @override
  @Deprecated('We already know the shape is a rectangle.')
  bool isStraightLine([int minLength = 0]) => false;

  @override
  RectangleStroke copy() => RectangleStroke(
        color: color,
        pressureEnabled: pressureEnabled,
        options: options.copyWith(),
        pageIndex: pageIndex,
        page: page,
        penType: penType,
        rect: rect,
      );
}
