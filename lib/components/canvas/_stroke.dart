import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_circle_stroke.dart';
import 'package:saber/components/canvas/_rectangle_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/list_extensions.dart';
import 'package:saber/data/extensions/point_extensions.dart';
import 'package:saber/data/tools/pen.dart';

class Stroke {
  static final log = Logger('Stroke');

  @visibleForTesting
  @protected
  final List<PointVector> points = [];

  bool get isEmpty => points.isEmpty;
  int get length => points.length;

  int pageIndex;
  HasSize page;
  final String penType;

  static const defaultColor = Colors.black;
  static const defaultPressureEnabled = true;

  Color color;
  bool pressureEnabled;
  final StrokeOptions options;

  List<Offset>? _lowQualityPolygon, _highQualityPolygon;
  List<Offset> get lowQualityPolygon => _lowQualityPolygon ??= getPolygon(6);
  List<Offset> get highQualityPolygon => _highQualityPolygon ??= getPolygon(1);

  Path? _lowQualityPath, _highQualityPath;
  Path get lowQualityPath =>
      _lowQualityPath ??= getPath(lowQualityPolygon, smooth: false);
  Path get highQualityPath => _highQualityPath ??= getPath(highQualityPolygon);

  void shift(Offset offset) {
    if (offset == Offset.zero) return;

    points.shift(offset);
    _lowQualityPolygon?.shift(offset);
    _highQualityPolygon?.shift(offset);
    _lowQualityPath = _lowQualityPath?.shift(offset);
    _highQualityPath = _highQualityPath?.shift(offset);
  }

  void markPolygonNeedsUpdating() {
    _lowQualityPolygon = null;
    _highQualityPolygon = null;
    _lowQualityPath = null;
    _highQualityPath = null;
  }

  Stroke({
    required this.color,
    required this.pressureEnabled,
    required this.options,
    required this.pageIndex,
    required this.page,
    required this.penType,
  });

  factory Stroke.fromJson(
      Map<String, dynamic> json, {
        required int fileVersion,
        required int pageIndex,
        required HasSize page,
      }) {
    assert(json['i'] == pageIndex || json['i'] == null);
    switch (json['shape'] as String?) {
      case null:
        break;
      case 'circle':
        return CircleStroke.fromJson(json,
            fileVersion: fileVersion, pageIndex: pageIndex, page: page);
      case 'rect':
        return RectangleStroke.fromJson(json,
            fileVersion: fileVersion, pageIndex: pageIndex, page: page);
      default:
        log.severe('Unknown shape: ${json['shape']}');
    }

    final options = StrokeOptions.fromJson(json);
    final pressureEnabled = json['pe'] ?? defaultPressureEnabled;

    final Color color;
    switch (json['c']) {
      case (int value):
        color = Color(value);
      case (Int64 value):
        color = Color(value.toInt());
      case null:
        color = defaultColor;
      default:
        throw Exception(
            'Invalid color value: (${json['c'].runtimeType}) ${json['c']}');
    }

    final offset = Offset(json['ox'] ?? 0, json['oy'] ?? 0);
    final pointsJson = json['p'] as List<dynamic>;
    final Iterable<PointVector> points;
    if (fileVersion >= 13) {
      points = pointsJson.map((point) => PointExtensions.fromBsonBinary(
        json: point,
        offset: offset,
      ));
    } else {
      // ignore: deprecated_member_use_from_same_package
      points = pointsJson.map((point) => PointExtensions.fromJson(
        json: Map<String, dynamic>.from(point),
        offset: offset,
      ));
    }

    return Stroke(
      color: color,
      pressureEnabled: pressureEnabled,
      options: options,
      pageIndex: pageIndex,
      page: page,
      penType: json['ty'] ?? (Pen).toString(),
    )..points.addAll(points);
  }
  Map<String, dynamic> toJson() {
    // these json keys should not be the same as the ones in [StrokeOptions.toJson]
    return {
      'shape': null,
      'p': points
          .where((point) => point.isFinite)
          .map((PointVector point) => point.toBsonBinary())
          .toList(),
      'i': pageIndex,
      'ty': penType,
      'pe': pressureEnabled,
      'c': color.toARGB32(),
    }..addAll(options.toJson());
  }

  void addPoint(Offset point, [double? pressure]) {
    if (!pressureEnabled) {
      pressure = null;
    } else if (pressure != null) {
      options.simulatePressure = false;
    }

    points.add(PointVector(point.dx, point.dy, pressure));
    markPolygonNeedsUpdating();
  }

  void addPoints(List<Offset> points) {
    for (final point in points) {
      addPoint(point);
    }
  }

  void popFirstPoint() {
    points.removeAt(0);
    markPolygonNeedsUpdating();
  }

  /// Points that are closer than this
  /// threshold multiplied by the stroke's size
  /// will be counted as duplicates.
  static const double _optimisePointsThreshold = 0.1;

