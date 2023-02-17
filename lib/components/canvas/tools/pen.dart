import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class Pen extends Tool {
  @protected
  @visibleForTesting
  Pen({
    required this.name,
    required this.sizeMin,
    required this.sizeMax,
    required this.sizeStep,
    required this.icon,
  });

  Pen.fountainPen() :
        name = t.editor.pens.fountainPen,
        sizeMin = 1,
        sizeMax = 25,
        sizeStep = 1,
        icon = fountainPenIcon,
        strokeProperties = Prefs.lastFountainPenProperties.value;

  Pen.ballpointPen() :
        name = t.editor.pens.ballpointPen,
        sizeMin = 1,
        sizeMax = 25,
        sizeStep = 1,
        icon = ballpointPenIcon,
        strokeProperties = Prefs.lastBallpointPenProperties.value;

  final String name;
  final double sizeMin, sizeMax, sizeStep;
  final IconData icon;
  static const IconData fountainPenIcon = FontAwesomeIcons.penFancy;
  static const IconData ballpointPenIcon = FontAwesomeIcons.pen;

  Stroke? currentStroke;
  StrokeProperties strokeProperties = StrokeProperties();

  /// If we don't move for [Prefs.editorStraightenDelay.value] milliseconds,
  /// we draw a straight line from the first point to the last point.
  Timer? _straightLineTimer;
  /// Gives us the time between the last two points, to get a rate of movement.
  /// If this movement is slower than a certain threshold for
  /// [Prefs.editorStraightenDelay.value] ms, we draw a straight line.
  final Stopwatch _straightLineStopwatch = Stopwatch();
  Offset firstPosition = Offset.zero;
  Offset lastPosition = Offset.zero;
  static const double maxSpeedForStraightLine = 0.03;
  /// Minimum length of a stroke to be considered a straight line,
  /// as a multiple of the pen size.
  static const int minLengthForStraightLine = 10;

  static Pen currentPen = Pen.fountainPen();

  onDragStart(Size pageSize, Offset position, int pageIndex, double? pressure) {
    currentStroke = Stroke(
      strokeProperties: strokeProperties.copy(),
      pageIndex: pageIndex,
      penType: runtimeType.toString(),
    );
    firstPosition = position;
    lastPosition = position;
    onDragUpdate(pageSize, position, pressure, null);
  }

  onDragUpdate(Size pageSize, Offset position, double? pressure, VoidCallback? redrawPage) {
    currentStroke!.addPoint(pageSize, position, pressure);

    /// The distance between the first point and the current point.
    double sqrLength = (position - firstPosition).distanceSquared;
    /// The minimum distance between the first point and the current point
    /// for the stroke to be considered a straight line.
    double minSqrLength = square(minLengthForStraightLine * strokeProperties.size);

    /// The time between the last two points.
    late int elapsedMs = _straightLineStopwatch.elapsedMilliseconds;
    /// The distance between the last two points.
    late double sqrChange = (position - lastPosition).distanceSquared;

    if (sqrLength < minSqrLength) {
      currentStroke!.isStraightLine = false;
    } else if (Prefs.editorStraightenDelay.value != 0 && elapsedMs != 0) {
      Timer newTimer() => Timer(Duration(milliseconds: Prefs.editorStraightenDelay.value - elapsedMs), () {
        currentStroke!.isStraightLine = true;
        redrawPage?.call();
      });

      double speed = sqrChange / elapsedMs;
      if (speed < maxSpeedForStraightLine) {
        // if we're moving slowly, continue or start the timer
        _straightLineTimer ??= newTimer();
      } else {
        // otherwise see if we don't move for a while
        // (if we do move, onDragUpdate will be called and we'll reset the timer)
        _straightLineTimer?.cancel();
        _straightLineTimer = newTimer();
      }
    }

    lastPosition = position;
    _straightLineStopwatch.reset();
    _straightLineStopwatch.start();
  }

  Stroke onDragEnd() {
    _straightLineTimer?.cancel();
    _straightLineTimer = null;

    _straightLineStopwatch.stop();
    _straightLineStopwatch.reset();

    final Stroke stroke = currentStroke!..isComplete = true;
    currentStroke = null;
    return stroke;
  }
}
