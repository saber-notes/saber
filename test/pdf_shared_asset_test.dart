import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/tools/stroke_properties.dart';
import 'package:sbn/has_size.dart';
import 'package:sbn/tool_id.dart';

import 'utils/test_mock_channel_handlers.dart';

/// Every page of an imported PDF must share a single asset, and strokes
/// (pen and highlighter) drawn on top of the PDF must still be saved with
/// their own page and survive a save/load round trip.
void main() {
  group('PDF pages sharing one asset:', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupMockPathProvider();
    FlavorConfig.setup();

    setUpAll(() async {
      await FileManager.init();
      StrokeOptionsExtension.setDefaults();
      FileManager.shouldUseRawFilePath = true;
    });
    tearDownAll(() => FileManager.shouldUseRawFilePath = false);

    const pageCount = 3;
    const pageSize = Size(1000, 1400);

    Stroke makeStroke(ToolId toolId, Offset start) => Stroke(
      color: Stroke.defaultColor,
      pressureEnabled: Stroke.defaultPressureEnabled,
      options: StrokeOptions(size: 5),
      pageIndex: 1,
      page: const HasSize(pageSize),
      toolId: toolId,
    )..addPoints([start, start + const Offset(10, 5), start + const Offset(20, 0)]);

    test('save and reload keeps one asset and the strokes of each page', () async {
      const notePath = '/tmp/saber_pdf_shared_asset_test';
      final pdfFile = File('/tmp/book.pdf');

      final coreInfo = EditorCoreInfo(filePath: notePath);
      for (var i = 0; i < pageCount; i++) {
        coreInfo.pages.add(
          EditorPage(
            size: pageSize,
            backgroundImage: PdfEditorImage(
              id: coreInfo.nextImageId++,
              assetCache: coreInfo.assetCache,
              pdfBytes: null,
              pdfFile: pdfFile,
              pdfPage: i,
              pageIndex: i,
              pageSize: pageSize,
              naturalSize: const Size(595, 842),
              onMoveImage: null,
              onDeleteImage: null,
              onMiscChange: null,
            ),
          ),
        );
      }

      // Write with a pen and highlight on the second page of the PDF.
      coreInfo.pages[1].insertStroke(
        makeStroke(.fountainPen, const Offset(100, 100)),
      );
      coreInfo.pages[1].insertStroke(
        makeStroke(.highlighter, const Offset(100, 200)),
      );

      final (bson, assets) = coreInfo.saveToBinary(currentPageIndex: null);
      expect(assets.length, 1, reason: 'one asset for the whole PDF');

      final reloaded = await EditorCoreInfo.loadFromFileContents(
        bsonBytes: bson,
        path: notePath,
        onlyFirstPage: false,
      );

      final pdfPaths = <String>{};
      for (var i = 0; i < pageCount; i++) {
        final background = reloaded.pages[i].backgroundImage;
        expect(background, isA<PdfEditorImage>());
        final image = background! as PdfEditorImage;
        expect(image.pdfPage, i);
        pdfPaths.add(image.pdfFile!.path);
      }
      expect(pdfPaths, hasLength(1), reason: 'all pages use the same file');

      expect(reloaded.pages[0].strokes, isEmpty);
      expect(reloaded.pages[2].strokes, isEmpty);
      expect(
        reloaded.pages[1].strokes.map((stroke) => stroke.toolId).toSet(),
        {ToolId.fountainPen, ToolId.highlighter},
      );
    });
  });
}
