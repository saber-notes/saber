import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';

import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/pen.dart';

class LaserPointer extends Tool {
  LaserPointer._();

  static final LaserPointer _currentLaserPointer = LaserPointer._();
  static LaserPointer get currentLaserPointer => _currentLaserPointer;

  @override
  ToolId get toolId => ToolId.laserPointer;

  final color = Colors.red;
  final pressureEnabled = false;
  final options = StrokeOptions(
    thinning: 0,
    smoothing: 0.7,
    streamline: 0.7,
  );

  /// List of timings that correspond to the delay between each point
  /// in the stroke. The first point has a delay of 0.
  ///
  /// This is used to fade out each point in the stroke one by one.
  List<Duration> strokePointDelays = [];

  /// Stopwatch used to find the time elapsed since the last point.
  final Stopwatch _stopwatch = Stopwatch();

  void onDragStart(Offset position, int pageIndex) {
    Pen.currentStroke = Stroke(
      color: color,
      pressureEnabled: pressureEnabled,
      options: options.copyWith(),
      pageIndex: pageIndex,
      penType: runtimeType.toString(),
    );

    strokePointDelays = [];
    _stopwatch.reset();
    onDragUpdate(position);
    _stopwatch.start();
  }

  void onDragUpdate(Offset position) {
    Pen.currentStroke?.addPoint(position);
    strokePointDelays.add(_stopwatch.elapsed);
    _stopwatch.reset();
  }

  Stroke onDragEnd(
      VoidCallback redrawPage, void Function(Stroke) deleteStroke) {
    fadeOutStroke(
      stroke: Pen.currentStroke!,
      strokePointDelays: strokePointDelays,
      redrawPage: redrawPage,
      deleteStroke: deleteStroke,
    );

    final Stroke stroke = Pen.currentStroke!
      ..options.isComplete = true
      ..markPolygonNeedsUpdating();
    Pen.currentStroke = null;
    return stroke;
  }

  static const Duration _fadeOutDelay = Duration(milliseconds: 500);
  @visibleForTesting
  static void fadeOutStroke(
      {required Stroke stroke,
      required List<Duration> strokePointDelays,
      required VoidCallback redrawPage,
      required void Function(Stroke) deleteStroke}) async {
    await Future.delayed(_fadeOutDelay);

    for (Duration delay in strokePointDelays) {
      await Future.delayed(delay);
      stroke.popFirstPoint();
      redrawPage();
    }

    deleteStroke(stroke);
    redrawPage();
  }
}
