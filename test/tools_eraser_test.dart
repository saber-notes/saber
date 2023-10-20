import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/data/tools/stroke_properties.dart';

const String _penType = 'testing pen';
final StrokeProperties _strokeProperties = StrokeProperties(
  size: 1, // small size so we have more precision in test
);
const Offset _eraserPos = Offset(50, 50);

void main() {
  test('Test that the eraser tool erases the correct strokes', () {
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
        ..addPoint(_eraserPos + const Offset(-20, -20) * eraser.size)
        ..addPoint(_eraserPos + const Offset(20, 20) * eraser.size)
        ..addPoint(_eraserPos + const Offset(20, 20) * eraser.size),
    ];

    List<Stroke> strokesToKeep = [
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
    List<Stroke> erased = eraser.checkForOverlappingStrokes(_eraserPos, strokes);

    for (Stroke stroke in strokesToErase) {
      expect(erased.contains(stroke), true, reason: 'Stroke should be erased: $stroke');
    }

    for (Stroke stroke in strokesToKeep) {
      expect(erased.contains(stroke), false, reason: 'Stroke should not be erased: $stroke');
    }

    List<Stroke> erasedStrokes = eraser.onDragEnd();
    expect(erasedStrokes.length, strokesToErase.length, reason: 'The correct number of strokes should have been erased');
    expect(erasedStrokes.every((stroke) => strokesToErase.contains(stroke)), true, reason: 'The correct strokes should have been erased');
  });
}

Stroke _strokeWithPoint(Offset point) => Stroke(
  strokeProperties: _strokeProperties,
  pageIndex: 0,
  penType: _penType,
)..addPoint(point);
