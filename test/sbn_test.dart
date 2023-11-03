import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
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

    final sbnExamples = Directory('test/sbn_examples/')
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.sbn'))
        .map((file) => file.path.substring('test/sbn_examples/'.length))
        .toList();

    for (final sbnName in sbnExamples) {
      testWidgets(sbnName, (tester) async {
        final path = 'test/sbn_examples/$sbnName';
        final contents = await tester.runAsync(
          () => File(path).readAsString(),
        );
        final coreInfo = await tester.runAsync(
          () => EditorCoreInfo.loadFromFileContents(
            jsonString: contents,
            path: path,
            readOnly: true,
            onlyFirstPage: true,
          ),
        );
        final page = coreInfo!.pages.first;

        // set up tester display size
        tester.view.physicalSize = page.size;
        addTearDown(tester.view.resetPhysicalSize);

        // create Canvas widget
        await tester.pumpWidget(
          TranslationProvider(
            child: SizedBox(
              width: page.size.width,
              height: page.size.height,
              child: MaterialApp(
                home: SizedBox(
                  width: page.size.width,
                  height: page.size.height,
                  child: RepaintBoundary(
                    child: Canvas(
                      path: path,
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
      });
    }
  });
}
