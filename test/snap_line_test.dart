import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';

void main() {
  group('Stroke.snapLine', () {
    test('horizontal line', () {
      final (firstPoint, lastPoint) = Stroke.snapLine(
        PointVector.zero,
        const PointVector(100, 1),
      );
      expect(firstPoint, PointVector.zero);
      expect(lastPoint, const PointVector(100, 0));
    });

    test('horizontal line (under/over threshold)', () {
      final threshold = 100 * math.tan(5 * math.pi / 180);
      final underThreshold = Stroke.snapLine(
        PointVector.zero,
        PointVector(100, threshold * 0.99),
      );
      final overThreshold = Stroke.snapLine(
        PointVector.zero,
        PointVector(100, threshold * 1.01),
      );
      expect(underThreshold.$2.dy, 0);
      expect(overThreshold.$2.dy, threshold * 1.01);
    });

    test('vertical line', () {
      final (firstPoint, lastPoint) = Stroke.snapLine(
        PointVector.zero,
        const PointVector(1, 100),
      );
      expect(firstPoint, PointVector.zero);
      expect(lastPoint, const PointVector(0, 100));
    });

    test('diagonal line doesn\'t snap', () {
      final (firstPoint, lastPoint) = Stroke.snapLine(
        PointVector.zero,
        const PointVector(100, 101),
      );
      expect(firstPoint, PointVector.zero);
      expect(lastPoint, const PointVector(100, 101));
    });
  });
}
