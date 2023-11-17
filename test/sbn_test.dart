import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/components/canvas/pencil_shader.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Test SBN parsing:', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    setupMockPathProvider();
    setupMockPrinting();

    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();
    FileManager.init();

    setUpAll(() => Future.wait([
      InvertShader.init(),
      PencilShader.init(),
    ]));

    final sbnExamples = Directory('test/sbn_examples/')
        .listSync()
        .whereType<File>()
        .where(
          (file) => file.path.endsWith('.sbn') || file.path.endsWith('.sbn2'),
        )
        .map((file) => file.path.substring('test/sbn_examples/'.length))
        .toList();

    for (final sbnName in sbnExamples) {
      group(sbnName, () {
        final path = 'test/sbn_examples/$sbnName';
        late final EditorCoreInfo coreInfo;
        late final page = coreInfo.pages.first;

        setUpAll(() async {
          if (sbnName.endsWith('.sbn2')) {
            coreInfo = await EditorCoreInfo.loadFromFileContents(
              bsonBytes: File(path).readAsBytesSync(),
              path: path,
              readOnly: true,
              onlyFirstPage: true,
            );
          } else {
            coreInfo = await EditorCoreInfo.loadFromFileContents(
              jsonString: File(path).readAsStringSync(),
              path: path,
              readOnly: true,
              onlyFirstPage: true,
            );
          }
        });

        testWidgets('(Light)', (tester) async {
          await tester.pumpWidget(_buildCanvas(
            brightness: Brightness.light,
            path: path,
            page: page,
            coreInfo: coreInfo,
          ));

          await tester.runAsync(() => _precacheImages(
            context: tester.binding.rootElement!,
            page: page,
          ));
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(Canvas),
            matchesGoldenFile('sbn_examples/$sbnName.png'),
          );
        });

        testWidgets('(Dark)', (tester) async {
          await tester.pumpWidget(_buildCanvas(
            brightness: Brightness.dark,
            path: path,
            page: page,
            coreInfo: coreInfo,
          ));

          await tester.runAsync(() => _precacheImages(
            context: tester.binding.rootElement!,
            page: page,
          ));
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(Canvas),
            matchesGoldenFile('sbn_examples/$sbnName.dark.png'),
          );
        });
      });
    }
  });
}

Widget _buildCanvas({
  required Brightness brightness,
  required String path,
  required EditorPage page,
  required EditorCoreInfo coreInfo,
}) {
  return TranslationProvider(
    child: MaterialApp(
      theme: ThemeData(
        brightness: brightness,
      ),
      home: Center(
        child: FittedBox(
          child: SizedBox(
            width: page.size.width,
            height: page.size.height,
            child: RepaintBoundary(
              child: Canvas(
                path: coreInfo.filePath,
                page: page,
                pageIndex: 0,
                textEditing: false,
                coreInfo: coreInfo,
                currentStroke: null,
                currentStrokeDetectedShape: null,
                currentSelection: null,
                setAsBackground: null,
                currentToolIsSelect: false,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> _precacheImages({
  required BuildContext context,
  required EditorPage page,
}) {
  return Future.wait([
    for (final image in page.images) image.precache(context),
    if (page.backgroundImage != null)
      page.backgroundImage!.precache(context),
  ]);
}
