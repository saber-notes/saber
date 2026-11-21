import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/editor/page.dart';

import 'utils/matches_points.dart';

void main() {
  group('EditorPage.normalizePageSize', () {
    const normalize = EditorPage.normalizePageSize;

    test('portrait A4', () {
      expect(normalize(1, 1.4), MatchesSize(1000, 1400));
    });
    test('landscape A4', () {
      expect(normalize(1.4, 1), MatchesSize(1400, 1000));
    });

    test('square', () {
      expect(normalize(100, 100), MatchesSize(1183.2, 1183.2));
    });

    test('landscape 16:9', () {
      expect(normalize(16, 9), MatchesSize(1577.6, 887.4));
    });
    test('portrait 9:16', () {
      expect(normalize(9, 16), MatchesSize(887.4, 1577.6));
    });

    test('tall portrait', () {
      expect(normalize(1, 3), MatchesSize(683.1, 2049.4));
    });
    test('very tall portrait', () {
      expect(normalize(1, 5), MatchesSize(529.2, 2645.8));
    });

    test('zero', () {
      expect(normalize(0, 1), EditorPage.defaultSize);
    });
    test('negative', () {
      expect(normalize(1, -1), EditorPage.defaultSize);
    });
    test('NaN', () {
      expect(normalize(1, double.nan), EditorPage.defaultSize);
    });
    test('Infinite', () {
      expect(normalize(1, double.infinity), EditorPage.defaultSize);
    });
  });
}
