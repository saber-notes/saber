import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:vector_math/vector_math_64.dart';

void main() {
  test('Zoom in with Ctrl +', () {
    final matrix = CanvasGestureDetectorState.zoomInOrOut(
      zoomIn: true,
      currentScale: 1,
      translation: Vector3.zero(),
    );
    expect(matrix, isNotNull);
    final scale = matrix!.getMaxScaleOnAxis();
    expect(scale, 1.1);
    final translation = matrix.getTranslation();
    expect(translation, Vector3.zero());
  });

  test('Zoom out with Ctrl -', () {
    final matrix = CanvasGestureDetectorState.zoomInOrOut(
      zoomIn: false,
      currentScale: 1,
      translation: Vector3.zero(),
    );
    expect(matrix, isNotNull);
    final scale = matrix!.getMaxScaleOnAxis();
    expect(scale, 0.9);
    final translation = matrix.getTranslation();
    expect(translation, Vector3.zero());
  });

  test('Zoom in with Ctrl + and translation', () {
    final matrix = CanvasGestureDetectorState.zoomInOrOut(
      zoomIn: true,
      currentScale: 1,
      translation: Vector3(100, 100, 0),
    );
    expect(matrix, isNotNull);
    final scale = matrix!.getMaxScaleOnAxis();
    expect(scale, 1.1);
    final translation = matrix.getTranslation();
    expect(translation, Vector3(100, 100, 0));
  });

  test('Zoom in with Ctrl + above max zoom', () {
    final matrix = CanvasGestureDetectorState.zoomInOrOut(
      zoomIn: true,
      currentScale: CanvasGestureDetector.kMaxScale,
      translation: Vector3.zero(),
    );
    expect(matrix, isNull);
  });

  test('Zoom out with Ctrl - below min zoom', () {
    final matrix = CanvasGestureDetectorState.zoomInOrOut(
      zoomIn: false,
      currentScale: CanvasGestureDetector.kMinScale,
      translation: Vector3.zero(),
    );
    expect(matrix, isNull);
  });
}
