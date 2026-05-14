/// 🤖 Generated partially with Claude Code; Google Antigravity
library;

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';

enum ResizeHandle {
  topLeft,
  topCenter,
  topRight,
  middleLeft,
  middleRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

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

  /// Returns which endpoint (0 = start, 1 = end) of a given straight line stroke
  /// is near [point], or null if none.
  int? getEndpointIndexAt(Offset point, Stroke stroke, {double radius = 20.0}) {
    if (!stroke.isStraightLineStroke) return null;
    if ((point - stroke.lineStart).distance <= radius) return 0;
    if ((point - stroke.lineEnd).distance <= radius) return 1;
    return null;
  }

  /// Returns which resize handle (if any) is near [point].
  ResizeHandle? getResizeHandleAt(Offset point, {double radius = 25.0}) {
    final bounds = path.getBounds();
    final handles = <ResizeHandle, Offset>{
      ResizeHandle.topLeft: bounds.topLeft,
      ResizeHandle.topCenter: Offset(bounds.center.dx, bounds.top),
      ResizeHandle.topRight: bounds.topRight,
      ResizeHandle.middleLeft: Offset(bounds.left, bounds.center.dy),
      ResizeHandle.middleRight: Offset(bounds.right, bounds.center.dy),
      ResizeHandle.bottomLeft: bounds.bottomLeft,
      ResizeHandle.bottomCenter: Offset(bounds.center.dx, bounds.bottom),
      ResizeHandle.bottomRight: bounds.bottomRight,
    };

    for (final entry in handles.entries) {
      if ((point - entry.value).distance <= radius) {
        return entry.key;
      }
    }
    return null;
  }
  void scalePathOnly(double scaleX, double scaleY, Offset anchor) {
    if (scaleX <= 0 || scaleY <= 0) return;
    final matrix = Matrix4.identity()
      ..translate(anchor.dx, anchor.dy)
      ..scale(scaleX, scaleY)
      ..translate(-anchor.dx, -anchor.dy);
    path = path.transform(matrix.storage);
  }
  /// Scales the selection contents by [scaleX]/[scaleY] from the given [anchor] point.
  void scaleFromAnchor(double scaleX, double scaleY, Offset anchor) {
    if (scaleX <= 0 || scaleY <= 0) return;

    // Scale the path around the anchor
    final matrix = Matrix4.identity()
      ..translate(anchor.dx, anchor.dy)
      ..scale(scaleX, scaleY)
      ..translate(-anchor.dx, -anchor.dy);
    path = path.transform(matrix.storage);

    // Scale each stroke's points around the anchor
    for (final stroke in strokes) {
      stroke.scale(scaleX, scaleY, anchor);
    }

    // Scale each image around the anchor
    for (final image in images) {
      image.scaleRect(scaleX, scaleY, anchor);
    }
  }

  /// Returns the anchor point opposite to [handle] for proportional scaling.
  Offset getOppositeAnchor(ResizeHandle handle) {
    final bounds = path.getBounds();
    return switch (handle) {
      ResizeHandle.topLeft => bounds.bottomRight,
      ResizeHandle.topCenter => Offset(bounds.center.dx, bounds.bottom),
      ResizeHandle.topRight => bounds.bottomLeft,
      ResizeHandle.middleLeft => Offset(bounds.right, bounds.center.dy),
      ResizeHandle.middleRight => Offset(bounds.left, bounds.center.dy),
      ResizeHandle.bottomLeft => bounds.topRight,
      ResizeHandle.bottomCenter => Offset(bounds.center.dx, bounds.top),
      ResizeHandle.bottomRight => bounds.topLeft,
    };
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