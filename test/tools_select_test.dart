
import 'dart:ui';

import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/tools/select.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';
import 'package:test/test.dart';

void main() {
  test("Test that the select tool selects the right points", () async {
    Select select = Select.currentSelect;
    StrokeProperties strokeProperties = StrokeProperties();
    Size pageSize = const Size(100, 100);

    // Drag gesture in a 10x10 square shape
    select.onDragStart(const Offset(0, 0));
    select.onDragUpdate(const Offset(0, 10));
    select.onDragUpdate(const Offset(10, 10));
    select.onDragUpdate(const Offset(10, 0));

    Stroke insideStroke = Stroke(
      strokeProperties: strokeProperties,
      pageIndex: 0,
      penType: "testing pen",
    )..addPoint(pageSize, const Offset(5, 5));

    Stroke outsideStroke = Stroke(
      strokeProperties: strokeProperties,
      pageIndex: 0,
      penType: "testing pen",
    )..addPoint(pageSize, const Offset(15, 15));

    List<Stroke> strokes = [insideStroke, outsideStroke]; // index 0 is inside, index 1 is outside
    List<int> selectedIndices = select.onDragEnd(strokes);

    expect(selectedIndices.length, 1, reason: "Only one stroke should be selected");
    expect(selectedIndices[0], 0, reason: "The first stroke should be selected");
  });
}
