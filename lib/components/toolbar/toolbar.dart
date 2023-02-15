
import 'package:collapsible/collapsible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/canvas/tools/select.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
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

    DynamicMaterialApp.addFullscreenListener(_setState);

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
    DynamicMaterialApp.setFullscreen(!DynamicMaterialApp.isFullscreen, updateSystem: true);
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Brightness brightness = Theme.of(context).brightness;
    bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;

    QuillStruct? quill = widget.getCurrentQuill();

    final isToolbarVertical = Prefs.editorToolbarAlignment.value == AxisDirection.left
        || Prefs.editorToolbarAlignment.value == AxisDirection.right;

    final children = <Widget>[
      Collapsible(
        axis: isToolbarVertical ? CollapsibleAxis.horizontal : CollapsibleAxis.vertical,
        maintainState: true,
        collapsed: !showExportOptions,
        child: ExportBar(
          axis: isToolbarVertical ? Axis.vertical : Axis.horizontal,
          toggleExportBar: toggleExportBar,
          exportAsSbn: widget.exportAsSbn,
          exportAsPdf: widget.exportAsPdf,
          exportAsPng: widget.exportAsPng,
        ),
      ),
      Collapsible(
        axis: isToolbarVertical ? CollapsibleAxis.horizontal : CollapsibleAxis.vertical,
        maintainState: true,
        collapsed: !showColorOptions,
        child: ColorBar(
          axis: isToolbarVertical ? Axis.vertical : Axis.horizontal,
          setColor: widget.setColor,
          currentColor: (widget.currentTool is Pen) ? (widget.currentTool as Pen).strokeProperties.color : null,
          invert: invert,
        ),
      ),
      Collapsible(
        axis: isToolbarVertical ? CollapsibleAxis.horizontal : CollapsibleAxis.vertical,
        maintainState: true,
        collapsed: !widget.textEditing || quill == null,
        child: quill != null ? QuillToolbar.basic(
          // todo: make quill toolbar vertical if [isToolbarVertical]
          controller: quill.controller,
          locale: TranslationProvider.of(context).flutterLocale,
          toolbarIconSize: 22,
          iconTheme: QuillIconTheme(
            iconSelectedColor: colorScheme.onPrimary,
            iconUnselectedColor: colorScheme.primary,
            iconSelectedFillColor: colorScheme.primary,
            iconUnselectedFillColor: Colors.transparent,
            disabledIconColor: colorScheme.onSurface.withOpacity(0.4),
            disabledIconFillColor: Colors.transparent,
            borderRadius: 22,
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
            direction: isToolbarVertical ? Axis.vertical : Axis.horizontal,
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
                  getTool: () => Pen.currentPen,
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
                  getTool: () => Highlighter.currentHighlighter,
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
                tooltip: t.editor.toolbar.select,
                selected: widget.currentTool is Select,
                enabled: !widget.readOnly,
                onPressed: (_) => widget.setTool(Select.currentSelect),
                child: Icon(CupertinoIcons.lasso, shadows: !widget.readOnly ? [
                  BoxShadow(
                    color: colorScheme.primary,
                    blurRadius: 0.1,
                    spreadRadius: 10,
                    blurStyle: BlurStyle.solid,
                  ),
                ] : null),
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
                child: const AdaptiveIcon(
                  icon: Icons.photo,
                  cupertinoIcon: CupertinoIcons.photo,
                ),
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.text,
                selected: widget.textEditing,
                enabled: !widget.readOnly,
                onPressed: (_) => widget.toggleTextEditing(),
                child: const AdaptiveIcon(
                  icon: Icons.text_fields,
                  cupertinoIcon: CupertinoIcons.text_cursor,
                ),
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.toggleFingerDrawing,
                selected: Prefs.editorFingerDrawing.value,
                enabled: !widget.readOnly,
                onPressed: (_) => widget.toggleFingerDrawing(),
                child: const Icon(CupertinoIcons.hand_draw),
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.fullscreen,
                selected: DynamicMaterialApp.isFullscreen,
                enabled: !widget.readOnly,
                onPressed: (_) => toggleFullscreen(),
                child: AdaptiveIcon(
                  icon: DynamicMaterialApp.isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                  cupertinoIcon: DynamicMaterialApp.isFullscreen ? CupertinoIcons.fullscreen_exit : CupertinoIcons.fullscreen,
                ),
              ),
              Wrap(
                direction: isToolbarVertical ? Axis.vertical : Axis.horizontal,
                children: [
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.undo,
                    enabled: !widget.readOnly && widget.isUndoPossible,
                    onPressed: (_) => widget.undo(),
                    child: const AdaptiveIcon(
                      icon: Icons.undo,
                      cupertinoIcon: CupertinoIcons.arrow_uturn_left,
                    ),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.redo,
                    enabled: !widget.readOnly && widget.isRedoPossible,
                    onPressed: (_) => widget.redo(),
                    child: const AdaptiveIcon(
                      icon: Icons.redo,
                      cupertinoIcon: CupertinoIcons.arrow_uturn_right,
                    ),
                  ),
                ],
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.export,
                selected: showExportOptions,
                enabled: !widget.readOnly,
                onPressed: (_) => toggleExportBar(),
                child: const AdaptiveIcon(
                  icon: Icons.share,
                  cupertinoIcon: CupertinoIcons.share,
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Material(
      color: colorScheme.background,
      child: isToolbarVertical
        ? Row(
            textDirection: Prefs.editorToolbarAlignment.value == AxisDirection.left
              ? TextDirection.rtl
              : TextDirection.ltr,
            children: children,
          )
        : Column(
            verticalDirection: Prefs.editorToolbarAlignment.value == AxisDirection.down
              ? VerticalDirection.down
              : VerticalDirection.up,
            children: children,
          ),
    );
  }

  @override
  void dispose() {
    DynamicMaterialApp.removeFullscreenListener(_setState);
    DynamicMaterialApp.setFullscreen(false, updateSystem: true);

    _removeKeybindings();
    super.dispose();
  }
}
