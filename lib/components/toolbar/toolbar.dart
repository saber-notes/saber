
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
    required this.setColor,

    required this.undo,
    required this.isUndoPossible,
    required this.redo,
    required this.isRedoPossible,

    required this.toggleFingerDrawing,
    required this.isFingerDrawingEnabled,
  }) : super(key: key);

  final ValueChanged<Tool> setTool;
  final Tool currentTool;
  final ValueChanged<Color> setColor;

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
                        for (String colorString in Prefs.recentColors.value.reversed) ColorOption(
                          isSelected: Pen.currentPen.strokeProperties.color == Color(int.parse(colorString)),
                          onTap: () => widget.setColor(Color(int.parse(colorString))),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(int.parse(colorString)),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        for (int i = 0; i < 5 - Prefs.recentColors.value.length; ++i) ColorOption(
                          isSelected: false,
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorScheme.onSurface.withOpacity(0.5),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const ColorOptionSeparator(),
                        for (Color color in Toolbar.colorOptions) ColorOption(
                          isSelected: Pen.currentPen.strokeProperties.color == color,
                          onTap: () => widget.setColor(color),
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
                        tooltip: "Toggle colors",
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
