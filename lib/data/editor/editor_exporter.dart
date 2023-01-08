
import 'package:flutter/material.dart' show Size;
import 'package:flutter_quill/flutter_quill.dart' show QuillController;
import 'package:html/dom.dart' as html;
import 'package:html/parser.dart' show parse;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

abstract class EditorExporter {

  static pw.Document generatePdf(EditorCoreInfo coreInfo) {
    final pw.Document pdf = pw.Document();

    for (int pageIndex = 0; pageIndex < coreInfo.pages.length; pageIndex++) {
      // Don't export the empty last page
      if (pageIndex == coreInfo.pages.length - 1 && _isPageEmpty(coreInfo, pageIndex)) {
        continue;
      }

      pdf.addPage(
        _generatePdfPage(coreInfo, pageIndex)
      );
    }

    return pdf;
  }

  static bool _isPageEmpty(EditorCoreInfo coreInfo, int pageIndex) {
    if (coreInfo.strokes.any((stroke) => stroke.pageIndex == pageIndex)) {
      return false;
    }
    if (coreInfo.images.any((image) => image.pageIndex == pageIndex)) {
      return false;
    }
    if (!coreInfo.pages[pageIndex].quill.controller.document.isEmpty()) {
      return false;
    }
    return true;
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
                  pw.Positioned.fill(
                    top: coreInfo.lineHeight * 2,
                    child: _pdfQuill(coreInfo.pages[pageIndex].quill.controller, coreInfo.lineHeight),
                  ),
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

  static pw.Widget _pdfQuill(QuillController controller, num lineHeight) {
    final converter = QuillDeltaToHtmlConverter(
      controller.document.toDelta().toJson().cast(),
    );
    final html.Document document = parse(converter.convert());

    final html.Element? body = document.body;
    if (body == null) return pw.SizedBox.shrink();

    return pw.RichText(
      text: _htmlNodeToTextSpan(body, lineHeight),
    );
  }

  static pw.TextSpan _htmlNodeToTextSpan(html.Node node, num lineHeight) {
    if (node is html.Text) {
      return pw.TextSpan(
        text: node.text,
      );
    } else if (node is! html.Element) {
      return const pw.TextSpan();
    }

    if (node.localName == "br") {
      return const pw.TextSpan(text: "\n");
    }

    final bool isHeading = node.localName == "h1"
      || node.localName == "h2"
      || node.localName == "h3";

    /// Block elements have a newline at the end
    final bool isBlock = node.localName == "p"
      || node.localName == "div"
      || node.localName == "ul"
      || node.localName == "ol"
      || node.localName == "li"
      || node.localName == "blockquote"
      || node.localName == "pre"
      || isHeading;

    /// Font size as a multiple of the line height
    final double fontSizePercent = {
      "h1": 1.15,
      "h2": 1.0,
      "h3": 0.9,
    }[node.localName] ?? 0.7;

    final PdfColor? underlineColor = {
      "h1": const PdfColor.fromInt(0x99000000),
      "h2": const PdfColor.fromInt(0x80000000),
      "h3": const PdfColor.fromInt(0x66000000),
    }[node.localName];

    return pw.TextSpan(
      style: pw.TextStyle(
        fontSize: lineHeight * fontSizePercent,
        height: 1 / fontSizePercent,
        fontWeight: node.localName == "b" ? pw.FontWeight.bold : null,
        fontStyle: node.localName == "i" ? pw.FontStyle.italic : null,
        decoration: isHeading ? pw.TextDecoration.underline : null,
        decorationColor: underlineColor,
        decorationThickness: isHeading ? 3 : null,
      ),
      children: [
        ...node.nodes.map((node) => _htmlNodeToTextSpan(node, lineHeight)),

        if (isBlock) const pw.TextSpan(text: "\n"),
      ],
    );
  }
}
