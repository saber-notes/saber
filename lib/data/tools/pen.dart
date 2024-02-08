import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/pencil.dart';
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
    required this.options,
    required this.pressureEnabled,
    required this.color,
    required this.toolId,
  });

  Pen.fountainPen()
      : name = t.editor.pens.fountainPen,
        sizeMin = 1,
        sizeMax = 25,
        sizeStep = 1,
        icon = fountainPenIcon,
        options = Prefs.lastFountainPenOptions.value,
        pressureEnabled = true,
        color = Color(Prefs.lastFountainPenColor.value),
        toolId = ToolId.fountainPen;

  Pen.ballpointPen()
      : name = t.editor.pens.ballpointPen,
        sizeMin = 1,
        sizeMax = 25,
        sizeStep = 1,
        icon = ballpointPenIcon,
        options = Prefs.lastBallpointPenOptions.value,
        pressureEnabled = false,
        color = Color(Prefs.lastBallpointPenColor.value),
        toolId = ToolId.ballpointPen;

  final String name;
  final double sizeMin, sizeMax, sizeStep;
  final IconData icon;

  @override
  final ToolId toolId;

  static const IconData fountainPenIcon = FontAwesomeIcons.penFancy;
  static const IconData ballpointPenIcon = FontAwesomeIcons.pen;

  static Stroke? currentStroke;
  Color color;
  bool pressureEnabled;
  StrokeOptions options;

  static Pen _currentPen = Pen.fountainPen();
  static Pen get currentPen => _currentPen;
  static set currentPen(Pen currentPen) {
    assert(currentPen is! Highlighter,
        'Use Highlighter.currentHighlighter instead');
    assert(currentPen is! Pencil, 'Use Pencil.currentPencil instead');
    _currentPen = currentPen;
  }

  void onDragStart(
      Offset position, EditorPage page, int pageIndex, double? pressure) {
    currentStroke = Stroke(
      color: color,
      pressureEnabled: pressureEnabled,
      options: options.copyWith(
        isComplete: false,
      ),
      pageIndex: pageIndex,
      page: page,
      penType: runtimeType.toString(),
    );
    onDragUpdate(position, pressure);
  }

  void onDragUpdate(Offset position, double? pressure) {
    currentStroke!.addPoint(position, pressure);
  }

  Stroke onDragEnd() {
    final Stroke stroke = currentStroke!
      ..options.isComplete = true
      ..markPolygonNeedsUpdating();
    currentStroke = null;
    return stroke;
  }

  static StrokeOptions get fountainPenOptions => StrokeOptions();
  static StrokeOptions get ballpointPenOptions => StrokeOptions();
  static StrokeOptions get shapePenOptions => StrokeOptions();
  static StrokeOptions get highlighterOptions => StrokeOptions(
        size: StrokeOptions.defaultSize * 5,
      );
  static StrokeOptions get pencilOptions => StrokeOptions(
        streamline: 0.1,
        start: StrokeEndOptions.start(taperEnabled: true),
        end: StrokeEndOptions.end(taperEnabled: true),
      );
}
