import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Interrupted Gesture Recovery', () {
    FlavorConfig.setup();
    FileManager.documentsDirectory =
        '$tmpDir/gesture_test/'
        '${FileManager.appRootDirectoryPrefix}';
    stows.editorFingerDrawing.value = false;

    testWidgets(
      'Should recover and draw stroke after interrupted multi-pointer gesture',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(home: Editor(path: '/gesture-recovery-test')),
        );
        final editorState = tester.state<EditorState>(find.byType(Editor));
        await tester.pump();
        final page = editorState.coreInfo.pages.first;
        expect(page.strokes, isEmpty);

        // Simulate an interrupted 3-finger touchpad swipe leaving pointer count >= 2
        editorState.lastSeenPointerCount = 3;

        // Perform a single-pointer stylus stroke
        final center = tester.getCenter(find.byType(Editor));
        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.stylus);
        await gesture.down(center);
        for (var i = 0; i < 5; ++i) {
          await gesture.moveBy(
            Offset(i.toDouble(), i.toDouble()),
            timeStamp: Duration(milliseconds: i * 50),
          );
        }
        await gesture.up(timeStamp: const Duration(milliseconds: 300));
        await tester.pump();

        // Stroke should be successfully recorded instead of rejected
        expect(page.strokes, hasLength(1));
      },
    );
  });
}
