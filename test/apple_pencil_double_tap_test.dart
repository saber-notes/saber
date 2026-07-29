/// 🤖 Generated wholely or partially with Claude Code (Claude Fable 5)
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/apple_pencil_interactions.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Apple Pencil double-tap', () {
    /// Simulates the iOS runner sending a double-tap over the method channel,
    /// with [preferredAction] being the system-wide Apple Pencil setting.
    Future<void> doubleTapPencil(
      WidgetTester tester, {
      String preferredAction = 'switchEraser',
    }) async {
      await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage(
            ApplePencilInteractions.channel.name,
            const StandardMethodCodec().encodeMethodCall(
              MethodCall('doubleTap', preferredAction),
            ),
            (_) {},
          );
      await tester.pump();
    }

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

      state.setTool(Pen.currentPen);
      return state;
    }

    testWidgets('toggles between pen and eraser', (tester) async {
      final state = await pumpEditor(tester);
      expect(state.currentTool, isA<Pen>());

      await doubleTapPencil(tester);
      expect(state.currentTool, isA<Eraser>());

      await doubleTapPencil(tester);
      expect(state.currentTool, isA<Pen>());
    });

    testWidgets('does nothing if disabled in the system settings', (
      tester,
    ) async {
      final state = await pumpEditor(tester);
      expect(state.currentTool, isA<Pen>());

      await doubleTapPencil(tester, preferredAction: 'ignore');
      expect(state.currentTool, isA<Pen>());
    });
  });
}
