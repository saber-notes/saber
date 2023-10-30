import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/toolbar/color_bar.dart';

void main() {
  group('describeColor', () {
    test('red', () {
      expect(ColorBar.describeColor(Colors.red), 'Custom red');
    });
    test('dark blue', () {
      expect(ColorBar.describeColor(const Color(0xFF00145c)), 'Custom dark blue');
    });
    test('light blue', () {
      expect(ColorBar.describeColor(const Color(0xFF8fa7ff)), 'Custom light blue');
    });
    test('grey', () {
      expect(ColorBar.describeColor(Colors.grey), 'Custom grey');
    });
    test('black', () {
      expect(ColorBar.describeColor(Colors.black), 'Custom dark grey');
    });
    test('white', () {
      expect(ColorBar.describeColor(Colors.white), 'Custom light grey');
    });
    test('light pink', () {
      expect(ColorBar.describeColor(const Color(0xFFffcff0)), 'Custom light pink');
    });
  });
}
