import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Stylus', () {
    FlavorConfig.setup();
    FileManager.documentsDirectory =
        '$tmpDir/stylus_test/'
        '${FileManager.appRootDirectoryPrefix}';
    stows.editorFingerDrawing.value = false;

    testWidgets('Normal input should draw a stroke', (tester) async {
      final editorState = await tester._pumpEditor();
      await tester.pump();
      final page = editorState.coreInfo.pages.first;
      expect(page.strokes, isEmpty);
      await tester._stylusDrag(editorState, .stylus);
      expect(page.strokes, hasLength(1));
    });

    // Styluses like the S Pen use a button to trigger the eraser.
    testWidgets('Pressing the stylus button should erase', (tester) async {
      final editorState = await tester._pumpEditor();
      await tester.pump();
      final page = editorState.coreInfo.pages.first;
      await tester._stylusDrag(editorState, .stylus);
      expect(page.strokes, hasLength(1));
      await tester._stylusDrag(editorState, .stylus, kSecondaryButton);
      expect(page.strokes, hasLength(0));
    });

    // Styluses like the Noris Digital Jumbo have an eraser on the bottom.
    testWidgets('Inverse stylus should erase', (tester) async {
      final editorState = await tester._pumpEditor();
      await tester.pump();
      final page = editorState.coreInfo.pages.first;
      await tester._stylusDrag(editorState, .stylus);
      expect(page.strokes, hasLength(1));
      await tester._stylusDrag(editorState, .invertedStylus);
      expect(page.strokes, hasLength(0));
    });
  });
}

extension on WidgetTester {
  Future<EditorState> _pumpEditor() async {
    await pumpWidget(MaterialApp(home: Editor(path: '/stylus-test')));
    return state<EditorState>(find.byType(Editor));
  }

  /// Similar to [timedDragFrom] but with support for [PointerDeviceKind].
  /// TODO(adil192): Submit PRs to Flutter to:
  ///                - Add [PointerDeviceKind] to [timedDragFrom]
  ///                - Add [buttons] to [TestPointer.hover]
  Future<void> _stylusDrag(
    EditorState editorState,
    PointerDeviceKind kind, [
    int buttons = kPrimaryButton,
  ]) async {
    final center = getCenter(find.byType(Editor));
    final gesture = await createGesture(kind: kind, buttons: buttons);

    await gesture.moveTo(center);
    if (buttons == kSecondaryButton) {
      // Right now, [TestPointer.hover] doesn't pass through [buttons],
      // so fake it until that gets fixed in Flutter.
      editorState.onStylusButtonChanged(true);
    }

    await gesture.down(center);
    for (var i = 0; i < 10; ++i) {
      await gesture.moveBy(
        Offset(i / 2, i / 2),
        timeStamp: Duration(seconds: i),
      );
    }
    await gesture.up(timeStamp: const Duration(seconds: 10));
  }
}
