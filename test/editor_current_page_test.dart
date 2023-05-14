import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/pages/editor/editor.dart';

void main() {
  group('getPageIndexFromScrollPosition', () {
    final pages = <EditorPage>[
      EditorPage(size: const Size(100, 100)),
      EditorPage(size: const Size(100, 200)),
      EditorPage(size: const Size(100, 300)),
    ];

    test('returns 0 when scroll position is 0', () {
      expect(
        EditorState.getPageIndexFromScrollPosition(
          scrollY: 0,
          screenWidth: 100,
          pages: pages,
        ),
        0,
      );
    });

    test('returns 0 when scroll position is negative', () {
      expect(
        EditorState.getPageIndexFromScrollPosition(
          scrollY: -100000,
          screenWidth: 100,
          pages: pages,
        ),
        0,
      );
    });

    test('returns 0 when scroll position is within first page', () {
      expect(
        EditorState.getPageIndexFromScrollPosition(
          scrollY: 50, // middle of first page
          screenWidth: 100,
          pages: pages,
        ),
        0,
      );
    });

    test('returns 1 when scroll position is within second page', () {
      expect(
        EditorState.getPageIndexFromScrollPosition(
          scrollY: 150, // middle of second page
          screenWidth: 100,
          pages: pages,
        ),
        1,
      );
    });

    test('returns 2 when scroll position is within third page', () {
      expect(
        EditorState.getPageIndexFromScrollPosition(
          scrollY: 350, // middle of third page
          screenWidth: 100,
          pages: pages,
        ),
        2,
      );
    });

    test('returns last page index when scroll position is beyond last page', () {
      expect(
        EditorState.getPageIndexFromScrollPosition(
          scrollY: 100000,
          screenWidth: 100,
          pages: pages,
        ),
        2,
      );
    });
  });
}
