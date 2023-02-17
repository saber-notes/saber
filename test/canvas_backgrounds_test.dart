import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';

void main() {
  group('Test canvas background patterns:', () {
    for (String pattern in CanvasBackgroundPatterns.all) {
      _testPatternWithLineHeight(pattern, 10);
      _testPatternWithLineHeight(pattern, 50);
    }
  });
}

void _testPatternWithLineHeight(final String pattern, final int lineHeight) {
  test("'$pattern' with line height $lineHeight", () {
    const Size size = Size(1000, 1000);
    /// We can't directly compare doubles, so check if they're within a small range (±epsilon)
    final double epsilon = lineHeight / 100;

    List<PatternElement> elements = CanvasBackgroundPainter.getPatternElements(pattern, size, lineHeight).toList();

    if (pattern == CanvasBackgroundPatterns.none) {
      expect(elements.isEmpty, true, reason: 'No elements should be returned for the none pattern');
      return;
    } else {
      expect(elements.isEmpty, false, reason: 'Elements should be returned for patterns other than the none pattern');
    }

    // Check that the elements are within the bounds of the canvas
    for (PatternElement element in elements) {
      expect(element.start.dx, lessThanOrEqualTo(size.width), reason: 'element.start not within canvas bounds');
      expect(element.start.dy, lessThanOrEqualTo(size.height), reason: 'element.start not within canvas bounds');
      expect(element.end.dx, lessThanOrEqualTo(size.width), reason: 'element.end not within canvas bounds');
      expect(element.end.dy, lessThanOrEqualTo(size.height), reason: 'element.end not within canvas bounds');
    }

    // Check we have 2 lineHeights of space at the top
    for (PatternElement element in elements) {
      if (element.secondaryColor) return; // ignore secondary elements
      expect(
        element.start.dy,
        greaterThan(lineHeight * 2 - 1),
        reason: 'Elements should leave 2 lineHeights of space at the top, but element.start.dy was ${element.start.dy}',
      );
      expect(
        element.end.dy,
        greaterThan(lineHeight * 2 - 1),
        reason: 'Elements should leave 2 lineHeights of space at the top, but element.end.dy was ${element.end.dy}',
      );
    }

    // Check all elements are lines or all elements are dots
    bool allLines = elements.every((element) => element.isLine);
    bool allDots = elements.every((element) => !element.isLine);
    expect(allLines || allDots, true, reason: 'All elements should be lines or all elements should be dots');

    if (allLines) {
      // Check spacing
      double lastPosition = -1;
      bool? lastWasHorizontal;
      for (PatternElement element in elements) {
        bool isHorizontal = element.start.dy == element.end.dy;
        bool isVertical = element.start.dx == element.end.dx;
        expect(isHorizontal || isVertical, true, reason: 'Lines should be horizontal or vertical');

        double position = isHorizontal ? element.start.dy : element.start.dx;

        // ignore spacing between a horizontal and a vertical line
        if (lastWasHorizontal != isHorizontal) {
          lastPosition = position;
          lastWasHorizontal = isHorizontal;
          continue;
        }

        expect(position != lastPosition, true, reason: 'Lines should be spaced apart');

        double spacing = (position - lastPosition).abs();
        expect((spacing - lineHeight).abs(), lessThan(epsilon), reason: 'Lines should be spaced by 1 lineHeight');

        lastPosition = position;
      }
    }
  });
}
