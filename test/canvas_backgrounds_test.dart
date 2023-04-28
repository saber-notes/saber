import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';

void main() {
  group('Test canvas background patterns:', () {
    for (final pattern in CanvasBackgroundPattern.values) {
      _testPatternWithLineHeight(pattern, 10);
      _testPatternWithLineHeight(pattern, 50);

      _testRtlPattern(pattern);
    }
  });
}

void _testPatternWithLineHeight(final CanvasBackgroundPattern pattern, final int lineHeight) {
  test("'$pattern' with line height $lineHeight", () {
    const Size size = Size(1000, 1000);
    /// We can't directly compare doubles, so check if they're within a small range (±epsilon)
    final double epsilon = lineHeight / 100;

    List<PatternElement> elements = CanvasBackgroundPainter.getPatternElements(
      pattern: pattern,
      size: size,
      lineHeight: lineHeight,
    ).toList();

    if (pattern == CanvasBackgroundPattern.none) {
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

        if (pattern != CanvasBackgroundPattern.cornell) {
          // Cornell has two lines on the same row, so they shouldn't be spaced apart

          expect(position != lastPosition, true, reason: 'Lines should be spaced apart');
        }

        double spacing = (position - lastPosition).abs();
        double diffFromALine = spacing % lineHeight;
        if (diffFromALine > lineHeight / 2) {
          diffFromALine = lineHeight - diffFromALine;
        }
        printOnFailure('spacing: $spacing, lineHeight: $lineHeight, diffFromALine: $diffFromALine');
        expect(diffFromALine, lessThan(epsilon), reason: 'Lines should be spaced in intervals of lineHeight');

        lastPosition = position;
      }
    }
  });
}

void _testRtlPattern(final CanvasBackgroundPattern pattern) {
  test("'$pattern'", () {
    const size = Size(1000, 1000);

    List<PatternElement> elements = CanvasBackgroundPainter.getPatternElements(
      pattern: pattern,
      size: size,
      lineHeight: 10,
    ).toList();

    int linesOnLeft = 0;
    int linesOnRight = 0;
    for (final element in elements) {
      if (!element.isLine) continue;

      // ignore horizontal lines
      if (element.start.dy == element.end.dy) continue;

      if (element.start.dx < size.width / 2) {
        linesOnLeft++;
      } else if (element.start.dx > size.width / 2) {
        linesOnRight++;
      }
    }

    final rtl = pattern.name.contains('rtl');
    final isCorrectlyRtl = rtl
      ? linesOnRight >= linesOnLeft * 0.9
      : linesOnLeft >= linesOnRight * 0.9;
    printOnFailure('linesOnLeft: $linesOnLeft, linesOnRight: $linesOnRight');
    expect(isCorrectlyRtl, true, reason: 'Lines should be on the left in ltr and on the right in rtl');
  });
}
