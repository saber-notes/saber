import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:material_ui/material_ui.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_editor.dart';
import 'utils/test_mock_channel_handlers.dart';

void main() {
  testWidgets(
    'copies selection and pastes independent copies on another page',
    (tester) async {
      setupMockPathProvider();
      setupMockPrinting();
      EditorImage.shouldLoadOutImmediately = true;
      addTearDown(() => EditorImage.shouldLoadOutImmediately = false);
      FlavorConfig.setup();
      await tester.runAsync(FileManager.init);
      final directory = await tester.runAsync(
        () => Directory.systemTemp.createTemp('saber-clipboard-test-'),
      );
      final sourceFile = await tester.runAsync(
        () => File('assets/icon/icon.png').copy('${directory!.path}/image.png'),
      );
      addTearDown(() async {
        if (sourceFile!.existsSync()) await sourceFile.delete();
        await directory!.delete();
      });

      await tester.pumpWidget(
        TranslationProvider(
          child: ScreenshotApp(
            device: GoldenScreenshotDevices.androidPhone.device,
            home: Editor(),
          ),
        ),
      );
      final editor = tester.state<EditorState>(find.byType(Editor));
      addTearDown(editor.cancelAutosaveAndMarkSaved);
      final pasteButton = find.byTooltip(t.editor.selectionBar.paste);
      expect(pasteButton, findsNothing);

      editor.drawTestStroke();
      final page = editor.coreInfo.pages.first;
      final stroke = page.strokes.single;
      final originalMaxY = stroke.maxY;
      final image = PngEditorImage(
        id: editor.coreInfo.nextImageId++,
        assetCache: editor.coreInfo.assetCache,
        extension: '.png',
        imageProvider: FileImage(sourceFile!),
        pageIndex: 0,
        pageSize: page.size,
        onMoveImage: editor.onMoveImage,
        onDeleteImage: editor.onDeleteImage,
        onMiscChange: editor.autosaveAfterDelay,
        newImage: false,
        dstRect: const Rect.fromLTWH(20, 20, 100, 100),
      );
      page.images.add(image);
      var select = editor.selectTool;
      select.selectResult = SelectResult(
        pageIndex: 0,
        pageIndexStart: 0,
        strokes: [stroke],
        images: [image],
        path: Path()..addRect(const Rect.fromLTWH(0, 0, 150, 150)),
      );
      select.doneSelecting = true;
      // ignore: invalid_use_of_protected_member
      editor.setState(() => editor.currentTool = select);
      await tester.pumpAndSettle();

      expect(find.byTooltip(t.editor.selectionBar.copy), findsOneWidget);
      await tester.runAsync(editor.copySelection);
      await tester.pumpAndSettle();
      expect(pasteButton, findsOneWidget);

      stroke.shift(const Offset(200, 200));
      image.dstRect = image.dstRect.shift(const Offset(200, 200));
      await tester.tap(find.byTooltip(t.editor.menu.insertPage));
      await tester.pumpAndSettle();
      final canvas = tester.state<CanvasGestureDetectorState>(
        find.byType(CanvasGestureDetector),
      );
      for (var i = 0; i < 30 && editor.currentPageIndex == 0; i++) {
        canvas.arrowKeyPan(AxisDirection.down, true);
        canvas.arrowKeyPan(AxisDirection.down, false);
      }
      await tester.pumpAndSettle();
      expect(editor.currentPageIndex, 1);
      final target = editor.coreInfo.pages[1];

      await tester.tap(pasteButton);
      await tester.pumpAndSettle();
      expect(pasteButton, findsNothing);
      expect(target.strokes, hasLength(1));
      expect(target.images, hasLength(1));
      expect(target.strokes.single.page, same(target));
      expect(target.strokes.single.pageIndex, 1);
      expect(target.strokes.single.maxY, originalMaxY);
      expect(target.images.single.pageIndex, 1);
      expect(
        target.images.single.dstRect,
        const Rect.fromLTWH(20, 20, 100, 100),
      );
      expect(select.doneSelecting, isTrue);
      expect(select.selectResult.pageIndexStart, 1);
      expect(select.selectResult.strokes.single, same(target.strokes.single));
      expect(select.selectResult.images.single, same(target.images.single));
      expect(select.selectResult.path.contains(const Offset(10, 10)), isTrue);
      expect(editor.currentTool, same(select));

      await tester.runAsync(editor.copySelection);
      await tester.pump();
      expect(pasteButton, findsOneWidget);
      final start = target.renderBox!.localToGlobal(const Offset(50, 50));
      final end = target.renderBox!.localToGlobal(const Offset(60, 65));
      editor.dragPageIndex = 1;
      editor.onDrawStart(ScaleStartDetails(focalPoint: start));
      editor.onDrawUpdate(ScaleUpdateDetails(focalPoint: end));
      editor.onDrawEnd(ScaleEndDetails());
      await tester.pumpAndSettle();
      expect(target.images.single.dstRect.left, closeTo(30, 0.001));
      expect(target.images.single.dstRect.top, closeTo(35, 0.001));
      editor.undo();
      await tester.pumpAndSettle();
      expect(target.images.single.dstRect.left, closeTo(20, 0.001));
      expect(target.images.single.dstRect.top, closeTo(20, 0.001));

      editor.undo();
      await tester.pumpAndSettle();
      expect(target.strokes, isEmpty);
      expect(target.images, isEmpty);
      editor.redo();
      await tester.pumpAndSettle();
      expect(target.strokes, hasLength(1));
      expect(target.images, hasLength(1));

      await tester.tap(pasteButton);
      await tester.pumpAndSettle();
      expect(pasteButton, findsNothing);
      expect(target.strokes, hasLength(2));
      expect(target.images, hasLength(2));
      expect(target.images[0].id, isNot(target.images[1].id));
      expect(target.images.last.dstRect, const Rect.fromLTWH(20, 20, 100, 100));

      await tester.runAsync(editor.copySelection);
      await tester.pump();
      await tester.tap(find.byTooltip(t.editor.selectionBar.duplicate));
      await tester.pumpAndSettle();
      expect(target.images.last.dstRect, const Rect.fromLTWH(45, -5, 100, 100));

      editor.cancelAutosaveAndMarkSaved();
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.runAsync(sourceFile.delete);
      await tester.pumpWidget(
        TranslationProvider(
          child: ScreenshotApp(
            device: GoldenScreenshotDevices.androidPhone.device,
            home: Editor(),
          ),
        ),
      );
      final anotherEditor = tester.state<EditorState>(find.byType(Editor));
      addTearDown(anotherEditor.cancelAutosaveAndMarkSaved);
      await tester.pumpAndSettle();
      select = anotherEditor.selectTool;
      expect(select.doneSelecting, isFalse);
      expect(select.selectResult.pageIndex, -1);
      expect(pasteButton, findsOneWidget);
      await tester.tap(pasteButton);
      await tester.pumpAndSettle();
      expect(pasteButton, findsNothing);
      final pastedImage = anotherEditor.coreInfo.pages.first.images.single;
      expect((pastedImage as PngEditorImage).imageProvider, isA<MemoryImage>());
      expect(pastedImage.assetCache, same(anotherEditor.coreInfo.assetCache));
      expect(anotherEditor.coreInfo.pages.first.strokes, hasLength(1));
      expect(select.doneSelecting, isTrue);
      expect(select.selectResult.images.single, same(pastedImage));

      await tester.runAsync(anotherEditor.copySelection);
      await tester.pump();
      expect(pasteButton, findsOneWidget);
      // ignore: invalid_use_of_protected_member
      anotherEditor.setState(() {
        anotherEditor.coreInfo.readOnlyReason = .versionTooNew;
      });
      await tester.pump();
      final pasteIconButton = find.ancestor(
        of: pasteButton,
        matching: find.byType(IconButton),
      );
      expect(tester.widget<IconButton>(pasteIconButton).onPressed, isNull);
      anotherEditor.pasteSelection();
      expect(anotherEditor.coreInfo.pages.first.strokes, hasLength(1));
      expect(pasteButton, findsOneWidget);

      // ignore: invalid_use_of_protected_member
      anotherEditor.setState(() {
        anotherEditor.coreInfo.readOnlyReason = null;
        select.selectResult = SelectResult(
          pageIndex: 0,
          pageIndexStart: 0,
          strokes: [],
          images: [image],
          path: Path()..addRect(const Rect.fromLTWH(0, 0, 150, 150)),
        );
      });
      await tester.runAsync(anotherEditor.copySelection);
      await tester.pump();
      expect(find.text(t.editor.selectionBar.copyFailed), findsOneWidget);
      expect(tester.widget<IconButton>(pasteIconButton).onPressed, isNotNull);
      final destination =
          anotherEditor.coreInfo.pages[anotherEditor.currentPageIndex];
      final oldCount = destination.strokes.length;
      await tester.tap(pasteButton);
      await tester.pump();
      expect(destination.strokes, hasLength(oldCount + 1));
      expect(pasteButton, findsNothing);
    },
  );

  testWidgets('cuts strokes and images only after a successful snapshot', (
    tester,
  ) async {
    setupMockPathProvider();
    setupMockPrinting();
    EditorImage.shouldLoadOutImmediately = true;
    addTearDown(() => EditorImage.shouldLoadOutImmediately = false);
    FlavorConfig.setup();
    await tester.runAsync(FileManager.init);
    final bytes = await tester.runAsync(
      () => File('assets/icon/icon.png').readAsBytes(),
    );
    final directory = await tester.runAsync(
      () => Directory.systemTemp.createTemp('saber-cut-test-'),
    );
    addTearDown(() => directory!.delete());

    await tester.pumpWidget(
      TranslationProvider(
        child: ScreenshotApp(
          device: GoldenScreenshotDevices.androidPhone.device,
          home: Editor(),
        ),
      ),
    );
    final editor = tester.state<EditorState>(find.byType(Editor));
    addTearDown(editor.cancelAutosaveAndMarkSaved);
    editor.drawTestStroke();
    final page = editor.coreInfo.pages.first;
    final stroke = page.strokes.single;
    final image = PngEditorImage(
      id: editor.coreInfo.nextImageId++,
      assetCache: editor.coreInfo.assetCache,
      extension: '.png',
      imageProvider: MemoryImage(bytes!),
      pageIndex: 0,
      pageSize: page.size,
      onMoveImage: editor.onMoveImage,
      onDeleteImage: editor.onDeleteImage,
      onMiscChange: editor.autosaveAfterDelay,
      newImage: false,
      dstRect: const Rect.fromLTWH(20, 20, 100, 100),
    );
    page.images.add(image);
    final select = editor.selectTool;
    select.selectResult = SelectResult(
      pageIndex: 0,
      pageIndexStart: 0,
      strokes: [stroke],
      images: [image],
      path: Path()..addRect(const Rect.fromLTWH(0, 0, 150, 150)),
    );
    select.doneSelecting = true;
    // ignore: invalid_use_of_protected_member
    editor.setState(() => editor.currentTool = select);
    await tester.pumpAndSettle();
    final cutButton = find.byTooltip(t.editor.selectionBar.cut);
    expect(cutButton, findsOneWidget);

    image.imageProvider = FileImage(File('${directory!.path}/missing.png'));
    await tester.runAsync(editor.cutSelection);
    image.imageProvider = MemoryImage(bytes);
    await tester.pump();
    expect(find.text(t.editor.selectionBar.cutFailed), findsOneWidget);
    expect(page.strokes, contains(stroke));
    expect(page.images, contains(image));

    await tester.runAsync(() async {
      final pendingCut = editor.cutSelection();
      image.dstRect = image.dstRect.shift(const Offset(10, 0));
      await pendingCut;
    });
    await tester.pump();
    expect(page.strokes, contains(stroke));
    expect(page.images, contains(image));

    await tester.tap(cutButton);
    await tester.pumpAndSettle();
    expect(page.strokes, isEmpty);
    expect(page.images, isEmpty);
    expect(select.doneSelecting, isFalse);
    expect(find.byTooltip(t.editor.selectionBar.paste), findsOneWidget);

    editor.undo();
    await tester.pump();
    expect(page.strokes, contains(stroke));
    expect(page.images, contains(image));
    editor.redo();
    await tester.pump();
    expect(page.strokes, isEmpty);
    expect(page.images, isEmpty);

    await tester.tap(find.byTooltip(t.editor.selectionBar.paste));
    await tester.pumpAndSettle();
    expect(find.byTooltip(t.editor.selectionBar.paste), findsNothing);
    expect(page.strokes, hasLength(1));
    expect(page.images, hasLength(1));
    expect(page.images.single.dstRect, const Rect.fromLTWH(30, 20, 100, 100));
    expect(select.doneSelecting, isTrue);
    expect(select.selectResult.strokes.single, same(page.strokes.single));
    expect(select.selectResult.images.single, same(page.images.single));
  });

  testWidgets('keeps selections isolated while switching between editors', (
    tester,
  ) async {
    setupMockPathProvider();
    setupMockPrinting();
    FlavorConfig.setup();
    await tester.runAsync(FileManager.init);
    final firstKey = GlobalKey<EditorState>();
    final secondKey = GlobalKey<EditorState>();
    await tester.pumpWidget(
      TranslationProvider(
        child: ScreenshotApp(
          device: GoldenScreenshotDevices.androidPhone.device,
          home: Editor(key: firstKey),
        ),
      ),
    );

    final first = firstKey.currentState!;
    addTearDown(first.cancelAutosaveAndMarkSaved);
    first.drawTestStroke();
    final original = first.coreInfo.pages.first.strokes.single;
    final firstSelect = first.selectTool;
    firstSelect.selectResult = SelectResult(
      pageIndex: 0,
      pageIndexStart: 0,
      strokes: [original],
      images: [],
      path: Path()..addRect(const Rect.fromLTWH(0, 0, 150, 150)),
    );
    firstSelect.doneSelecting = true;
    // ignore: invalid_use_of_protected_member
    first.setState(() => first.currentTool = firstSelect);
    await tester.runAsync(first.copySelection);
    await tester.pump();

    Navigator.of(firstKey.currentContext!)
        .push(MaterialPageRoute<void>(builder: (_) => Editor(key: secondKey)));
    await tester.pumpAndSettle();
    final second = secondKey.currentState!;
    addTearDown(second.cancelAutosaveAndMarkSaved);
    final secondSelect = second.selectTool;
    expect(secondSelect, isNot(same(firstSelect)));
    expect(secondSelect.doneSelecting, isFalse);
    expect(secondSelect.selectResult.pageIndex, -1);
    expect(find.byTooltip(t.editor.selectionBar.paste), findsOneWidget);

    await tester.tap(find.byTooltip(t.editor.selectionBar.paste));
    await tester.pumpAndSettle();
    expect(find.byTooltip(t.editor.selectionBar.paste), findsNothing);
    expect(secondSelect.doneSelecting, isTrue);
    expect(secondSelect.selectResult.strokes.single, isNot(same(original)));
    expect(firstSelect.selectResult.strokes.single, same(original));
    expect(firstSelect.doneSelecting, isTrue);

    second.cancelAutosaveAndMarkSaved();
    await tester.pump();
    Navigator.of(secondKey.currentContext!).pop();
    await tester.pumpAndSettle();
    expect(find.byTooltip(t.editor.selectionBar.paste), findsNothing);
    expect(firstSelect.doneSelecting, isTrue);
    expect(firstSelect.selectResult.strokes.single, same(original));
  });
}
