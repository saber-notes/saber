
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

class EditorCoreInfo {
  static const int fileVersion = 3;

  static const double defaultWidth = 1000;
  static const double defaultHeight = defaultWidth * 1.4;
  static const Size defaultPageSize = Size(defaultWidth, defaultHeight);

  final List<Stroke> strokes;
  final List<EditorImage> images;
  Color? backgroundColor;
  String backgroundPattern;
  int lineHeight;
  List<Size> pageSizes;

  bool get isEmpty => strokes.isEmpty && images.isEmpty;

  EditorCoreInfo():
        strokes = [],
        images = [],
        backgroundPattern = Prefs.lastBackgroundPattern.value,
        lineHeight = Prefs.lastLineHeight.value,
        pageSizes = [];

  EditorCoreInfo._({
    required this.strokes,
    required this.images,
    this.backgroundColor,
    required this.backgroundPattern,
    required this.lineHeight,
    required this.pageSizes,
  });

  EditorCoreInfo.fromJson(Map<String, dynamic> json, {bool ignoreVersion = false}):
        strokes = _parseStrokesJson(json["s"] as List),
        images = _parseImagesJson(json["i"] as List? ?? []),
        backgroundColor = json["b"] != null ? Color(json["b"] as int) : null,
        backgroundPattern = json["p"] as String? ?? CanvasBackgroundPatterns.none,
        lineHeight = json["l"] as int? ?? Prefs.lastLineHeight.value,
        pageSizes = _parsePageSizesJson(json["z"] as List?) {
    int thisVersion = json["v"] as int? ?? 0;
    if (thisVersion > fileVersion && !ignoreVersion) throw CoreInfoTooNewException(thisVersion);

    _handleEmptyPageSizes(json["w"] as double?, json["h"] as double?);
  }
  /// Old json format is just a list of strokes
  EditorCoreInfo.fromOldJson(List<dynamic> json):
        strokes = _parseStrokesJson(json),
        images = [],
        backgroundPattern = CanvasBackgroundPatterns.none,
        lineHeight = Prefs.lastLineHeight.value,
        pageSizes = [] {
    _handleEmptyPageSizes();
  }

  static List<Stroke> _parseStrokesJson(List<dynamic> strokes) => strokes
      .map((dynamic stroke) => Stroke.fromJson(stroke as Map<String, dynamic>))
      .toList();

  static List<EditorImage> _parseImagesJson(List<dynamic> images) => images
      .map((dynamic image) => EditorImage.fromJson(image as Map<String, dynamic>))
      .toList();

  static List<Size> _parsePageSizesJson(List<dynamic>? pageSizes) => pageSizes
      ?.map((dynamic size) => Size(size[0], size[1]))
      .toList() ?? [];

  void _handleEmptyPageSizes([double? width, double? height]) {
    if (pageSizes.isNotEmpty) return;

    int maxPageIndex = max(
      strokes.isNotEmpty ? strokes.map((stroke) => stroke.pageIndex).reduce(max) : 0,
      images.isNotEmpty ? images.map((image) => image.pageIndex).reduce(max) : 0,
    );
    pageSizes = List.generate(maxPageIndex + 1, (index) => Size(width ?? defaultWidth, height ?? defaultHeight));
  }

  static Future<EditorCoreInfo> loadFromFilePath(String path, {bool ignoreVersion = false}) async {
    String? jsonString = await FileManager.readFile(path + Editor.extension);
    if (jsonString == null) return EditorCoreInfo();

    try {
      final dynamic json = jsonDecode(jsonString);
      if (json is List) { // old format
        return EditorCoreInfo.fromOldJson(json);
      } else {
        return EditorCoreInfo.fromJson(json as Map<String, dynamic>, ignoreVersion: ignoreVersion);
      }
    } on CoreInfoTooNewException {
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return EditorCoreInfo();
      }
    }
  }

  Map<String, dynamic> toJson() => {
    'v': fileVersion,
    's': strokes,
    'i': images,
    'b': backgroundColor?.value,
    'p': backgroundPattern,
    'l': lineHeight,
    'z': pageSizes.map((size) => [size.width, size.height]).toList(),
  };

  EditorCoreInfo copyWith({
    List<Stroke>? strokes,
    List<EditorImage>? images,
    Color? backgroundColor,
    String? backgroundPattern,
    int? lineHeight,
    List<Size>? pageSizes,
  }) {
    return EditorCoreInfo._(
      strokes: strokes ?? this.strokes,
      images: images ?? this.images,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundPattern: backgroundPattern ?? this.backgroundPattern,
      lineHeight: lineHeight ?? this.lineHeight,
      pageSizes: pageSizes ?? this.pageSizes,
    );
  }
}

class CoreInfoTooNewException implements Exception {
  final int version;

  CoreInfoTooNewException(this.version);

  @override
  String toString() => "CoreInfoTooNewException: Note version is $version while the app only supports up to ${EditorCoreInfo.fileVersion}";
}
