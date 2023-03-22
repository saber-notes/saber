import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_canvas_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/tools/select.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/prefs.dart';
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
    final bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;
    final Color backgroundColor = widget.coreInfo.backgroundColor ?? InnerCanvas.defaultBackgroundColor;

    if (widget.coreInfo.pages.isEmpty) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
      );
    }

    final page = widget.coreInfo.pages[widget.pageIndex];

    Locale? locale;
    try {
      locale = TranslationProvider.of(context).flutterLocale;
    } catch (e) {
      /// Error is thrown when using the [screenshot] package
      /// as we don't have a TranslationProvider
      locale = null;
    }

    Widget? quillEditor = widget.coreInfo.pages.isNotEmpty ? QuillEditor(
      controller: widget.coreInfo.pages[widget.pageIndex].quill.controller,
      scrollController: ScrollController(),
      scrollable: false,
      autoFocus: false,
      readOnly: false,
      expands: true,
      focusNode: widget.coreInfo.pages[widget.pageIndex].quill.focusNode,
      padding: EdgeInsets.only(
        top: widget.coreInfo.lineHeight * 1.2,
        left: widget.coreInfo.lineHeight * 0.5,
        right: widget.coreInfo.lineHeight * 0.5,
        bottom: widget.coreInfo.lineHeight * 0.5,
      ),
      customStyles: _getQuillStyles(context, invert: invert),
      locale: locale,
      placeholder: widget.textEditing ? t.editor.quill.typeSomething : null,
      showCursor: true,
      keyboardAppearance: invert ? Brightness.dark : Brightness.light,
    ) : null;

    return RepaintBoundary(
      child: CustomPaint(
        painter: CanvasBackgroundPainter(
          invert: invert,
          backgroundColor: widget.hideBackground
              ? InnerCanvas.defaultBackgroundColor
              : backgroundColor,
          backgroundPattern: widget.hideBackground
              ? CanvasBackgroundPatterns.none
              : widget.coreInfo.backgroundPattern,
          lineHeight: widget.coreInfo.lineHeight,
          primaryColor: colorScheme.primary,
          secondaryColor: colorScheme.secondary,
        ),
        foregroundPainter: CanvasPainter(
          repaint: widget.redrawPageListenable,

          invert: invert,
          strokes: page.strokes,
          currentStroke: widget.currentStroke,
          currentSelection: widget.currentSelection,
          primaryColor: colorScheme.primary,

          showPageIndicator: !widget.isPreview && (!widget.isPrint || Prefs.printPageIndicators.value),
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
                    readOnly: widget.coreInfo.readOnly
                        || !widget.currentToolIsSelect,
                    selected: widget.currentSelection
                        ?.images.contains(page.images[i])
                        ?? false,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Adapted from "packages://flutter_quill/lib/src/widgets/default_styles.dart"
  DefaultStyles _getQuillStyles(BuildContext context, {required bool invert}) {
    final colorScheme = Theme.of(context).colorScheme;

    /// lineHeight in local space
    final num lineHeight = widget.coreInfo.lineHeight;

    /// Blank TextStyle with the correct color
    final TextStyle defaultStyle = TextStyle(color: invert ? Colors.white : Colors.black);

    final TextStyle dekko = GoogleFonts.dekko(); // Preload fallback font
    List<String> fontFamilyFallback = [
      'Neucha',
      dekko.fontFamily ?? 'Dekko',
      'Dekko',
      'Kalam',
      'handwriting',
      'sans-serif',
    ];

    TextTheme textTheme = GoogleFonts.neuchaTextTheme( // neucha is a handwriting font
      ThemeData(brightness: invert ? Brightness.dark : Brightness.light).textTheme,
    );
    textTheme = textTheme.copyWith(
      bodyLarge: (textTheme.bodyLarge ?? defaultStyle).copyWith(
        fontFamilyFallback: fontFamilyFallback,
        fontSize: lineHeight * 0.7,
        height: 1 / 0.7,
        color: textTheme.bodyLarge?.color ?? defaultStyle.color!,
      ),
      displayLarge: (textTheme.displayLarge ?? defaultStyle).copyWith(
        fontFamilyFallback: fontFamilyFallback,
        fontSize: lineHeight * 1.15,
        height: 1 / 1.15,
        color: defaultStyle.color,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withOpacity(0.6),
        decorationThickness: 3,
      ),
      displayMedium: (textTheme.displayMedium ?? defaultStyle).copyWith(
        fontFamilyFallback: fontFamilyFallback,
        fontSize: lineHeight * 1,
        height: 1 / 1,
        color: defaultStyle.color,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withOpacity(0.5),
        decorationThickness: 3,
      ),
      displaySmall: (textTheme.displaySmall ?? defaultStyle).copyWith(
        fontFamilyFallback: fontFamilyFallback,
        fontSize: lineHeight * 0.9,
        height: 1 / 0.9,
        color: defaultStyle.color,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withOpacity(0.4),
        decorationThickness: 3,
      ),
    );

    const zeroSpacing = VerticalSpacing(0, 0);

    return DefaultStyles(
      h1: DefaultTextBlockStyle(
        textTheme.displayLarge!,
        zeroSpacing, zeroSpacing, null
      ),
      h2: DefaultTextBlockStyle(
        textTheme.displayMedium!,
        zeroSpacing, zeroSpacing, null
      ),
      h3: DefaultTextBlockStyle(
        textTheme.displaySmall!,
        zeroSpacing, zeroSpacing, null
      ),
      paragraph: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        zeroSpacing, zeroSpacing, null
      ),
      bold: const TextStyle(fontWeight: FontWeight.bold),
      italic: const TextStyle(fontStyle: FontStyle.italic),
      small: TextStyle(
        fontSize: lineHeight * 0.4,
        height: 1 / 0.4,
      ),
      underline: const TextStyle(decoration: TextDecoration.underline),
      strikeThrough: const TextStyle(decoration: TextDecoration.lineThrough),
      inlineCode: InlineCodeStyle(
        backgroundColor: Colors.grey.withOpacity(0.1),
        radius: const Radius.circular(3),
        style: GoogleFonts.firaMono(textStyle: textTheme.bodyLarge!).copyWith(
          // Setting backgroundColor is broken right now, so this always has a white background.
          // Set text color to black to make it readable.
          // https://github.com/singerdmx/flutter-quill/issues/1014
          color: Colors.black,
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
        zeroSpacing, zeroSpacing, null
      ),
      lists: DefaultListBlockStyle(
        textTheme.bodyLarge!,
        zeroSpacing, zeroSpacing, null, null
      ),
      quote: DefaultTextBlockStyle(
        TextStyle(color: textTheme.bodyLarge!.color!.withOpacity(0.6)),
        zeroSpacing, zeroSpacing,
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
        zeroSpacing, zeroSpacing,
        BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      indent: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        zeroSpacing, zeroSpacing, null
      ),
      align: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        zeroSpacing, zeroSpacing, null
      ),
      leading: DefaultTextBlockStyle(
        textTheme.bodyLarge!,
        zeroSpacing, zeroSpacing, null
      ),
    );
  }
}
