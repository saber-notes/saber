
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

import 'pen.dart';

class Highlighter extends Pen {
  Highlighter() : super(
    name: t.editor.pens.highlighter,
    sizeMin: 10,
    sizeMax: 100,
    sizeStep: 10,
    icon: highlighterIcon,
  ) {
    strokeProperties = Prefs.lastHighlighterProperties.value;
  }

  static const int alpha = 100;

  static Pen currentHighlighter = Highlighter();

  static const IconData highlighterIcon = FontAwesomeIcons.highlighter;
}
