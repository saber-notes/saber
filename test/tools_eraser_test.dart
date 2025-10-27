import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/eraser.dart';

final _options = StrokeOptions(
  size: 1, // small size so we have more precision in test
);
const _eraserPos = Offset(50, 50);

void main() {
  test('Test that the eraser tool erases the correct strokes', () {
    final eraser = Eraser(size: 10);

    final List<Stroke> strokesToErase = [
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
      _strokeWithPoint(_eraserPos + const Offset(-20, -20) * eraser.size)
        ..addPoint(_eraserPos + const Offset(20, 20) * eraser.size)
        ..addPoint(_eraserPos + const Offset(20, 20) * eraser.size),
    ];

    final List<Stroke> strokesToKeep = [
      // > 1 size downwards from center
      _strokeWithPoint(_eraserPos + const Offset(0, 1.1) * eraser.size),

      // > 1 size right from center
      _strokeWithPoint(_eraserPos + const Offset(1.1, 0) * eraser.size),

      // > 1 size diagonally from center
      _strokeWithPoint(_eraserPos + const Offset(1, 1) * eraser.size),

      // 2 sizes right from center
      _strokeWithPoint(_eraserPos + const Offset(2, 0) * eraser.size),
    ];

    final strokes = <Stroke>[...strokesToErase, ...strokesToKeep];
    final List<Stroke> erased = eraser.checkForOverlappingStrokes(
      _eraserPos,
      strokes,
    );

    for (final stroke in strokesToErase) {
      expect(
        erased.contains(stroke),
        true,
        reason: 'Stroke should be erased: $stroke',
      );
    }

    for (final stroke in strokesToKeep) {
      expect(
        erased.contains(stroke),
        false,
        reason: 'Stroke should not be erased: $stroke',
      );
    }

    final List<Stroke> erasedStrokes = eraser.onDragEnd();
    expect(
      erasedStrokes.length,
      strokesToErase.length,
      reason: 'The correct number of strokes should have been erased',
    );
    expect(
      erasedStrokes.every((stroke) => strokesToErase.contains(stroke)),
      true,
      reason: 'The correct strokes should have been erased',
    );
  });
}

Stroke _strokeWithPoint(Offset point) => Stroke(
  color: Stroke.defaultColor,
  pressureEnabled: Stroke.defaultPressureEnabled,
  options: _options,
  pageIndex: 0,
  page: const HasSize(Size(100, 100)),
  toolId: ToolId.fountainPen,
)..addPoint(point);
