
import 'dart:ui';

import 'package:saber/components/canvas/_stroke.dart';

import '_tool.dart';

double square(double x) => x * x;
double sqrDistanceBetween(Offset p1, Offset p2) => square(p1.dx - p2.dx) + square(p1.dy - p2.dy);

class Eraser extends Tool {
  final double sqrSize;

  List<Stroke> _erased = [];

  Eraser([ double size = 10 ]) : sqrSize = square(size);

  /// Returns the indices of any [strokes] that are close to the given [eraserPos].
  List<int> checkForOverlappingStrokes(int pageIndex, Offset eraserPos, List<Stroke> strokes) {
    final List<int> indices = [];
    for (int i = 0; i < strokes.length; i++) {
      final Stroke stroke = strokes[i];
      if (stroke.pageIndex != pageIndex) continue;
      if (stroke.polygon.any((strokeVertex) => sqrDistanceBetween(strokeVertex, eraserPos) < sqrSize)) {
        _erased.add(stroke);
        indices.add(i);
      }
    }
    return indices;
  }

  /// Returns the strokes that have been erased during this drag.
  List<Stroke> onDragEnd() {
    final List<Stroke> erased = _erased;
    _erased = [];
    return erased;
  }
}
