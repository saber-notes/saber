import 'package:collapsible/collapsible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/toolbar/color_bar.dart';
import 'package:saber/components/toolbar/export_bar.dart';
import 'package:saber/components/toolbar/pen_modal.dart';
import 'package:saber/components/toolbar/selection_bar.dart';
import 'package:saber/components/toolbar/toolbar_button.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/laser_pointer.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/i18n/strings.g.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({
    super.key,

    required this.readOnly,

    required this.setTool,
    required this.currentTool,
    required this.setColor,

    required this.quillFocus,
    required this.textEditing,
    required this.toggleTextEditing,

    required this.undo,
    required this.isUndoPossible,
    required this.redo,
    required this.isRedoPossible,

    required this.toggleFingerDrawing,

    required this.pickPhoto,

    required this.paste,

    required this.duplicateSelection,
    required this.deleteSelection,

    required this.exportAsSbn,
    required this.exportAsPdf,
    required this.exportAsPng,
  });

  final bool readOnly;

  final ValueChanged<Tool> setTool;
  final Tool currentTool;
  final ValueChanged<Color> setColor;

  final ValueNotifier<QuillStruct?> quillFocus;
  final bool textEditing;
  final VoidCallback toggleTextEditing;

  final VoidCallback undo;
  final bool isUndoPossible;
  final VoidCallback redo;
  final bool isRedoPossible;

  final VoidCallback toggleFingerDrawing;

  final VoidCallback pickPhoto;

  final VoidCallback paste;

  final VoidCallback duplicateSelection;
  final VoidCallback deleteSelection;

  final Future Function()? exportAsSbn;
  final Future Function()? exportAsPdf;
  final Future Function()? exportAsPng;

  @override
  State<Toolbar> createState() => _ToolbarState();

  static const EdgeInsets _buttonPaddingHorizontal = EdgeInsets.symmetric(horizontal: 6);
  static const EdgeInsets _buttonPaddingVertical = EdgeInsets.symmetric(vertical: 6);
}

