import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/tools/laser_pointer.dart';
import 'package:saber/data/tools/pen.dart';

void main() {
  group('Laser fade', () {
    final laserPointer = LaserPointer.currentLaserPointer;
    const strokePointDelays = [
      Duration.zero,
      Duration(milliseconds: 37),
      Duration(milliseconds: 21),
      Duration(milliseconds: 52),
    ];
    final page = EditorPage();

    setUp(() {
      var cursorPos = const Offset(200, 200);
      laserPointer.onDragStart(cursorPos, page, 0);
      for (final delay in strokePointDelays.skip(1)) {
        cursorPos += const Offset(15, 15);
        laserPointer.onDragUpdate(cursorPos, elapsed: delay);
      }
    });

    test('matches drawn speed', () async {
      expect(laserPointer.strokePointDelays, strokePointDelays);
      final stroke = Pen.currentStroke as LaserStroke;
      expect(stroke.length, strokePointDelays.length);

      var redraws = 0;
      var deletions = 0;
      final delays = <Duration>[];

      LaserPointer.isDrawing = false;
      await LaserPointer.fadeOutStroke(
        stroke: stroke,
        strokePointDelays: strokePointDelays,
        redrawPage: () => redraws++,
        deleteStroke: (_) => deletions++,
        wait: (duration) async => delays.add(duration),
      );

      expect(redraws, 4);
      expect(deletions, 1);
      expect(delays, [LaserPointer.fadeOutDelay, ...strokePointDelays]);
    });

    test('reduces point count', () async {
      final stroke = Pen.currentStroke as LaserStroke;
      var lastStrokeLength = stroke.length + 1; // +1 for initial fadeOutDelay

      LaserPointer.isDrawing = false;
      await LaserPointer.fadeOutStroke(
        stroke: stroke,
        strokePointDelays: strokePointDelays,
        redrawPage: () {},
        deleteStroke: (_) {
          printOnFailure('Deleting stroke, length ${stroke.length}');
          expect(
            stroke.length,
            lessThanOrEqualTo(1),
            reason: 'Stroke should only be deleted at end',
          );
          lastStrokeLength = 0;
        },
        wait: (duration) async {
          printOnFailure(
            'Waiting for $duration, stroke length ${stroke.length}',
          );
          if (duration == Duration.zero) return; // skip wait before first pop
          expect(stroke.length, lessThan(lastStrokeLength));
          lastStrokeLength = stroke.length;
        },
      );
    });

    test('produces valid strokes', () async {
      final stroke = Pen.currentStroke as LaserStroke;
      expect(stroke.points, isNotEmpty);

      LaserPointer.isDrawing = false;
      await LaserPointer.fadeOutStroke(
        stroke: stroke,
        strokePointDelays: strokePointDelays,
        redrawPage: () {
          expect(stroke.points, isNotEmpty);
          expect(() => stroke.lowQualityPath, returnsNormally);
        },
        deleteStroke: (stroke) {},
        wait: (duration) async {},
      );
    });
  });
}
