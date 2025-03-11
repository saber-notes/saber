import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_canvas_painter.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/i18n/strings.g.dart';

class InnerCanvas extends StatefulWidget {
  const InnerCanvas({
    super.key,
    required this.pageIndex,
    this.redrawPageListenable,
    required this.width,
    required this.height,
    this.isPreview = false,
    this.isPrint = false,
    this.textEditing = false,
    required this.coreInfo,
    required this.currentStroke,
    required this.currentStrokeDetectedShape,
    required this.currentSelection,
    this.setAsBackground,
    this.onRenderObjectChange,
    this.hideBackground = false,
    required this.currentToolIsSelect,
    required this.currentScale,
  });

  final int pageIndex;
  final Listenable? redrawPageListenable;
  final double width;
  final double height;

  final bool isPreview;
  final bool isPrint;

  final bool textEditing;
  final EditorCoreInfo coreInfo;
  final Stroke? currentStroke;
  final RecognizedUnistroke? currentStrokeDetectedShape;
  final SelectResult? currentSelection;
  final void Function(EditorImage image)? setAsBackground;
  final ValueChanged<RenderObject>? onRenderObjectChange;

  final bool hideBackground;
  final bool currentToolIsSelect;

  final double currentScale;

  static const Color defaultBackgroundColor = Color(0xFFFCFCFC);

  @override
  State<InnerCanvas> createState() => _InnerCanvasState();
}

