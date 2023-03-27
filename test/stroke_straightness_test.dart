import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';

Stroke getEmptyStroke({double size = StrokeProperties.defaultSize}) => Stroke(
  strokeProperties: StrokeProperties(size: size),
  pageIndex: 0,
  penType: 'testingPen',
);

const double maxDeviationOfPerfectLine = 0.0001;

void main() {
  group('Straightness', () {
    test('of a perfectly straight horizontal line', () {
      final stroke = getEmptyStroke();
      stroke.addPoint(Offset.zero);
      stroke.addPoint(const Offset(10, 0));
      stroke.addPoint(const Offset(20, 0));
      stroke.addPoint(const Offset(30, 0));
      stroke.addPoint(const Offset(100, 0));
      expect(stroke.deviationFromStraightLine(), lessThan(maxDeviationOfPerfectLine));
      expect(stroke.isLineRoughlyStraight(), true);
    });

    test('of a perfectly straight vertical line', () {
      final stroke = getEmptyStroke();
      stroke.addPoint(Offset.zero);
      stroke.addPoint(const Offset(0, 10));
      stroke.addPoint(const Offset(0, 20));
      stroke.addPoint(const Offset(0, 30));
      stroke.addPoint(const Offset(0, 100));
      expect(stroke.deviationFromStraightLine(), lessThan(maxDeviationOfPerfectLine));
      expect(stroke.isLineRoughlyStraight(), true);
    });

    test('of a perfectly straight diagonal line', () {
      final stroke = getEmptyStroke();
      stroke.addPoint(Offset.zero);
      stroke.addPoint(const Offset(10, 10));
      stroke.addPoint(const Offset(20, 20));
      stroke.addPoint(const Offset(30, 30));
      stroke.addPoint(const Offset(100, 100));
      expect(stroke.deviationFromStraightLine(), lessThan(maxDeviationOfPerfectLine));
      expect(stroke.isLineRoughlyStraight(), true);
    });

    test('of a mostly straight horizontal line', () {
      final stroke = getEmptyStroke();
      stroke.addPoint(Offset.zero);
      stroke.addPoint(const Offset(1, 0));
      stroke.addPoint(const Offset(2, 1));
      stroke.addPoint(const Offset(3, 0));
      stroke.addPoint(const Offset(10, 0));

      final deviation = stroke.deviationFromStraightLine();
      expect(deviation, greaterThan(0));
      expect(stroke.isLineRoughlyStraight(), true);
    });

    test('of a wobbly straight line', () {
      final stroke = getEmptyStroke();

      bool up = false;
      for (double x = 0; x < 100; x++, up = !up) {
        stroke.addPoint(Offset(x, up ? 1 : 0));
      }

      final deviation = stroke.deviationFromStraightLine();
      expect(deviation, greaterThan(0));
      expect(stroke.isLineRoughlyStraight(), true);
    });

    test('of a wobbly straight line from a large pen', () {
      const scale = 10000000.0;
      final stroke = getEmptyStroke(size: StrokeProperties.defaultSize * scale);

      bool up = false;
      for (double x = 0; x < 100; x++, up = !up) {
        stroke.addPoint(Offset(x * scale, up ? scale : 0));
      }

      final deviation = stroke.deviationFromStraightLine();
      expect(deviation, greaterThan(0));
      expect(stroke.isLineRoughlyStraight(), true);
    });

    test('of a quadratic curve', () {
      final stroke = getEmptyStroke();

      for (double x = 0; x < 10; x++) {
        stroke.addPoint(Offset(x, x * x));
      }

      expect(stroke.isLineRoughlyStraight(), false);
    });

    test('of a quadratic curve with a small pen', () {
      const scale = 0.0000001;
      final stroke = getEmptyStroke(size: StrokeProperties.defaultSize * scale);

      for (double x = 0; x < 10; x++) {
        stroke.addPoint(Offset(x * scale, x * x * scale));
      }

      expect(stroke.isLineRoughlyStraight(), false);
    });

    // todo: test using real strokes
  });
}
