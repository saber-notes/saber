import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({super.key});

  static const String filePath = '/_whiteboard';

  static bool needsToAutoClearWhiteboard = Prefs.autoClearWhiteboardOnExit.value;

  static final _whiteboardKey = GlobalKey(debugLabel: 'whiteboard');

  @override
  Widget build(BuildContext context) {
    return Editor(
      key: _whiteboardKey,
      path: filePath,
      customTitle: t.home.titles.whiteboard,
    );
  }
}
