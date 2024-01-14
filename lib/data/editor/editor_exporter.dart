import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/pencil.dart';
import 'package:screenshot/screenshot.dart';

abstract class EditorExporter {
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.red;

  /// Most* strokes can be drawn to the PDF canvas as vector graphics.
  /// This function returns true if [stroke] is one of those strokes.
  ///
  /// Strokes that can't be drawn as vector graphics include:
  /// - Highlighter strokes, because PDFs don't support transparency
  /// - Pencil strokes, which need a special shader to look correct
  static bool _shouldRasterizeStroke(Stroke stroke) {
    return stroke.penType == (Highlighter).toString() ||
        stroke.penType == (Pencil).toString();
  }

  static Future<pw.Document> generatePdf(
      EditorCoreInfo coreInfo, BuildContext context) async {
    coreInfo = coreInfo.copyWith(
      pages: coreInfo.pages
          // don't export the empty last page
          .whereIndexed((index, page) =>
              index != coreInfo.pages.length - 1 || page.isNotEmpty)
          .toList(),
    );

    final pw.Document pdf = pw.Document();
    ScreenshotController screenshotController = ScreenshotController();

    List<Uint8List> pageScreenshots = await Future.wait(coreInfo.pages
        // screenshot each page
        .mapIndexed((index, page) => screenshotPage(
              coreInfo: coreInfo,
              pageIndex: index,
              screenshotController: screenshotController,
              context: context,
            )));
    assert(pageScreenshots.length <= coreInfo.pages.length);

    for (int pageIndex = 0; pageIndex < pageScreenshots.length; ++pageIndex) {
      Size pageSize = coreInfo.pages[pageIndex].size;
      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat(pageSize.width, pageSize.height),
          build: (pw.Context context) {
            return pw.SizedBox(
              width: pageSize.width,
              height: pageSize.height,
              child: pw.CustomPaint(
                foregroundPainter: (PdfGraphics pdfGraphics, PdfPoint size) {
                  final EditorPage page = coreInfo.pages[pageIndex];
                  final PdfColor backgroundColor = PdfColor.fromInt(
                          coreInfo.backgroundColor?.value ??
                              InnerCanvas.defaultBackgroundColor.value)
                      .flatten();

                  final Iterable<Stroke> strokes = page.strokes
                      .where((stroke) => !_shouldRasterizeStroke(stroke));
                  for (Stroke stroke in strokes) {
                    final bool shapePaint;
                    if (stroke is CircleStroke) {
                      shapePaint = true;
                      pdfGraphics.drawEllipse(
                        stroke.center.dx,
                        pageSize.height - stroke.center.dy,
                        stroke.radius,
                        stroke.radius,
                        clockwise: false,
                      );
                    } else if (stroke is RectangleStroke) {
                      shapePaint = true;
                      final strokeSize = stroke.options.size;
                      pdfGraphics.drawRRect(
                        stroke.rect.left,
                        pageSize.height - stroke.rect.bottom,
                        stroke.rect.width,
                        stroke.rect.height,
                        strokeSize / 4,
                        strokeSize / 4,
                      );
                    } else if (stroke.length <= 2) {
                      // a dot
                      shapePaint = false;
                      final bounds = stroke.path.getBounds();
                      final radius =
                          max(bounds.size.width, stroke.options.size * 0.5) / 2;
                      pdfGraphics.drawEllipse(
                        bounds.center.dx,
                        pageSize.height - bounds.center.dy,
                        radius,
                        radius,
                      );
                    } else {
                      shapePaint = false;
                      pdfGraphics.drawShape(stroke.toSvgPath(pageSize));
                    }

                    if (shapePaint) {
                      // stroke
                      pdfGraphics.setStrokeColor(
                          PdfColor.fromInt(stroke.color.value)
                              .flatten(background: backgroundColor));
                      pdfGraphics.setLineWidth(stroke.options.size);
                      pdfGraphics.strokePath();
                    } else {
                      // fill
                      pdfGraphics.setFillColor(
                          PdfColor.fromInt(stroke.color.value)
                              .flatten(background: backgroundColor));
                      pdfGraphics.fillPath();
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
          }));
    }

    return pdf;
  }

  /// Returns a screenshot of the page at [pageIndex] in [coreInfo].
  ///
  /// Note that screenshots do not include most* strokes
  /// because they're added separately to the PDF as vector graphics.
  /// See [_shouldRasterizeStroke] for more details.
  static Future<Uint8List> screenshotPage({
    required EditorCoreInfo coreInfo,
    required int pageIndex,
    required ScreenshotController screenshotController,
    required BuildContext context,
  }) async {
    final pageSize = coreInfo.pages[pageIndex].size;
    return await screenshotController.captureFromWidget(
      Localizations(
        // needed to avoid errors with Quill, but not actually used
        locale: const Locale('en', 'US'),
        delegates: GlobalMaterialLocalizations.delegates,
        child: Theme(
          data: ThemeData(
            brightness: Brightness.light,
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
              secondary: secondaryColor,
            ),
          ),
          child: InnerCanvas(
            pageIndex: pageIndex,
            width: pageSize.width,
            height: pageSize.height,
            isPrint: true,
            textEditing: false,
            coreInfo: coreInfo.copyWith(
              pages: coreInfo.pages
                  .map((page) => page.copyWith(
                        strokes: page.strokes
                            .where((stroke) => _shouldRasterizeStroke(stroke))
                            .toList(),
                      ))
                  .toList(),
            ),
            currentStroke: null,
            currentStrokeDetectedShape: null,
            currentSelection: null,
            currentToolIsSelect: false,
          ),
        ),
      ),
      context: context,
      pixelRatio: 2,
      targetSize: pageSize,
    );
  }
}
