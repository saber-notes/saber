
import 'dart:ui';

import 'package:saber/components/canvas/_stroke.dart';

import 'package:saber/data/tools/_tool.dart';

double square(double x) => x * x;
double sqrDistanceBetween(Offset p1, Offset p2) => square(p1.dx - p2.dx) + square(p1.dy - p2.dy);

class Eraser extends Tool {
  final double size;
  late final double sqrSize = square(size);

  List<Stroke> _erased = [];

  Eraser({
    this.size = 10
  });

  @override
  ToolId get toolId => ToolId.eraser;

  /// Returns any [strokes] that are close to the given [eraserPos].
  List<Stroke> checkForOverlappingStrokes(Offset eraserPos, List<Stroke> strokes) {
    final List<Stroke> overlapping = [];
    for (int i = 0; i < strokes.length; i++) {
      final Stroke stroke = strokes[i];
      if (_shouldStrokeBeErased(eraserPos, stroke, sqrSize)) {
        overlapping.add(stroke);
        _erased.add(stroke);
      }
    }
    return overlapping;
  }

  /// Returns the strokes that have been erased during this drag.
  List<Stroke> onDragEnd() {
    final List<Stroke> erased = _erased;
    _erased = [];
    return erased;
  }

  static bool _shouldStrokeBeErased(Offset eraserPos, Stroke stroke, double sqrSize) {
    if (stroke.length <= 3) {
      if (stroke.path.contains(eraserPos)) return true;
    }

    /// skip checking every few vertices for performance
    final int verticesToSkip;
    if (stroke.polygon.length < 100) {
      verticesToSkip = 0;
    } else if (stroke.polygon.length < 1000) {
      verticesToSkip = 1;
    } else {
      verticesToSkip = 2;
    }

    for (int i = 0; i < stroke.polygon.length; i += verticesToSkip + 1) {
      final Offset strokeVertex = stroke.polygon[i];
      if (sqrDistanceBetween(strokeVertex, eraserPos) <= sqrSize) return true;
    }
    return false;
  }
}
