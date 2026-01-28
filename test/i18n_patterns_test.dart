import 'package:flutter_test/flutter_test.dart';
import 'package:saber/i18n/extensions/canvas_background_pattern_localized.dart';
import 'package:sbn/canvas_background_pattern.dart';

void main() {
  test('Test that background patterns are localized', () {
    for (final pattern in CanvasBackgroundPattern.values) {
      expect(pattern.localizedName, isNotEmpty);
    }
  });
}
