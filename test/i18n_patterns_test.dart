import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';

void main() {
  test('Test that background patterns are localized', () {
    for (final pattern in CanvasBackgroundPattern.values) {
      expect(CanvasBackgroundPattern.localizedName(pattern), isNotEmpty);
    }
  });
}
