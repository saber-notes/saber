import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/data/tools/stroke_properties.dart';

void main() {
  test('Test that the select tool selects the right strokes', () async {
    Select select = Select.currentSelect;
    StrokeProperties strokeProperties = StrokeProperties();

    // Drag gesture in a 10x10 square shape, on page 0
    select.onDragStart(Offset.zero, 0);
    select.onDragUpdate(const Offset(0, 10));
    select.onDragUpdate(const Offset(10, 10));
    select.onDragUpdate(const Offset(10, 0));

    expect(select.selectResult.pageIndex, 0, reason: 'The page index should be 0');

    List<Stroke> strokes = [
      // index 0 is inside
      Stroke(
        strokeProperties: strokeProperties,
        pageIndex: 0,
        penType: 'testing pen',
      )..addPoint(const Offset(5, 5)),
      // index > 0 is outside
      Stroke(
        strokeProperties: strokeProperties,
        pageIndex: 0,
        penType: 'testing pen',
      )..addPoint(const Offset(15, 15)),
    ];

    select.onDragEnd(strokes, const []);

    expect(select.selectResult.strokes.length, 1, reason: 'Only one stroke should be selected');
    expect(select.selectResult.strokes.first, strokes[0], reason: 'The first stroke should be selected');
    expect(select.selectResult.images.isEmpty, true, reason: 'No images should be selected');
  });

  test('Test that the select tool selects the right images', () async {
    await InvertShader.init();

    Select select = Select.currentSelect;

    // Drag gesture in a 10x10 square shape, on page 0
    select.onDragStart(Offset.zero, 0);
    select.onDragUpdate(const Offset(0, 10));
    select.onDragUpdate(const Offset(10, 10));
    select.onDragUpdate(const Offset(10, 0));

    expect(select.selectResult.pageIndex, 0, reason: 'The page index should be 0');

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

    expect(select.selectResult.images.length, 2, reason: 'Two images should be selected');
    expect(select.selectResult.images.contains(images[0]), true, reason: 'The first image should be selected');
    expect(select.selectResult.images.contains(images[1]), true, reason: 'The second image should be selected');
    expect(select.selectResult.strokes.length, 0, reason: 'No strokes should be selected');
  });
}

class TestImage extends EditorImage {
  TestImage({
    required super.dstRect,
  })  : super(
          id: -1,
          extension: '.png',
          bytes: Uint8List(0),
          pageIndex: 0,
          pageSize: const Size(100, 100),
          onMoveImage: null,
          onDeleteImage: null,
          onMiscChange: null,
        );

  @override
  Future<void> getImage({Size? pageSize}) async {
    // do nothing
  }
}
