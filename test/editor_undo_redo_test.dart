import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  testWidgets('Editor: undo/redo buttons interaction test', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = null; // needed for [google_fonts] package

    setupMockPathProvider();
    setupMockPrinting();

    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();
    FileManager.init();

    const filePath = '/tests/editor_undo_redo_test';
    await tester.runAsync(() async {
      await FileManager.deleteFile(filePath + Editor.extension);
    });

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => SizedBox(
            width: 1000,
            height: 1000,
            child: Editor(path: filePath),
          ),
        ),
      ],
    );
    await tester.pumpWidget(TranslationProvider(
      child: DynamicMaterialApp(
        title: 'Saber',
        router: router,
      ),
    ));
    await tester.pumpAndSettle();

    // wait for editor to load (i.e. when readOnly is false)
    final editorState = tester.state<EditorState>(find.byType(Editor));
    for (int i = 0; i < 10; i++) {
      if (!editorState.coreInfo.readOnly) break;
      await tester.runAsync(() => Future.delayed(const Duration(milliseconds: 10)));
    }
    expect(editorState.coreInfo.readOnly, isFalse, reason: 'Editor is still read-only');
    printOnFailure('Editor core info is loaded');

    IconButton getUndoBtn() => tester.widget<IconButton>(find.ancestor(
      of: find.byIcon(Icons.undo),
      matching: find.byType(IconButton),
    ));
    IconButton getRedoBtn() => tester.widget<IconButton>(find.ancestor(
      of: find.byIcon(Icons.redo),
      matching: find.byType(IconButton),
    ));

    expect(getUndoBtn().onPressed, isNull, reason: 'Undo button should be disabled initially');
    expect(getRedoBtn().onPressed, isNull, reason: 'Redo button should be disabled initially');

    // draw something
    await drawOnEditor(tester);
    await tester.pumpAndSettle();
    expect(getUndoBtn().onPressed, isNotNull, reason: 'Undo button should be enabled after first draw');
    expect(getRedoBtn().onPressed, isNull, reason: 'Redo button should be disabled after first draw');

    // undo
    await tester.tap(find.byIcon(Icons.undo));
    await tester.pump();
    expect(getUndoBtn().onPressed, isNull, reason: 'Undo button should be disabled after undo');
    expect(getRedoBtn().onPressed, isNotNull, reason: 'Redo button should be enabled after undo');

    // redo
    await tester.tap(find.byIcon(Icons.redo));
    await tester.pump();
    expect(getUndoBtn().onPressed, isNotNull, reason: 'Undo button should be enabled after redo');
    expect(getRedoBtn().onPressed, isNull, reason: 'Redo button should be disabled after redo');

    // undo, then draw again
    await tester.tap(find.byIcon(Icons.undo));
    await tester.pump();
    await drawOnEditor(tester);
    await tester.pump();
    expect(getUndoBtn().onPressed, isNotNull, reason: 'Undo button should be enabled after undo and draw');
    expect(getRedoBtn().onPressed, isNull, reason: 'Redo button should be disabled after undo and draw');

    // save file now to supersede the save timer (which would run after the test is finished)
    printOnFailure('Saving file: $filePath${Editor.extension}');
    await tester.runAsync(() async {
      await editorState.saveToFile();
      await Future.delayed(const Duration(milliseconds: 100));
      await FileManager.deleteFile(filePath + Editor.extension);
    });
  });
}

Future drawOnEditor(WidgetTester tester) => tester.timedDrag(
  find.byType(Editor),
  const Offset(50, 0),
  const Duration(milliseconds: 100),
);
