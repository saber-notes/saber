import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_calligraphy_stroke.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/tools/calligraphy_pen.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:sbn/tool_id.dart';

class MockPage extends Fake implements EditorPage {
  @override
  Size get size => const Size(800, 1000);
}

void main() {
  FlavorConfig.setup();

  group('CalligraphyStroke geometry & properties:', () {
    test('Default properties have high aspect ratio rectangular nib', () {
      final stroke = CalligraphyStroke(
        color: Colors.black,
        options: StrokeOptions(size: 15),
        pageIndex: 0,
        page: MockPage(),
        angle: 45 * pi / 180,
      );

      expect(stroke.width, equals(15.0));
      expect(stroke.nibHeight, equals(CalligraphyStroke.defaultNibHeight)); // 2.5
      expect(stroke.pressureEnabled, isFalse);
      expect(stroke.options.simulatePressure, isFalse);
      expect(stroke.toolId, equals(ToolId.calligraphyPen));

      // Aspect ratio: 15 / 2.5 = 6.0 (high aspect ratio)
      final aspectRatio = stroke.width / stroke.nibHeight;
      expect(aspectRatio, greaterThan(3.0));
    });

    test('Nib corners are counter-clockwise and symmetric', () {
      final deltas = CalligraphyStroke.computeCornerOffsets(
        width: 12,
        height: 2.5,
        angle: 45 * pi / 180,
      );

      expect(deltas.length, equals(4));
      // delta2 == -delta0
      expect((deltas[2].dx + deltas[0].dx).abs(), lessThan(1e-9));
      expect((deltas[2].dy + deltas[0].dy).abs(), lessThan(1e-9));
      // delta3 == -delta1
      expect((deltas[3].dx + deltas[1].dx).abs(), lessThan(1e-9));
      expect((deltas[3].dy + deltas[1].dy).abs(), lessThan(1e-9));

      // Cross product delta0 x delta1 is positive (counter-clockwise)
      final cross = deltas[0].dx * deltas[1].dy - deltas[0].dy * deltas[1].dx;
      expect(cross, greaterThan(0));
    });

    test('Single point (tap) generates rectangular footprint', () {
      final stroke = CalligraphyStroke(
        color: Colors.blue,
        options: StrokeOptions(size: 10),
        pageIndex: 0,
        page: MockPage(),
        angle: 0, // horizontal
        nibHeight: 2.0,
      )..addPoint(const Offset(100, 100));

      final poly = stroke.highQualityPolygon;
      expect(poly.length, equals(4));

      // With angle = 0, half-width = 5 along X, half-height = 1 along Y
      // Expected corners around (100, 100):
      // (105, 101), (95, 101), (95, 99), (105, 99)
      expect(poly[0], equals(const Offset(105, 101)));
      expect(poly[1], equals(const Offset(95, 101)));
      expect(poly[2], equals(const Offset(95, 99)));
      expect(poly[3], equals(const Offset(105, 99)));

      final path = stroke.highQualityPath;
      expect(path.getBounds(), equals(const Rect.fromLTRB(95, 99, 105, 101)));
    });

    test('Hairline vs broad stroke contrast (calligraphy effect)', () {
      const angle = 45 * pi / 180; // 45°
      final deltas = CalligraphyStroke.computeCornerOffsets(
        width: 20,
        height: 2.0,
        angle: angle,
      );

      // Stroke moving along 45° (parallel to nib width): should be very thin (~nibHeight = 2)
      // Direction in screen coordinates: dx = 10, dy = -10 (up-right)
      final hairlinePoly = CalligraphyStroke.computeStepPolygon(
        const Offset(100, 100),
        const Offset(110, 90),
        deltas,
      );
      final hairlineBounds = Path()..addPolygon(hairlinePoly, true);
      final hairlineWidth = hairlineBounds.getBounds();

      // Stroke moving perpendicular to 45° (dx = 10, dy = 10, down-right): should be thick (~nibWidth = 20)
      final broadPoly = CalligraphyStroke.computeStepPolygon(
        const Offset(100, 100),
        const Offset(110, 110),
        deltas,
      );
      final broadBounds = Path()..addPolygon(broadPoly, true);
      final broadRect = broadBounds.getBounds();

      // Broad stroke bounding box diagonal must be significantly larger than hairline
      expect(broadRect.width, greaterThan(hairlineWidth.width * 0.8));
      expect(broadRect.height, greaterThan(hairlineWidth.height * 0.8));
    });

    test('Multi-point stroke produces non-empty Path and SVG output', () {
      final stroke = CalligraphyStroke(
        color: Colors.black,
        options: StrokeOptions(size: 14),
        pageIndex: 0,
        page: MockPage(),
        angle: 45 * pi / 180,
      )
        ..addPoint(const Offset(10, 10))
        ..addPoint(const Offset(20, 30))
        ..addPoint(const Offset(40, 60))
        ..addPoint(const Offset(70, 70));

      final path = stroke.highQualityPath;
      final bounds = path.getBounds();
      expect(bounds.isEmpty, isFalse);
      expect(bounds.left, lessThan(10));
      expect(bounds.right, greaterThan(70));

      final svg = stroke.toSvgPath();
      expect(svg, isNotEmpty);
      expect(svg.startsWith('M'), isTrue);
      expect(svg.contains('Z'), isTrue);
    });

    test('Stroke copy and shift preserve angle and dimensions', () {
      final stroke = CalligraphyStroke(
        color: Colors.red,
        options: StrokeOptions(size: 16),
        pageIndex: 1,
        page: MockPage(),
        angle: 30 * pi / 180,
        nibHeight: 3.0,
      )
        ..addPoint(const Offset(50, 50))
        ..addPoint(const Offset(100, 100));

      final copy = stroke.copy();
      expect(copy.angle, equals(stroke.angle));
      expect(copy.nibHeight, equals(stroke.nibHeight));
      expect(copy.width, equals(stroke.width));
      expect(copy.color, equals(stroke.color));
      expect(copy.points.length, equals(stroke.points.length));

      // Test shift
      const shiftOffset = Offset(25, -15);
      final originalBounds = stroke.highQualityPath.getBounds();
      stroke.shift(shiftOffset);
      final shiftedBounds = stroke.highQualityPath.getBounds();

      expect(
        shiftedBounds.left,
        closeTo(originalBounds.left + shiftOffset.dx, 0.001),
      );
      expect(
        shiftedBounds.top,
        closeTo(originalBounds.top + shiftOffset.dy, 0.001),
      );
    });

    test('Serialization to/from JSON works with Stroke.fromJson', () {
      final stroke = CalligraphyStroke(
        color: const Color(0xFF123456),
        options: StrokeOptions(size: 18),
        pageIndex: 2,
        page: MockPage(),
        angle: 60 * pi / 180,
        nibHeight: 2.5,
      )
        ..addPoint(const Offset(20, 20))
        ..addPoint(const Offset(60, 40));

      final json = stroke.toJson();
      expect(json['shape'], equals('calligraphy'));
      expect(json['ca'], equals(60 * pi / 180));
      expect(json['nh'], equals(2.5));
      expect(json['ty'], equals(ToolId.calligraphyPen.id));
      expect(json['pe'], isFalse);

      final deserialized = Stroke.fromJson(
        json,
        fileVersion: 19,
        pageIndex: 2,
        page: MockPage(),
      );

      expect(deserialized, isA<CalligraphyStroke>());
      final callig = deserialized as CalligraphyStroke;
      expect(callig.angle, equals(60 * pi / 180));
      expect(callig.nibHeight, equals(2.5));
      expect(callig.width, equals(18.0));
      expect(callig.color.toARGB32(), equals(const Color(0xFF123456).toARGB32()));
      expect(callig.points.length, equals(2));
    });
  });

  group('CalligraphyPen tool integration:', () {
    test('Tool properties and defaults', () {
      final pen = CalligraphyPen(angle: 45 * pi / 180);
      expect(pen.toolId, equals(ToolId.calligraphyPen));
      expect(pen.icon, equals(CalligraphyPen.calligraphyPenIcon));
      expect(pen.pressureEnabled, isFalse);
      expect(pen.angleInDegrees, closeTo(45.0, 0.001));

      // Setting degrees updates radians
      pen.angleInDegrees = 90.0;
      expect(pen.angle, closeTo(pi / 2, 0.001));
    });

    test('Pen.calligraphyPen factory creates CalligraphyPen', () {
      final pen = Pen.calligraphyPen();
      expect(pen, isA<CalligraphyPen>());
      expect(pen.toolId, equals(ToolId.calligraphyPen));
    });

    test('onDragStart creates CalligraphyStroke with fixed width and angle', () {
      final pen = CalligraphyPen(angle: 30 * pi / 180);
      pen.options.size = 14;

      final page = MockPage();
      pen.onDragStart(const Offset(50, 50), page, 0, 0.9); // pass high pressure

      final stroke = Pen.currentStroke;
      expect(stroke, isNotNull);
      expect(stroke, isA<CalligraphyStroke>());

      final calligStroke = stroke! as CalligraphyStroke;
      expect(calligStroke.width, equals(14.0));
      expect(calligStroke.pressureEnabled, isFalse); // pressure ignored
      expect(calligStroke.angle, equals(30 * pi / 180));

      pen.onDragUpdate(const Offset(80, 80), 0.2); // low pressure
      final finished = pen.onDragEnd();
      expect(finished, equals(calligStroke));
      expect(finished!.points.length, equals(2));
      // First point has no pressure applied
      expect(finished.points.first.pressure, isNull);
    });
  });
}
