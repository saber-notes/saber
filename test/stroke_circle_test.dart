import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:sbn/has_size.dart';

import 'utils/matches_points.dart';

void main() {
  group('CircleStroke', () {
    const page = HasSize(EditorPage.defaultSize);
    final stroke = CircleStroke.fromJson(
      {'shape': 'circle', 'cx': 100.0, 'cy': 200.0, 'r': 10.0},
      fileVersion: 0,
      pageIndex: 0,
      page: page,
    );

    test('isEmpty', () {
      expect(stroke.isEmpty, false);
    });

    test('length', () {
      expect(stroke.length, 24);
    });

    test('lowQualityPolygon', () {
      expect(
        stroke.lowQualityPolygon,
        MatchesPoints([
          const Offset(110, 200),
          const Offset(105, 208.7),
          const Offset(95, 208.7),
          const Offset(90, 200),
          const Offset(95, 191.3),
          const Offset(105, 191.3),
        ]),
      );
    });

    test('highQualityPolygon', () {
      expect(stroke.highQualityPolygon, hasLength(24));
    });

    test('ultraLowQualityPolygon', () {
      final polygon = stroke.getPolygon(quality: const StrokeQuality(6));
      expect(
        polygon,
        MatchesPoints([
          const Offset(110, 200),
          const Offset(100, 210),
          const Offset(90, 200),
          const Offset(100, 190),
        ]),
      );
    });

    test('toSvgPath', () {
      expect(
        stroke.toSvgPath(),
        'M100.0,200.0 m-10.0,0 a10.0,10.0 0 1,0 20.0,0 a10.0,10.0 0 1,0 -20.0,0',
      );
    });
  });
}
