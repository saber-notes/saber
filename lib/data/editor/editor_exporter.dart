
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
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
    return pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.FittedBox(
          child: pw.SizedBox(
            width: coreInfo.width,
            height: coreInfo.height,
            child: pw.CustomPaint(
              size: PdfPoint(coreInfo.width, coreInfo.height),
              painter: (PdfGraphics pdfGraphics, PdfPoint pdfPoint) {
                for (Stroke stroke in coreInfo.strokes) {
                  pdfGraphics.drawShape(stroke.toSvgPath(coreInfo));
                  pdfGraphics.setFillColor(PdfColor.fromInt(stroke.strokeProperties.color.value));
                  pdfGraphics.fillPath(evenOdd: false);
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
