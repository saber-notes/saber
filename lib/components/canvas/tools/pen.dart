
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/data/editor/editor_core_info.dart';

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
  static const int straightLineTimerDurationMs = 500;

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

    _straightLineTimer?.cancel();
    _straightLineTimer = Timer(const Duration(milliseconds: straightLineTimerDurationMs), () {
      currentStroke!.isStraightLine = true;
      setState?.call();
    });
  }

  Stroke onDragEnd() {
    _straightLineTimer?.cancel();
    final Stroke stroke = currentStroke!..isComplete = true;
    currentStroke = null;
    return stroke;
  }
}
