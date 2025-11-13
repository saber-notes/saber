import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';

const _pageSize = Size(100, 100);
const _penSize = 1.0;

void main() {
  group('SVG string', () {
    final strokes = [
      _stroke(Offset.zero),
      _stroke(Offset(_pageSize.width, _pageSize.height)),
      _stroke(Offset(_pageSize.width / 2, _pageSize.height / 2)),
      _stroke(const Offset(3.14159, 2.71828)),
    ];
    for (final stroke in strokes) {
      test('for a stroke at ${stroke.points.first}', () {
        _testStrokeSvg(stroke);
      });
    }
  });
}

Stroke _stroke(Offset point) => Stroke(
  color: Stroke.defaultColor,
  pressureEnabled: Stroke.defaultPressureEnabled,
  options: StrokeOptions(size: _penSize),
  pageIndex: 0,
  page: const HasSize(_pageSize),
  toolId: .fountainPen,
)..addPoint(point);

void _testStrokeSvg(Stroke stroke) {
  final svgPath = stroke.toSvgPath();
  final svgPoints = svgPath
      .split(RegExp(r'[ML]'))
      .where((e) => e.isNotEmpty)
      .map((e) => e.split(' ').map((e) => double.parse(e)).toList())
      .map((e) => Offset(e[0], e[1]))
      .toList();
  final center = stroke.points.first;
  for (var i = 0; i < stroke.points.length; i++) {
    final svgPoint = svgPoints[i];

    expect(svgPoint.dx, greaterThanOrEqualTo(center.x - _penSize));
    expect(svgPoint.dx, lessThanOrEqualTo(center.x + _penSize));

    expect(
      svgPoint.dy,
      greaterThanOrEqualTo(_pageSize.height - center.y - _penSize),
    );
    expect(
      svgPoint.dy,
      lessThanOrEqualTo(_pageSize.height - center.y + _penSize),
    );
  }
}
