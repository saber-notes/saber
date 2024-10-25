import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';

/// This test is to diagnose an issue with sending an `EditorCoreInfo` object
/// from the isolate to the main thread:
/// https://github.com/saber-notes/saber/issues/638
void main() {
  group('Isolate messages:', () {
    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    test('Empty EditorCoreInfo', () async {
      final coreInfo = EditorCoreInfo.empty;
      await compute((EditorCoreInfo coreInfo) => coreInfo, coreInfo);
    });

    test('With empty SVG image', () async {
      final coreInfo = EditorCoreInfo(filePath: '', readOnly: false);
      coreInfo.pages = [
        EditorPage(
          images: [
            SvgEditorImage(
              id: 0,
              svgString: '<svg height="100" width="100"></svg>',
              svgFile: null,
              pageIndex: 0,
              pageSize: EditorPage.defaultSize,
              onMoveImage: null,
              onDeleteImage: null,
              onMiscChange: null,
              assetCache: coreInfo.assetCache,
            ),
          ],
        ),
      ];
      await compute((EditorCoreInfo coreInfo) => coreInfo, coreInfo);
    });

    test('With small PNG image', () async {
      final imageBytes = await File('assets/icon/icon.png').readAsBytes();
      final coreInfo = EditorCoreInfo(filePath: '', readOnly: false);
      coreInfo.pages = [
        EditorPage(
          images: [
            PngEditorImage(
              id: 0,
              extension: '.png',
              imageProvider: MemoryImage(imageBytes),
              pageIndex: 0,
              pageSize: EditorPage.defaultSize,
              onMoveImage: null,
              onDeleteImage: null,
              onMiscChange: null,
              assetCache: coreInfo.assetCache,
            ),
          ],
        ),
      ];
      await compute((EditorCoreInfo coreInfo) => coreInfo, coreInfo);
    });

    test('With large PNG image', () async {
      final imageBytes = await File('assets/icon/icon.png').readAsBytes();
      final coreInfo = EditorCoreInfo(filePath: '', readOnly: false);
      coreInfo.pages = [
        EditorPage(
          images: [
            PngEditorImage(
              id: 0,
              extension: '.png',
              imageProvider: MemoryImage(imageBytes),
              pageIndex: 0,
              pageSize: EditorPage.defaultSize,
              onMoveImage: null,
              onDeleteImage: null,
              onMiscChange: null,
              assetCache: coreInfo.assetCache,
            ),
          ],
        ),
      ];
      await compute((EditorCoreInfo coreInfo) => coreInfo, coreInfo);
    });
  });
}
