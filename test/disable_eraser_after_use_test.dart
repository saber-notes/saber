import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('disableEraserAfterUse', () {
    for (final disableEraserAfterUse in const [true, false]) {
      testWidgets('$disableEraserAfterUse', (tester) async {
        FlavorConfig.setup();
        FileManager.documentsDirectory =
            '$tmpDir/nc_upload_download_test/'
            '${FileManager.appRootDirectoryPrefix}';
        stows.disableEraserAfterUse.value = disableEraserAfterUse;

        await tester.pumpWidget(
          MaterialApp(home: Editor(path: '/disableEraserAfterUse')),
        );
        final state = tester.state<EditorState>(find.byType(Editor));
        state.currentTool = Eraser();

        await tester.timedDrag(
          find.byType(Editor),
          const Offset(10, 10),
          const Duration(seconds: 1),
        );
        await tester.pump();

        if (disableEraserAfterUse) {
          expect(state.currentTool, isA<Pen>());
        } else {
          expect(state.currentTool, isA<Eraser>());
        }
      });
    }
  });
}
