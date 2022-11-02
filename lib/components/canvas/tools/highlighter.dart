
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';

import 'pen.dart';

class Highlighter extends Pen {
  Highlighter() {
    strokeProperties.size = StrokeProperties.defaultSize * 5;
    strokeProperties.color = defaultColor;
    strokeProperties.simulatePressure = false;
  }

  static const int alpha = 100;
  static final Color defaultColor = Colors.yellow.withAlpha(alpha);

  static late Pen currentHighlighter;
}
