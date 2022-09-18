
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';

abstract class EditorExporter {

  static pw.Document generatePdf(List<EditorPage> pages, EditorCoreInfo coreInfo) {
    final pw.Document pdf = pw.Document();

    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      pdf.addPage(
        _generatePdfPage(coreInfo.copyWith(
          strokes: coreInfo.strokes.where((stroke) => stroke.pageIndex == pageIndex).toList()
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
          child: pw.CustomPaint(
            size: PdfPoint(coreInfo.width, coreInfo.height),
            painter: (PdfGraphics pdfGraphics, PdfPoint pdfPoint) {
              for (Stroke stroke in coreInfo.strokes) {
                pdfGraphics.drawShape(stroke.toSvgPath(coreInfo));
                pdfGraphics.setFillColor(PdfColor.fromInt(stroke.strokeProperties.color.value));
                pdfGraphics.fillPath(evenOdd: false);
              }
            },
          ),
        );
      },
    );
  }
}
