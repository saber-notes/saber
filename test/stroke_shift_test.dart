import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';

void main() {
  test('Stroke.shift(offset)', () {
    final stroke = Stroke(
      color: Stroke.defaultColor,
      pressureEnabled: Stroke.defaultPressureEnabled,
      options: StrokeOptions(size: double.minPositive),
      pageIndex: 0,
      page: const HasSize(Size(100, 100)),
      penType: 'testing pen',
    )..addPoint(const Offset(5, 5));
    expect(stroke.points, [const Offset(5, 5)]);

    var polygon = stroke.highQualityPolygon;
    var path = stroke.highQualityPath;
    expect(polygon.first.dx, moreOrLessEquals(5, epsilon: 0.01));
    expect(path.getBounds().top, moreOrLessEquals(5, epsilon: 0.01));

    stroke.shift(const Offset(-5, -5));
    polygon = stroke.highQualityPolygon;
    path = stroke.highQualityPath;
    expect(stroke.points, [Offset.zero]);
    expect(polygon.first.dx, moreOrLessEquals(0, epsilon: 0.01));
    expect(path.getBounds().top, moreOrLessEquals(0, epsilon: 0.01));
  });
}
