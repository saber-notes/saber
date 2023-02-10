import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:screenshot/screenshot.dart';

abstract class EditorExporter {
  static Future<pw.Document> generatePdf(EditorCoreInfo coreInfo, BuildContext context) async {
    final pw.Document pdf = pw.Document();
    ScreenshotController screenshotController = ScreenshotController();

    List<Uint8List> pageScreenshots = await Future.wait(
      coreInfo.pages
        // don't export the empty last page
        .whereIndexed((index, page) =>
           index != coreInfo.pages.length - 1 || page.isNotEmpty)
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
            return pw.Image(
              pw.MemoryImage(pageScreenshots[pageIndex]),
              fit: pw.BoxFit.contain,
              width: pageSize.width,
              height: pageSize.height,
            );
          }
        )
      );
    }

    return pdf;
  }

  static Future<Uint8List> screenshotPage({
    required EditorCoreInfo coreInfo,
    required int pageIndex,
    required ScreenshotController screenshotController,
    required BuildContext context,
  }) async {
    final pageSize = coreInfo.pages[pageIndex].size;
    return await screenshotController.captureFromWidget(
      Localizations( // needed to avoid errors with Quill, but not actually used
        locale: const Locale("en", "US"),
        delegates: GlobalMaterialLocalizations.delegates,
        child: Theme(
          data: ThemeData(
            brightness: Brightness.light,
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              secondary: Colors.red,
            ),
          ),
          child: InnerCanvas(
            pageIndex: pageIndex,
            width: pageSize.width,
            height: pageSize.height,
            isPreview: true,
            textEditing: false,
            coreInfo: coreInfo,
            currentStroke: null,
            currentSelection: null,
          ),
        ),
      ),
      context: context,
      pixelRatio: 2,
      targetSize: pageSize,
    );
  }
}
