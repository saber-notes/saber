
import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/toolbar/color_option.dart';
import 'package:saber/components/toolbar/toolbar_button.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

class Toolbar extends StatefulWidget {
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

  static final colorOptions = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.white,
  ];

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {

  bool showColorOptions = false;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: Material(
        child: Column(
          verticalDirection: Prefs.editorToolbarOnBottom.value ? VerticalDirection.down : VerticalDirection.up,
          children: [
            Collapsible(
              axis: CollapsibleAxis.vertical,
              alignment: Prefs.editorToolbarOnBottom.value ? Alignment.bottomCenter : Alignment.topCenter,
              maintainState: true,
              collapsed: !showColorOptions,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (Color color in Toolbar.colorOptions) ColorOption(
                          isSelected: Pen.currentPen.strokeProperties.color == color,
                          onTap: () {
                            Pen.currentPen.strokeProperties.color = color;
                            widget.setTool(Pen.currentPen);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ToolbarIconButton(
                        tooltip: "Fountain pen",
                        selected: widget.currentTool == Pen.currentPen,
                        onPressed: () {
                          widget.setTool(Pen.currentPen);
                        },
                        child: const Icon(Icons.brush),
                      ),
                      ToolbarIconButton(
                        tooltip: "Colour",
                        selected: showColorOptions,
                        onPressed: () {
                          setState(() {
                            showColorOptions = !showColorOptions;
                          });
                        },
                        child: const Icon(Icons.palette),
                      ),
                      ToolbarIconButton(
                        tooltip: "Eraser",
                        selected: widget.currentTool is Eraser,
                        onPressed: () {
                          widget.setTool(Eraser());
                        },
                        child: const Icon(Icons.remove), // todo: better eraser icon
                      ),
                      ToolbarIconButton(
                        tooltip: "Photo",
                        onPressed: null,
                        child: const Icon(Icons.photo_size_select_actual),
                      ),
                      ToolbarIconButton(
                        tooltip: "Toggle finger drawing",
                        selected: widget.isFingerDrawingEnabled,
                        onPressed: widget.toggleFingerDrawing,
                        child: const Icon(Icons.gesture),
                      ),
                      ToolbarIconButton(
                        tooltip: "Undo",
                        onPressed: widget.isUndoPossible ? widget.undo : null,
                        child: const Icon(Icons.undo),
                      ),
                      ToolbarIconButton(
                        tooltip: "Redo",
                        onPressed: widget.isRedoPossible ? widget.redo : null,
                        child: const Icon(Icons.redo),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
