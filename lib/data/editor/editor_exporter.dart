import 'dart:typed_data';

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

    for (int pageIndex = 0; pageIndex < coreInfo.pages.length; pageIndex++) {
      // Don't export the empty last page
      if (pageIndex == coreInfo.pages.length - 1 && coreInfo.pages[pageIndex].isEmpty) {
        continue;
      }

      Size pageSize = coreInfo.pages[pageIndex].size;
      Uint8List pageImage = await screenshotPage(
        coreInfo: coreInfo,
        pageIndex: pageIndex,
        screenshotController: screenshotController,
        context: context,
      );

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(pageSize.width, pageSize.height),
          build: (pw.Context context) {
            return pw.Image(
              pw.MemoryImage(pageImage),
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
          ),
        ),
      ),
      context: context,
      pixelRatio: 2,
      targetSize: pageSize,
    );
  }
}
