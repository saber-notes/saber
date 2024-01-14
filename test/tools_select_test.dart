import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_asset_cache.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/data/tools/select.dart';

void main() {
  test('Test that the select tool selects the right strokes', () async {
    Select select = Select.currentSelect;
    StrokeOptions options = StrokeOptions(size: 9);

    // Drag gesture in a 10x10 square shape, on page 0
    select.onDragStart(Offset.zero, 0);
    select.onDragUpdate(const Offset(0, 10));
    select.onDragUpdate(const Offset(10, 10));
    select.onDragUpdate(const Offset(10, 0));

    expect(select.selectResult.pageIndex, 0,
        reason: 'The page index should be 0');

    List<Stroke> strokes = [
      // index 0 is inside
      Stroke(
        color: Stroke.defaultColor,
        pressureEnabled: Stroke.defaultPressureEnabled,
        options: options,
        pageIndex: 0,
        penType: 'testing pen',
      )..addPoint(const Offset(5, 5)),
      // index > 0 is outside
      Stroke(
        color: Stroke.defaultColor,
        pressureEnabled: Stroke.defaultPressureEnabled,
        options: options,
        pageIndex: 0,
        penType: 'testing pen',
      )..addPoint(const Offset(10, 10)),
      Stroke(
        color: Stroke.defaultColor,
        pressureEnabled: Stroke.defaultPressureEnabled,
        options: options,
        pageIndex: 0,
        penType: 'testing pen',
      )..addPoint(const Offset(15, 15)),
    ];

    select.onDragEnd(strokes, const []);

    expect(select.selectResult.strokes.length, 1,
        reason: 'Only one stroke should be selected');
    expect(select.selectResult.strokes.first, strokes[0],
        reason: 'The first stroke should be selected');
    expect(select.selectResult.images.isEmpty, true,
        reason: 'No images should be selected');
  });

  test('Test that the select tool selects the right images', () async {
    await InvertShader.init();

    Select select = Select.currentSelect;

    // Drag gesture in a 10x10 square shape, on page 0
    select.onDragStart(Offset.zero, 0);
    select.onDragUpdate(const Offset(0, 10));
    select.onDragUpdate(const Offset(10, 10));
    select.onDragUpdate(const Offset(10, 0));

    expect(select.selectResult.pageIndex, 0,
        reason: 'The page index should be 0');

    List<EditorImage> images = [
      // index 0 is inside (100% in the selection)
      TestImage(
        dstRect: const Rect.fromLTWH(0, 0, 10, 10),
      ),
      // index 1 is inside (> 70% in the selection)
      TestImage(
        dstRect: const Rect.fromLTWH(0, 0, 10 / 0.75, 10 / 0.75),
      ),
      // index 2 is outside (< 70% in the selection)
      TestImage(
        dstRect: const Rect.fromLTWH(0, 0, 10 / 0.6, 10 / 0.6),
      ),
    ];

    select.onDragEnd(const [], images);

    expect(select.selectResult.images.length, 2,
        reason: 'Two images should be selected');
    expect(select.selectResult.images.contains(images[0]), true,
        reason: 'The first image should be selected');
    expect(select.selectResult.images.contains(images[1]), true,
        reason: 'The second image should be selected');
    expect(select.selectResult.strokes.length, 0,
        reason: 'No strokes should be selected');
  });
}

// ignore: missing_override_of_must_be_overridden
class TestImage extends PngEditorImage {
  static final _assetCache = AssetCache();

  TestImage({
    required super.dstRect,
  }) : super(
          id: -1,
          extension: '.png',
          imageProvider: null,
          pageIndex: 0,
          pageSize: const Size(100, 100),
          onMoveImage: null,
          onDeleteImage: null,
          onMiscChange: null,
          assetCache: _assetCache,
        );

  @override
  Future<void> firstLoad() async {
    // do nothing
  }
}
