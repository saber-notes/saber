
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/_tool.dart';

class PenModal extends StatefulWidget {
  const PenModal({
    super.key,
    required this.setTool,
    required this.currentTool,
  });

  final Function setTool;
  final Tool currentTool;

  @override
  State<PenModal> createState() => _PenModalState();
}

class _PenModalState extends State<PenModal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Pen options not yet available"),
      ],
    );
  }
}
