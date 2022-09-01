
import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/toolbar/color_bar.dart';
import 'package:saber/components/toolbar/toolbar_button.dart';
import 'package:saber/data/prefs.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({
    super.key,
    required this.setTool,
    required this.currentTool,
    required this.setColor,

    required this.undo,
    required this.isUndoPossible,
    required this.redo,
    required this.isRedoPossible,

    required this.toggleFingerDrawing,
  });

  final ValueChanged<Tool> setTool;
  final Tool currentTool;
  final ValueChanged<Color> setColor;

  final VoidCallback undo;
  final bool isUndoPossible;
  final VoidCallback redo;
  final bool isRedoPossible;

  final VoidCallback toggleFingerDrawing;

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {

  bool showColorOptions = false;

  @override
  void initState() {
    _assignKeybindings();
    super.initState();
  }

  Keybinding? _keyF;
  Keybinding? _keyE;
  Keybinding? _keyC;
  _assignKeybindings() {
    _keyF = Keybinding([KeyCode.from(LogicalKeyboardKey.keyF)], inclusive: true);
    _keyE = Keybinding([KeyCode.from(LogicalKeyboardKey.keyE)], inclusive: true);
    _keyC = Keybinding([KeyCode.from(LogicalKeyboardKey.keyC)], inclusive: true);
    Keybinder.bind(_keyF!, widget.toggleFingerDrawing);
    Keybinder.bind(_keyE!, toggleEraser);
    Keybinder.bind(_keyC!, toggleColorOptions);
  }
  _removeKeybindings() {
    if (_keyF != null) Keybinder.remove(_keyF!);
    if (_keyE != null) Keybinder.remove(_keyE!);
    if (_keyC != null) Keybinder.remove(_keyC!);
  }

  toggleEraser() {
    if (widget.currentTool is Eraser) {
      widget.setTool(Pen.currentPen);
    } else {
      widget.setTool(Eraser());
    }
  }
  toggleColorOptions() {
    setState(() {
      showColorOptions = !showColorOptions;
    });
  }

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
              child: ColorBar(
                setColor: widget.setColor,
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
                        tooltip: "Toggle colors (C)",
                        selected: showColorOptions,
                        onPressed: toggleColorOptions,
                        child: const Icon(Icons.palette),
                      ),
                      ToolbarIconButton(
                        tooltip: "Toggle eraser (E)",
                        selected: widget.currentTool is Eraser,
                        onPressed: toggleEraser,
                        child: const Icon(Icons.remove), // todo: better eraser icon
                      ),
                      ToolbarIconButton(
                        tooltip: "Photo",
                        onPressed: null,
                        child: const Icon(Icons.photo_size_select_actual),
                      ),
                      ToolbarIconButton(
                        tooltip: "Toggle finger drawing (F)",
                        selected: Prefs.editorFingerDrawing.value,
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

  @override
  void dispose() {
    _removeKeybindings();
    super.dispose();
  }
}
