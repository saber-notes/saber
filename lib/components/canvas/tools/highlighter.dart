
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';

import 'pen.dart';

class Highlighter extends Pen {
  Highlighter() {
    strokeProperties.size = StrokeProperties.defaultSize * 5;
    strokeProperties.color = Colors.yellow.withAlpha(alpha);
    strokeProperties.simulatePressure = false;
  }

  static const int alpha = 100;

  static late Pen currentHighlighter;
}
