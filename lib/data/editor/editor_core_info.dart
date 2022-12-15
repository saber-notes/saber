
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

class EditorCoreInfo {
  /// The version of the file format.
  /// Increment this if earlier versions of the app can't satisfiably read the file.
  static const int fileVersion = 4;
  bool readOnly = false;

  final List<Stroke> strokes;
  final List<EditorImage> images;
  int nextImageId;
  Color? backgroundColor;
  String backgroundPattern;
  int lineHeight;
  List<EditorPage> pages;

  bool get isEmpty => strokes.isEmpty && images.isEmpty;

  EditorCoreInfo():
        strokes = [],
        images = [],
        nextImageId = 0,
        backgroundPattern = Prefs.lastBackgroundPattern.value,
        lineHeight = Prefs.lastLineHeight.value,
        pages = [];

  /// used in EditorCoreInfo.copyWith(...)
  EditorCoreInfo._({
    required this.readOnly,
    required this.strokes,
    required this.images,
    required this.nextImageId,
    this.backgroundColor,
    required this.backgroundPattern,
    required this.lineHeight,
    required this.pages,
  });

  EditorCoreInfo.fromJson(Map<String, dynamic> json, {bool readOnly = false}):
        readOnly = readOnly || (json["v"] as int? ?? 0) > fileVersion,
        strokes = _parseStrokesJson(json["s"] as List),
        images = _parseImagesJson(
          json["i"] as List? ?? [],
          allowCalculations: !(readOnly || (json["v"] as int? ?? 0) > fileVersion), // !this.readOnly
        ),
        nextImageId = json["ni"] as int? ?? 0,
        backgroundColor = json["b"] != null ? Color(json["b"] as int) : null,
        backgroundPattern = json["p"] as String? ?? CanvasBackgroundPatterns.none,
        lineHeight = json["l"] as int? ?? Prefs.lastLineHeight.value,
        pages = _parsePagesJson(json["z"] as List?) {
    _handleEmptyPages(json["w"] as double?, json["h"] as double?);
    _handleEmptyImageIds();
  }
  /// Old json format is just a list of strokes
  EditorCoreInfo.fromOldJson(List<dynamic> json):
        strokes = _parseStrokesJson(json),
        images = [],
        nextImageId = 0,
        backgroundPattern = CanvasBackgroundPatterns.none,
        lineHeight = Prefs.lastLineHeight.value,
        pages = [] {
    _handleEmptyPages();
  }

  static List<Stroke> _parseStrokesJson(List<dynamic> strokes) => strokes
      .map((dynamic stroke) => Stroke.fromJson(stroke as Map<String, dynamic>))
      .toList();

  static List<EditorImage> _parseImagesJson(List<dynamic> images, {required bool allowCalculations}) => images
      .map((dynamic image) => EditorImage.fromJson(image as Map<String, dynamic>, allowCalculations: allowCalculations))
      .toList();

  static List<EditorPage> _parsePagesJson(List<dynamic>? pages) {
    if (pages == null || pages.isEmpty) return [];
    if (pages[0] is List) { // old format (list of [width, height])
      return pages
        .map((dynamic page) => EditorPage(
          width: page[0] as double?,
          height: page[1] as double?,
        ))
        .toList();
    } else {
      return pages
          .map((dynamic page) => EditorPage.fromJson(page as Map<String, dynamic>))
          .toList();
    }
  }

  void _handleEmptyPages([double? width, double? height]) {
    if (pages.isNotEmpty) return;

    int maxPageIndex = max(
      strokes.isNotEmpty ? strokes.map((stroke) => stroke.pageIndex).reduce(max) : 0,
      images.isNotEmpty ? images.map((image) => image.pageIndex).reduce(max) : 0,
    );
    pages = List.generate(maxPageIndex + 1, (index) => EditorPage(width: width, height: height));
  }

  void _handleEmptyImageIds() {
    for (EditorImage image in images) {
      if (image.id == -1) image.id = nextImageId++;
    }
  }

  static Future<EditorCoreInfo> loadFromFilePath(String path, {bool readOnly = false}) async {
    String? jsonString = await FileManager.readFile(path + Editor.extension);
    if (jsonString == null) return EditorCoreInfo();

    try {
      final dynamic json = jsonDecode(jsonString);
      if (json is List) { // old format
        return EditorCoreInfo.fromOldJson(json);
      } else {
        return EditorCoreInfo.fromJson(json as Map<String, dynamic>, readOnly: readOnly);
      }
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
    'ni': nextImageId,
    'b': backgroundColor?.value,
    'p': backgroundPattern,
    'l': lineHeight,
    'z': pages,
  };

  EditorCoreInfo copyWith({
    bool? readOnly,
    List<Stroke>? strokes,
    List<EditorImage>? images,
    int? nextImageId,
    Color? backgroundColor,
    String? backgroundPattern,
    int? lineHeight,
    List<EditorPage>? pages,
  }) {
    return EditorCoreInfo._(
      readOnly: readOnly ?? this.readOnly,
      strokes: strokes ?? this.strokes,
      images: images ?? this.images,
      nextImageId: nextImageId ?? this.nextImageId,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundPattern: backgroundPattern ?? this.backgroundPattern,
      lineHeight: lineHeight ?? this.lineHeight,
      pages: pages ?? this.pages,
    );
  }
}
