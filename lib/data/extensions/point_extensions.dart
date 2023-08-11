import 'dart:typed_data';
import 'dart:ui' show Offset;

import 'package:bson/bson.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

extension PointExtensions on Point {
  @Deprecated('Use fromBsonBinary instead; fromJson is only for backward compatibility')
  static Point fromJson({
    required Map<String, dynamic> json,
    Offset offset = Offset.zero,
  }) => Point(
    json['x'] + offset.dx,
    json['y'] + offset.dy,
    json['p'] ?? 0.5,
  );

  static Point fromBsonBinary({
    required BsonBinary json,
    Offset offset = Offset.zero,
  }) {
    Float32List point = json.byteList.buffer.asFloat32List();
    return Point(
      point[0] + offset.dx,
      point[1] + offset.dy,
      point.length == 2 ? 0.5 : point[2],
    );
  }

  BsonBinary toBsonBinary() {
    final Float32List point = Float32List.fromList([
      x,
      y,
      if (p != 0.5) p,
    ]);
    return BsonBinary.from(point.buffer.asUint8List());
  }

  Point operator +(Offset offset) => Point(
    x + offset.dx,
    y + offset.dy,
    p,
  );
}
