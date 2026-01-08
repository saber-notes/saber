import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:screenshot/screenshot.dart';

abstract class EditorExporter {
  /// Most* strokes can be drawn to the PDF canvas as vector graphics.
  /// This function returns true if [stroke] is one of those strokes.
  ///
  /// Strokes that can't be drawn as vector graphics include:
  /// - Highlighter strokes, because PDFs don't support transparency
  /// - Pencil strokes, which need a special shader to look correct
  static bool shouldRasterizeStroke(Stroke stroke) {
    return stroke.toolId == .highlighter || stroke.toolId == .pencil;
  }

  static Future<pw.Document> generatePdf(
    EditorCoreInfo coreInfo,
    BuildContext context,
  ) async {
    if (coreInfo.pages.isNotEmpty && coreInfo.pages.last.isEmpty) {
      // don't export the empty last page
      coreInfo = coreInfo.copyWith(
        pages: coreInfo.pages.toList()..removeLast(),
      );
    }

    final pdf = pw.Document();
    final screenshotController = ScreenshotController();

    // screenshot each page
    final pageScreenshots = await Future.wait(
      List.generate(
        coreInfo.pages.length,
        (pageIndex) => screenshotPage(
          coreInfo: coreInfo,
          pageIndex: pageIndex,
          screenshotController: screenshotController,
        ),
      ),
    );

    for (int pageIndex = 0; pageIndex < pageScreenshots.length; ++pageIndex) {
      final page = coreInfo.pages[pageIndex];
      final pageSize = page.size;
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(pageSize.width, pageSize.height),
          build: (pw.Context context) {
            return pw.SizedBox(
              width: pageSize.width,
              height: pageSize.height,
              child: pw.CustomPaint(
                foregroundPainter: (PdfGraphics pdfGraphics, PdfPoint size) {
                  final backgroundColor = PdfColor.fromInt(
                    coreInfo.backgroundColor?.toARGB32() ??
                        InnerCanvas.defaultBackgroundColor.toARGB32(),
                  ).flatten();

                  final strokes = page.strokes.where(
                    (stroke) => !shouldRasterizeStroke(stroke),
                  );
                  for (final stroke in strokes) {
                    final strokeColor = PdfColor.fromInt(
                      stroke.color.toARGB32(),
                    ).flatten(background: backgroundColor);

                    /// Whether we need to fill the shape, or draw its stroke
                    final bool shouldFillShape;
                    if (stroke is CircleStroke) {
                      shouldFillShape = false;
                      pdfGraphics.drawEllipse(
                        stroke.center.dx,
                        pageSize.height - stroke.center.dy,
                        stroke.radius,
                        stroke.radius,
                        clockwise: false,
                      );
                    } else if (stroke is RectangleStroke) {
                      shouldFillShape = false;
                      final strokeSize = stroke.options.size;
                      pdfGraphics.drawRRect(
                        stroke.rect.left,
                        pageSize.height - stroke.rect.bottom,
                        stroke.rect.width,
                        stroke.rect.height,
                        strokeSize / 4,
                        strokeSize / 4,
                      );
                    } else {
                      shouldFillShape = true;
                      pdfGraphics.drawShape(stroke.toSvgPath());
                    }

                    if (shouldFillShape) {
                      // fill
                      pdfGraphics.setFillColor(strokeColor);
                      pdfGraphics.fillPath();
                    } else {
                      // stroke
                      pdfGraphics.setStrokeColor(strokeColor);
                      pdfGraphics.setLineWidth(stroke.options.size);
                      pdfGraphics.strokePath();
                    }
                  }
                },
                child: pw.Image(
                  pw.MemoryImage(pageScreenshots[pageIndex]),
                  width: pageSize.width,
                  height: pageSize.height,
                ),
              ),
            );
          },
        ),
      );
    }

    return pdf;
  }

  /// Returns a screenshot of the page at [pageIndex] in [coreInfo].
  ///
  /// Note that screenshots do not include most* strokes
  /// because they're added separately to the PDF as vector graphics.
  /// See [shouldRasterizeStroke] for more details, or set
  /// [rasterizeAllStrokes] to true to include all strokes in the screenshot.
  static Future<Uint8List> screenshotPage({
    required EditorCoreInfo coreInfo,
    required int pageIndex,
    required ScreenshotController screenshotController,
    bool rasterizeAllStrokes = false,
    Size? targetSize,
    double? cropHeight,
    double pixelRatio = 2,
  }) async {
    final page = coreInfo.pages[pageIndex].cloneForRasterization(
      rasterizeAllStrokes: rasterizeAllStrokes,
    );
    try {
      targetSize ??= page.size;
      coreInfo = coreInfo.copyWith(
        pages: [
          for (var i = 0; i < coreInfo.pages.length; ++i)
            if (i == pageIndex) page else coreInfo.pages[i],
        ],
      );
      return await screenshotController.captureFromWidget(
        EditorExporterTheme(
          targetSize: targetSize,
          child: CanvasPreview(
            pageIndex: pageIndex,
            height: cropHeight,
            coreInfo: coreInfo,
          ),
        ),
        pixelRatio: pixelRatio,
        targetSize: targetSize,
      );
    } finally {
      page.disposeClonedData();
    }
  }
}

/// Applies a consistent theme to its [child] so that exports
/// look the same regardless of the user's current theme or device.
class EditorExporterTheme extends StatelessWidget {
  const EditorExporterTheme({
    super.key,
    required this.targetSize,
    required this.child,
  });

  final Size targetSize;
  final Widget child;

  static final theme = ThemeData(
    brightness: .light,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.red,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(size: targetSize),
      child: Localizations(
        // needed to avoid errors with Quill, but not actually used
        locale: const Locale('en', 'US'),
        delegates: GlobalMaterialLocalizations.delegates,
        child: Theme(
          data: theme,
          child: DefaultTextStyle(
            style: theme.textTheme.bodyMedium!,
            child: SizedBox(
              width: targetSize.width,
              height: targetSize.height,
              child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
