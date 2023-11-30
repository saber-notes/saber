import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/tools/shape_pen.dart';

void main() {
  group('ShapePen.snapLine', () {
    test('horizontal line', () {
      final (firstPoint, lastPoint) = ShapePen.snapLine(
        Offset.zero,
        const Offset(100, 1),
      );
      expect(firstPoint, Offset.zero);
      expect(lastPoint, const Offset(100, 0));
    });

    test('horizontal line (under/over threshold)', () {
      final threshold = 100 * math.tan(5 * math.pi / 180);
      final underThreshold = ShapePen.snapLine(
        Offset.zero,
        Offset(100, threshold * 0.99),
      );
      final overThreshold = ShapePen.snapLine(
        Offset.zero,
        Offset(100, threshold * 1.01),
      );
      expect(underThreshold.$2.dy, 0);
      expect(overThreshold.$2.dy, threshold * 1.01);
    });

    test('vertical line', () {
      final (firstPoint, lastPoint) = ShapePen.snapLine(
        Offset.zero,
        const Offset(1, 100),
      );
      expect(firstPoint, Offset.zero);
      expect(lastPoint, const Offset(0, 100));
    });

    test('diagonal line doesn\'t snap', () {
      final (firstPoint, lastPoint) = ShapePen.snapLine(
        Offset.zero,
        const Offset(100, 101),
      );
      expect(firstPoint, Offset.zero);
      expect(lastPoint, const Offset(100, 101));
    });
  });
}
