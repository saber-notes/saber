import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/settings/settings_spen.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

import 'utils/test_editor.dart';
import 'utils/test_mock_channel_handlers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('saber/spen');
  const codec = StandardMethodCodec();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  Future<void> sendUndo(WidgetTester tester) async {
    await messenger.handlePlatformMessage(
      channel.name,
      codec.encodeMethodCall(const MethodCall('undo')),
      null,
    );
    await tester.pump();
  }

  Future<EditorState> pumpEditor(WidgetTester tester) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(home: Editor(path: '/remote-test')),
      ),
    );
    await tester.pumpAndSettle();
    return tester.state<EditorState>(find.byType(Editor));
  }

  setUp(() async {
    setupMockPathProvider();
    setupMockPrinting();
    setupMockWindowManager();
    FlavorConfig.setup();
    final directory = await Directory.systemTemp.createTemp('saber-spen-test-');
    await FileManager.init(
      documentsDirectory: directory.path,
      shouldWatchRootDirectory: false,
    );
    stows.spenRemoteUndo.value = true;
  });

  tearDown(() {
    messenger.setMockMethodCallHandler(channel, null);
  });

  testWidgets('remote Undo removes exactly the latest stroke without focus', (
    tester,
  ) async {
    final editor = await pumpEditor(tester);
    editor.drawTestStroke();
    editor.drawTestStroke();
    final first = editor.coreInfo.pages.first.strokes.first;
    await sendUndo(tester);
    expect(editor.coreInfo.pages.first.strokes, [first]);
    expect(editor.history.canRedo, isTrue);
    editor.cancelAutosaveAndMarkSaved();
  });

  testWidgets('remote Undo with empty history is harmless', (tester) async {
    final editor = await pumpEditor(tester);
    await sendUndo(tester);
    expect(editor.coreInfo.pages.first.strokes, isEmpty);
    expect(editor.history.canRedo, isFalse);
    expect(tester.takeException(), isNull);
    editor.cancelAutosaveAndMarkSaved();
  });

  testWidgets('remote Undo leaves an editor behind another route unchanged', (
    tester,
  ) async {
    final editor = await pumpEditor(tester);
    editor.drawTestStroke();
    Navigator.of(editor.context).push<void>(
      MaterialPageRoute(
        builder: (_) => const Scaffold(body: Text('Other page')),
      ),
    );
    await tester.pumpAndSettle();
    await sendUndo(tester);
    expect(editor.coreInfo.pages.first.strokes, hasLength(1));
    editor.cancelAutosaveAndMarkSaved();
  });

  testWidgets('disabled remote Undo keeps the latest stroke', (tester) async {
    final editor = await pumpEditor(tester);
    editor.drawTestStroke();
    stows.spenRemoteUndo.value = false;
    await sendUndo(tester);
    expect(editor.coreInfo.pages.first.strokes, hasLength(1));
    editor.cancelAutosaveAndMarkSaved();
  });

  testWidgets('remote Undo does not change a read-only note', (tester) async {
    final editor = await pumpEditor(tester);
    editor.drawTestStroke();
    editor.coreInfo.readOnlyReason = .versionTooNew;
    await sendUndo(tester);
    expect(editor.coreInfo.pages.first.strokes, hasLength(1));
    editor.cancelAutosaveAndMarkSaved();
  });

  testWidgets('leaving the editor removes its remote listener', (tester) async {
    final editor = await pumpEditor(tester);
    editor.cancelAutosaveAndMarkSaved();
    await tester.pumpWidget(const SizedBox.shrink());
    await sendUndo(tester);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Samsung settings toggle controls the saved preference', (
    tester,
  ) async {
    messenger.setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'isSupported') return true;
      return null;
    });
    await tester.pumpWidget(
      TranslationProvider(
        child: const MaterialApp(home: Scaffold(body: SettingsSpen())),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text(t.settings.spen.title), findsOneWidget);
    await tester.tap(find.text(t.settings.spen.undo));
    expect(stows.spenRemoteUndo.value, isFalse);
    await tester.pumpAndSettle();
  }, variant: const TargetPlatformVariant({TargetPlatform.android}));

  testWidgets('Samsung settings are hidden on unsupported devices', (
    tester,
  ) async {
    messenger.setMockMethodCallHandler(channel, (call) async => false);
    await tester.pumpWidget(
      TranslationProvider(
        child: const MaterialApp(home: Scaffold(body: SettingsSpen())),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text(t.settings.spen.title), findsNothing);
  }, variant: const TargetPlatformVariant({TargetPlatform.android}));
}
