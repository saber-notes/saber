import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_svg_editor_image.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/tools/pen.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Test SBN parsing:', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupMockPathProvider();

    test('v9 single stroke', () async {
      const path = 'test/sbn_examples/v9_single_stroke.sbn';
      File file = File(path);
      String contents = await file.readAsString();

      EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFileContents(
        jsonString: contents,
        path: path,
        readOnly: true,
        onlyFirstPage: false,
        alwaysUseIsolate: true,
      );

      // make sure the file was loaded
      expect(coreInfo.pages.length, greaterThan(0), reason: 'Failed to load $path');

      expect(coreInfo.backgroundColor, null);
      expect(coreInfo.initialPageIndex, 0);
      expect(coreInfo.lineHeight, 90);
      expect(coreInfo.nextImageId, 0);
      expect(coreInfo.backgroundPattern, CanvasBackgroundPattern.none);

      expect(coreInfo.pages.length, 2);
      expect(coreInfo.pages[0].isEmpty, false);
      expect(coreInfo.pages[1].isEmpty, true);

      final page = coreInfo.pages[0];
      expect(page.size.width, 1000);
      expect(page.size.height, 1400);
      expect(page.images.length, 0);
      expect(page.quill.controller.document.isEmpty(), true);
      expect(page.strokes.length, 1);

      final stroke = page.strokes[0];
      const offset = Offset(10, 14);
      expect(stroke.isComplete, true);
      expect(stroke.pageIndex, 0);
      expect(stroke.penType, (Pen).toString());
      expect(stroke.strokeProperties.size, 25);
      expect(stroke.points.length, 3);

      expect(stroke.points[0].p, 0.1);
      expect(stroke.points[0].x, 0 + offset.dx);
      expect(stroke.points[0].y, 0 + offset.dy);

      expect(stroke.points[1].p, 0.5);
      expect(stroke.points[1].x, 200 + offset.dx);
      expect(stroke.points[1].y, 200 + offset.dy);

      expect(stroke.points[2].p, 0.9);
      expect(stroke.points[2].x, 555.555555555555 + offset.dx);
      expect(stroke.points[2].y, 555.555555555555 + offset.dy);
    });

    test('v9 quill', () async {
      const path = 'test/sbn_examples/v9_quill.sbn';
      File file = File(path);
      String contents = await file.readAsString();

      EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFileContents(
        jsonString: contents,
        path: path,
        readOnly: true,
        onlyFirstPage: false,
        alwaysUseIsolate: true,
      );

      // make sure the file was loaded
      expect(coreInfo.pages.length, greaterThan(0), reason: 'Failed to load $path');

      expect(coreInfo.backgroundColor, null);
      expect(coreInfo.initialPageIndex, 0);
      expect(coreInfo.lineHeight, 90);
      expect(coreInfo.nextImageId, 0);
      expect(coreInfo.backgroundPattern, CanvasBackgroundPattern.lined);

      expect(coreInfo.pages.length, 2);
      expect(coreInfo.pages[0].isEmpty, false);
      expect(coreInfo.pages[1].isEmpty, true);

      final page = coreInfo.pages[0];
      expect(page.size.width, 1000);
      expect(page.size.height, 1400);
      expect(page.strokes.length, 0);
      expect(page.images.length, 0);
      expect(page.quill.controller.document.isEmpty(), false);

      final controller = page.quill.controller;
      controller.updateSelection(const TextSelection(
        baseOffset: 0,
        extentOffset: 100000000,
      ), ChangeSource.LOCAL);
      final plainText = controller.getPlainText();
      expect(plainText, 'h1\nh2\nh3\nn');

      bool foundH1 = false,
          foundH2 = false,
          foundH3 = false;
      for (final Operation operation in controller.document.toDelta().toList()) {
        final header = operation.attributes?['header'];
        if (header == null) continue;
        if (header == 1) {
          foundH1 = true;
        } else if (header == 2) {
          foundH2 = true;
        } else if (header == 3) {
          foundH3 = true;
        }
      }
      expect(foundH1, true);
      expect(foundH2, true);
      expect(foundH3, true);
    });

    test('v9 image', () async {
      const path = 'test/sbn_examples/v9_image.sbn';
      File file = File(path);
      String contents = await file.readAsString();

      EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFileContents(
        jsonString: contents,
        path: path,
        readOnly: true,
        onlyFirstPage: false,
        alwaysUseIsolate: true,
      );

      // make sure the file was loaded
      expect(coreInfo.pages.length, greaterThan(0), reason: 'Failed to load v9_image.sbn');

      expect(coreInfo.nextImageId, 1);
      expect(coreInfo.pages.length, 2);
      expect(coreInfo.pages[0].isEmpty, false);
      expect(coreInfo.pages[1].isEmpty, true);

      final page = coreInfo.pages[0];
      expect(page.size.width, 1000);
      expect(page.size.height, 1400);
      expect(page.quill.controller.document.isEmpty(), true);
      expect(page.strokes.length, 0);
      expect(page.images.length, 1);

      final image = page.images[0];
      expect(image.id, 0);
      expect(image.extension, '.png');
      expect(image.pageIndex, 0);
      expect(image.invertible, true);
      expect(image.backgroundFit, BoxFit.contain);
      expect(image.dstRect, const Rect.fromLTWH(178, 242, 256, 255));
      expect(image.srcRect, const Rect.fromLTWH(0, 0, 256, 256));
      expect(image.naturalSize, const Size(256, 256));
      expect(image.memoryImage!.bytes.isNotEmpty, true);
      expect(image.thumbnailBytes, null); // (too small for thumbnail)
      expect(image.isThumbnail, true);
    });

    test('v11 image (png)', () async {
      const path = 'test/sbn_examples/v11_image_png.sbn';
      File file = File(path);
      String contents = await file.readAsString();

      EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFileContents(
        jsonString: contents,
        path: path,
        readOnly: true,
        onlyFirstPage: false,
        alwaysUseIsolate: true,
      );

      // make sure the file was loaded
      expect(coreInfo.pages.length, greaterThan(0), reason: 'Failed to load $path');

      expect(coreInfo.nextImageId, 1);
      expect(coreInfo.pages.length, 2);
      expect(coreInfo.pages[0].isEmpty, false);
      expect(coreInfo.pages[1].isEmpty, true);

      final page = coreInfo.pages[0];
      expect(page.size.width, 1000);
      expect(page.size.height, 1400);
      expect(page.quill.controller.document.isEmpty(), true);
      expect(page.strokes.length, 0);
      expect(page.images.length, 1);

      final image = page.images[0];
      expect(image.id, 0);
      expect(image.extension, '.png');
      expect(image.pageIndex, 0);
      expect(image.invertible, true);
      expect(image.backgroundFit, BoxFit.contain);
      expect(image.dstRect, const Rect.fromLTWH(178, 242, 256, 255));
      expect(image.srcRect, const Rect.fromLTWH(0, 0, 256, 256));
      expect(image.naturalSize, const Size(256, 256));
      expect(image.memoryImage!.bytes.isNotEmpty, true);
      expect(image.thumbnailBytes, null); // (too small for thumbnail)
      expect(image.isThumbnail, true);
    });

    test('v11 image (svg)', () async {
      const path = 'test/sbn_examples/v11_image_svg.sbn';
      File file = File(path);
      String contents = await file.readAsString();

      EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFileContents(
        jsonString: contents,
        path: path,
        readOnly: true,
        onlyFirstPage: false,
        alwaysUseIsolate: true,
      );

      // make sure the file was loaded
      expect(coreInfo.pages.length, greaterThan(0), reason: 'Failed to load $path');

      expect(coreInfo.nextImageId, 1);
      expect(coreInfo.pages.length, 2);
      expect(coreInfo.pages[0].isEmpty, false);
      expect(coreInfo.pages[1].isEmpty, true);

      final page = coreInfo.pages[0];
      expect(page.size.width, 1000);
      expect(page.size.height, 1400);
      expect(page.quill.controller.document.isEmpty(), true);
      expect(page.strokes.length, 0);
      expect(page.images.length, 1);

      expect(page.images[0] is SvgEditorImage, true);
      final image = page.images[0] as SvgEditorImage;
      expect(image.id, 0);
      expect(image.extension, '.svg');
      expect(image.pageIndex, 0);
      expect(image.invertible, true);
      expect(image.backgroundFit, BoxFit.contain);
      expect(image.dstRect, const Rect.fromLTWH(178, 242, 256, 255));
      expect(image.srcRect, const Rect.fromLTWH(0, 0, 256, 256));
      expect(image.naturalSize, const Size(256, 256));
      expect(image.thumbnailBytes, null);
      expect(image.isThumbnail, true);

      expect(image.svgString.isNotEmpty, true);
      expect(image.svgString, "<svg width='100px' height='100px' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'><circle cx='50' cy='50' r='50'/></svg>");
    });

    test('stress test from #179', () async {
      const path = 'test/sbn_examples/stress_test_179.sbn';
      File file = File(path);
      String contents = await file.readAsString();

      EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFileContents(
        jsonString: contents,
        path: path,
        readOnly: true,
        onlyFirstPage: false,
        alwaysUseIsolate: true,
      );

      // make sure the file was loaded
      expect(coreInfo.pages.length, greaterThan(0), reason: 'Failed to load $path');

      expect(coreInfo.nextImageId, 2);
      expect(coreInfo.pages.length, 2);
      expect(coreInfo.pages[0].isEmpty, false);
      expect(coreInfo.pages[1].isEmpty, true);

      final page = coreInfo.pages[0];
      expect(page.size.width, 1000);
      expect(page.size.height, 1400);
      expect(page.quill.controller.document.getPlainText(0, page.quill.controller.document.length),
          'Stress testing the performance of Saber with a note that has lots of strokes. \n');
      expect(page.strokes.length, 776);
      expect(page.images.length, 2);
    });
  });
}
