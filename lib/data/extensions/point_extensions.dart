import 'dart:typed_data';
import 'dart:ui' show Offset;

import 'package:bson/bson.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

extension PointExtensions on PointVector {
  @Deprecated(
    'Use fromBsonBinary instead; fromJson is only for backward compatibility',
  )
  static Point fromJson({
    required Map<String, dynamic> json,
    Offset offset = .zero,
  }) => Point(json['x'] + offset.dx, json['y'] + offset.dy, json['p']);

  static PointVector fromBsonBinary({
    required BsonBinary json,
    Offset offset = .zero,
  }) {
    final point = json.byteList.buffer.asFloat32List();
    return PointVector(
      point[0] + offset.dx,
      point[1] + offset.dy,
      point.length == 2 ? null : point[2],
    );
  }

  BsonBinary toBsonBinary() {
    final Float32List point = Float32List.fromList([
      x,
      y,
      if (pressure != null) pressure!,
    ]);
    return BsonBinary.from(point.buffer.asUint8List());
  }

  PointVector operator +(Offset offset) =>
      PointVector(x + offset.dx, y + offset.dy, pressure);
}
