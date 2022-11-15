
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/toolbar/size_picker.dart';
import 'package:saber/i18n/strings.g.dart';

class PenModal extends StatefulWidget {
  const PenModal({
    super.key,
    required this.setTool,
    required this.currentTool,
  });

  final Function setTool;
  final Pen currentTool;

  @override
  State<PenModal> createState() => _PenModalState();
}

class _PenModalState extends State<PenModal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(t.editor.penOptions.size),
            SizePicker(
              currentTool: widget.currentTool,
            ),
          ],
        ),
      ],
    );
  }
}
