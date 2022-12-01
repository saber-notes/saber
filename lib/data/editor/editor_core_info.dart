
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/pages/editor/editor.dart';

class EditorCoreInfo {
  static const int fileVersion = 2;

  static const double defaultWidth = 1000;
  static const double defaultHeight = defaultWidth * 1.4;

  final List<Stroke> strokes;
  final List<EditorImage> images;
  Color? backgroundColor;
  String backgroundPattern;
  final double width;
  final double height;

  bool get isEmpty => strokes.isEmpty && images.isEmpty;

  EditorCoreInfo({
    List<Stroke>? strokes,
    List<EditorImage>? images,
    this.backgroundColor,
    this.backgroundPattern = CanvasBackgroundPatterns.none,
    this.width = defaultWidth,
    this.height = defaultHeight,
  }): strokes = strokes ?? [],
      images = images ?? [];

  EditorCoreInfo.fromJson(Map<String, dynamic> json):
        strokes = _parseStrokesJson(json["s"] as List),
        images = json["i"] != null ? _parseImagesJson(json["i"] as List) : [],
        backgroundColor = json["b"] != null ? Color(json["b"] as int) : null,
        backgroundPattern = json["p"] as String? ?? CanvasBackgroundPatterns.none,
        width = json["w"] ?? defaultWidth,
        height = json["h"] ?? defaultHeight;
  EditorCoreInfo.fromOldJson(List<dynamic> json):
        strokes = _parseStrokesJson(json),
        images = [],
        backgroundPattern = CanvasBackgroundPatterns.none,
        width = defaultWidth,
        height = defaultHeight;

  static List<Stroke> _parseStrokesJson(List<dynamic> strokes) => strokes
      .map((dynamic stroke) => Stroke.fromJson(stroke as Map<String, dynamic>))
      .toList();

  static List<EditorImage> _parseImagesJson(List<dynamic> images) => images
      .map((dynamic image) => EditorImage.fromJson(image as Map<String, dynamic>))
      .toList();

  static Future<EditorCoreInfo> loadFromFilePath(String path) async {
    String? jsonString = await FileManager.readFile(path + Editor.extension);
    if (jsonString == null) return EditorCoreInfo();

    try {
      final dynamic json = jsonDecode(jsonString);
      if (json is List) { // old format
        return EditorCoreInfo.fromOldJson(json);
      } else {
        return EditorCoreInfo.fromJson(json as Map<String, dynamic>);
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
    'b': backgroundColor?.value,
    'p': backgroundPattern,
    'w': width,
    'h': height,
  };

  EditorCoreInfo copyWith({
    List<Stroke>? strokes,
    List<EditorImage>? images,
    Color? backgroundColor,
    String? backgroundPattern,
    double? width,
    double? height,
  }) {
    return EditorCoreInfo(
      strokes: strokes ?? this.strokes,
      images: images ?? this.images,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundPattern: backgroundPattern ?? this.backgroundPattern,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}
