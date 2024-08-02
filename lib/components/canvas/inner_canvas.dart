import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_canvas_painter.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
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

    /// [locale] doesn't matter for the preview or print views,
    /// and [TranslationProvider] isn't available in the test environment.
    final locale = (widget.isPreview || widget.isPrint)
        ? null
        : TranslationProvider.of(context).flutterLocale;

    Widget? quillEditor = widget.coreInfo.pages.isNotEmpty
        ? QuillEditor(
            controller:
                widget.coreInfo.pages[widget.pageIndex].quill.controller,
            configurations: QuillEditorConfigurations(
              sharedConfigurations: QuillSharedConfigurations(
                locale: locale,
              ),
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

    // Load handwriting fonts
    final neucha = GoogleFonts.neucha();
    final dekko = GoogleFonts.dekko();
    final fontFamily = neucha.fontFamily ?? 'Neucha';
    final fontFamilyFallback = [
      if (neucha.fontFamily != null) neucha.fontFamily!,
      'Neucha',
      if (dekko.fontFamily != null) dekko.fontFamily!,
      'Dekko',
      // Fallback fonts from https://github.com/system-fonts/modern-font-stacks#handwritten
      'Segoe Print',
      'Bradley Hand',
      'Chilanka',
      'TSCu_Comic',
      'Coming Soon',
      'casual',
      'cursive',
      'handwriting',
      'sans-serif',
    ];

    final defaultStyle = TextStyle(
      inherit: false,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
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
        decorationColor: defaultStyle.color?.withOpacity(0.6),
        decorationThickness: 3,
      ),
      displayMedium: defaultStyle.copyWith(
        fontSize: lineHeight * 1,
        height: 1 / 1,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withOpacity(0.5),
        decorationThickness: 3,
      ),
      displaySmall: defaultStyle.copyWith(
        fontSize: lineHeight * 0.9,
        height: 1 / 0.9,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withOpacity(0.4),
        decorationThickness: 3,
      ),
    );

    const zeroVerticalSpacing = VerticalSpacing(0, 0);
    const zeroHorizontalSpacing = HorizontalSpacing(0, 0);

    return DefaultStyles(
      h1: DefaultTextBlockStyle(
        textTheme.displayLarge!,
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
        null,
      ),
      h2: DefaultTextBlockStyle(
        textTheme.displayMedium!,
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
        null,
      ),
      h3: DefaultTextBlockStyle(
        textTheme.displaySmall!,
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
        null,
      ),
      paragraph: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
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
        style: GoogleFonts.firaMono(textStyle: textTheme.bodyLarge!).copyWith(
          backgroundColor: Color.lerp(backgroundColor, Colors.grey, 0.2),
        ),
        header1: GoogleFonts.firaMono(textStyle: textTheme.displayLarge!),
        header2: GoogleFonts.firaMono(textStyle: textTheme.displayMedium!),
        header3: GoogleFonts.firaMono(textStyle: textTheme.displaySmall!),
      ),
      link: TextStyle(
        color: colorScheme.secondary,
        decoration: TextDecoration.underline,
      ),
      placeHolder: DefaultTextBlockStyle(
        textTheme.bodyLarge!.copyWith(
          color: Colors.grey.withOpacity(0.6),
        ),
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
        null,
      ),
      lists: DefaultListBlockStyle(
        textTheme.bodyLarge!,
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
        null,
        null,
      ),
      quote: DefaultTextBlockStyle(
        TextStyle(color: textTheme.bodyLarge!.color!.withOpacity(0.6)),
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
        BoxDecoration(
          border: Border(
            left: BorderSide(
              color: textTheme.bodyLarge!.color!.withOpacity(0.6),
              width: 4,
            ),
          ),
        ),
      ),
      code: DefaultTextBlockStyle(
        GoogleFonts.firaMono(textStyle: textTheme.bodyLarge!),
        zeroHorizontalSpacing,
        VerticalSpacing(-lineHeight * 0.16, lineHeight * 0.8),
        zeroVerticalSpacing,
        BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      indent: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
        null,
      ),
      align: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
        null,
      ),
      leading: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        zeroHorizontalSpacing,
        zeroVerticalSpacing,
        zeroVerticalSpacing,
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
