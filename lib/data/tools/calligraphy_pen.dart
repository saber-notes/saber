import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/canvas/_calligraphy_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:sbn/tool_id.dart';

/// A calligraphy pen tool with adjustable fixed line width and nib angle.
///
/// The brush shape is a high aspect ratio rectangle where the width is adjustable
/// and the height is fixed but small (a few pixels). Both width and angle remain
/// fixed while drawing (no pressure dynamics).
class CalligraphyPen extends Pen {
  new({double? angle})
    : angle = angle ?? (stows.lastCalligraphyPenAngle.value * pi / 180),
      super(
        name: t.editor.pens.calligraphyPen,
        sizeMin: 2,
        sizeMax: 40,
        sizeStep: 1,
        icon: calligraphyPenIcon,
        options: stows.lastCalligraphyPenOptions.value,
        pressureEnabled: false,
        color: Color(stows.lastCalligraphyPenColor.value),
        toolId: ToolId.calligraphyPen,
      );

  static const calligraphyPenIcon = FontAwesomeIcons.penNib;

  /// Angle of the calligraphy nib in radians.
  double angle;

  /// Angle in degrees (0° to 180°).
  double get angleInDegrees => angle * 180 / pi;
  set angleInDegrees(double degrees) {
    angle = degrees * pi / 180;
    stows.lastCalligraphyPenAngle.value = degrees;
  }

  @override
  void onDragStart(
    Offset position,
    EditorPage page,
    int pageIndex,
    double? pressure,
  ) {
    Pen.currentStroke = CalligraphyStroke(
      color: color,
      pressureEnabled: false,
      options: options.copyWith(isComplete: false, simulatePressure: false),
      pageIndex: pageIndex,
      page: page,
      toolId: toolId,
      angle: angle,
    );
    onDragUpdate(position, null);
  }
}
