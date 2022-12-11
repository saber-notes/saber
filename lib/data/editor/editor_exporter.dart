
import 'package:flutter/material.dart' show Size;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';

abstract class EditorExporter {

  static pw.Document generatePdf(EditorCoreInfo coreInfo) {
    final pw.Document pdf = pw.Document();

    for (int pageIndex = 0; pageIndex < coreInfo.pages.length; pageIndex++) {
      pdf.addPage(
        _generatePdfPage(coreInfo, pageIndex)
      );
    }

    return pdf;
  }
  
  static pw.Page _generatePdfPage(EditorCoreInfo coreInfo, int pageIndex) {
    /// Blue at 0.2 opacity against white
    const PdfColor primaryColor = PdfColor(0.8, 0.8, 1);
    /// Red at 0.2 opacity against white
    const PdfColor secondaryColor = PdfColor(1, 0.8, 0.8);

    final Size pageSize = coreInfo.pages[pageIndex].size;

    return pw.Page(
      pageFormat: PdfPageFormat(pageSize.width, pageSize.height),
      build: (pw.Context context) {
        return pw.FittedBox(
          child: pw.SizedBox(
            width: pageSize.width,
            height: pageSize.height,
            child: pw.CustomPaint(
              size: PdfPoint(pageSize.width, pageSize.height),
              painter: (PdfGraphics pdfGraphics, PdfPoint pdfPoint) {
                if (coreInfo.backgroundColor != null) {
                  pdfGraphics.drawRect(0, 0, pageSize.width, pageSize.height);
                  pdfGraphics.setFillColor(PdfColor.fromInt(coreInfo.backgroundColor!.value));
                  pdfGraphics.fillPath();
                }
                for (PatternElement element in CanvasBackgroundPainter.getPatternElements(coreInfo.backgroundPattern, pageSize, coreInfo.lineHeight)) {
                  if (element.isLine) {
                    pdfGraphics.drawLine(
                      element.start.dx, pageSize.height - element.start.dy,
                      element.end.dx, pageSize.height - element.end.dy,
                    );
                  } else {
                    pdfGraphics.drawEllipse(
                      element.start.dx, pageSize.height - element.start.dy,
                      4, 4,
                    );
                  }
                  if (element.secondaryColor) {
                    pdfGraphics.setColor(secondaryColor);
                  } else {
                    pdfGraphics.setColor(primaryColor);
                  }
                  pdfGraphics.setLineWidth(3);
                  pdfGraphics.strokePath();
                }
              },
              foregroundPainter: (PdfGraphics pdfGraphics, PdfPoint pdfPoint) {
                final PdfColor backgroundColor;
                if (coreInfo.backgroundColor != null) {
                  backgroundColor = PdfColor.fromInt(coreInfo.backgroundColor!.value);
                } else {
                  backgroundColor = PdfColors.white;
                }

                void drawStroke(Stroke stroke) {
                  pdfGraphics.drawShape(stroke.toSvgPath(pageSize));
                  pdfGraphics.setFillColor(PdfColor.fromInt(stroke.strokeProperties.color.value).flatten(background: backgroundColor));
                  pdfGraphics.fillPath();
                }

                for (Stroke stroke in coreInfo.strokes) {
                  if (stroke.pageIndex != pageIndex) continue;
                  if (stroke.penType != (Highlighter).toString()) continue;
                  drawStroke(stroke);
                }
                for (Stroke stroke in coreInfo.strokes) {
                  if (stroke.pageIndex != pageIndex) continue;
                  if (stroke.penType == (Highlighter).toString()) continue;
                  drawStroke(stroke);
                }
              },
              child: pw.Stack(
                children: [
                  for (EditorImage image in coreInfo.images.where((image) => image.pageIndex == pageIndex))
                    pw.Positioned(
                      left: image.dstRect.left,
                      top: image.dstRect.top,
                      child: pw.Image(
                        pw.MemoryImage(image.bytes),
                        width: image.dstRect.width,
                        height: image.dstRect.height,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
