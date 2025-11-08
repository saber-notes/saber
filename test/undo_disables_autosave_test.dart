import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/canvas/save_indicator.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/test_mock_channel_handlers.dart';

const _filePath = '/tests/editor_undo_redo_test';
void main() {
  group('Editor: pending autosave', () {
    late EditorState editorState;
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupMockPathProvider();
      setupMockPrinting();
      setupMockWindowManager();
      SharedPreferences.setMockInitialValues({});

      FlavorConfig.setup();
      await FileManager.init();

      await FileManager.deleteFile(_filePath + Editor.extension);
    });
    tearDown(() async {
      // save file now to supersede the save timer (which would run after the test is finished)
      printOnFailure('Saving file: $_filePath${Editor.extension}');
      await editorState.saveToFile();
      await Future.delayed(const Duration(milliseconds: 100));
      await FileManager.deleteFile(_filePath + Editor.extension);
    });

    testGoldens('draw then undo', (tester) async {
      await tester.pumpWidget(const _EditorApp());
      editorState = tester.state<EditorState>(find.byType(Editor));
      await _waitForEditorToLoad(tester, editorState);

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
      await drawOnEditor(tester);
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

    testGoldens('draw then save then undo', (tester) async {
      await tester.pumpWidget(const _EditorApp());
      editorState = tester.state<EditorState>(find.byType(Editor));
      await _waitForEditorToLoad(tester, editorState);

      SavingState getSavingState() => tester
          .widget<SaveIndicator>(find.byType(SaveIndicator))
          .savingState
          .value;

      expect(
        getSavingState(),
        SavingState.saved,
        reason: 'Initial saving state should be "saved"',
      );

      printOnFailure('Drawing on editor');
      await drawOnEditor(tester);
      await tester.pumpAndSettle();
      expect(
        getSavingState(),
        SavingState.waitingToSave,
        reason: 'Saving state should be "waitingToSave" after drawing',
      );

      printOnFailure('Saving file after drawing');
      await tester.runAsync(() => editorState.saveToFile());
      await tester.pumpAndSettle();
      expect(
        getSavingState(),
        SavingState.saved,
        reason: 'Saving state should be "saved" after saving the file',
      );

      printOnFailure('Undoing the drawing');
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

Future drawOnEditor(WidgetTester tester) => tester.timedDrag(
  find.byType(Editor),
  const Offset(50, 0),
  const Duration(milliseconds: 100),
);

Future<void> _waitForEditorToLoad(
  WidgetTester tester,
  EditorState editorState,
) async {
  // wait for editor to load (i.e. when readOnly is false)
  for (var i = 0; i < 10; i++) {
    if (!editorState.coreInfo.readOnly) break;
    await tester.runAsync(
      () => Future.delayed(const Duration(milliseconds: 10)),
    );
    await tester.pump();
  }
  expect(
    editorState.coreInfo.readOnly,
    isFalse,
    reason: 'Editor is still read-only',
  );
  printOnFailure('Editor core info is loaded');
}

class _EditorApp extends StatelessWidget {
  const _EditorApp();
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            SizedBox(width: 1000, height: 1000, child: Editor(path: _filePath)),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: DynamicMaterialApp(title: 'Saber', router: router),
    );
  }
}