  /// Removes points that are too close together. See [_optimisePointsThreshold].
  ///
  /// This function is idempotent, so running it multiple times
  /// will not change the result.
  ///
  /// This function does not change [_polygonNeedsUpdating].
  void optimisePoints({double thresholdMultiplier = _optimisePointsThreshold}) {
    if (points.length <= 3) return;

    final minDistance = options.size * thresholdMultiplier;

    // Remove points with null pressure because they were duplicates
    points.removeWhere((point) => point.pressure == null);

    for (int i = 1; i < points.length - 1; i++) {
      final point = points[i];
      final prev = points[i - 1];
      final next = points[i + 1];

      if (prev.distanceSquaredTo(point) < minDistance * minDistance &&
          point.distanceSquaredTo(next) < minDistance * minDistance) {
        points.removeAt(i);
        i--;
      }
    }
  }

  @protected
  List<Offset> getPolygon(int N) {
    if (!pressureEnabled) {
      options.simulatePressure = false;
    }
    final rememberSimulatedPressure =
        N <= 1 && options.simulatePressure && options.isComplete;

    final polygon = getStroke(
      skipPoints(points, N),
      options: options,
      rememberSimulatedPressure: rememberSimulatedPressure,
    );

    if (rememberSimulatedPressure) {
      // Ensure we don't simulate pressure again
      options.simulatePressure = false;
      // Remove points that are too close together
      optimisePoints();
    }

    return polygon;
  }

  /// Returns a [Path] that represents the stroke.
  ///
  /// If [smooth] is true, and the stroke is complete,
  /// the path will be a smooth curve between the points in [polygon].
  ///
  /// Otherwise, the path will use straight lines between each point
  /// in [polygon] for performance.
  @protected
  Path getPath(List<Offset> polygon, {bool smooth = true}) {
    if (smooth && options.isComplete) {
      return smoothPathFromPolygon(polygon);
    }

    return Path()..addPolygon(polygon, true);
  }

  /// Returns a list with every Nth point in [points].
  static List<PointVector> skipPoints(List<PointVector> points, int N) {
    if (N == 1) return points;
    if (points.length < N * 4) return points;
    return [
      for (int i = 0; i < points.length; i += N) points[i],
      if (points.length % N != 0) points.last,
    ];
  }

  static Path smoothPathFromPolygon(List<Offset> polygon) {
    final path = Path();
    path.moveTo(polygon.first.dx, polygon.first.dy);
    for (int i = 1; i < polygon.length - 1; i++) {
      final p1 = polygon[i];
      final p2 = polygon[i + 1];
      final mid = (p1 + p2) / 2;
      path.quadraticBezierTo(p1.dx, p1.dy, mid.dx, mid.dy);
    }
    return path..close();
  }

  String toSvgPath() {
    String toSvgPoint(Offset point) {
      return '${point.dx} '
          '${page.size.height - point.dy}';
    }

    // Remove NaN points, and convert to SVG coordinates
    final svgPoints =
    highQualityPolygon.where((offset) => offset.isFinite).map(toSvgPoint);

    return svgPoints.isNotEmpty ? 'M${svgPoints.join('L')}' : '';
  }

  double get maxY {
    return points.isEmpty ? 0 : points.map((point) => point.y).reduce(max);
  }

  RecognizedUnistroke? detectShape() {
    if (points.length < 3) return null;
    return recognizeUnistroke(points);
  }

  /// Uses the one_dollar_unistroke_recognizer package
  /// only to recognize straight lines.
  ///
  /// In addition, the line must be sufficiently long
  /// relative to [options.size].
  bool isStraightLine([int minLength = 5]) {
    if (points.length < 3) return false;

    final recognized = recognizeUnistroke(
      points,
      overrideReferenceUnistrokes: default$1Unistrokes
          .where((unistroke) => unistroke.name == DefaultUnistrokeNames.line)
          .toList(),
    );
    if (recognized == null) return false;
    assert(recognized.name == DefaultUnistrokeNames.line);
    if (recognized.score < 0.7) return false;

    final sqrLength = points.first.distanceSquaredTo(points.last);
    final sqrMinLength = minLength * minLength * options.size * options.size;
    return sqrLength >= sqrMinLength;
  }

  /// Replaces the points in this stroke with a straight line.
  ///
  /// If the resulting line is close to horizontal or vertical,
  /// it will be snapped to be exactly horizontal or vertical.
  void convertToLine() {
    assert(points.length >= 2);

    // Use the average pressure
    final pressure = points.map((point) => point.pressure ?? 0.5).average;
    var firstPoint =
    PointVector.fromOffset(offset: points.first, pressure: pressure);
    var lastPoint =
    PointVector.fromOffset(offset: points.last, pressure: pressure);

    // Snap to the horizontal or vertical axis
    (firstPoint, lastPoint) = snapLine(firstPoint, lastPoint);

    points.clear();
    points.add(firstPoint);
    points.add(lastPoint);
    points.add(lastPoint);
    options.isComplete = true;
    options.start.taperEnabled = false;
    options.end.taperEnabled = false;
  }

