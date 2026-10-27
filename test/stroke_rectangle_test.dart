import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:sbn/has_size.dart';

import 'utils/matches_points.dart';

void main() {
  group('RectangleStroke', () {
    const page = HasSize(EditorPage.defaultSize);
    final stroke = RectangleStroke.fromJson(
      {'shape': 'rect', 'rw': 20.0, 'rh': 40.0},
      fileVersion: 0,
      pageIndex: 0,
      page: page,
    );

    test('isEmpty', () {
      expect(stroke.isEmpty, false);
    });

    test('length', () {
      expect(stroke.length, 64);
    });

    test('lowQualityPolygon', () {
      expect(
        stroke.lowQualityPolygon,
        MatchesPoints([
          Offset.zero,
          const Offset(0, 10),
          const Offset(0, 20),
          const Offset(0, 30),
          const Offset(0, 40),
          const Offset(5, 40),
          const Offset(10, 40),
          const Offset(15, 40),
          const Offset(20, 40),
          const Offset(20, 30),
          const Offset(20, 20),
          const Offset(20, 10),
          const Offset(20, 0),
          const Offset(15, 0),
          const Offset(10, 0),
          const Offset(5, 0),
        ]),
      );
    });

    test('highQualityPolygon', () {
      expect(stroke.highQualityPolygon, hasLength(64));
    });

    test('ultraLowQualityPolygon', () {
      final polygon = stroke.getPolygon(quality: const StrokeQuality(8));
      expect(
        polygon,
        MatchesPoints([
          Offset.zero,
          const Offset(0, 20),
          const Offset(0, 40),
          const Offset(10, 40),
          const Offset(20, 40),
          const Offset(20, 20),
          const Offset(20, 0),
          const Offset(10, 0),
        ]),
      );
    });

    test('toSvgPath', () {
      expect(stroke.toSvgPath(), 'M0.0,0.0 L20.0,0.0 L20.0,40.0 L0.0,40.0 Z');
    });
  });
}
