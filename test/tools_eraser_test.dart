import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
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

  test('Test that eraser size scales inversely with zoom', () {
    final eraser = Eraser(size: 10);
    // At scale 1.0, this stroke is at the edge (distance = size)
    // At scale 2.0, the effective size should be 5, so this stroke (at 10) should NOT be erased
    final strokeAtEdge = _strokeWithPoint(
      _eraserPos + const Offset(1, 0) * eraser.size,
    );

    // Check with scale 1.0 (default)
    var erased = eraser.checkForOverlappingStrokes(
      _eraserPos,
      [strokeAtEdge],
      scale: 1.0,
    );
    expect(
      erased.contains(strokeAtEdge),
      true,
      reason: 'Should erase stroke at edge with scale 1.0',
    );

    // Check with scale 2.0 (eraser should be smaller in document coordinates)
    erased = eraser.checkForOverlappingStrokes(
      _eraserPos,
      [strokeAtEdge],
      scale: 2.0,
    );
    expect(
      erased.contains(strokeAtEdge),
      false,
      reason: 'Should NOT erase stroke at distance 10 when scale is 2.0 (effective size 5)',
    );

    // At scale 0.5, effective size should be 20.
    // A stroke at distance 15 should be erased.
    final strokeFurtherAway = _strokeWithPoint(
      _eraserPos + const Offset(1.5, 0) * eraser.size,
    );
    erased = eraser.checkForOverlappingStrokes(
      _eraserPos,
      [strokeFurtherAway],
      scale: 0.5,
    );
    expect(
      erased.contains(strokeFurtherAway),
      true,
      reason: 'Should erase stroke at distance 15 when scale is 0.5 (effective size 20)',
    );
  });
}

Stroke _strokeWithPoint(Offset point) => Stroke(
  color: Stroke.defaultColor,
  pressureEnabled: Stroke.defaultPressureEnabled,
  options: _options,
  pageIndex: 0,
  page: const HasSize(Size(100, 100)),
  toolId: .fountainPen,
)..addPoint(point);
