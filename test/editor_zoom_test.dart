import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';

void main() {
  const containerBounds = BoxConstraints(
    minWidth: 100,
    maxWidth: 100,
    minHeight: 200,
    maxHeight: 200,
  );

  test('Zoom in with Ctrl +', () {
    final oldMatrix = Matrix4.identity();
    final newMatrix = CanvasGestureDetectorState.setZoom(
      scaleDelta: 0.1,
      transformation: oldMatrix,
      containerBounds: containerBounds,
    );
    expect(newMatrix, isNotNull);
    final scale = newMatrix!.getMaxScaleOnAxis();
    expect(scale, 1.1);
    final translation = newMatrix.getTranslation();
    expect(translation.x, moreOrLessEquals(-5));
    expect(translation.y, moreOrLessEquals(-10));
  });

  test('Zoom out with Ctrl -', () {
    final oldMatrix = Matrix4.identity();
    final newMatrix = CanvasGestureDetectorState.setZoom(
      scaleDelta: -0.1,
      transformation: oldMatrix,
      containerBounds: containerBounds,
    );
    expect(newMatrix, isNotNull);
    final scale = newMatrix!.getMaxScaleOnAxis();
    expect(scale, 0.9);
    final translation = newMatrix.getTranslation();
    expect(translation.x, moreOrLessEquals(5));
    expect(translation.y, moreOrLessEquals(10));
  });

  test('Zoom in with Ctrl + and translation', () {
    final oldMatrix = Matrix4.translationValues(100, 100, 0);
    final newMatrix = CanvasGestureDetectorState.setZoom(
      scaleDelta: 0.1,
      transformation: oldMatrix,
      containerBounds: containerBounds,
    );
    expect(newMatrix, isNotNull);
    final scale = newMatrix!.getMaxScaleOnAxis();
    expect(scale, 1.1);
    final translation = newMatrix.getTranslation();
    expect(translation.x, moreOrLessEquals(105));
    expect(translation.y, moreOrLessEquals(100));
  });

  test('Zoom in with Ctrl + above max zoom', () {
    final oldMatrix = Matrix4.identity()
        ..scale(CanvasGestureDetector.kMaxScale);
    final newMatrix = CanvasGestureDetectorState.setZoom(
      scaleDelta: 0.1,
      transformation: oldMatrix,
      containerBounds: containerBounds,
    );
    expect(newMatrix, isNull);
  });

  test('Zoom out with Ctrl - below min zoom', () {
    final oldMatrix = Matrix4.identity()
        ..scale(CanvasGestureDetector.kMinScale);
    final newMatrix = CanvasGestureDetectorState.setZoom(
      scaleDelta: -0.1,
      transformation: oldMatrix,
      containerBounds: containerBounds,
    );
    expect(newMatrix, isNull);
  });
}
