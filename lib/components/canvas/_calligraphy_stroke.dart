import 'dart:math';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/extensions/point_extensions.dart';
import 'package:sbn/has_size.dart';
import 'package:sbn/tool_id.dart';

/// A stroke produced by a calligraphy pen.
///
/// The brush shape is a high aspect ratio rectangle with:
/// - Adjustable width ([options.size]), which remains fixed while in use.
/// - Fixed small height ([nibHeight], defaults to 2.5 pixels).
/// - Adjustable [angle] (in radians), which remains fixed while in use.
class CalligraphyStroke extends Stroke {
  new({
    required super.color,
    super.pressureEnabled = false,
    required super.options,
    required super.pageIndex,
    required super.page,
    super.toolId = ToolId.calligraphyPen,
    required this.angle,
    this.nibHeight = defaultNibHeight,
  }) {
    options.isComplete = true;
    options.simulatePressure = false;
  }

  /// Default small height for the rectangular nib (in pixels).
  static const defaultNibHeight = 2.5;

  /// Default angle (45 degrees in radians).
  static const defaultAngle = 45 * pi / 180;

  /// The fixed angle of the calligraphy nib, in radians.
  double angle;

  /// The fixed height of the rectangular nib, in pixels.
  final double nibHeight;

  /// Line width (the long dimension of the rectangular nib).
  double get width => options.size;
  set width(double value) {
    options.size = value;
    markPolygonNeedsUpdating();
  }

