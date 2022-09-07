
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/data/editor/page.dart';

abstract class EditorExporter {

  static pw.Document generatePdf(List<EditorPage> pages, List<Stroke> strokes) {
    final pw.Document pdf = pw.Document();

    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      pdf.addPage(
        _generatePdfPage(
            strokes.where((stroke) => stroke.pageIndex == pageIndex).toList()
        )
      );
    }

    return pdf;
  }
  
  static pw.Page _generatePdfPage(List<Stroke> strokes) {
    return pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.FittedBox(
          child: pw.CustomPaint(
            size: const PdfPoint(Canvas.canvasWidth, Canvas.canvasHeight),
            painter: (PdfGraphics pdfGraphics, PdfPoint pdfPoint) {
              for (Stroke stroke in strokes) {
                pdfGraphics.drawShape(stroke.toSvgPath());
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
