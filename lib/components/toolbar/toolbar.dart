
import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/toolbar/color_bar.dart';
import 'package:saber/components/toolbar/export_bar.dart';
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

    required this.exportAsSbn,
    required this.exportAsPdf,
    required this.exportAsPng,
  });

  final ValueChanged<Tool> setTool;
  final Tool currentTool;
  final ValueChanged<Color> setColor;

  final VoidCallback undo;
  final bool isUndoPossible;
  final VoidCallback redo;
  final bool isRedoPossible;

  final VoidCallback toggleFingerDrawing;

  final Future Function()? exportAsSbn;
  final Future Function()? exportAsPdf;
  final Future Function()? exportAsPng;

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {

  bool showColorOptions = false;
  bool showExportOptions = false;

  @override
  void initState() {
    _assignKeybindings();
    super.initState();
  }

  Keybinding? _ctrlF;
  Keybinding? _ctrlE;
  Keybinding? _ctrlC;
  Keybinding? _ctrlShiftS;
  _assignKeybindings() {
    _ctrlF = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyF)], inclusive: true);
    _ctrlE = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyE)], inclusive: true);
    _ctrlC = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyC)], inclusive: true);
    _ctrlShiftS = Keybinding([KeyCode.ctrl, KeyCode.shift, KeyCode.from(LogicalKeyboardKey.keyS)], inclusive: true);
    Keybinder.bind(_ctrlF!, widget.toggleFingerDrawing);
    Keybinder.bind(_ctrlE!, toggleEraser);
    Keybinder.bind(_ctrlC!, toggleColorOptions);
    Keybinder.bind(_ctrlShiftS!, toggleExportBar);
  }
  _removeKeybindings() {
    if (_ctrlF != null) Keybinder.remove(_ctrlF!);
    if (_ctrlE != null) Keybinder.remove(_ctrlE!);
    if (_ctrlC != null) Keybinder.remove(_ctrlC!);
    if (_ctrlShiftS != null) Keybinder.remove(_ctrlShiftS!);
  }

  void toggleEraser() {
    if (widget.currentTool is Eraser) {
      widget.setTool(Pen.currentPen);
    } else {
      widget.setTool(Eraser());
    }
  }
  void toggleColorOptions() {
    setState(() {
      showColorOptions = !showColorOptions;
    });
  }
  void toggleExportBar() {
    setState(() {
      showExportOptions = !showExportOptions;
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
              collapsed: !showExportOptions,
              child: ExportBar(
                toggleExportBar: toggleExportBar,
                exportAsSbn: widget.exportAsSbn,
                exportAsPdf: widget.exportAsPdf,
                exportAsPng: widget.exportAsPng,
              ),
            ),
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
                        onPressed: (button) {
                          widget.setTool(Pen.currentPen);
                        },
                        child: const Icon(Icons.brush),
                      ),
                      ToolbarIconButton(
                        tooltip: "Toggle colors (Ctrl C)",
                        selected: showColorOptions,
                        onPressed: (_) => toggleColorOptions(),
                        child: const Icon(Icons.palette),
                      ),
                      ToolbarIconButton(
                        tooltip: "Toggle eraser (Ctrl E)",
                        selected: widget.currentTool is Eraser,
                        onPressed: (_) => toggleEraser(),
                        child: const Icon(Icons.remove), // todo: better eraser icon
                      ),
                      ToolbarIconButton(
                        tooltip: "Photo",
                        onPressed: null,
                        child: const Icon(Icons.photo_size_select_actual),
                      ),
                      ToolbarIconButton(
                        tooltip: "Toggle finger drawing (Ctrl F)",
                        selected: Prefs.editorFingerDrawing.value,
                        onPressed: (_) => widget.toggleFingerDrawing(),
                        child: const Icon(Icons.gesture),
                      ),
                      ToolbarIconButton(
                        tooltip: "Undo",
                        onPressed: widget.isUndoPossible ? (_) => widget.undo() : null,
                        child: const Icon(Icons.undo),
                      ),
                      ToolbarIconButton(
                        tooltip: "Redo",
                        onPressed: widget.isRedoPossible ? (_) => widget.redo() : null,
                        child: const Icon(Icons.redo),
                      ),
                      ToolbarIconButton(
                        tooltip: "Export (Ctrl Shift S)",
                        onPressed: (_) => toggleExportBar(),
                        child: const Icon(Icons.share),
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
