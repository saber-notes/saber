import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/stroke_properties.dart';
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
    required this.toolId,
  });

  Pen.fountainPen() :
        name = t.editor.pens.fountainPen,
        sizeMin = 1,
        sizeMax = 25,
        sizeStep = 1,
        icon = fountainPenIcon,
        strokeProperties = Prefs.lastFountainPenProperties.value,
        toolId = ToolId.fountainPen;

  Pen.ballpointPen() :
        name = t.editor.pens.ballpointPen,
        sizeMin = 1,
        sizeMax = 25,
        sizeStep = 1,
        icon = ballpointPenIcon,
        strokeProperties = Prefs.lastBallpointPenProperties.value,
        toolId = ToolId.ballpointPen;

  final String name;
  final double sizeMin, sizeMax, sizeStep;
  final IconData icon;

  @override
  final ToolId toolId;

  static const IconData fountainPenIcon = FontAwesomeIcons.penFancy;
  static const IconData ballpointPenIcon = FontAwesomeIcons.pen;

  static Stroke? currentStroke;
  StrokeProperties strokeProperties = StrokeProperties();

  static Pen currentPen = Pen.fountainPen();

  void onDragStart(Offset position, int pageIndex, double? pressure) {
    currentStroke = Stroke(
      strokeProperties: strokeProperties.copy(),
      pageIndex: pageIndex,
      penType: runtimeType.toString(),
    );
    onDragUpdate(position, pressure);
  }

  void onDragUpdate(Offset position, double? pressure) {
    currentStroke!.addPoint(position, pressure);
  }

  Stroke onDragEnd() {
    final Stroke stroke = currentStroke!..isComplete = true;
    currentStroke = null;
    return stroke;
  }
}
