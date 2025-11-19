import 'dart:async';

import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/list_extensions.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/pen.dart';

class LaserPointer extends Tool {
  LaserPointer._();

  static final _currentLaserPointer = LaserPointer._();
  static LaserPointer get currentLaserPointer => _currentLaserPointer;

  @override
  ToolId get toolId => .laserPointer;

  static const outerColor = Colors.red;
  final pressureEnabled = false;
  final options = StrokeOptions(smoothing: 0.7, streamline: 0.7);

  /// List of timings that correspond to the delay between each point
  /// in the stroke. The first point has a delay of 0.
  ///
  /// This is used to fade out each point in the stroke one by one.
  List<Duration> strokePointDelays = [];

  /// Stopwatch used to find the time elapsed since the last point.
  final _stopwatch = Stopwatch();

  /// Whether the user is currently drawing with the laser.
  /// This is used to prevent strokes fading out until the user
  /// has finished drawing.
  static var isDrawing = false;

  void onDragStart(Offset position, EditorPage page, int pageIndex) {
    isDrawing = true;
    Pen.currentStroke = LaserStroke(
      color: outerColor,
      pressureEnabled: pressureEnabled,
      options: options.copyWith(),
      pageIndex: pageIndex,
      page: page,
      toolId: toolId,
    );

    strokePointDelays = [];
    _stopwatch.reset();
    onDragUpdate(position);
    _stopwatch.start();
  }

  void onDragUpdate(Offset position, {@visibleForTesting Duration? elapsed}) {
    isDrawing = true;
    Pen.currentStroke?.addPoint(position);
    strokePointDelays.add(elapsed ?? _stopwatch.elapsed);
    _stopwatch.reset();
  }

  LaserStroke? onDragEnd(
    VoidCallback redrawPage,
    void Function(Stroke) deleteStroke,
  ) {
    isDrawing = false;

    final stroke = Pen.currentStroke;
    Pen.currentStroke = null;
    if (stroke is! LaserStroke) return null;

    unawaited(
      fadeOutStroke(
        stroke: stroke,
        strokePointDelays: strokePointDelays,
        redrawPage: redrawPage,
        deleteStroke: deleteStroke,
      ),
    );

    return stroke
      ..options.isComplete = true
      ..markPolygonNeedsUpdating();
  }

  @visibleForTesting
  static const fadeOutDelay = Duration(seconds: 2);
  @visibleForTesting
  static Future<void> fadeOutStroke({
    required LaserStroke stroke,
    required List<Duration> strokePointDelays,
    required VoidCallback redrawPage,
    required void Function(LaserStroke) deleteStroke,
    @visibleForTesting Future<void> Function(Duration) wait = Future.delayed,
  }) async {
    await wait(fadeOutDelay);

    for (final delay in strokePointDelays) {
      await wait(delay);

      if (stroke.length <= 1) break;

      stroke.popFirstPoint();
      redrawPage();

      if (isDrawing) {
        // if the user starts drawing again, wait until they stop
        const waitTime = Duration(milliseconds: 100);
        while (isDrawing) await wait(waitTime);
        // now wait the normal delay before continuing
        await wait(fadeOutDelay - waitTime);
      }
    }

    deleteStroke(stroke);
    redrawPage();
  }
}

class LaserStroke extends Stroke {
  LaserStroke({
    required super.color,
    required super.pressureEnabled,
    required super.options,
    required super.pageIndex,
    required EditorPage super.page,
    required super.toolId,
  });
  @visibleForTesting
  LaserStroke.convertStroke(Stroke stroke)
    : super(
        color: stroke.color,
        pressureEnabled: stroke.pressureEnabled,
        options: stroke.options
          ..streamline = 0.7
          ..smoothing = 0.7,
        pageIndex: stroke.pageIndex,
        page: stroke.page,
        toolId: stroke.toolId,
      ) {
    points.addAll(stroke.points);
  }

  @protected
  List<Offset> get innerPolygon => _innerPolygon ??= getStroke(
    points,
    options: options.copyWith(size: options.size * 0.4),
  );
  List<Offset>? _innerPolygon;

  /// The inner part of the stroke which is thinner and white
  /// to create a glowing effect.
  Path get innerPath =>
      _innerPath ??= Stroke.smoothPathFromPolygon(innerPolygon);
  Path? _innerPath;

  /// The outer thicker part of the stroke which is colored with [color].
  @override
  List<Offset> get highQualityPolygon => super.highQualityPolygon;

  /// The outer thicker part of the stroke which is colored with [color].
  ///
  /// Note that LODs are disabled so that the outer path matches the inner path.
  @override
  List<Offset> get lowQualityPolygon => super.highQualityPolygon;

  @override
  void shift(Offset offset) {
    _innerPolygon?.shift(offset);
    _innerPath?.shift(offset);
    super.shift(offset);
  }

  @override
  void markPolygonNeedsUpdating() {
    _innerPolygon = null;
    _innerPath = null;
    super.markPolygonNeedsUpdating();
  }
}
