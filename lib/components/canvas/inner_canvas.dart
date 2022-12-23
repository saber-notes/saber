
import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

import '_canvas_painter.dart';
import '_stroke.dart';

class InnerCanvas extends StatefulWidget {
  InnerCanvas({
    super.key,
    this.pageIndex = 0,
    required this.width,
    required this.height,
    this.textEditing = false,
    required EditorCoreInfo coreInfo,
    required this.currentStroke,
    this.onRenderObjectChange,
  }) {
    this.coreInfo = coreInfo.copyWith(
      strokes: coreInfo.strokes.where((stroke) => isStrokeInPage(stroke)).toList(),
    );
  }

  final int pageIndex;
  final double width;
  final double height;

  final bool textEditing;
  late final EditorCoreInfo coreInfo;
  final Stroke? currentStroke;
  final ValueChanged<RenderObject>? onRenderObjectChange;

  bool isStrokeInPage(Stroke stroke) {
    final maxY = stroke.maxY;
    final startOfPageY = height * pageIndex;
    return maxY >= startOfPageY && maxY <= startOfPageY + height;
  }

  static const Color defaultBackgroundColor = Color(0xFFFCFCFC);

  /// Quill text size / UI size is quite small due to the canvas resolution, so we need to scale it up.
  static const double quillScale = 2;

  @override
  State<InnerCanvas> createState() => _InnerCanvasState();
}

class _InnerCanvasState extends State<InnerCanvas> {

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Brightness brightness = Theme.of(context).brightness;
    final bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;
    final Color backgroundColor = widget.coreInfo.backgroundColor ?? InnerCanvas.defaultBackgroundColor;

    Widget quillEditor = Transform.scale(
      scale: InnerCanvas.quillScale,
      alignment: Alignment.topLeft,
      child: QuillEditor(
        controller: widget.coreInfo.quillController,
        scrollController: ScrollController(),
        scrollable: false,
        autoFocus: false,
        readOnly: false,
        expands: true,
        focusNode: widget.coreInfo.quillFocusNode,
        padding: EdgeInsets.zero,
        customStyles: DefaultStyles(
          color: invert ? Colors.white : Colors.black,
        ),
        locale: TranslationProvider.of(context).flutterLocale,
        placeholder: "Type here",
        showCursor: true,
        keyboardAppearance: invert ? Brightness.dark : Brightness.light,
      ),
    );

    return CustomPaint(
      painter: CanvasBackgroundPainter(
        invert: invert,
        backgroundColor: backgroundColor,
        backgroundPattern: widget.coreInfo.backgroundPattern,
        lineHeight: widget.coreInfo.lineHeight,
        primaryColor: colorScheme.primary,
        secondaryColor: colorScheme.secondary,
      ),
      foregroundPainter: CanvasPainter(
        invert: invert,
        strokes: widget.coreInfo.strokes,
        currentStroke: widget.currentStroke,
      ),
      isComplex: true,
      willChange: widget.currentStroke != null,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: DeferredPointerHandler(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                width: widget.width / InnerCanvas.quillScale,
                height: widget.height / InnerCanvas.quillScale,
                child: (widget.coreInfo.readOnly || !widget.textEditing) ? IgnorePointer(
                  child: quillEditor,
                ) : quillEditor,
              ),
              for (final EditorImage editorImage in widget.coreInfo.images)
                CanvasImage(
                  filePath: widget.coreInfo.filePath,
                  image: editorImage,
                  pageSize: Size(widget.width, widget.height),
                  readOnly: widget.coreInfo.readOnly,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
