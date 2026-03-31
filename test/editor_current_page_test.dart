import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/data/editor/page_style.dart';
import 'package:sbn/canvas_background_pattern.dart';

void main() {
  group('getPageIndexFromScrollPosition', () {
    const style = PageStyle(
      pattern: CanvasBackgroundPattern.none,
      lineHeight: 40,
      lineThickness: 2,
    );
    final pages = <EditorPage>[
      EditorPage(size: const Size(100, 100), style: style),
      EditorPage(size: const Size(100, 200), style: style),
      EditorPage(size: const Size(100, 300), style: style),
    ];

    test('returns 0 when scroll position is 0', () {
      expect(
        CanvasGestureDetector.getPageIndex(
          scrollY: 0,
          screenWidth: 100,
          pages: pages,
        ),
        0,
      );
    });

    test('returns 0 when scroll position is negative', () {
      expect(
        CanvasGestureDetector.getPageIndex(
          scrollY: -100000,
          screenWidth: 100,
          pages: pages,
        ),
        0,
      );
    });

    test('returns 0 when scroll position is within first page', () {
      expect(
        CanvasGestureDetector.getPageIndex(
          scrollY: 50, // middle of first page
          screenWidth: 100,
          pages: pages,
        ),
        0,
      );
    });

    test('returns 1 when scroll position is within second page', () {
      expect(
        CanvasGestureDetector.getPageIndex(
          scrollY: 150, // middle of second page
          screenWidth: 100,
          pages: pages,
        ),
        1,
      );
    });

    test('returns 2 when scroll position is within third page', () {
      expect(
        CanvasGestureDetector.getPageIndex(
          scrollY: 350, // middle of third page
          screenWidth: 100,
          pages: pages,
        ),
        2,
      );
    });

    test('returns last page index when scroll position is beyond last page', () {
      expect(
        CanvasGestureDetector.getPageIndex(
          scrollY: 100000,
          screenWidth: 100,
          pages: pages,
        ),
        2,
      );
    });
  });
}
