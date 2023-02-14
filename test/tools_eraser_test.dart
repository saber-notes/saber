import 'dart:math';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';

const String _penType = "testing pen";
final StrokeProperties _strokeProperties = StrokeProperties(
  size: 1, // small size so we have more precision in test
);
const Size _pageSize = Size(100, 100);
const Offset _eraserPos = Offset(50, 50);

void main() {
  test("Test that the eraser tool erases the correct strokes", () {
    final Eraser eraser = Eraser(size: 10);

    List<Stroke> strokesToErase = [
      // center
      _strokeWithPoint(_eraserPos),

      // 1 size downwards from center
      _strokeWithPoint(_eraserPos + const Offset(0, 1) * eraser.size),

      // 1 size right from center
      _strokeWithPoint(_eraserPos + const Offset(1, 0) * eraser.size),

      // 1 size diagonally from center
      _strokeWithPoint(_eraserPos + const Offset(1, 1) * sqrt(eraser.size)),

      // 0.5 sizes right from center
      _strokeWithPoint(_eraserPos + const Offset(0.5, 0) * eraser.size),

      // straight line that passes through center
      Stroke(
        strokeProperties: _strokeProperties,
        pageIndex: 0,
        penType: _penType,
      )
        ..addPoint(_pageSize, _eraserPos + const Offset(-20, -20) * eraser.size)
        ..addPoint(_pageSize, _eraserPos + const Offset(20, 20) * eraser.size)
        ..isStraightLine = true,
    ];

    List<Stroke> strokesToKeep = [
      // center, but offset > 1 size downwards
      _strokeWithPoint(_eraserPos)
        ..offset = const Offset(0, 1.1) * eraser.size,

      // > 1 size downwards from center
      _strokeWithPoint(_eraserPos + const Offset(0, 1.1) * eraser.size),

      // > 1 size right from center
      _strokeWithPoint(_eraserPos + const Offset(1.1, 0) * eraser.size),

      // > 1 size diagonally from center
      _strokeWithPoint(_eraserPos + const Offset(1, 1) * eraser.size),

      // 2 sizes right from center
      _strokeWithPoint(_eraserPos + const Offset(2, 0) * eraser.size),
    ];

    List<Stroke> strokes = [...strokesToErase, ...strokesToKeep];
    List<int> erasedIndices = eraser.checkForOverlappingStrokes(_eraserPos, strokes);

    for (int i = 0; i < strokesToErase.length; i++) {
      expect(erasedIndices.contains(i), true, reason: "Stroke at index $i should be erased");
    }

    for (int i = strokesToErase.length; i < strokes.length; i++) {
      expect(erasedIndices.contains(i), false, reason: "Stroke at index $i should not be erased");
    }

    List<Stroke> erasedStrokes = eraser.onDragEnd();
    expect(erasedStrokes.length, strokesToErase.length, reason: "The correct number of strokes should have been erased");
    expect(erasedStrokes.every((stroke) => strokesToErase.contains(stroke)), true, reason: "The correct strokes should have been erased");
  });
}

Stroke _strokeWithPoint(Offset point) => Stroke(
  strokeProperties: _strokeProperties,
  pageIndex: 0,
  penType: _penType,
)..addPoint(_pageSize, point);
