import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:path/path.dart' as p;
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/pencil_shader.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/editor_exporter.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/laser_pointer.dart';
import 'package:saber/data/tools/stroke_properties.dart';
import 'package:saber/i18n/strings.g.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Test SBN parsing:', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    BackgroundIsolateBinaryMessenger.ensureInitialized(
      ServicesBinding.rootIsolateToken!,
    );

    setupMockPathProvider();
    setupMockPrinting();

    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    setUpAll(() => Future.wait([
          FileManager.init(),
          PencilShader.init(),
        ]));

    const laserSbn = 'v17_laser_pointer.sbn2';
    final sbnExamples = Directory('test/sbn_examples/')
        .listSync()
        .whereType<File>()
        .where(
          (file) => file.path.endsWith('.sbn') || file.path.endsWith('.sbn2'),
        )
        .map((file) => file.path.substring('test/sbn_examples/'.length))
        .toList()
      ..add(laserSbn);

    for (final sbnName in sbnExamples) {
      group(sbnName, () {
        final path = sbnName == laserSbn
            ? 'test/sbn_examples/v17_squiggles.sbn2'
            : 'test/sbn_examples/$sbnName';
        final pathWithoutExtension = path.substring(0, path.lastIndexOf('.'));

        late final EditorCoreInfo coreInfo;
        late final page = coreInfo.pages.first;

        setUpAll(() async {
          StrokeOptionsExtension.setDefaults();
          FileManager.shouldUseRawFilePath = true;
          EditorImage.shouldLoadOutImmediately = true;
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
          if (sbnName == laserSbn) {
            final page = coreInfo.pages.first;
            page.laserStrokes
                .addAll(page.strokes.map(LaserStroke.convertStroke));
            page.strokes.clear();
          }
          if (coreInfo.pages.length > 1 && coreInfo.pages.last.isEmpty) {
            coreInfo.pages.removeLast();
          }
        });
        tearDownAll(() {
          FileManager.shouldUseRawFilePath = false;
          EditorImage.shouldLoadOutImmediately = false;
        });

        testGoldens('(Light)', (tester) async {
          await tester.runAsync(() => _precacheImages(
                context: tester.binding.rootElement!,
                page: page,
              ));
          await tester.loadFonts(overriddenFonts: saberSansSerifFontFallbacks);
          await tester.pumpWidget(_buildCanvas(
            brightness: Brightness.light,
            path: path,
            page: page,
            coreInfo: coreInfo,
          ));
          await tester.pumpAndSettle();

          tester.useFuzzyComparator(allowedDiffPercent: 0.1);
          await expectLater(
            find.byType(Canvas),
            matchesGoldenFile('sbn_examples/$sbnName.light.png'),
          );
        });

        testGoldens('(Dark)', (tester) async {
          await tester.runAsync(() => _precacheImages(
                context: tester.binding.rootElement!,
                page: page,
              ));
          await tester.loadFonts(overriddenFonts: saberSansSerifFontFallbacks);
          await tester.pumpWidget(_buildCanvas(
            brightness: Brightness.dark,
            path: path,
            page: page,
            coreInfo: coreInfo,
          ));
          await tester.pumpAndSettle();

          tester.useFuzzyComparator(allowedDiffPercent: 0.1);
          await expectLater(
            find.byType(Canvas),
            matchesGoldenFile('sbn_examples/$sbnName.dark.png'),
          );
        });

        if (sbnName != laserSbn) {
          bool hasGhostscript = true;
          final gsCheck =
              Process.runSync('gs', ['--version'], runInShell: true);
          if (gsCheck.exitCode != 0) {
            debugPrint('Please install Ghostscript to test PDF exports.');
            hasGhostscript = false;
          }

          testGoldens('(PDF)', (tester) async {
            final context = await _getBuildContext(tester, page.size);

            final pdfFile = File(p.join(tmpDir, '$sbnName.pdf'));
            final pngFile = File(p.join(tmpDir, '$sbnName.pdf.png'));

            // Generate PDF file and write to disk
            await tester.runAsync(() async {
              final doc = await EditorExporter.generatePdf(coreInfo, context);
              final bytes = await doc.save();
              await pdfFile.writeAsBytes(bytes);
            });

            // Convert PDF to PNG with Ghostscript
            await tester.runAsync(() => Process.run(
                'gs', ['-sDEVICE=pngalpha', '-o', pngFile.path, pdfFile.path],
                runInShell: true));

            // Load PNG from disk
            final pdfImage = await tester.runAsync(() => pngFile.readAsBytes());

            // Precache image and render it
            final pdfImageProvider = MemoryImage(pdfImage!);
            await tester
                .runAsync(() => precacheImage(pdfImageProvider, context));
            await tester.pumpWidget(Center(
              child: RepaintBoundary(
                child: Image(image: pdfImageProvider),
              ),
            ));

            tester.useFuzzyComparator(allowedDiffPercent: 0.1);
            await expectLater(
              find.byType(Image),
              matchesGoldenFile('sbn_examples/$sbnName.pdf.png'),
            );
          }, skip: !hasGhostscript);
        }
      });
    }

    testGoldens('SBA export and import', (tester) async {
      const path = 'test/sbn_examples/v19_separate_assets.sbn2';
      final pathWithoutExtension = path.substring(0, path.lastIndexOf('.'));

      EditorImage.shouldLoadOutImmediately = true;
      addTearDown(() => EditorImage.shouldLoadOutImmediately = false);

      // copy the file to the temporary directory
      await tester.runAsync(() => Future.wait([
            FileManager.getFile('/$path')
                .create(recursive: true)
                .then((file) => File(path).copy(file.path)),
            FileManager.getFile('/$path.0')
                .create(recursive: true)
                .then((file) => File('$path.0').copy(file.path)),
          ]));

      final coreInfo =
          await tester.runAsync(() => EditorCoreInfo.loadFromFilePath(
                '/$pathWithoutExtension',
              ));
      if (coreInfo == null) fail('Failed to load core info');

      final sba = await tester.runAsync(() => coreInfo.saveToSba(
            currentPageIndex: null,
          ));
      if (sba == null) fail('Failed to save SBA');

      final sbaFile = File('$pathWithoutExtension.sba');
      await tester.runAsync(() => sbaFile.writeAsBytes(sba));
      addTearDown(sbaFile.delete);

      final importedPath = await tester.runAsync(() => FileManager.importFile(
            sbaFile.path,
            null,
          ));
      if (importedPath == null) fail('Failed to import SBA');

      final importedCoreInfo =
          await tester.runAsync(() => EditorCoreInfo.loadFromFilePath(
                importedPath,
              ));
      if (importedCoreInfo == null) fail('Failed to load imported core info');

      if (importedCoreInfo.pages.length > 1 &&
          importedCoreInfo.pages.last.isEmpty) {
        importedCoreInfo.pages.removeLast();
      }

      await tester.runAsync(() => _precacheImages(
            context: tester.binding.rootElement!,
            page: importedCoreInfo.pages.first,
          ));
      await tester.loadFonts(overriddenFonts: saberSansSerifFontFallbacks);
      await tester.pumpWidget(_buildCanvas(
        brightness: Brightness.light,
        path: importedPath,
        page: importedCoreInfo.pages.first,
        coreInfo: importedCoreInfo,
      ));
      await tester.pumpAndSettle();

      tester.useFuzzyComparator(allowedDiffPercent: 0.1);
      await expectLater(
        find.byType(Canvas),
        matchesGoldenFile('sbn_examples/v19_separate_assets.sbn2.light.png'),
      );
    });
  });
}

/// Provides a [BuildContext] with the necessary inherited widgets
Future<BuildContext> _getBuildContext(
    WidgetTester tester, Size pageSize) async {
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
                currentTool: LaserPointer.currentLaserPointer,
                currentScale: double.maxFinite,
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
  final backgroundImage = page.backgroundImage;
  await Future.wait([
    for (final image in page.images)
      if (image is PngEditorImage)
        if (image.imageProvider is FileImage)
          (image.imageProvider as FileImage)
              .file
              .readAsBytes()
              .then((bytes) => image.imageProvider = MemoryImage(bytes)),
    if (backgroundImage is PngEditorImage)
      if (backgroundImage.imageProvider is FileImage)
        (backgroundImage.imageProvider as FileImage).file.readAsBytes().then(
            (bytes) => (page.backgroundImage as PngEditorImage).imageProvider =
                MemoryImage(bytes)),
  ]);

  // Precache images
  await Future.wait([
    for (final image in page.images) image.precache(context),
    if (page.backgroundImage != null) page.backgroundImage!.precache(context),
  ]);
}
