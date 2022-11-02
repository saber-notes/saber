
import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/toolbar/color_bar.dart';
import 'package:saber/components/toolbar/export_bar.dart';
import 'package:saber/components/toolbar/toolbar_button.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

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
                currentColor: (widget.currentTool is Pen) ? (widget.currentTool as Pen).strokeProperties.color : null,
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
                        tooltip: t.editor.toolbar.fountainPen,
                        selected: widget.currentTool == Pen.currentPen,
                        onPressed: (button) {
                          widget.setTool(Pen.currentPen);
                        },
                        child: const FaIcon(FontAwesomeIcons.pen, size: 16),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.highlighter,
                        selected: widget.currentTool == Highlighter.currentHighlighter,
                        onPressed: (button) {
                          widget.setTool(Highlighter.currentHighlighter);
                        },
                        child: const FaIcon(FontAwesomeIcons.highlighter, size: 16),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.toggleColors,
                        selected: showColorOptions,
                        onPressed: (_) => toggleColorOptions(),
                        child: const Icon(Icons.palette),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.toggleEraser,
                        selected: widget.currentTool is Eraser,
                        onPressed: (_) => toggleEraser(),
                        child: const FaIcon(FontAwesomeIcons.eraser, size: 16),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.photo,
                        onPressed: null,
                        child: const Icon(Icons.photo_size_select_actual),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.toggleFingerDrawing,
                        selected: Prefs.editorFingerDrawing.value,
                        onPressed: (_) => widget.toggleFingerDrawing(),
                        child: const FaIcon(FontAwesomeIcons.handPointer, size: 16),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.undo,
                        onPressed: widget.isUndoPossible ? (_) => widget.undo() : null,
                        child: const Icon(Icons.undo),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.redo,
                        onPressed: widget.isRedoPossible ? (_) => widget.redo() : null,
                        child: const Icon(Icons.redo),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.export,
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
