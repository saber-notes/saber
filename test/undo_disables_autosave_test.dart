import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/save_indicator.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_editor.dart';
import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Editor: pending autosave', () {
    late EditorState editorState;
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupMockPathProvider();
      setupMockPrinting();
      setupMockWindowManager();

      FlavorConfig.setup();
      await FileManager.init();
    });
    tearDown(() => editorState.cancelAutosaveAndMarkSaved());

    testWidgets('draw then undo', (tester) async {
      await tester.pumpWidget(
        TranslationProvider(child: MaterialApp(home: Editor())),
      );
      editorState = tester.state<EditorState>(find.byType(Editor));
      expect(editorState.coreInfo.readOnly, isFalse);

      SavingState getSavingState() => tester
          .widget<SaveIndicator>(find.byType(SaveIndicator))
          .savingState
          .value;

      expect(
        getSavingState(),
        SavingState.saved,
        reason: 'Initial saving state should be "saved"',
      );

      // draw something
      editorState.drawTestStroke();
      await tester.pumpAndSettle();
      expect(
        getSavingState(),
        SavingState.waitingToSave,
        reason: 'Saving state should be "waitingToSave" after drawing',
      );

      // undo the drawing
      await tester.tap(find.byIcon(Icons.undo));
      await tester.pumpAndSettle();
      expect(
        getSavingState(),
        SavingState.saved,
        reason: 'Saving state should be "saved" after undoing the change',
      );
    });

    testWidgets('draw then save then undo', (tester) async {
      await tester.pumpWidget(
        TranslationProvider(child: MaterialApp(home: Editor())),
      );
      editorState = tester.state<EditorState>(find.byType(Editor));
      expect(editorState.coreInfo.readOnly, isFalse);

      SavingState getSavingState() => tester
          .widget<SaveIndicator>(find.byType(SaveIndicator))
          .savingState
          .value;

      expect(
        getSavingState(),
        SavingState.saved,
        reason: 'Initial saving state should be "saved"',
      );

      editorState.drawTestStroke();
      await tester.pumpAndSettle();
      expect(
        getSavingState(),
        SavingState.waitingToSave,
        reason: 'Saving state should be "waitingToSave" after drawing',
      );

      editorState.cancelAutosaveAndMarkSaved();
      await tester.pumpAndSettle();
      expect(
        getSavingState(),
        SavingState.saved,
        reason: 'Saving state should be "saved" after saving the file',
      );

      await tester.tap(find.byIcon(Icons.undo));
      await tester.pumpAndSettle();
      expect(
        getSavingState(),
        SavingState.waitingToSave,
        reason:
            'Saving state should be "waitingToSave" since different to saved',
      );
    });
  });
}
