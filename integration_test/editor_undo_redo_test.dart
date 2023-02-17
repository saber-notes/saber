
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/pages/editor/editor.dart';

import 'test_globals.dart';

void main() {
  testWidgets('Editor: undo/redo buttons interaction test', (tester) async {
    initialiseForTests();

    const String filePath = '/tests/editor_undo_redo_test';
    final Editor editor = Editor(
      path: filePath,
    );
    await tester.pumpWidget(MaterialApp(
      home: SizedBox(
        width: 1000,
        height: 1000,
        child: editor,
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byWidget(editor), findsOneWidget, reason: 'Editor widget not found');

    var undoBtnFinder = find.ancestor(
      of: find.byIcon(Icons.undo),
      matching: find.byType(IconButton)
    );
    var redoBtnFinder = find.ancestor(
      of: find.byIcon(Icons.redo),
      matching: find.byType(IconButton)
    );

    expect(undoBtnFinder, findsOneWidget, reason: 'Undo button not found');
    expect(redoBtnFinder, findsOneWidget, reason: 'Redo button not found');

    expect(tester.widget<IconButton>(undoBtnFinder).onPressed == null, isTrue, reason: 'Undo button should be disabled initially');
    expect(tester.widget<IconButton>(redoBtnFinder).onPressed == null, isTrue, reason: 'Redo button should be disabled initially');

    // draw something
    await drawOnEditor(tester, editor);
    await tester.pumpAndSettle();
    expect(tester.widget<IconButton>(undoBtnFinder).onPressed == null, isFalse, reason: 'Undo button should be enabled after first draw');
    expect(tester.widget<IconButton>(redoBtnFinder).onPressed == null, isTrue, reason: 'Redo button should be disabled after first draw');

    // undo
    await tester.tap(undoBtnFinder);
    await tester.pump();
    expect(tester.widget<IconButton>(undoBtnFinder).onPressed == null, isTrue, reason: 'Undo button should be disabled after undo');
    expect(tester.widget<IconButton>(redoBtnFinder).onPressed == null, isFalse, reason: 'Redo button should be enabled after undo');

    // redo
    await tester.tap(redoBtnFinder);
    await tester.pump();
    expect(tester.widget<IconButton>(undoBtnFinder).onPressed == null, isFalse, reason: 'Undo button should be enabled after redo');
    expect(tester.widget<IconButton>(redoBtnFinder).onPressed == null, isTrue, reason: 'Redo button should be disabled after redo');

    // undo, then draw again
    await tester.tap(undoBtnFinder);
    await tester.pump();
    await drawOnEditor(tester, editor);
    await tester.pump();
    expect(tester.widget<IconButton>(undoBtnFinder).onPressed == null, isFalse, reason: 'Undo button should be enabled after undo and draw');
    expect(tester.widget<IconButton>(redoBtnFinder).onPressed == null, isTrue, reason: 'Redo button should be disabled after undo and draw');

    FileManager.deleteFile(filePath + Editor.extension);
  });
}

Future drawOnEditor(WidgetTester tester, Editor editor) => tester.timedDrag(
  find.byWidget(editor),
  const Offset(50, 0),
  const Duration(milliseconds: 200),
);
