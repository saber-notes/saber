
import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:tuple/tuple.dart';

import '_canvas_painter.dart';
import '_stroke.dart';

class InnerCanvas extends StatefulWidget {
  const InnerCanvas({
    super.key,
    this.pageIndex = 0,
    required this.width,
    required this.height,
    this.textEditing = false,
    required this.coreInfo,
    required this.currentStroke,
    this.onRenderObjectChange,
  });

  final int pageIndex;
  final double width;
  final double height;

  final bool textEditing;
  final EditorCoreInfo coreInfo;
  final Stroke? currentStroke;
  final ValueChanged<RenderObject>? onRenderObjectChange;

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
      child: widget.coreInfo.pages.isNotEmpty ? QuillEditor(
        controller: widget.coreInfo.pages[widget.pageIndex].quill.controller,
        scrollController: ScrollController(),
        scrollable: false,
        autoFocus: false,
        readOnly: false,
        expands: true,
        focusNode: widget.coreInfo.pages[widget.pageIndex].quill.focusNode,
        padding: EdgeInsets.zero,
        customStyles: _getQuillStyles(context, invert: invert),
        locale: TranslationProvider.of(context).flutterLocale,
        placeholder: "Type here",
        showCursor: true,
        keyboardAppearance: invert ? Brightness.dark : Brightness.light,
      ) : null,
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

  /// Adapted from "packages://flutter_quill/lib/src/widgets/default_styles.dart"
  DefaultStyles _getQuillStyles(BuildContext context, {required bool invert}) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = GoogleFonts.neuchaTextTheme( // neucha is a handwriting font
      ThemeData(brightness: invert ? Brightness.dark : Brightness.light).textTheme,
    );
    final TextStyle defaultStyle = TextStyle(color: invert ? Colors.white : Colors.black);
    final TextStyle bodyStyle = textTheme.bodyText1 ?? defaultStyle;

    const zeroSpacing = Tuple2<double, double>(0, 0);
    const baseSpacing = Tuple2<double, double>(6, 0);

    return DefaultStyles.getInstance(context).merge(DefaultStyles(
      h1: DefaultTextBlockStyle(
        textTheme.titleLarge ?? defaultStyle,
        const Tuple2(16, 0), zeroSpacing, null
      ),
      h2: DefaultTextBlockStyle(
        textTheme.titleMedium ?? defaultStyle,
        const Tuple2(8, 0), zeroSpacing, null
      ),
      h3: DefaultTextBlockStyle(
        textTheme.titleSmall ?? defaultStyle,
        const Tuple2(8, 0), zeroSpacing, null
      ),
      paragraph: DefaultTextBlockStyle(
        bodyStyle,
        zeroSpacing, zeroSpacing, null
      ),
      bold: const TextStyle(fontWeight: FontWeight.bold),
      italic: const TextStyle(fontStyle: FontStyle.italic),
      small: const TextStyle(fontSize: 12),
      underline: const TextStyle(decoration: TextDecoration.underline),
      strikeThrough: const TextStyle(decoration: TextDecoration.lineThrough),
      inlineCode: InlineCodeStyle(
        backgroundColor: Colors.grey.shade100,
        radius: const Radius.circular(3),
        style: GoogleFonts.firaMono(textStyle: bodyStyle),
        header1: GoogleFonts.firaMono(textStyle: textTheme.titleLarge),
        header2: GoogleFonts.firaMono(textStyle: textTheme.titleMedium),
        header3: GoogleFonts.firaMono(textStyle: textTheme.titleSmall),
      ),
      link: TextStyle(
        color: themeData.colorScheme.secondary,
        decoration: TextDecoration.underline,
      ),
      placeHolder: DefaultTextBlockStyle(
        bodyStyle.copyWith(
          color: Colors.grey.withOpacity(0.6),
        ),
        zeroSpacing, zeroSpacing, null
      ),
      lists: DefaultListBlockStyle(
        bodyStyle,
        baseSpacing, const Tuple2(0, 6), null, null,
      ),
      quote: DefaultTextBlockStyle(
        TextStyle(color: (bodyStyle.color ?? defaultStyle.color!).withOpacity(0.6)),
        baseSpacing, const Tuple2(6, 2),
        BoxDecoration(
          border: Border(
            left: BorderSide(
              color: (bodyStyle.color ?? defaultStyle.color!).withOpacity(0.6),
              width: 4,
            ),
          ),
        ),
      ),
      code: DefaultTextBlockStyle(
        GoogleFonts.firaMono(textStyle: bodyStyle),
        baseSpacing, zeroSpacing,
        BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      indent: DefaultTextBlockStyle(
        bodyStyle,
        baseSpacing, const Tuple2(0, 6), null
      ),
      align: DefaultTextBlockStyle(
        bodyStyle,
        zeroSpacing, zeroSpacing, null
      ),
      leading: DefaultTextBlockStyle(
        bodyStyle,
        zeroSpacing, zeroSpacing, null
      ),
    ));
  }
}