  /// Snaps a line to either horizontal or vertical
  /// if the angle is close enough.
  static (PointVector firstPoint, PointVector lastPoint) snapLine(
      PointVector firstPoint,
      PointVector lastPoint,
      ) {
    final dx = (lastPoint.dx - firstPoint.dx).abs();
    final dy = (lastPoint.dy - firstPoint.dy).abs();
    final angle = atan2(dy, dx);

    const snapAngle = 5 * pi / 180; // 5 degrees
    if (angle < snapAngle) {
      // snap to horizontal
      return (
      firstPoint,
      PointVector(lastPoint.dx, firstPoint.dy, lastPoint.pressure)
      );
    } else if (angle > pi / 2 - snapAngle) {
      // snap to vertical
      return (
      firstPoint,
      PointVector(firstPoint.dx, lastPoint.dy, lastPoint.pressure)
      );
    } else {
      return (firstPoint, lastPoint);
    }
  }

  Stroke copy() => Stroke(
    color: color,
    pressureEnabled: pressureEnabled,
    options: options.copyWith(),
    pageIndex: pageIndex,
    page: page,
    penType: penType,
  )..points.addAll(points);


  //////////////////////////////////////////
  // helpers to store point vectors
  static Uint8List pointVectorToBinary(PointVector point) {
    final bd = ByteData(8);
    bd.setFloat32(0, point.x, Endian.little);
    bd.setFloat32(4, point.y, Endian.little);
    return bd.buffer.asUint8List();
  }

  static PointVector pointVectorFromBinary(Uint8List bytes) {
    final bd = ByteData.sublistView(bytes);
    final x = bd.getFloat32(0, Endian.little);
    final y = bd.getFloat32(4, Endian.little);
    return PointVector(x, y);
  }
  //////////////////////////////////////////


  /// Serializes a Stroke object into a compact binary format.
  Uint8List toBinary() {
    // Serialize only finite points to binary
    final pointsBytes = points
        .where((p) => p.isFinite)
        .map((p) => pointVectorToBinary(p))
        .toList();

    final pointCount = pointsBytes.length;

    final buffer = BytesBuilder();

    // 1. Write the number of points as uint32 (4 bytes)
    final meta = ByteData(4);
    meta.setUint32(0, pointCount, Endian.little);
    buffer.add(meta.buffer.asUint8List());

    // 2. Write each point's binary data sequentially
    for (final pb in pointsBytes) {
      buffer.add(pb); // Assuming each point is a fixed size (e.g., 8 bytes)
    }

    // 3. Write pageIndex as int32 (4 bytes)
    final indexData = ByteData(4);
    indexData.setInt32(0, pageIndex, Endian.little);
    buffer.add(indexData.buffer.asUint8List());

    // 4. Write penType length (1 byte) + UTF8-encoded penType string
    final penBytes = utf8.encode(penType);
    buffer.add([penBytes.length]);
    buffer.add(penBytes);

    // 5. Write pressureEnabled as 1 byte (0 or 1)
    buffer.add([pressureEnabled ? 1 : 0]);

    // 6. Write color as int32 (ARGB format, 4 bytes)
    final colorData = ByteData(4);
    colorData.setInt32(0, color.toARGB32(), Endian.little);
    buffer.add(colorData.buffer.asUint8List());

    // TODO: Add serialization of StrokeOptions if needed

    return buffer.toBytes();
  }

  /// Deserializes a Stroke object from binary data starting at [offset].
  factory Stroke.fromBinary(ByteData data, {
    int offset = 0,
    required int fileVersion,
    required int pageIndex,
    required HasSize page,
  }){


    int cursor = offset;

    // 1. Read number of points (uint32)
    final pointCount = data.getUint32(cursor, Endian.little);
    cursor += 4;

    final points = <PointVector>[];
    for (int i = 0; i < pointCount; i++) {
      final pointBytes = data.buffer.asUint8List(cursor, 8);
      final point = pointVectorFromBinary(pointBytes);
      points.add(point);
      cursor += 8;
    }

    // 2. Read pageIndex (int32)
    final pageIndex = data.getInt32(cursor, Endian.little);
    cursor += 4;

    // 3. Read penType length (1 byte) and decode UTF8 string
    final penLen = data.getUint8(cursor++);
    final penBytes = data.buffer.asUint8List(cursor, penLen);
    final penType = utf8.decode(penBytes);
    cursor += penLen;

    // 4. Read pressureEnabled (1 byte, 0 or 1)
    final pressureEnabled = data.getUint8(cursor++) != 0;

    // 5. Read color (int32 ARGB)
    final colorInt = data.getInt32(cursor, Endian.little);
    cursor += 4;
    final color = Color(colorInt);

    // Note: In your JSON version you also process options — add them if needed here:
    final options = StrokeOptions(); // adjust this as per your needs

    return Stroke(
      color: color,
      pressureEnabled: pressureEnabled,
      options: options,
      pageIndex: pageIndex,
      page: page,
      penType: penType,
    )..points.addAll(points); // match the fromJson pattern
  }
}
