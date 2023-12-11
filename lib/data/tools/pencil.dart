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
          sizeMax: 25,
          sizeStep: 1,
          icon: pencilIcon,
          toolId: ToolId.pencil,
        ) {
    strokeProperties = Prefs.lastPencilProperties.value;
  }

  static Pencil currentPencil = Pencil();

  static const IconData pencilIcon = FontAwesomeIcons.pencil;
}
