/// 🤖 Generated wholely or partially with Claude Code (Claude Fable 5)
library;

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_mock_channel_handlers.dart';

/// A 1x1 transparent png.
final _pngBytes = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAA'
  'DUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==',
);

void main() {
  group('Moving an image across pages', () {
    testWidgets('transfers, undoes, and redoes', (tester) async {
      EditorImage.shouldLoadOutImmediately = true;
      addTearDown(() => EditorImage.shouldLoadOutImmediately = false);

      TestWidgetsFlutterBinding.ensureInitialized();
      setupMockPathProvider();
      FlavorConfig.setup();
      await tester.runAsync(FileManager.init);

      await tester.pumpWidget(MaterialApp(home: Editor()));
      final state = tester.state<EditorState>(find.byType(Editor));
      addTearDown(state.cancelAutosaveAndMarkSaved);

      for (var i = 0; i < 10 && state.coreInfo.readOnly; i++) {
        await tester.pump();
      }
      expect(state.coreInfo.readOnly, isFalse);

      final inserted = await state.insertPickedFiles([
        PlatformFile(
          name: 'picked.png',
          size: _pngBytes.length,
          bytes: _pngBytes,
        ),
      ]);
      expect(inserted, 1);
      final image = state.coreInfo.pages.first.images.single;
      expect(image.pageIndex, 0);

      while (state.coreInfo.pages.length < 2) {
        state.coreInfo.pages.add(EditorPage());
      }

      // Size the image like it would be once loaded.
      image.dstRect = const Rect.fromLTWH(100, 100, 200, 150);
      final startRect = image.dstRect;
      final pageHeight = state.coreInfo.pages.first.size.height;

      // Simulate a drag that leaves the image's center past the page bottom,
      // like CanvasImage does before calling onMoveImage.
      final dy = pageHeight + EditorPage.gapBetweenPages - startRect.top;
      image.dstRect = startRect.translate(0, dy);
      state.onMoveImage(image, Rect.fromLTRB(0, dy, 0, dy));
      await tester.pump();

      expect(image.pageIndex, 1);
      expect(state.coreInfo.pages[0].images, isEmpty);
      expect(state.coreInfo.pages[1].images, contains(image));

      state.undo();
      await tester.pump();
      expect(image.pageIndex, 0);
      expect(state.coreInfo.pages[0].images, contains(image));
      expect(state.coreInfo.pages[1].images, isEmpty);
      expect(image.dstRect, rectMoreOrLessEquals(startRect));

      state.redo();
      await tester.pump();
      expect(image.pageIndex, 1);
      expect(state.coreInfo.pages[0].images, isEmpty);
      expect(state.coreInfo.pages[1].images, contains(image));
    });

    testWidgets('stays on the last page if there is no next page', (
      tester,
    ) async {
      EditorImage.shouldLoadOutImmediately = true;
      addTearDown(() => EditorImage.shouldLoadOutImmediately = false);

      TestWidgetsFlutterBinding.ensureInitialized();
      setupMockPathProvider();
      FlavorConfig.setup();
      await tester.runAsync(FileManager.init);

      await tester.pumpWidget(MaterialApp(home: Editor()));
      final state = tester.state<EditorState>(find.byType(Editor));
      addTearDown(state.cancelAutosaveAndMarkSaved);

      for (var i = 0; i < 10 && state.coreInfo.readOnly; i++) {
        await tester.pump();
      }

      final inserted = await state.insertPickedFiles([
        PlatformFile(
          name: 'picked.png',
          size: _pngBytes.length,
          bytes: _pngBytes,
        ),
      ]);
      expect(inserted, 1);

      final lastPageIndex = state.coreInfo.pages.length - 1;
      final image = state.coreInfo.pages.first.images.single;
      state.coreInfo.pages.first.images.remove(image);
      state.coreInfo.pages[lastPageIndex].images.add(image);
      image.pageIndex = lastPageIndex;

      final pageSize = state.coreInfo.pages[lastPageIndex].size;
      image.dstRect = Rect.fromLTWH(
        0,
        pageSize.height + EditorPage.gapBetweenPages,
        200,
        150,
      );
      state.onMoveImage(image, Rect.zero);
      await tester.pump();

      expect(image.pageIndex, lastPageIndex);
      expect(
        image.dstRect.top,
        lessThanOrEqualTo(pageSize.height),
        reason: 'The image should be clamped back onto its page',
      );
    });
  });
}
