import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/tools/stroke_properties.dart';

void main() {
  test('Test strokeProperties copy function', () { // also tests json serialization
    /// StrokeProperties with non-default values
    final StrokeProperties strokeProperties = StrokeProperties(
      color: const Color(0xFF123456),
      size: StrokeProperties.defaultSize / 2,
      thinning: StrokeProperties.defaultThinning / 2,
      smoothing: 0.1,
      streamline: StrokeProperties.defaultStreamline / 2,
      taperStart: 0.1,
      taperEnd: 0.1,
      capStart: !StrokeProperties.defaultCapStart,
      capEnd: !StrokeProperties.defaultCapEnd,
      pressureEnabled: !StrokeProperties.defaultPressureEnabled,
      simulatePressure: !StrokeProperties.defaultSimulatePressure,
    );

    StrokeProperties copy = strokeProperties.copy();

    expect(copy.color, strokeProperties.color);
    expect(copy.size, strokeProperties.size);
    expect(copy.thinning, strokeProperties.thinning);
    expect(copy.smoothing, strokeProperties.smoothing);
    expect(copy.streamline, strokeProperties.streamline);
    expect(copy.taperStart, strokeProperties.taperStart);
    expect(copy.taperEnd, strokeProperties.taperEnd);
    expect(copy.capStart, strokeProperties.capStart);
    expect(copy.capEnd, strokeProperties.capEnd);
    expect(copy.pressureEnabled, strokeProperties.pressureEnabled);
    expect(copy.simulatePressure, strokeProperties.simulatePressure);
  });
}