class _InnerCanvasState extends State<InnerCanvas> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Brightness brightness = Theme.of(context).brightness;
    final bool invert =
        Prefs.editorAutoInvert.value && brightness == Brightness.dark;
    final Color backgroundColor =
        widget.coreInfo.backgroundColor ?? InnerCanvas.defaultBackgroundColor;

    if (widget.coreInfo.pages.isEmpty) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
      );
    }

    final page = widget.coreInfo.pages[widget.pageIndex];

    Widget? quillEditor = widget.coreInfo.pages.isNotEmpty
        ? QuillEditor(
            controller:
                widget.coreInfo.pages[widget.pageIndex].quill.controller,
            config: QuillEditorConfig(
              customStyles: _getQuillStyles(invert: invert),
              scrollable: false,
              autoFocus: false,
              expands: true,
              placeholder:
                  widget.textEditing ? t.editor.quill.typeSomething : null,
              showCursor: true,
              keyboardAppearance: invert ? Brightness.dark : Brightness.light,
              padding: EdgeInsets.only(
                top: widget.coreInfo.lineHeight * 1.2,
                left: widget.coreInfo.lineHeight * 0.5,
                right: widget.coreInfo.lineHeight * 0.5,
                bottom: widget.coreInfo.lineHeight * 0.5,
              ),
            ),
            scrollController: ScrollController(),
            focusNode: widget.coreInfo.pages[widget.pageIndex].quill.focusNode,
          )
        : null;

    return RepaintBoundary(
      child: CustomPaint(
        painter: CanvasBackgroundPainter(
          invert: invert,
          backgroundColor: () {
            if (page.backgroundImage != null) {
              return Colors.white;
            } else if (widget.hideBackground) {
              return InnerCanvas.defaultBackgroundColor;
            } else {
              return backgroundColor;
            }
          }(),
          backgroundPattern: () {
            if (page.backgroundImage != null) {
              return CanvasBackgroundPattern.none;
            } else if (widget.hideBackground) {
              return CanvasBackgroundPattern.none;
            } else {
              return widget.coreInfo.backgroundPattern;
            }
          }(),
          lineHeight: widget.coreInfo.lineHeight,
          lineThickness: widget.coreInfo.lineThickness,
          primaryColor: colorScheme.primary,
          secondaryColor: colorScheme.secondary,
        ),
        foregroundPainter: CanvasPainter(
          repaint: widget.redrawPageListenable,
          invert: invert,
          strokes: page.strokes,
          laserStrokes: page.laserStrokes,
          currentStroke: widget.currentStroke,
          currentSelection: widget.currentSelection,
          primaryColor: colorScheme.primary,
          page: page,
          showPageIndicator: !widget.isPreview &&
              (!widget.isPrint || Prefs.printPageIndicators.value),
          pageIndex: widget.pageIndex,
          totalPages: widget.coreInfo.pages.length,
          currentScale: widget.currentScale,
        ),
        isComplex: true,
        willChange: true,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: DeferredPointerHandler(
            child: Stack(
              children: [
                if (page.backgroundImage != null)
                  CanvasImage(
                    filePath: widget.coreInfo.filePath,
                    image: page.backgroundImage!,
                    pageSize: Size(widget.width, widget.height),
                    setAsBackground: null,
                    isBackground: true,
                    readOnly: true,
                  ),
                Positioned(
                  top: 0,
                  left: 0,
                  width: widget.width,
                  height: widget.height,
                  child: IgnorePointer(
                    ignoring: widget.coreInfo.readOnly || !widget.textEditing,
                    child: quillEditor,
                  ),
                ),
                for (int i = 0; i < page.images.length; i++)
                  CanvasImage(
                    filePath: widget.coreInfo.filePath,
                    image: page.images[i],
                    pageSize: Size(widget.width, widget.height),
                    setAsBackground: widget.setAsBackground,
                    readOnly:
                        widget.coreInfo.readOnly || !widget.currentToolIsSelect,
                    selected: widget.currentSelection?.images
                            .contains(page.images[i]) ??
                        false,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Adapted from https://github.com/singerdmx/flutter-quill/blob/master/lib/src/editor/widgets/default_styles.dart
  DefaultStyles _getQuillStyles({required bool invert}) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = invert ? Colors.black : Colors.white;
    final lineHeight = widget.coreInfo.lineHeight;

    final defaultStyle = TextStyle(
      inherit: false,
      fontFamily: 'Neucha',
      fontFamilyFallback: saberHandwritingFontFallbacks,
      color: invert ? Colors.white : Colors.black,
    );

    final textTheme = TextTheme(
      bodyLarge: defaultStyle.copyWith(
        fontSize: lineHeight * 0.7,
        height: 1 / 0.7,
      ),
      displayLarge: defaultStyle.copyWith(
        fontSize: lineHeight * 1.15,
        height: 1 / 1.15,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withValues(alpha: 0.6),
        decorationThickness: 3,
      ),
      displayMedium: defaultStyle.copyWith(
        fontSize: lineHeight * 1,
        height: 1 / 1,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withValues(alpha: 0.5),
        decorationThickness: 3,
      ),
      displaySmall: defaultStyle.copyWith(
        fontSize: lineHeight * 0.9,
        height: 1 / 0.9,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withValues(alpha: 0.4),
        decorationThickness: 3,
      ),
    );

    return DefaultStyles(
      h1: DefaultTextBlockStyle(
        textTheme.displayLarge!,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      h2: DefaultTextBlockStyle(
        textTheme.displayMedium!,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      h3: DefaultTextBlockStyle(
        textTheme.displaySmall!,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      paragraph: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      small: TextStyle(
        fontSize: lineHeight * 0.4,
        height: 1 / 0.4,
      ),
      inlineCode: InlineCodeStyle(
        // [InlineCodeStyle.backgroundColor] is broken right now,
        // so inline code always has a white-ish background.
        //
        // We set [InlineCodeStyle.style.backgroundColor] to make it readable,
        // but this isn't perfect: see test/sbn_examples/v9_quill.sbn.dark.png
        // for the issue.
        //
        // Also see https://github.com/singerdmx/flutter-quill/issues/1014
        backgroundColor: Colors.transparent,
        radius: const Radius.circular(3),
        style: textTheme.bodyLarge!.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
          backgroundColor: Color.lerp(backgroundColor, Colors.grey, 0.2),
        ),
        header1: textTheme.displayLarge!.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
        header2: textTheme.displayMedium!.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
        header3: textTheme.displaySmall!.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
      ),
      link: TextStyle(
        color: colorScheme.secondary,
        decoration: TextDecoration.underline,
      ),
      placeHolder: DefaultTextBlockStyle(
        textTheme.bodyLarge!.copyWith(
          color: Colors.grey.withValues(alpha: 0.6),
        ),
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      lists: DefaultListBlockStyle(
        textTheme.bodyLarge!,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
        null,
      ),
      quote: DefaultTextBlockStyle(
        TextStyle(color: textTheme.bodyLarge!.color!.withValues(alpha: 0.6)),
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        BoxDecoration(
          border: Border(
            left: BorderSide(
              color: textTheme.bodyLarge!.color!.withValues(alpha: 0.6),
              width: 4,
            ),
          ),
        ),
      ),
      code: DefaultTextBlockStyle(
        textTheme.bodyLarge!.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
        HorizontalSpacing.zero,
        VerticalSpacing(-lineHeight * 0.16, lineHeight * 0.8),
        VerticalSpacing.zero,
        BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      indent: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      align: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      leading: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      sizeSmall: TextStyle(
        fontSize: textTheme.bodyLarge!.fontSize!,
      ),
      sizeLarge: TextStyle(
        fontSize: textTheme.bodyLarge!.fontSize!,
      ),
      sizeHuge: TextStyle(
        fontSize: textTheme.bodyLarge!.fontSize!,
      ),
    );
  }
}
