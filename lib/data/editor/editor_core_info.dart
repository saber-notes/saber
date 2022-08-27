
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/file_manager.dart';
import 'package:saber/pages/editor/editor.dart';

class EditorCoreInfo {
  final List<Stroke> strokes;
  Color? backgroundColor;

  EditorCoreInfo({
    List<Stroke>? strokes,
    this.backgroundColor,
  }): strokes = strokes ?? [];

  EditorCoreInfo.fromJson(Map<String, dynamic> json):
        strokes = _parseStrokesJson(json["s"] as List),
        backgroundColor = json["b"] != null ? Color(json["b"] as int) : null;
  EditorCoreInfo.fromOldJson(List<dynamic> json):
        strokes = _parseStrokesJson(json);

  static List<Stroke> _parseStrokesJson(List<dynamic> strokes) => strokes
      .map((dynamic stroke) => Stroke.fromJson(stroke as Map<String, dynamic>))
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
    's': strokes,
    'b': backgroundColor?.value,
  };
}
