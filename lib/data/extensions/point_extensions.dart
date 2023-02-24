
import 'package:perfect_freehand/perfect_freehand.dart';

extension PointExtensions on Point {
  static Point fromJson(Map<String, dynamic> json) => Point(
    json['x'],
    json['y'],
    json['p']
  );

  Map<String, dynamic> toJson() => {
    'x': x,
    'y': y,
    'p': p,
  };
}
