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
      testWidgets(sbnName, (tester) async {
        final path = 'test/sbn_examples/$sbnName';
        final coreInfo = await tester.runAsync(() async {
          if (sbnName.endsWith('.sbn2')) {
            return await EditorCoreInfo.loadFromFileContents(
              bsonBytes: File(path).readAsBytesSync(),
              path: path,
              readOnly: true,
              onlyFirstPage: true,
            );
          } else {
            return await EditorCoreInfo.loadFromFileContents(
              jsonString: File(path).readAsStringSync(),
              path: path,
              readOnly: true,
              onlyFirstPage: true,
            );
          }
        });
        final page = coreInfo!.pages.first;

        // set up tester display size
        tester.view.physicalSize = page.size;
        addTearDown(tester.view.resetPhysicalSize);

        // create Canvas widget
        await tester.pumpWidget(_buildCanvas(
          brightness: Brightness.light,
          path: path,
          page: page,
          coreInfo: coreInfo,
        ));

        // precache images
        final context = tester.binding.rootElement!;
        await tester.runAsync(
          () => Future.wait([
            for (final image in page.images) image.precache(context),
            page.backgroundImage?.precache(context) ?? Future.value(),
          ]),
        );
        await tester.pumpAndSettle();

        // compare to golden image
        await expectLater(
          find.byType(Canvas),
          matchesGoldenFile('sbn_examples/$sbnName.png'),
        );

        // now test dark mode
        await tester.pumpWidget(_buildCanvas(
          brightness: Brightness.dark,
          path: path,
          page: page,
          coreInfo: coreInfo,
        ));
        await tester.pumpAndSettle();
        await expectLater(
          find.byType(Canvas),
          matchesGoldenFile('sbn_examples/$sbnName.dark.png'),
        );
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
    child: SizedBox(
      width: page.size.width,
      height: page.size.height,
      child: MaterialApp(
        theme: ThemeData(
          brightness: brightness,
        ),
        home: SizedBox(
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
  );
}
