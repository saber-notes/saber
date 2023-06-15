import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/i18n/strings.g.dart';

class Highlighter extends Pen {
  Highlighter() : super(
    name: t.editor.pens.highlighter,
    sizeMin: 10,
    sizeMax: 100,
    sizeStep: 10,
    icon: highlighterIcon,
    toolId: ToolId.highlighter,
  ) {
    strokeProperties = Prefs.lastHighlighterProperties.value;
  }

  static const int alpha = 100;

  static Pen currentHighlighter = Highlighter();

  static const IconData highlighterIcon = FontAwesomeIcons.highlighter;
}
