
import 'dart:ui';

import 'package:saber/components/canvas/_stroke.dart';

import 'package:saber/components/canvas/tools/_tool.dart';

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

  /// Returns the indices of any [strokes] that are close to the given [eraserPos].
  List<int> checkForOverlappingStrokes(Offset eraserPos, List<Stroke> strokes) {
    final List<int> indices = [];
    for (int i = 0; i < strokes.length; i++) {
      final Stroke stroke = strokes[i];
      if (_shouldStrokeBeErased(eraserPos, stroke, sqrSize)) {
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

  static bool _shouldStrokeBeErased(Offset eraserPos, Stroke stroke, double sqrSize) {
    if (stroke.path.contains(eraserPos - stroke.offset)) return true;

    for (Offset strokeVertex in stroke.polygon) {
      Offset translated = strokeVertex + stroke.offset;
      if (sqrDistanceBetween(translated, eraserPos) <= sqrSize) return true;
    }

    return false;
  }
}
