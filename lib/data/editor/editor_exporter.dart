import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:screenshot/screenshot.dart';

abstract class EditorExporter {
  static const Color _primaryColor = Colors.blue;
  static const Color _secondaryColor = Colors.red;

  static Future<pw.Document> generatePdf(EditorCoreInfo coreInfo, BuildContext context) async {
    coreInfo = coreInfo.copyWith(
      pages: coreInfo.pages
        // don't export the empty last page
        .whereIndexed((index, page) =>
           index != coreInfo.pages.length - 1 || page.isNotEmpty)
        .toList(),
    );

    final pw.Document pdf = pw.Document();
    ScreenshotController screenshotController = ScreenshotController();

    List<Uint8List> pageScreenshots = await Future.wait(
      coreInfo.pages
        // screenshot each page
        .mapIndexed((index, page) => screenshotPage(
          coreInfo: coreInfo,
          pageIndex: index,
          screenshotController: screenshotController,
          context: context,
        ))
    );
    assert(pageScreenshots.length <= coreInfo.pages.length);

    for (int pageIndex = 0; pageIndex < pageScreenshots.length; ++pageIndex) {
      Size pageSize = coreInfo.pages[pageIndex].size;
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(pageSize.width, pageSize.height),
          build: (pw.Context context) {
            return pw.SizedBox(
              width: pageSize.width,
              height: pageSize.height,
              child: pw.CustomPaint(
                foregroundPainter: (PdfGraphics pdfGraphics, PdfPoint size) {
                  final EditorPage page = coreInfo.pages[pageIndex];
                  final PdfColor backgroundColor = PdfColor.fromInt(
                      coreInfo.backgroundColor?.value
                          ?? InnerCanvas.defaultBackgroundColor.value
                  ).flatten();

                  // only draw non-highlighter strokes
                  final Iterable<Stroke> strokes = page.strokes
                    .where((stroke) => stroke.penType != (Highlighter).toString());
                  for (Stroke stroke in strokes) {
                    if (stroke.polygon.length <= 13) { // a dot
                      final bounds = stroke.path.shift(stroke.offset).getBounds();
                      final radius = max(bounds.size.width, stroke.strokeProperties.size * 0.5) / 2;
                      pdfGraphics.drawEllipse(
                        bounds.center.dx, pageSize.height - bounds.center.dy,
                        radius, radius,
                      );
                    } else {
                      pdfGraphics.drawShape(stroke.toSvgPath(pageSize));
                    }

                    pdfGraphics.setFillColor(
                        PdfColor.fromInt(stroke.strokeProperties.color.value)
                            .flatten(background: backgroundColor)
                    );
                    pdfGraphics.fillPath();
                  }
                },
                child: pw.Image(
                  pw.MemoryImage(pageScreenshots[pageIndex]),
                  width: pageSize.width,
                  height: pageSize.height,
                ),
              ),
            );
          }
        )
      );
    }

    return pdf;
  }

  /// Returns a screenshot of the page at [pageIndex] in [coreInfo].
  ///
  /// Note that screenshots do not include (non-highlighter) strokes
  /// because strokes are added separately to the PDF as vector graphics
  /// (highlighter strokes are screenshotted because PDFs don't support
  /// transparency).
  static Future<Uint8List> screenshotPage({
    required EditorCoreInfo coreInfo,
    required int pageIndex,
    required ScreenshotController screenshotController,
    required BuildContext context,
  }) async {
    final pageSize = coreInfo.pages[pageIndex].size;
    return await screenshotController.captureFromWidget(
      Localizations( // needed to avoid errors with Quill, but not actually used
        locale: const Locale('en', 'US'),
        delegates: GlobalMaterialLocalizations.delegates,
        child: Theme(
          data: ThemeData(
            brightness: Brightness.light,
            colorScheme: const ColorScheme.light(
              primary: _primaryColor,
              secondary: _secondaryColor,
            ),
          ),
          child: InnerCanvas(
            pageIndex: pageIndex,
            width: pageSize.width,
            height: pageSize.height,
            isPrint: true,
            textEditing: false,
            coreInfo: coreInfo.copyWith(
              pages: coreInfo.pages.map((page) => page.copyWith(
                strokes: page.strokes
                    .where((stroke) => stroke.penType == (Highlighter).toString())
                    .toList(),
              )).toList(),
            ),
            currentStroke: null,
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
