import 'dart:math';
import 'dart:ui';

import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:sbn/tool_id.dart';

double square(double x) => x * x;

double sqrDistanceBetween(Offset p1, Offset p2) =>
    square(p1.dx - p2.dx) + square(p1.dy - p2.dy);

// Return true when `point` lies within the eraser's circular area.
// Uses squared distances to avoid unnecessary `sqrt` calls for speed.
bool _isPointInsideEraser(Offset point, Offset eraserPos, double sqrSize) {
  return sqrDistanceBetween(point, eraserPos) <= sqrSize;
}

class Eraser extends Tool {
  static Eraser currentEraser = Eraser(
    size: stows.lastEraserSize.value,
    areaEraser: stows.lastEraserAreaMode.value,
  );

  final double sizeMin = 1;
  final double sizeMax = 25;
  final double sizeStep = 1;
  late final int sizeStepsBetweenMinAndMax = ((sizeMax - sizeMin) / sizeStep)
      .round();

  double _size;
  bool _areaErase;

  double get size => _size;
  set size(double value) {
    if (_size == value) return;
    _size = value;
    stows.lastEraserSize.value = value;
  }

  bool get areaEraser => _areaErase;
  set areaEraser(bool value) {
    if (_areaErase == value) return;
    _areaErase = value;
    stows.lastEraserAreaMode.value = value;
  }

  double get sqrSize => square(size);

  final List<Stroke> _erased = [];
  final List<Stroke> _replacementStrokes = [];
  final Set<Stroke> _processedStrokes = {};

  Eraser({double size = 10, bool areaEraser = false})
    : _size = size,
      _areaErase = areaEraser;

  @override
  ToolId get toolId => .eraser;

  static bool _shouldStrokeBeErased(
    Offset eraserPos,
    Stroke stroke,
    double sqrSize,
  ) {
    if (stroke.lowQualityPath.contains(eraserPos)) return true;

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

  /// Returns any strokes that are fully removed by the eraser.
  List<Stroke> checkForOverlappingStrokes(
    Offset eraserPos,
    List<Stroke> strokes,
  ) {
    // The returned list contains strokes that should be removed entirely.
    // During a drag this method also updates internal replacement lists for
    // partial erases so the caller can apply point-replacements afterwards.
    final List<Stroke> erased = [];
    for (int i = 0; i < strokes.length; i++) {
      final stroke = strokes[i];
      if (!_shouldStrokeBeErased(eraserPos, stroke, sqrSize)) continue;

      if (!areaEraser) {
        // Stroke (normal) eraser: mark and return stroke for removal.
        _trackErasedStroke(stroke);
        erased.add(stroke);
        continue;
      }

      // Area eraser: remember original stroke snapshot and compute
      // remaining segments after removing points inside the eraser.
      _trackPartialEraseStroke(stroke);

      final remainingSegments = _remainingSegmentsAfterErase(
        stroke,
        eraserPos,
        sqrSize,
      );
      if (remainingSegments.isEmpty) {
        erased.add(stroke);
        _removeReplacementStroke(stroke);
        continue;
      }

      if (remainingSegments.length == 1 &&
          _isSameSegmentAsStroke(remainingSegments.first, stroke)) {
        _trackReplacementStroke(stroke);
        continue;
      }

      stroke.replacePoints(remainingSegments.first);
      _trackReplacementStroke(stroke);

      for (final segment in remainingSegments.skip(1)) {
        final replacement = _strokeFromSegment(stroke, segment);
        strokes.insert(i + 1, replacement);
        _trackReplacementStroke(replacement);
      }
    }
    return erased;
  }

  EraserResult onDragEnd() {
    final result = EraserResult(
      erasedStrokes: List.of(_erased),
      replacementStrokes: List.of(_replacementStrokes),
    );
    _erased.clear();
    _replacementStrokes.clear();
    _processedStrokes.clear();
    return result;
  }

  static List<List<PointVector>> _remainingSegmentsAfterErase(
    Stroke stroke,
    Offset eraserPos,
    double sqrSize,
  ) {
    final radius = sqrt(sqrSize);
    final List<List<PointVector>> segments = [];
    List<PointVector>? currentSegment;
    final points = stroke.pointVectors;

    bool pointInside(PointVector point) {
      return _isPointInsideEraser(Offset(point.x, point.y), eraserPos, sqrSize);
    }

    for (var i = 0; i < points.length; i++) {
      final point = points[i];
      final inside = pointInside(point);

      if (!inside) {
        currentSegment ??= [];
        currentSegment.add(point);
      }

      if (i + 1 < points.length) {
        final nextPoint = points[i + 1];
        final nextInside = pointInside(nextPoint);

        final shouldSplit =
            !inside &&
            !nextInside &&
            _segmentIntersectsCircle(
              Offset(point.x, point.y),
              Offset(nextPoint.x, nextPoint.y),
              eraserPos,
              radius,
            );

        if (shouldSplit || (!inside && nextInside)) {
          if (currentSegment != null) {
            segments.add(currentSegment);
            currentSegment = null;
          }
        }
      }
    }

    if (currentSegment != null) {
      segments.add(currentSegment);
    }
    return segments;
  }

  static bool _segmentIntersectsCircle(
    Offset from,
    Offset to,
    Offset center,
    double radius,
  ) {
    final dx = to.dx - from.dx;
    final dy = to.dy - from.dy;
    final l2 = dx * dx + dy * dy;
    if (l2 == 0) {
      return sqrDistanceBetween(from, center) <= radius * radius;
    }

    final t = ((center.dx - from.dx) * dx + (center.dy - from.dy) * dy) / l2;
    final clampedT = t.clamp(0.0, 1.0);
    final projection = Offset(from.dx + dx * clampedT, from.dy + dy * clampedT);
    return sqrDistanceBetween(projection, center) <= radius * radius;
  }

  static bool _isSameSegmentAsStroke(List<PointVector> segment, Stroke stroke) {
    if (segment.length != stroke.length) return false;
    final points = stroke.pointVectors;
    for (int i = 0; i < segment.length; i++) {
      if (!_isSamePoint(segment[i], points[i])) return false;
    }
    return true;
  }

  static bool _isSamePoint(PointVector a, PointVector b) {
    return a.x == b.x && a.y == b.y && a.pressure == b.pressure;
  }

  static Stroke _strokeFromSegment(Stroke source, List<PointVector> segment) {
    final replacement = Stroke(
      color: source.color,
      pressureEnabled: source.pressureEnabled,
      options: source.options.copyWith(isComplete: true),
      pageIndex: source.pageIndex,
      page: source.page,
      toolId: source.toolId,
    );
    for (final point in segment) {
      replacement.addPoint(Offset(point.x, point.y), point.pressure);
    }
    replacement.markPolygonNeedsUpdating();
    return replacement;
  }

  void _trackErasedStroke(Stroke stroke) {
    if (_processedStrokes.add(stroke)) {
      _erased.add(stroke);
    }
  }

  void _trackPartialEraseStroke(Stroke stroke) {
    if (_processedStrokes.add(stroke)) {
      _erased.add(stroke.copy());
    }
  }

  void _trackReplacementStroke(Stroke stroke) {
    if (!_replacementStrokes.contains(stroke)) {
      _replacementStrokes.add(stroke);
    }
  }

  void _removeReplacementStroke(Stroke stroke) {
    _replacementStrokes.remove(stroke);
  }
}

class EraserResult {
  EraserResult({required this.erasedStrokes, required this.replacementStrokes});

  final List<Stroke> erasedStrokes;
  final List<Stroke> replacementStrokes;
}
