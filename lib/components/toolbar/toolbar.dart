
import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/toolbar/color_bar.dart';
import 'package:saber/components/toolbar/export_bar.dart';
import 'package:saber/components/toolbar/pen_modal.dart';
import 'package:saber/components/toolbar/toolbar_button.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({
    super.key,

    required this.readOnly,

    required this.setTool,
    required this.currentTool,
    required this.setColor,

    required this.getCurrentQuill,
    required this.textEditing,
    required this.toggleTextEditing,

    required this.undo,
    required this.isUndoPossible,
    required this.redo,
    required this.isRedoPossible,

    required this.toggleFingerDrawing,

    required this.pickPhoto,

    required this.exportAsSbn,
    required this.exportAsPdf,
    required this.exportAsPng,
  });

  final bool readOnly;

  final ValueChanged<Tool> setTool;
  final Tool currentTool;
  final ValueChanged<Color> setColor;

  final QuillStruct? Function() getCurrentQuill;
  final bool textEditing;
  final VoidCallback toggleTextEditing;

  final VoidCallback undo;
  final bool isUndoPossible;
  final VoidCallback redo;
  final bool isRedoPossible;

  final VoidCallback toggleFingerDrawing;

  final VoidCallback pickPhoto;

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

    DynamicMaterialApp.isFullscreen.addListener(_setState);

    super.initState();
  }

  void _setState() => setState(() { });

  Keybinding? _ctrlF;
  Keybinding? _ctrlE;
  Keybinding? _ctrlC;
  Keybinding? _ctrlShiftS;
  Keybinding? _f11;
  _assignKeybindings() {
    _ctrlF = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyF)], inclusive: true);
    _ctrlE = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyE)], inclusive: true);
    _ctrlC = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyC)], inclusive: true);
    _ctrlShiftS = Keybinding([KeyCode.ctrl, KeyCode.shift, KeyCode.from(LogicalKeyboardKey.keyS)], inclusive: true);
    _f11 = Keybinding([KeyCode.from(LogicalKeyboardKey.f11)], inclusive: true);
    Keybinder.bind(_ctrlF!, widget.toggleFingerDrawing);
    Keybinder.bind(_ctrlE!, toggleEraser);
    Keybinder.bind(_ctrlC!, toggleColorOptions);
    Keybinder.bind(_ctrlShiftS!, toggleExportBar);
    Keybinder.bind(_f11!, toggleFullscreen);
  }
  _removeKeybindings() {
    if (_ctrlF != null) Keybinder.remove(_ctrlF!);
    if (_ctrlE != null) Keybinder.remove(_ctrlE!);
    if (_ctrlC != null) Keybinder.remove(_ctrlC!);
    if (_ctrlShiftS != null) Keybinder.remove(_ctrlShiftS!);
    if (_f11 != null) Keybinder.remove(_f11!);
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

  void toggleFullscreen() async {
    DynamicMaterialApp.isFullscreen.value = !DynamicMaterialApp.isFullscreen.value;
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Brightness brightness = Theme.of(context).brightness;
    bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;

    QuillStruct? quill = widget.getCurrentQuill();

    return Material(
      color: colorScheme.background,
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
              invert: invert,
            ),
          ),
          Collapsible(
            axis: CollapsibleAxis.vertical,
            alignment: Prefs.editorToolbarOnBottom.value ? Alignment.bottomCenter : Alignment.topCenter,
            maintainState: true,
            collapsed: !widget.textEditing || quill == null,
            child: quill != null ? QuillToolbar.basic(
              controller: quill.controller,
              locale: TranslationProvider.of(context).flutterLocale,
              toolbarIconSize: 20,
              iconTheme: QuillIconTheme(
                iconSelectedColor: colorScheme.onPrimary,
              ),
              showFontSize: false,
              showFontFamily: false,
              showClearFormat: false,
            ) : const SizedBox.shrink(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 8,
                children: [
                  ToolbarIconButton(
                    tooltip: Pen.currentPen.name,
                    selected: widget.currentTool == Pen.currentPen,
                    enabled: !widget.readOnly,
                    onPressed: (button) {
                      if (widget.currentTool == Pen.currentPen) {
                        button.openModal(context);
                      } else {
                        widget.setTool(Pen.currentPen);
                      }
                    },
                    modal: PenModal(
                      currentTool: Pen.currentPen,
                      setTool: widget.setTool,
                    ),
                    child: FaIcon(Pen.currentPen.icon, size: 16),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.pens.highlighter,
                    selected: widget.currentTool == Highlighter.currentHighlighter,
                    enabled: !widget.readOnly,
                    onPressed: (button) {
                      if (widget.currentTool == Highlighter.currentHighlighter) {
                        button.openModal(context);
                      } else {
                        widget.setTool(Highlighter.currentHighlighter);
                      }
                    },
                    modal: PenModal(
                      currentTool: Highlighter.currentHighlighter,
                      setTool: widget.setTool,
                    ),
                    child: const FaIcon(FontAwesomeIcons.highlighter, size: 16),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.toggleColors,
                    selected: showColorOptions,
                    enabled: !widget.readOnly,
                    onPressed: (_) => toggleColorOptions(),
                    child: const Icon(Icons.palette),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.toggleEraser,
                    selected: widget.currentTool is Eraser,
                    enabled: !widget.readOnly,
                    onPressed: (_) => toggleEraser(),
                    child: const FaIcon(FontAwesomeIcons.eraser, size: 16),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.photo,
                    enabled: !widget.readOnly,
                    onPressed: (_) => widget.pickPhoto(),
                    child: const Icon(Icons.photo_size_select_actual),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.text,
                    selected: widget.textEditing,
                    enabled: !widget.readOnly,
                    onPressed: (_) => widget.toggleTextEditing(),
                    child: const Icon(Icons.text_fields),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.toggleFingerDrawing,
                    selected: Prefs.editorFingerDrawing.value,
                    enabled: !widget.readOnly,
                    onPressed: (_) => widget.toggleFingerDrawing(),
                    child: const FaIcon(FontAwesomeIcons.handPointer, size: 16),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.fullscreen,
                    selected: DynamicMaterialApp.isFullscreen.value,
                    enabled: !widget.readOnly,
                    onPressed: (_) => toggleFullscreen(),
                    child: Icon(DynamicMaterialApp.isFullscreen.value ? Icons.fullscreen_exit : Icons.fullscreen),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.undo,
                        enabled: !widget.readOnly && widget.isUndoPossible,
                        onPressed: (_) => widget.undo(),
                        child: const Icon(Icons.undo),
                      ),
                      ToolbarIconButton(
                        tooltip: t.editor.toolbar.redo,
                        enabled: !widget.readOnly && widget.isRedoPossible,
                        onPressed: (_) => widget.redo(),
                        child: const Icon(Icons.redo),
                      ),
                    ],
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.export,
                    selected: showExportOptions,
                    enabled: !widget.readOnly,
                    onPressed: (_) => toggleExportBar(),
                    child: Icon(Icons.adaptive.share),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    DynamicMaterialApp.isFullscreen.removeListener(_setState);
    DynamicMaterialApp.isFullscreen.value = false;

    _removeKeybindings();
    super.dispose();
  }
}
