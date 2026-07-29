/// 🤖 Generated wholely or partially with Claude Code (Claude Fable 5)
library;

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/toolbar/toolbar.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_mock_channel_handlers.dart';

/// A 1x1 transparent png.
final _pngBytes = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAA'
  'DUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==',
);

class _FakeImagePickerPlatform extends ImagePickerPlatform {
  var pickCalls = 0;

  @override
  Future<List<XFile>> getMultiImageWithOptions({
    MultiImagePickerOptions options = const MultiImagePickerOptions(),
  }) async {
    pickCalls++;
    return [XFile.fromData(_pngBytes, name: 'picked.png')];
  }
}

void main() {
  group('Inserting photos', () {
    Future<EditorState> pumpEditor(WidgetTester tester) async {
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
      expect(
        state.coreInfo.readOnly,
        isFalse,
        reason: 'New file should not be read-only',
      );
      return state;
    }

    testWidgets(
      'uses the photo library on iOS',
      variant: TargetPlatformVariant.only(TargetPlatform.iOS),
      (tester) async {
        EditorImage.shouldLoadOutImmediately = true;
        addTearDown(() => EditorImage.shouldLoadOutImmediately = false);

        final fakePicker = _FakeImagePickerPlatform();
        ImagePickerPlatform.instance = fakePicker;

        final state = await pumpEditor(tester);
        final toolbar = tester.widget<Toolbar>(find.byType(Toolbar));
        expect(
          toolbar.pickPhotoFromFile,
          isNotNull,
          reason: 'iOS should offer a separate insert-from-Files button',
        );
        expect(find.byTooltip(t.editor.toolbar.photoFromFile), findsOneWidget);

        toolbar.pickPhoto();
        await tester.pump();
        await tester.pump();

        expect(fakePicker.pickCalls, 1);
        expect(state.coreInfo.pages.first.images, hasLength(1));
        expect(
          state.coreInfo.pages.first.images.single.invertible,
          isFalse,
          reason: 'Inserted photos should keep their original colors',
        );
        expect(
          state.currentTool,
          isA<Select>(),
          reason: 'The select tool lets the user move the inserted image',
        );
      },
    );

    testWidgets('offers no insert-from-Files button on other platforms', (
      tester,
    ) async {
      await pumpEditor(tester);
      final toolbar = tester.widget<Toolbar>(find.byType(Toolbar));
      expect(toolbar.pickPhotoFromFile, isNull);
      expect(find.byTooltip(t.editor.toolbar.photoFromFile), findsNothing);
    });

    testWidgets('inserts images picked from Files with original colors', (
      tester,
    ) async {
      EditorImage.shouldLoadOutImmediately = true;
      addTearDown(() => EditorImage.shouldLoadOutImmediately = false);

      final state = await pumpEditor(tester);
      final inserted = await state.insertPickedFiles([
        PlatformFile(
          name: 'picked.png',
          size: _pngBytes.length,
          bytes: _pngBytes,
        ),
      ]);
      await tester.pump();

      expect(inserted, 1);
      expect(state.coreInfo.pages.first.images, hasLength(1));
      expect(state.coreInfo.pages.first.images.single.invertible, isFalse);
    });
  });
}