class _ToolbarState extends State<Toolbar> {
  ValueNotifier<bool> showExportOptions = ValueNotifier(false);
  ValueNotifier<bool> showColorOptions = ValueNotifier(false);
  ValueNotifier<ToolOptions> toolOptionsType = ValueNotifier(ToolOptions.hide);

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
  Keybinding? _ctrlV;
  void _assignKeybindings() {
    _ctrlF = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyF)], inclusive: true);
    _ctrlE = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyE)], inclusive: true);
    _ctrlC = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyC)], inclusive: true);
    _ctrlShiftS = Keybinding([KeyCode.ctrl, KeyCode.shift, KeyCode.from(LogicalKeyboardKey.keyS)], inclusive: true);
    _f11 = Keybinding([KeyCode.from(LogicalKeyboardKey.f11)], inclusive: true);
    _ctrlV = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyV)], inclusive: true);

    Keybinder.bind(_ctrlF!, widget.toggleFingerDrawing);
    Keybinder.bind(_ctrlE!, toggleEraser);
    Keybinder.bind(_ctrlC!, toggleColorOptions);
    Keybinder.bind(_ctrlShiftS!, toggleExportBar);
    Keybinder.bind(_f11!, toggleFullscreen);
    Keybinder.bind(_ctrlV!, widget.paste);
  }
  void _removeKeybindings() {
    if (_ctrlF != null) Keybinder.remove(_ctrlF!);
    if (_ctrlE != null) Keybinder.remove(_ctrlE!);
    if (_ctrlC != null) Keybinder.remove(_ctrlC!);
    if (_ctrlShiftS != null) Keybinder.remove(_ctrlShiftS!);
    if (_f11 != null) Keybinder.remove(_f11!);
    if (_ctrlV != null) Keybinder.remove(_ctrlV!);
  }

  void toggleEraser() {
    toolOptionsType.value = ToolOptions.hide;
    widget.setTool(Eraser()); // this toggles eraser
  }
  void toggleColorOptions() {
    showColorOptions.value = !showColorOptions.value;
  }
  void toggleExportBar() {
    showExportOptions.value = !showExportOptions.value;
  }

  void toggleFullscreen() async {
    DynamicMaterialApp.setFullscreen(!DynamicMaterialApp.isFullscreen, updateSystem: true);
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Brightness brightness = Theme.of(context).brightness;
    bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;

    final isToolbarVertical = Prefs.editorToolbarAlignment.value == AxisDirection.left
        || Prefs.editorToolbarAlignment.value == AxisDirection.right;

    final buttonPadding = isToolbarVertical
        ? Toolbar._buttonPaddingVertical
        : Toolbar._buttonPaddingHorizontal;

    final currentColor = switch (widget.currentTool) {
      Pen pen => pen.strokeProperties.color,
      Select select => select.getDominantStrokeColor(),
      _ => null,
    };

    if (widget.currentTool == Select.currentSelect) {
      // Enable selection bar only when selection is done
      toolOptionsType.value = Select.currentSelect.doneSelecting
          ? ToolOptions.select
          : ToolOptions.hide;
    }

    final children = <Widget>[
      ValueListenableBuilder(
        valueListenable: showExportOptions,
        builder: (context, showExportOptions, child) {
          return Collapsible(
            axis: isToolbarVertical ? CollapsibleAxis.horizontal : CollapsibleAxis.vertical,
            maintainState: true,
            collapsed: !showExportOptions,
            child: child!,
          );
        },
        child: ExportBar(
          axis: isToolbarVertical ? Axis.vertical : Axis.horizontal,
          toggleExportBar: toggleExportBar,
          exportAsSbn: widget.exportAsSbn,
          exportAsPdf: widget.exportAsPdf,
          exportAsPng: widget.exportAsPng,
        ),
      ),
      ValueListenableBuilder(
        valueListenable: toolOptionsType,
        builder: (context, toolOptionsType, _) {
          return Collapsible(
            axis: isToolbarVertical ? CollapsibleAxis.horizontal : CollapsibleAxis.vertical,
            maintainState: false,
            collapsed: toolOptionsType == ToolOptions.hide,
            child: switch (toolOptionsType) {
              ToolOptions.hide => const SizedBox(),
              ToolOptions.pen => PenModal(
                getTool: () => Pen.currentPen,
                setTool: widget.setTool,
              ),
              ToolOptions.highlighter => PenModal(
                getTool: () => Highlighter.currentHighlighter,
                setTool: widget.setTool,
              ),
              ToolOptions.select => SelectionBar(
                duplicateSelection: widget.duplicateSelection,
                deleteSelection: widget.deleteSelection,
              ),
            },
          );
        },
      ),
      ValueListenableBuilder(
        valueListenable: showColorOptions,
        builder: (context, showColorOptions, child) {
          return Collapsible(
            axis: isToolbarVertical ? CollapsibleAxis.horizontal : CollapsibleAxis.vertical,
            maintainState: true,
            collapsed: !showColorOptions,
            child: child!,
          );
        },
        child: ColorBar(
          axis: isToolbarVertical ? Axis.vertical : Axis.horizontal,
          setColor: widget.setColor,
          currentColor: currentColor,
          invert: invert,
        ),
      ),
      ValueListenableBuilder(
        valueListenable: widget.quillFocus,
        builder: (context, quill, _) {
          return Collapsible(
            axis: isToolbarVertical ? CollapsibleAxis.horizontal : CollapsibleAxis.vertical,
            maintainState: false,
            collapsed: !widget.textEditing || quill == null,
            child: quill != null ? QuillToolbar.basic(
              axis: isToolbarVertical ? Axis.vertical : Axis.horizontal,
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
              showUndo: false,
              showRedo: false,
              showFontSize: false,
              showFontFamily: false,
              showClearFormat: false,
            ) : const SizedBox.shrink(),
          );
        }
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            direction: isToolbarVertical ? Axis.vertical : Axis.horizontal,
            alignment: WrapAlignment.center,
            runSpacing: 8,
            children: [
              ToolbarIconButton(
                tooltip: Pen.currentPen.name,
                selected: widget.currentTool == Pen.currentPen,
                enabled: !widget.readOnly,
                onPressed: () {
                  if (widget.currentTool == Pen.currentPen) {
                    if (toolOptionsType.value == ToolOptions.pen) {
                      toolOptionsType.value = ToolOptions.hide;
                    } else {
                      toolOptionsType.value = ToolOptions.pen;
                    }
                  } else {
                    toolOptionsType.value = ToolOptions.hide;
                    widget.setTool(Pen.currentPen);
                  }
                },
                padding: buttonPadding,
                child: FaIcon(Pen.currentPen.icon, size: 16),
              ),
              ToolbarIconButton(
                tooltip: t.editor.pens.highlighter,
                selected: widget.currentTool == Highlighter.currentHighlighter,
                enabled: !widget.readOnly,
                onPressed: () {
                  if (widget.currentTool == Highlighter.currentHighlighter) {
                    if (toolOptionsType.value == ToolOptions.highlighter) {
                      toolOptionsType.value = ToolOptions.hide;
                    } else {
                      toolOptionsType.value = ToolOptions.highlighter;
                    }
                  } else {
                    toolOptionsType.value = ToolOptions.hide;
                    widget.setTool(Highlighter.currentHighlighter);
                  }
                },
                padding: buttonPadding,
                child: const FaIcon(FontAwesomeIcons.highlighter, size: 16),
              ),
              ValueListenableBuilder(
                valueListenable: showColorOptions,
                builder: (context, showColorOptions, child) {
                  return ToolbarIconButton(
                    tooltip: t.editor.toolbar.toggleColors,
                    selected: showColorOptions,
                    enabled: !widget.readOnly,
                    onPressed: toggleColorOptions,
                    padding: buttonPadding,
                    child: child!,
                  );
                },
                child: currentColor == null
                    ? const Icon(Icons.palette)
                    : Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: currentColor.withInversion(invert).withOpacity(1),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colorScheme.primary,
                            width: 2,
                          ),
                        ),
                      ),
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.select,
                selected: widget.currentTool is Select,
                enabled: !widget.readOnly,
                onPressed: () {
                  toolOptionsType.value = ToolOptions.hide;
                  widget.setTool(Select.currentSelect);
                },
                padding: buttonPadding,
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
                tooltip: t.editor.pens.laserPointer,
                selected: widget.currentTool == LaserPointer.currentLaserPointer,
                enabled: true, // even in read-only mode
                onPressed: () {
                  toolOptionsType.value = ToolOptions.hide;
                  widget.setTool(LaserPointer.currentLaserPointer);
                },
                padding: buttonPadding,
                // TODO: use [Icons.stylusLaserPointer] when it's available
                child: const FaIcon(FontAwesomeIcons.circleDot, size: 16),
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.toggleEraser,
                selected: widget.currentTool is Eraser,
                enabled: !widget.readOnly,
                onPressed: toggleEraser,
                padding: buttonPadding,
                child: const FaIcon(FontAwesomeIcons.eraser, size: 16),
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.photo,
                enabled: !widget.readOnly,
                onPressed: widget.pickPhoto,
                padding: buttonPadding,
                child: const AdaptiveIcon(
                  icon: Icons.photo,
                  cupertinoIcon: CupertinoIcons.photo,
                ),
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.text,
                selected: widget.textEditing,
                enabled: !widget.readOnly,
                onPressed: widget.toggleTextEditing,
                padding: buttonPadding,
                child: const AdaptiveIcon(
                  icon: Icons.text_fields,
                  cupertinoIcon: CupertinoIcons.text_cursor,
                ),
              ),
              if (!Prefs.hideFingerDrawingToggle.value) ToolbarIconButton(
                tooltip: t.editor.toolbar.toggleFingerDrawing,
                selected: Prefs.editorFingerDrawing.value,
                enabled: !widget.readOnly,
                onPressed: widget.toggleFingerDrawing,
                padding: buttonPadding,
                child: const Icon(CupertinoIcons.hand_draw),
              ),
              ToolbarIconButton(
                tooltip: t.editor.toolbar.fullscreen,
                selected: DynamicMaterialApp.isFullscreen,
                enabled: !widget.readOnly,
                onPressed: toggleFullscreen,
                padding: buttonPadding,
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
                    onPressed: widget.undo,
                    padding: buttonPadding,
                    child: const AdaptiveIcon(
                      icon: Icons.undo,
                      cupertinoIcon: CupertinoIcons.arrow_uturn_left,
                    ),
                  ),
                  ToolbarIconButton(
                    tooltip: t.editor.toolbar.redo,
                    enabled: !widget.readOnly && widget.isRedoPossible,
                    onPressed: widget.redo,
                    padding: buttonPadding,
                    child: const AdaptiveIcon(
                      icon: Icons.redo,
                      cupertinoIcon: CupertinoIcons.arrow_uturn_right,
                    ),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: showExportOptions,
                builder: (context, showExportOptions, child) {
                  return ToolbarIconButton(
                    tooltip: t.editor.toolbar.export,
                    selected: showExportOptions,
                    enabled: !widget.readOnly,
                    onPressed: toggleExportBar,
                    padding: buttonPadding,
                    child: child!,
                  );
                },
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

enum ToolOptions {
  hide,
  pen,
  highlighter,
  select,
}
