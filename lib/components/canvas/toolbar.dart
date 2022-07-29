
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/eraser.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    Key? key,
    required this.setTool,
    required this.undo,
    required this.redo,
    required this.isUndoPossible,
    required this.isRedoPossible,
  }) : super(key: key);

  final ValueChanged<Tool> setTool;
  final VoidCallback undo;
  final VoidCallback redo;
  final bool isUndoPossible;
  final bool isRedoPossible;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () { },
              style: TextButton.styleFrom(
                primary: colorScheme.onPrimary,
                backgroundColor: colorScheme.primary
              ),
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
              child: const Icon(Icons.backspace), // todo: better eraser icon
            ),
            TextButton(
              child: const Icon(Icons.photo_size_select_actual),
              onPressed: () { }
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
    );
  }
}
