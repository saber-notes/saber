
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/prefs.dart';

import '../_stroke.dart';
import 'stroke_properties.dart';
import '_tool.dart';

class Pen extends Tool {

  @protected
  @visibleForTesting
  Pen();

  Pen.fountainPen();

  Stroke? currentStroke;
  StrokeProperties strokeProperties = StrokeProperties();

  /// If we don't move for [straightLineTimerDurationMs] milliseconds, we draw a straight line from the first point to the last point.
  Timer? _straightLineTimer;
  /// Gives us the time between the last two points, to get a rate of movement.
  /// If this movement is below a certain threshold for [straightLineTimerDurationMs], we draw a straight line.
  final Stopwatch _straightLineStopwatch = Stopwatch();
  Offset? lastPosition;
  static const double maxSpeedForStraightLine = 0.2;

  static late Pen currentPen;

  onDragStart(EditorCoreInfo context, Offset position, int pageIndex, double? pressure) {
    currentStroke = Stroke(
      strokeProperties: strokeProperties.copy(),
      pageIndex: pageIndex,
      penType: runtimeType.toString(),
    );
    onDragUpdate(context, position, pressure, null);
  }

  onDragUpdate(EditorCoreInfo context, Offset position, double? pressure, void Function()? setState) {
    currentStroke!.addPoint(context, position, pressure);

    if (lastPosition != null && Prefs.editorStraightenDelay.value != 0) {
      _straightLineStopwatch.stop();
      int elapsedMs = _straightLineStopwatch.elapsedMilliseconds;
      double sqrDist = (position - lastPosition!).distanceSquared;
      double speed = sqrDist / elapsedMs;
      _straightLineTimer?.cancel();
      if (speed < maxSpeedForStraightLine) {
        _straightLineTimer = Timer(Duration(milliseconds: Prefs.editorStraightenDelay.value), () {
          currentStroke!.isStraightLine = true;
          setState?.call();
        });
      }
    }

    lastPosition = position;
    _straightLineStopwatch.reset();
    _straightLineStopwatch.start();
  }

  Stroke onDragEnd() {
    _straightLineTimer?.cancel();
    final Stroke stroke = currentStroke!..isComplete = true;
    currentStroke = null;
    return stroke;
  }
}
