import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';

const _pageSize = Size(100, 100);
final _center = Offset(_pageSize.width / 2, _pageSize.height / 2);

void main() {
  group('Stroke offset', () {
    test('in SVG string', () {
      final stroke = Stroke(
        strokeProperties: StrokeProperties(size: 1),
        pageIndex: 0,
        penType: 'testingPen',
      ) ..addPoint(_center)
        ..offset = -_center;

      // loop through points in svg path
      final svgPath = stroke.toSvgPath(_pageSize);
      final svgPoints = svgPath.split(RegExp(r'[ML]'))
            .where((e) => e.isNotEmpty)
            .map((e) => e.split(' ').map((e) => double.parse(e)).toList())
            .map((e) => Offset(e[0], e[1]))
            .toList();
      for (Offset point in svgPoints) {
        expect(point.dx, greaterThanOrEqualTo(-1));
        expect(point.dx, lessThanOrEqualTo(1));

        expect(point.dy, greaterThanOrEqualTo(_pageSize.height - 1));
        expect(point.dy, lessThanOrEqualTo(_pageSize.height + 1));
      }
    });
  });
}
