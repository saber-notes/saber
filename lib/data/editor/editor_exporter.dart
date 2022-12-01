
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

  static pw.Document generatePdf(List<EditorPage> pages, EditorCoreInfo coreInfo) {
    final pw.Document pdf = pw.Document();

    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      pdf.addPage(
        _generatePdfPage(coreInfo.copyWith(
          strokes: coreInfo.strokes.where((stroke) => stroke.pageIndex == pageIndex).toList(),
          images: coreInfo.images.where((image) => image.pageIndex == pageIndex).toList(),
        ))
      );
    }

    return pdf;
  }
  
  static pw.Page _generatePdfPage(EditorCoreInfo coreInfo) {
    /// Blue at 0.2 opacity against white
    const PdfColor primaryColor = PdfColor(0.8, 0.8, 1);
    /// Red at 0.2 opacity against white
    const PdfColor secondaryColor = PdfColor(1, 0.8, 0.8);

    return pw.Page(
      pageFormat: PdfPageFormat(coreInfo.width, coreInfo.height),
      build: (pw.Context context) {
        return pw.FittedBox(
          child: pw.SizedBox(
            width: coreInfo.width,
            height: coreInfo.height,
            child: pw.CustomPaint(
              size: PdfPoint(coreInfo.width, coreInfo.height),
              painter: (PdfGraphics pdfGraphics, PdfPoint pdfPoint) {
                if (coreInfo.backgroundColor != null) {
                  pdfGraphics.drawRect(0, 0, coreInfo.width, coreInfo.height);
                  pdfGraphics.setFillColor(PdfColor.fromInt(coreInfo.backgroundColor!.value));
                  pdfGraphics.fillPath();
                }
                for (PatternElement element in CanvasBackgroundPainter.getPatternElements(coreInfo.backgroundPattern, Size(coreInfo.width, coreInfo.height), coreInfo.lineHeight)) {
                  if (element.isLine) {
                    pdfGraphics.drawLine(
                      element.start.dx, coreInfo.height - element.start.dy,
                      element.end.dx, coreInfo.height - element.end.dy,
                    );
                  } else {
                    pdfGraphics.drawEllipse(
                      element.start.dx, coreInfo.height - element.start.dy,
                      2, 2,
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
                  pdfGraphics.drawShape(stroke.toSvgPath(coreInfo));
                  pdfGraphics.setFillColor(PdfColor.fromInt(stroke.strokeProperties.color.value).flatten(background: backgroundColor));
                  pdfGraphics.fillPath();
                }

                for (Stroke stroke in coreInfo.strokes) {
                  if (stroke.penType != (Highlighter).toString()) continue;
                  drawStroke(stroke);
                }
                for (Stroke stroke in coreInfo.strokes) {
                  if (stroke.penType == (Highlighter).toString()) continue;
                  drawStroke(stroke);
                }
              },
              child: pw.Stack(
                children: [
                  for (EditorImage image in coreInfo.images)
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
