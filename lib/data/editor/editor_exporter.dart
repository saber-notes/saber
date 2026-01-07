import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/prefs.dart';
import 'package:screenshot/screenshot.dart';

abstract class EditorExporter {
  /// Most* strokes can be drawn to the PDF canvas as vector graphics.
  /// This function returns true if [stroke] is one of those strokes.
  ///
  /// Strokes that can't be drawn as vector graphics include:
  /// - Highlighter strokes, because PDFs don't support transparency
  /// - Pencil strokes, which need a special shader to look correct
  static bool _shouldRasterizeStroke(Stroke stroke) {
    return stroke.toolId == .highlighter || stroke.toolId == .pencil;
  }

  static Future<pw.Document> generatePdf(
    EditorCoreInfo coreInfo,
    BuildContext context,
  ) async {
    if (coreInfo.pages.isNotEmpty && coreInfo.pages.last.isEmpty) {
      // don't export the empty last page
      coreInfo = coreInfo.copyWith(
        pages: coreInfo.pages.toList()..removeLast(),
      );
    }

    final pdf = pw.Document();
    final screenshotController = ScreenshotController();

    // Screenshot pages sequentially (not in parallel) to avoid blocking the
    // UI and exhausting memory. Use an adaptive pixelRatio based on page area
    // so extremely large pages produce smaller bitmaps.
    final pageScreenshots = <Uint8List>[];
    for (int pageIndex = 0; pageIndex < coreInfo.pages.length; ++pageIndex) {
      final page = coreInfo.pages[pageIndex];
      final area = page.size.width * page.size.height;
      double pixelRatio = 2.0;
      if (area > 4e6) {
        // very large page, reduce pixelRatio to avoid huge bitmaps
        pixelRatio = 1.0;
      } else if (area > 1e6) {
        pixelRatio = 1.5;
      }

      final screenshot = await screenshotPage(
        coreInfo: coreInfo,
        pageIndex: pageIndex,
        screenshotController: screenshotController,
        context: context,
        pixelRatio: pixelRatio,
      );
      pageScreenshots.add(screenshot);

      // Yield to the event loop so the OS sees progress and the UI stays responsive
      await Future.delayed(const Duration(milliseconds: 50));
    }

    for (int pageIndex = 0; pageIndex < pageScreenshots.length; ++pageIndex) {
      final page = coreInfo.pages[pageIndex];
      final pageSize = page.size;
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(pageSize.width, pageSize.height),
          build: (pw.Context context) {
            return pw.SizedBox(
              width: pageSize.width,
              height: pageSize.height,
              child: pw.CustomPaint(
                foregroundPainter: (PdfGraphics pdfGraphics, PdfPoint size) {
                  final backgroundColor = PdfColor.fromInt(
                    coreInfo.backgroundColor?.toARGB32() ??
                        InnerCanvas.defaultBackgroundColor.toARGB32(),
                  ).flatten();

                  final strokes = page.strokes.where(
                    (stroke) => !_shouldRasterizeStroke(stroke),
                  );
                  for (final stroke in strokes) {
                    final strokeColor = PdfColor.fromInt(
                      stroke.color.toARGB32(),
                    ).flatten(background: backgroundColor);

                    /// Whether we need to fill the shape, or draw its stroke
                    final bool shouldFillShape;
                    if (stroke is CircleStroke) {
                      shouldFillShape = false;
                      pdfGraphics.drawEllipse(
                        stroke.center.dx,
                        pageSize.height - stroke.center.dy,
                        stroke.radius,
                        stroke.radius,
                        clockwise: false,
                      );
                    } else if (stroke is RectangleStroke) {
                      shouldFillShape = false;
                      final strokeSize = stroke.options.size;
                      pdfGraphics.drawRRect(
                        stroke.rect.left,
                        pageSize.height - stroke.rect.bottom,
                        stroke.rect.width,
                        stroke.rect.height,
                        strokeSize / 4,
                        strokeSize / 4,
                      );
                    } else {
                      shouldFillShape = true;
                      pdfGraphics.drawShape(stroke.toSvgPath());
                    }

                    if (shouldFillShape) {
                      // fill
                      pdfGraphics.setFillColor(strokeColor);
                      pdfGraphics.fillPath();
                    } else {
                      // stroke
                      pdfGraphics.setStrokeColor(strokeColor);
                      pdfGraphics.setLineWidth(stroke.options.size);
                      pdfGraphics.strokePath();
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
          },
        ),
      );
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
    double pixelRatio = 2,
  }) async {
    final pageSize = coreInfo.pages[pageIndex].size;
    return await screenshotController.captureFromWidget(
      EditorExporterTheme(
        targetSize: pageSize,
        child: InnerCanvas(
          pageIndex: pageIndex,
          width: pageSize.width,
          height: pageSize.height,
          showPageIndicator: stows.printPageIndicators.value,
          textEditing: false,
          coreInfo: coreInfo.copyWith(
            pages: [
              for (final page in coreInfo.pages)
                page.copyWith(
                  strokes: page.strokes.where(_shouldRasterizeStroke).toList(),
                ),
            ],
          ),
          currentStroke: null,
          currentStrokeDetectedShape: null,
          currentSelection: null,
          currentToolIsSelect: false,
          currentScale: double.maxFinite,
        ),
      ),
      context: context,
      pixelRatio: pixelRatio,
      targetSize: pageSize,
    );
  }
}

/// Applies a consistent theme to its [child] so that exports
/// look the same regardless of the user's current theme or device.
class EditorExporterTheme extends StatelessWidget {
  const EditorExporterTheme({
    super.key,
    required this.targetSize,
    required this.child,
  });

  final Size targetSize;
  final Widget child;

  static final theme = ThemeData(
    brightness: .light,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.red,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(size: targetSize),
      child: Localizations(
        // needed to avoid errors with Quill, but not actually used
        locale: const Locale('en', 'US'),
        delegates: GlobalMaterialLocalizations.delegates,
        child: Theme(
          data: theme,
          child: DefaultTextStyle(
            style: theme.textTheme.bodyMedium!,
            child: SizedBox(
              width: targetSize.width,
              height: targetSize.height,
              child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
