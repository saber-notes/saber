import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/apple_pencil_gesture_action.dart';

void main() {
  group('ApplePencilGestureAction codec', () {
    const expectedIds = {
      ApplePencilGestureAction.none: 'none',
      ApplePencilGestureAction.toggleEraser: 'toggle_eraser',
      ApplePencilGestureAction.toggleColors: 'toggle_colors',
      ApplePencilGestureAction.fountainPen: 'fountain_pen',
      ApplePencilGestureAction.ballpointPen: 'ballpoint_pen',
      ApplePencilGestureAction.pencil: 'pencil',
      ApplePencilGestureAction.highlighter: 'highlighter',
      ApplePencilGestureAction.shapePen: 'shape_pen',
      ApplePencilGestureAction.select: 'select',
      ApplePencilGestureAction.laserPointer: 'laser_pointer',
    };

    test('encodes stable ids', () {
      for (final entry in expectedIds.entries) {
        expect(ApplePencilGestureAction.codec.encode(entry.key), entry.value);
      }
    });

    test('decodes stable ids', () {
      for (final entry in expectedIds.entries) {
        expect(ApplePencilGestureAction.codec.decode(entry.value), entry.key);
      }
    });

    test('falls back to toggling the eraser for unknown ids', () {
      expect(
        ApplePencilGestureAction.codec.decode('future_action'),
        ApplePencilGestureAction.toggleEraser,
      );
    });
  });
}
