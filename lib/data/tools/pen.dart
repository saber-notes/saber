import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/pencil.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:sbn/tool_id.dart';

class Pen extends Tool {
  @protected
  @visibleForTesting
  new({
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

  new fountainPen()
    : name = t.editor.pens.fountainPen,
      sizeMin = 1,
      sizeMax = 25,
      sizeStep = 1,
      icon = fountainPenIcon,
      options = stows.lastFountainPenOptions.value,
      pressureEnabled = true,
      color = Color(stows.lastFountainPenColor.value),
      toolId = .fountainPen;

  new ballpointPen()
    : name = t.editor.pens.ballpointPen,
      sizeMin = 1,
      sizeMax = 25,
      sizeStep = 1,
      icon = ballpointPenIcon,
      options = stows.lastBallpointPenOptions.value,
      pressureEnabled = false,
      color = Color(stows.lastBallpointPenColor.value),
      toolId = .ballpointPen;

  final String name;
  final double sizeMin, sizeMax, sizeStep;
  late final int sizeStepsBetweenMinAndMax = ((sizeMax - sizeMin) / sizeStep)
      .round();
  final Object icon;

  @override
  final ToolId toolId;

  static const fountainPenIcon = FontAwesomeIcons.penFancy;
  static const ballpointPenIcon = FontAwesomeIcons.pen;

  static Stroke? currentStroke;
  Color color;
  bool pressureEnabled;
  StrokeOptions options;

  static var _currentPen = Pen.fountainPen();
  static Pen get currentPen => _currentPen;
  static set currentPen(Pen currentPen) {
    assert(
      currentPen is! Highlighter,
      'Use Highlighter.currentHighlighter instead',
    );
    assert(currentPen is! Pencil, 'Use Pencil.currentPencil instead');
    _currentPen = currentPen;
  }

  void onDragStart(
    Offset position,
    EditorPage page,
    int pageIndex,
    double? pressure,
  ) {
    currentStroke = Stroke(
      color: color,
      pressureEnabled: pressureEnabled,
      options: options.copyWith(isComplete: false),
      pageIndex: pageIndex,
      page: page,
      toolId: toolId,
    );
    onDragUpdate(position, pressure);
  }

  void onDragUpdate(Offset position, double? pressure) {
    currentStroke?.addPoint(position, pressure);
  }

  Stroke? onDragEnd() {
    final stroke = currentStroke;
    currentStroke = null;
    if (stroke == null) return null;

    stroke
      ..options.isComplete = true
      ..markPolygonNeedsUpdating();

    // Samsung-style automatic shape snap: if a fountain/ballpoint stroke
    // looks like a geometric shape with high confidence, replace it with
    // the clean shape. Always on, no toggle — but conservative so
    // handwriting is never mangled.
    if (toolId == .fountainPen || toolId == .ballpointPen) {
      final snapped = _trySnapToShape(stroke);
      if (snapped != null) return snapped;
    }

    return stroke;
  }

  /// Minimum bounding-box diagonal (logical pixels) for a stroke to be
  /// considered for shape snapping. Filters out handwriting fragments,
  /// dots, and small marks.
  static const _minShapeSnapDiagonal = 48.0;

  /// Minimum $1 recognizer score (0.0–1.0) to snap. Deliberately high:
  /// handwriting rarely scores this well against geometric templates.
  static const _minShapeSnapScore = 0.8;

  /// Returns a clean geometric stroke if [stroke] confidently matches a
  /// shape, otherwise null (keep the raw stroke).
  Stroke? _trySnapToShape(Stroke stroke) {
    // Size filter: ignore small strokes (handwriting fragments, dots).
    if (stroke.boundingBoxDiagonal < _minShapeSnapDiagonal) return null;

    final detected = stroke.detectShape();
    if (detected == null || detected.score < _minShapeSnapScore) return null;

    switch (detected.name) {
      case DefaultUnistrokeNames.line:
        return stroke..convertToLine();
      case DefaultUnistrokeNames.rectangle:
        return RectangleStroke(
          color: color,
          pressureEnabled: pressureEnabled,
          options: stroke.options,
          pageIndex: stroke.pageIndex,
          page: stroke.page,
          toolId: toolId,
          rect: detected.convertToRect(),
        );
      case DefaultUnistrokeNames.circle:
        final (center, radius) = detected.convertToCircle();
        return CircleStroke(
          color: color,
          pressureEnabled: pressureEnabled,
          options: stroke.options,
          pageIndex: stroke.pageIndex,
          page: stroke.page,
          toolId: toolId,
          radius: radius,
          center: center,
        );
      case DefaultUnistrokeNames.triangle:
      case DefaultUnistrokeNames.star:
        return Stroke(
          color: color,
          pressureEnabled: pressureEnabled,
          options: stroke.options,
          pageIndex: stroke.pageIndex,
          page: stroke.page,
          toolId: toolId,
        )..addPoints(_boundingBoxTriangle(stroke));
      default:
        return null;
    }
  }

  /// Builds a clean triangle from the stroke's bounding box: apex at the
  /// top-center, base along the bottom. Simple and predictable — always
  /// looks like the triangle the user drew.
  List<Offset> _boundingBoxTriangle(Stroke stroke) {
    final box = stroke.boundingBox;
    final apex = Offset(box.center.dx, box.top);
    final baseLeft = Offset(box.left, box.bottom);
    final baseRight = Offset(box.right, box.bottom);
    // Closed path: apex -> baseLeft -> baseRight -> apex
    return [apex, baseLeft, baseRight, apex];
  }

  /// The default stroke options.
  ///
  /// Note that these are different to the default options in [StrokeOptions]
  /// e.g. [StrokeOptions.defaultSize] for historical reasons
  /// (i.e. [StrokeOptions.toJson] does not include default values.)
  static final defaultOptions = StrokeOptions(size: 5);

  static StrokeOptions get fountainPenOptions => defaultOptions.copyWith();
  static StrokeOptions get ballpointPenOptions => defaultOptions.copyWith();
  static StrokeOptions get shapePenOptions =>
      defaultOptions.copyWith(smoothing: 0, streamline: 0);
  static StrokeOptions get highlighterOptions =>
      defaultOptions.copyWith(size: 50);
  static StrokeOptions get pencilOptions => defaultOptions.copyWith(
    streamline: 0.1,
    start: StrokeEndOptions.start(taperEnabled: true, customTaper: 1),
    end: StrokeEndOptions.end(taperEnabled: true, customTaper: 1),
  );
}
