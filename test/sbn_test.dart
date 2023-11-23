import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:process_run/shell.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/components/canvas/pencil_shader.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/editor_exporter.dart';
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
        final pathWithoutExtension = path.substring(0, path.lastIndexOf('.'));

        late final EditorCoreInfo coreInfo;
        late final page = coreInfo.pages.first;

        setUpAll(() async {
          FileManager.shouldUseRawFilePath = true;
          if (sbnName.endsWith('.sbn2')) {
            coreInfo = await EditorCoreInfo.loadFromFileContents(
              bsonBytes: File(path).readAsBytesSync(),
              path: pathWithoutExtension,
              readOnly: false,
              onlyFirstPage: true,
            );
          } else {
            coreInfo = await EditorCoreInfo.loadFromFileContents(
              jsonString: File(path).readAsStringSync(),
              path: pathWithoutExtension,
              readOnly: false,
              onlyFirstPage: true,
            );
          }
        });
        tearDownAll(() {
          FileManager.shouldUseRawFilePath = false;
        });

        testWidgets('(Light)', (tester) async {
          await tester.runAsync(() => _precacheImages(
            context: tester.binding.rootElement!,
            page: page,
          ));
          await tester.pumpWidget(_buildCanvas(
            brightness: Brightness.light,
            path: path,
            page: page,
            coreInfo: coreInfo,
          ));
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(Canvas),
            matchesGoldenFile('sbn_examples/$sbnName.light.png'),
          );
        });

        testWidgets('(Dark)', (tester) async {
          await tester.runAsync(() => _precacheImages(
            context: tester.binding.rootElement!,
            page: page,
          ));
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

        testWidgets('(PDF)', (tester) async {
          final context = await _getBuildContext(tester, page.size);

          final pdfFile = File('/tmp/$sbnName.pdf');
          final pngFile = File('/tmp/$sbnName.pdf.png');

          // Generate PDF file and write to disk
          await tester.runAsync(() async {
            final doc = await EditorExporter.generatePdf(coreInfo, context);
            final bytes = await doc.save();
            await pdfFile.writeAsBytes(bytes);
          });

          // Convert PDF to PNG with Ghostscript
          final shell = Shell(verbose: false);
          await tester.runAsync(() => shell.run('gs -sDEVICE=pngalpha -o ${pngFile.path} ${pdfFile.path}'));

          // Load PNG from disk
          final pdfImage = await tester.runAsync(() => pngFile.readAsBytes());

          // Precache image and render it
          final pdfImageProvider = MemoryImage(pdfImage!);
          await tester.runAsync(() => precacheImage(pdfImageProvider, context));
          await tester.pumpWidget(Center(
            child: RepaintBoundary(
              child: Image(image: pdfImageProvider),
            ),
          ));

          await expectLater(
            find.byType(Image),
            matchesGoldenFile('sbn_examples/$sbnName.pdf.png'),
          );
        });
      });
    }
  });
}

/// Provides a [BuildContext] with the necessary inherited widgets
Future<BuildContext> _getBuildContext(WidgetTester tester, Size pageSize) async {
  final completer = Completer<BuildContext>();

  await tester.pumpWidget(TranslationProvider(
    child: MaterialApp(
      home: Center(
        child: FittedBox(
          child: SizedBox(
            width: pageSize.width,
            height: pageSize.height,
            child: Builder(
              builder: (context) {
                completer.complete(context);
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    ),
  ));

  return completer.future;
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
}) async {
  // FileImages aren't working in tests, so replace them with MemoryImages
  await Future.wait([
    for (final image in page.images)
      if (image.imageProvider is FileImage)
        (image.imageProvider as FileImage).file.readAsBytes()
          .then((bytes) => image.imageProvider = MemoryImage(bytes)),
    if (page.backgroundImage?.imageProvider is FileImage)
      (page.backgroundImage!.imageProvider as FileImage).file.readAsBytes()
        .then((bytes) => page.backgroundImage!.imageProvider = MemoryImage(bytes)),
  ]);

  // Precache images
  await Future.wait([
    for (final image in page.images)
      image.precache(context),
    if (page.backgroundImage != null)
      page.backgroundImage!.precache(context),
  ]);
}
