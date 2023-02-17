import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/fast_math.dart';

const double _quarterTurn = pi/4;
/// Tolerance for an error (large because it's a fast approximation).
/// This is roughly equivalent to 3 degrees.
const double _epsilon = 0.05;

void main() {
  group('Test diffToRightAngle function:', () {
    test('up, right, down, left', () {
      expect(diffToRightAngle(0, 0), 0);
      expect(diffToRightAngle(0, 1), 0);
      expect(diffToRightAngle(1, 0), 0);
      expect(diffToRightAngle(0, -1), 0);
      expect(diffToRightAngle(-1, 0), 0);
    });

    test('diagonal (45deg)', () {
      expect(diffToRightAngle(1, 1), ApproximateMatcher(_quarterTurn, _epsilon));
      expect(diffToRightAngle(1, -1), ApproximateMatcher(_quarterTurn, _epsilon));
      expect(diffToRightAngle(-1, 1), ApproximateMatcher(_quarterTurn, _epsilon));
      expect(diffToRightAngle(-1, -1), ApproximateMatcher(_quarterTurn, _epsilon));
    });

    test('100 random points', () {
      Random rng = Random(743643); // use a fixed seed for reproducibility
      for (int i = 0; i < 100; i++) {
        double x = (rng.nextDouble() * 2) - 1;
        double y = (rng.nextDouble() * 2) - 1;
        printOnFailure('x: $x, y: $y');

        double approx = diffToRightAngle(y, x);
        double target = diffToRightAngle(y, x, atan); // use the real atan function
        printOnFailure('target: $target, approx: $approx');

        expect(approx, ApproximateMatcher(target, _epsilon));
      }
    });

  });
}

class ApproximateMatcher extends CustomMatcher {
  final double value;
  final double acceptableError;

  ApproximateMatcher(this.value, this.acceptableError) : super('Approximately $value', 'value', value);

  @override
  bool matches(item, Map matchState) {
    if (item is! num) {
      return false;
    }
    return (item - value).abs() <= acceptableError;
  }
}
