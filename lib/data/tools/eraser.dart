import 'dart:ui';

import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';

import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:sbn/tool_id.dart';

class EraserResult {
  final List<Stroke> strokesToRemove;
  final List<Stroke> strokesToAdd;
  EraserResult(this.strokesToRemove, this.strokesToAdd);
}

double square(double x) => x * x;
double sqrDistanceBetween(Offset p1, Offset p2) =>
    square(p1.dx - p2.dx) + square(p1.dy - p2.dy);

class Eraser extends Tool {
  List<Stroke> _erased = [];

  Eraser();

  /// The current effective eraser size, read from the user preference.
  double get size => stows.eraserSize.value;
  
  /// The current effective squared eraser size.
  double get sqrSize => square(size);

  @override
  ToolId get toolId => .eraser;

  /// Returns the strokes to remove and strokes to add.
  EraserResult checkForOverlappingStrokes(
    Offset eraserPos,
    List<Stroke> strokes, {
    required double scale,
  }) {
    final effectiveSqrSize = sqrSize / square(scale);
    final List<Stroke> strokesToRemove = [];
    final List<Stroke> strokesToAdd = [];
    for (int i = 0; i < strokes.length; i++) {
      final stroke = strokes[i];
      if (stows.partialEraser.value) {
        final result = _partialEraseStroke(eraserPos, stroke, effectiveSqrSize);
        if (result != null) {
          strokesToRemove.add(stroke);
          _erased.add(stroke);
          strokesToAdd.addAll(result);
        }
      } else {
        if (_shouldStrokeBeErased(eraserPos, stroke, effectiveSqrSize)) {
          strokesToRemove.add(stroke);
          _erased.add(stroke);
        }
      }
    }
    return EraserResult(strokesToRemove, strokesToAdd);
  }

  List<Stroke>? _partialEraseStroke(Offset eraserPos, Stroke stroke, double sqrSize) {
    if (!_shouldStrokeBeErased(eraserPos, stroke, sqrSize)) return null;

    // Shape strokes (RectangleStroke, CircleStroke, etc.) have empty points lists.
    // They store geometry separately and cannot be partially erased by splitting points.
    // For these, fall through to the regular full-stroke erase.
    if (stroke.points.isEmpty) {
      return null;
    }

    final List<Stroke> newStrokes = [];
    List<PointVector> currentPoints = [];
    
    for (final point in stroke.points) {
      if (sqrDistanceBetween(Offset(point.x, point.y), eraserPos) > sqrSize) {
        currentPoints.add(point);
      } else {
        if (currentPoints.isNotEmpty) {
          final newStroke = stroke.copy()..points.clear()..points.addAll(currentPoints);
          newStroke.markPolygonNeedsUpdating();
          newStrokes.add(newStroke);
          currentPoints = [];
        }
      }
    }
    
    if (currentPoints.isNotEmpty) {
      final newStroke = stroke.copy()..points.clear()..points.addAll(currentPoints);
      newStroke.markPolygonNeedsUpdating();
      newStrokes.add(newStroke);
    }
    
    return newStrokes;
  }

  /// Returns the strokes that have been erased during this drag.
  List<Stroke> onDragEnd() {
    final List<Stroke> erased = _erased;
    _erased = [];
    return erased;
  }

  static bool _shouldStrokeBeErased(
    Offset eraserPos,
    Stroke stroke,
    double sqrSize,
  ) {
    if (stroke.length <= 3) {
      if (stroke.lowQualityPath.contains(eraserPos)) return true;
    }

    /// skip checking every few vertices for performance
    final int verticesToSkip = switch (stroke.lowQualityPolygon.length) {
      < 100 => 0,
      < 1000 => 1,
      _ => 2,
    };

    for (
      int i = 0;
      i < stroke.lowQualityPolygon.length;
      i += verticesToSkip + 1
    ) {
      final Offset strokeVertex = stroke.lowQualityPolygon[i];
      if (sqrDistanceBetween(strokeVertex, eraserPos) <= sqrSize) return true;
    }
    return false;
  }
}
