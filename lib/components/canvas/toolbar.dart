
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/eraser.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    Key? key,
    required this.setTool,
    required this.currentTool,

    required this.undo,
    required this.isUndoPossible,
    required this.redo,
    required this.isRedoPossible,

    required this.toggleFingerDrawing,
    required this.isFingerDrawingEnabled,
  }) : super(key: key);

  final ValueChanged<Tool> setTool;
  final Tool currentTool;

  final VoidCallback undo;
  final bool isUndoPossible;
  final VoidCallback redo;
  final bool isRedoPossible;

  final VoidCallback toggleFingerDrawing;
  final bool isFingerDrawingEnabled;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var selectedButtonStyle = TextButton.styleFrom(
        primary: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary
    );

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  setTool(Pen.currentPen);
                },
                style: currentTool == Pen.currentPen ? selectedButtonStyle : null,
                child: const Icon(Icons.brush),
              ),
              TextButton(
                child: const Icon(Icons.palette),
                onPressed: () { }
              ),
              TextButton(
                onPressed: () {
                  setTool(Eraser());
                },
                style: currentTool is Eraser ? selectedButtonStyle : null,
                child: const Icon(Icons.backspace), // todo: better eraser icon
              ),
              TextButton(
                child: const Icon(Icons.photo_size_select_actual),
                onPressed: () { }
              ),
              TextButton(
                onPressed: toggleFingerDrawing,
                // todo: better icon
                child: isFingerDrawingEnabled ? const Icon(Icons.pan_tool) : const Icon(Icons.do_not_touch_outlined),
              ),
              TextButton(
                onPressed: isUndoPossible ? undo : null,
                child: const Icon(Icons.undo),
              ),
              TextButton(
                onPressed: isRedoPossible ? redo : null,
                child: const Icon(Icons.redo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
