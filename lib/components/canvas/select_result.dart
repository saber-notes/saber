import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';

class SelectResult {
  int pageIndex;
  final List<Stroke> strokes;
  final List<EditorImage> images;
  Path path;
  double angle; // rotation angle in radians

  SelectResult({
    required this.pageIndex,
    required this.strokes,
    required this.images,
    required this.path,
    this.angle = 0,
  });

  bool get isEmpty {
    return strokes.isEmpty && images.isEmpty;
  }

  Rect get center {
    if (strokes.isEmpty && images.isEmpty) return Rect.zero;
    final pathBounds = path.getBounds();
    return pathBounds;
  }

  /// The center point of the rotation handle (above the selection).
  Offset get rotationHandleCenter {
    final bounds = path.getBounds();
    return Offset(bounds.center.dx, bounds.top - 30);
  }

  /// Returns true if [point] is near the rotation handle.
  bool isPointNearRotationHandle(Offset point, {double radius = 20}) {
    return (point - rotationHandleCenter).distance <= radius;
  }

  void rotate(double deltaAngle) {
    if (deltaAngle == 0) return;
    angle += deltaAngle;

    // Rotate the path around its center
    final bounds = path.getBounds();
    final center = bounds.center;
    final matrix = Matrix4.identity()
      ..translate(center.dx, center.dy)
      ..rotateZ(deltaAngle)
      ..translate(-center.dx, -center.dy);
    path = path.transform(matrix.storage);

    // Rotate each stroke's points around the center
    for (final stroke in strokes) {
      stroke.rotate(deltaAngle, center);
    }

    // Rotate each image around the center
    for (final image in images) {
      image.rotate(deltaAngle, center);
    }
  }

  SelectResult copyWith({
    int? pageIndex,
    List<Stroke>? strokes,
    List<EditorImage>? images,
    Path? path,
    double? angle,
  }) {
    return SelectResult(
      pageIndex: pageIndex ?? this.pageIndex,
      strokes: strokes ?? this.strokes,
      images: images ?? this.images,
      path: path ?? this.path,
      angle: angle ?? this.angle,
    );
  }
}