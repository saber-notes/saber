import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/tools/select.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';

void main() {
  test('Test that the select tool selects the right points', () async {
    Select select = Select.currentSelect;
    StrokeProperties strokeProperties = StrokeProperties();
    Size pageSize = const Size(100, 100);

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
      )..addPoint(pageSize, const Offset(5, 5)),
      // index > 0 is outside
      Stroke(
        strokeProperties: strokeProperties,
        pageIndex: 0,
        penType: 'testing pen',
      )..addPoint(pageSize, const Offset(15, 15)),
      // same as index 0, but offset outside
      Stroke(
        strokeProperties: strokeProperties,
        pageIndex: 0,
        penType: 'testing pen',
      )..addPoint(pageSize, const Offset(5, 5))
        ..offset = const Offset(10, 10),
    ];

    select.onDragEnd(strokes);

    expect(select.selectResult.indices.length, 1, reason: 'Only one stroke should be selected');
    expect(select.selectResult.indices.first, 0, reason: 'The first stroke should be selected');
  });
}
