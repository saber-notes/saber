import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/data/editor/editor_core_info.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Test SBN parsing', () {
    test('v9 single stroke', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupMockPathProvider();

      const path = 'test/sbn_examples/v9_single_stroke.sbn';
      File file = File(path);
      String contents = await file.readAsString();

      EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFileContents(
        contents,
        path: path,
        readOnly: true,
        onlyFirstPage: false,
      );

      // make sure the file was loaded
      expect(coreInfo.pages.length, greaterThan(0), reason: 'Failed to load v9_single_stroke.sbn');

      expect(coreInfo.backgroundColor, null);
      expect(coreInfo.initialPageIndex, 0);
      expect(coreInfo.lineHeight, 90);
      expect(coreInfo.nextImageId, 0);
      expect(coreInfo.backgroundPattern, CanvasBackgroundPatterns.none);

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
      expect(stroke.isComplete, true);
      expect(stroke.pageIndex, 0);
      expect(stroke.offset.dx, 10);
      expect(stroke.offset.dy, 14);
      expect(stroke.penType, (Pen).toString());
      expect(stroke.strokeProperties.size, 25);
      expect(stroke.points.length, 3);

      expect(stroke.points[0].p, 0.1);
      expect(stroke.points[0].x, 0);
      expect(stroke.points[0].y, 0);

      expect(stroke.points[1].p, 0.5);
      expect(stroke.points[1].x, 200);
      expect(stroke.points[1].y, 200);

      expect(stroke.points[2].p, 0.9);
      expect(stroke.points[2].x, 555.555555555555);
      expect(stroke.points[2].y, 555.555555555555);
    });
  });
}
