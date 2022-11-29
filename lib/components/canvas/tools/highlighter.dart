
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';
import 'package:saber/i18n/strings.g.dart';

import 'pen.dart';

class Highlighter extends Pen {
  Highlighter() : super(name: t.editor.pens.highlighter, icon: highlighterIcon) {
    strokeProperties.size = StrokeProperties.defaultSize * 5;
    strokeProperties.color = defaultColor;
    strokeProperties.simulatePressure = false;
  }

  static const int alpha = 100;
  static final Color defaultColor = Colors.yellow.withAlpha(alpha);

  static late Pen currentHighlighter;

  static const IconData highlighterIcon = FontAwesomeIcons.highlighter;
}
