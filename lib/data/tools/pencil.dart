import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/i18n/strings.g.dart';

class Pencil extends Pen {
  Pencil()
    : super(
        name: t.editor.pens.pencil,
        sizeMin: 1,
        sizeMax: 15,
        sizeStep: 1,
        icon: pencilIcon,
        options: stows.lastPencilOptions.value,
        pressureEnabled: true,
        color: Color(stows.lastPencilColor.value),
        toolId: ToolId.pencil,
      );

  static var currentPencil = Pencil();

  static const IconData pencilIcon = FontAwesomeIcons.pencil;
}