  factory fromJson(
    Map<String, dynamic> json, {
    required int fileVersion,
    required int pageIndex,
    required HasSize page,
  }) {
    assert(json['shape'] == 'calligraphy' || json['ty'] == ToolId.calligraphyPen.id);
    assert(json['i'] == pageIndex || json['i'] == null);

    final Color color;
    switch (json['c']) {
      case (final int value):
        color = Color(value);
      case (final Int64 value):
        color = Color(value.toInt());
      case null:
        color = Stroke.defaultColor;
      default:
        throw Exception(
          'Invalid color value: (${json['c'].runtimeType}) ${json['c']}',
        );
    }

    final double strokeAngle = (json['ca'] as num?)?.toDouble() ?? defaultAngle;
    final double height = (json['nh'] as num?)?.toDouble() ?? defaultNibHeight;

    final offset = Offset(json['ox'] ?? 0, json['oy'] ?? 0);
    final pointsJson = (json['p'] as List<dynamic>?) ?? [];
    final Iterable<PointVector> points;
    if (fileVersion >= 13) {
      points = pointsJson.map(
        (point) => PointExtensions.fromBsonBinary(json: point, offset: offset),
      );
    } else {
      points = pointsJson.map(
        // ignore: deprecated_member_use_from_same_package
        (point) => PointExtensions.fromJson(
          json: Map<String, dynamic>.from(point),
          offset: offset,
        ),
      );
    }

    final stroke = CalligraphyStroke(
      color: color,
      pressureEnabled: false,
      options: StrokeOptions.fromJson(json)..simulatePressure = false,
      pageIndex: pageIndex,
      page: page,
      toolId: ToolId.calligraphyPen,
      angle: strokeAngle,
      nibHeight: height,
    );
    stroke.points.addAll(points);
    return stroke;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'shape': 'calligraphy',
      'ca': angle,
      'nh': nibHeight,
      'p': points
          .where((point) => point.isFinite)
          .map((PointVector point) => point.toBsonBinary())
          .toList(),
      'i': pageIndex,
      'ty': toolId.id,
      'pe': false,
      'c': color.toARGB32(),
    }..addAll(options.toJson());
  }

  /// Calculates the 4 corner offsets of the rectangular nib centered at origin.
  ///
  /// Corners are returned in counter-clockwise order:
  /// - `delta0`: (+w_h, +h_h) in rotated frame
  /// - `delta1`: (-w_h, +h_h) in rotated frame
  /// - `delta2`: (-w_h, -h_h) in rotated frame (-delta0)
  /// - `delta3`: (+w_h, -h_h) in rotated frame (-delta1)
  static List<Offset> computeCornerOffsets({
    required double width,
    required double height,
    required double angle,
  }) {
    final halfW = width / 2;
    final halfH = height / 2;
    final cosA = cos(angle);
    final sinA = sin(angle);

    // Direction along nib width (tilted up-right in screen coordinates where y increases downwards)
    final wx = halfW * cosA;
    final wy = -halfW * sinA;
    // Direction along nib height (perpendicular to width, 90 degrees CCW)
    final hx = halfH * sinA;
    final hy = halfH * cosA;

    return [
      Offset(wx + hx, wy + hy),
      Offset(-wx + hx, -wy + hy),
      Offset(-wx - hx, -wy - hy),
      Offset(wx - hx, wy - hy),
    ];
  }

  /// Computes the swept convex polygon between two consecutive points [pA] and [pB].
  static List<Offset> computeStepPolygon(
    Offset pA,
    Offset pB,
    List<Offset> deltas,
  ) {
    final d = pB - pA;
    if (d.dx == 0 && d.dy == 0) {
      return [
        pA + deltas[0],
        pA + deltas[1],
        pA + deltas[2],
        pA + deltas[3],
      ];
    }

    // Normal pointing perpendicular to direction of movement
    final nx = -d.dy;
    final ny = d.dx;

    // Find the corner with maximum projection along the normal
    int kMax = 0;
    double maxDot = deltas[0].dx * nx + deltas[0].dy * ny;
    for (int k = 1; k < 4; k++) {
      final dot = deltas[k].dx * nx + deltas[k].dy * ny;
      if (dot > maxDot) {
        maxDot = dot;
        kMax = k;
      }
    }

    final kMin = (kMax + 2) % 4;
    final kLead = (kMax + 1) % 4;
    final kTrail = (kMax + 3) % 4;

    return [
      pA + deltas[kMax],
      pB + deltas[kMax],
      pB + deltas[kLead],
      pB + deltas[kMin],
      pA + deltas[kMin],
      pA + deltas[kTrail],
    ];
  }

  @override
  List<Offset> getPolygon({required StrokeQuality quality}) {
    if (points.isEmpty) return const [];

    final deltas = computeCornerOffsets(
      width: options.size,
      height: nibHeight,
      angle: angle,
    );

    final sampledPoints = Stroke.skipPoints(points, quality.N);
    if (sampledPoints.isEmpty) return const [];

    if (sampledPoints.length == 1) {
      final p0 = Offset(sampledPoints.first.dx, sampledPoints.first.dy);
      return [
        p0 + deltas[0],
        p0 + deltas[1],
        p0 + deltas[2],
        p0 + deltas[3],
      ];
    }

    final n = sampledPoints.length;
    final leftSide = <Offset>[];
    final rightSide = <Offset>[];

    for (int i = 0; i < n - 1; i++) {
      final pA = Offset(sampledPoints[i].dx, sampledPoints[i].dy);
      final pB = Offset(sampledPoints[i + 1].dx, sampledPoints[i + 1].dy);
      final d = pB - pA;
      if (d.dx == 0 && d.dy == 0) continue;

      final nx = -d.dy;
      final ny = d.dx;

      int kMax = 0;
      double maxDot = deltas[0].dx * nx + deltas[0].dy * ny;
      for (int k = 1; k < 4; k++) {
        final dot = deltas[k].dx * nx + deltas[k].dy * ny;
        if (dot > maxDot) {
          maxDot = dot;
          kMax = k;
        }
      }
      final kMin = (kMax + 2) % 4;

      leftSide.add(pA + deltas[kMax]);
      leftSide.add(pB + deltas[kMax]);

      rightSide.add(pB + deltas[kMin]);
      rightSide.add(pA + deltas[kMin]);
    }

    if (leftSide.isEmpty) {
      final p0 = Offset(sampledPoints.first.dx, sampledPoints.first.dy);
      return [
        p0 + deltas[0],
        p0 + deltas[1],
        p0 + deltas[2],
        p0 + deltas[3],
      ];
    }

    return [...leftSide, ...rightSide];
  }

  @override
  Path getPath(List<Offset> polygon, {bool smooth = true}) {
    if (points.isEmpty) return Path();

    final deltas = computeCornerOffsets(
      width: options.size,
      height: nibHeight,
      angle: angle,
    );

    if (points.length == 1) {
      final p0 = Offset(points.first.dx, points.first.dy);
      return Path()
        ..addPolygon([
          p0 + deltas[0],
          p0 + deltas[1],
          p0 + deltas[2],
          p0 + deltas[3],
        ], true);
    }

    final path = Path();
    for (int i = 0; i < points.length - 1; i++) {
      final pA = Offset(points[i].dx, points[i].dy);
      final pB = Offset(points[i + 1].dx, points[i + 1].dy);
      final stepPoly = computeStepPolygon(pA, pB, deltas);
      path.addPolygon(stepPoly, true);
    }
    return path;
  }

  @override
  String toSvgPath() {
    if (points.isEmpty) return '';

    String toSvgPoint(Offset point) {
      return '${point.dx} ${page.size.height - point.dy}';
    }

    final deltas = computeCornerOffsets(
      width: options.size,
      height: nibHeight,
      angle: angle,
    );

    if (points.length == 1) {
      final p0 = Offset(points.first.dx, points.first.dy);
      final pts = [
        p0 + deltas[0],
        p0 + deltas[1],
        p0 + deltas[2],
        p0 + deltas[3],
      ].map(toSvgPoint);
      return 'M${pts.join('L')}Z';
    }

    final buffer = StringBuffer();
    for (int i = 0; i < points.length - 1; i++) {
      final pA = Offset(points[i].dx, points[i].dy);
      final pB = Offset(points[i + 1].dx, points[i + 1].dy);
      final stepPoly = computeStepPolygon(pA, pB, deltas);
      final pts = stepPoly.map(toSvgPoint);
      buffer.write('M${pts.join('L')}Z ');
    }
    return buffer.toString().trim();
  }

  @override
  double get maxY {
    if (points.isEmpty) return 0;
    final halfBound = max(options.size, nibHeight);
    return points.map((point) => point.y).reduce(max) + halfBound;
  }

  @override
  CalligraphyStroke copy() => CalligraphyStroke(
    color: color,
    pressureEnabled: pressureEnabled,
    options: options.copyWith(),
    pageIndex: pageIndex,
    page: page,
    toolId: toolId,
    angle: angle,
    nibHeight: nibHeight,
  )..points.addAll(points);
}
