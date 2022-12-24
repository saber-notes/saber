
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
        padding: EdgeInsets.only(
          top: widget.coreInfo.lineHeight * 1.2 / InnerCanvas.quillScale,
          left: widget.coreInfo.lineHeight * 0.5 / InnerCanvas.quillScale,
          right: widget.coreInfo.lineHeight * 0.5 / InnerCanvas.quillScale,
          bottom: widget.coreInfo.lineHeight * 0.5 / InnerCanvas.quillScale,
        ),
        customStyles: _getQuillStyles(context, invert: invert),
        locale: TranslationProvider.of(context).flutterLocale,
        placeholder: widget.textEditing ? t.editor.quill.typeSomething : null,
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
    final colorScheme = Theme.of(context).colorScheme;

    /// lineHeight in local space
    final double lineHeight = widget.coreInfo.lineHeight / InnerCanvas.quillScale;

    /// Blank TextStyle with the correct color
    final TextStyle defaultStyle = TextStyle(color: invert ? Colors.white : Colors.black);

    TextTheme textTheme = GoogleFonts.neuchaTextTheme( // neucha is a handwriting font
      ThemeData(brightness: invert ? Brightness.dark : Brightness.light).textTheme,
    );
    textTheme = textTheme.copyWith(
      bodyText1: (textTheme.bodyText1 ?? defaultStyle).copyWith(
        fontSize: lineHeight * 0.6,
        height: 1 / 0.6,
      ),
      headline1: (textTheme.headline1 ?? defaultStyle).copyWith(
        fontSize: lineHeight * 0.85,
        height: 1 / 0.85,
        color: defaultStyle.color,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withOpacity(0.9),
      ),
      headline2: (textTheme.headline2 ?? defaultStyle).copyWith(
        fontSize: lineHeight * 0.775,
        height: 1 / 0.775,
        color: defaultStyle.color,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withOpacity(0.6),
      ),
      headline3: (textTheme.headline3 ?? defaultStyle).copyWith(
        fontSize: lineHeight * 0.7,
        height: 1 / 0.7,
        color: defaultStyle.color,
        decoration: TextDecoration.underline,
        decorationColor: defaultStyle.color?.withOpacity(0.3),
      ),
    );

    const zeroSpacing = Tuple2<double, double>(0, 0);

    return DefaultStyles.getInstance(context).merge(DefaultStyles(
      h1: DefaultTextBlockStyle(
        textTheme.headline1!,
        zeroSpacing, zeroSpacing, null
      ),
      h2: DefaultTextBlockStyle(
        textTheme.headline2!,
        zeroSpacing, zeroSpacing, null
      ),
      h3: DefaultTextBlockStyle(
        textTheme.headline3!,
        zeroSpacing, zeroSpacing, null
      ),
      paragraph: DefaultTextBlockStyle(
        textTheme.bodyText1!,
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
        style: GoogleFonts.firaMono(textStyle: textTheme.bodyText1!),
        header1: GoogleFonts.firaMono(textStyle: textTheme.headline1!),
        header2: GoogleFonts.firaMono(textStyle: textTheme.headline2!),
        header3: GoogleFonts.firaMono(textStyle: textTheme.headline3!),
      ),
      link: TextStyle(
        color: colorScheme.secondary,
        decoration: TextDecoration.underline,
      ),
      placeHolder: DefaultTextBlockStyle(
        textTheme.bodyText1!.copyWith(
          color: Colors.grey.withOpacity(0.6),
        ),
        zeroSpacing, zeroSpacing, null
      ),
      lists: DefaultListBlockStyle(
        textTheme.bodyText1!,
        zeroSpacing, zeroSpacing, null, null
      ),
      quote: DefaultTextBlockStyle(
        TextStyle(color: (textTheme.bodyText1!.color ?? defaultStyle.color!).withOpacity(0.6)),
        zeroSpacing, zeroSpacing,
        BoxDecoration(
          border: Border(
            left: BorderSide(
              color: (textTheme.bodyText1!.color ?? defaultStyle.color!).withOpacity(0.6),
              width: 4,
            ),
          ),
        ),
      ),
      code: DefaultTextBlockStyle(
        GoogleFonts.firaMono(textStyle: textTheme.bodyText1!),
        zeroSpacing, zeroSpacing,
        BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      indent: DefaultTextBlockStyle(
        textTheme.bodyText1!,
        zeroSpacing, zeroSpacing, null
      ),
      align: DefaultTextBlockStyle(
        textTheme.bodyText1!,
        zeroSpacing, zeroSpacing, null
      ),
      leading: DefaultTextBlockStyle(
        textTheme.bodyText1!,
        zeroSpacing, zeroSpacing, null
      ),
    ));
  }
}
