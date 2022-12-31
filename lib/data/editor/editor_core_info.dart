
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:worker_manager/worker_manager.dart';

class EditorCoreInfo {
  /// The version of the file format.
  /// Increment this if earlier versions of the app can't satisfiably read the file.
  static const int fileVersion = 6;
  bool readOnly = false;
  bool readOnlyBecauseOfVersion = false;

  String filePath;

  final List<Stroke> strokes;
  final List<EditorImage> images;
  int nextImageId;
  Color? backgroundColor;
  String backgroundPattern;
  int lineHeight;
  List<EditorPage> pages;

  /// Stores the current page index so that it can be restored when the file is reloaded.
  int? initialPageIndex;

  static final empty = EditorCoreInfo._(
    filePath: '',
    readOnly: true,
    readOnlyBecauseOfVersion: false,
    strokes: [],
    images: [],
    nextImageId: 0,
    backgroundColor: null,
    backgroundPattern: '',
    lineHeight: Prefs.lastLineHeight.value,
    pages: [EditorPage()],
    initialPageIndex: null,
  );

  bool get isEmpty => strokes.isEmpty && images.isEmpty && pages.every((EditorPage page) => page.quill.controller.document.isEmpty());

  EditorCoreInfo({
    required this.filePath,
    this.readOnly = true, // default to read-only, until it's loaded with [loadFromFilePath]
  }):
        strokes = [],
        images = [],
        nextImageId = 0,
        backgroundPattern = Prefs.lastBackgroundPattern.value,
        lineHeight = Prefs.lastLineHeight.value,
        pages = [];

  EditorCoreInfo._({
    required this.filePath,
    required this.readOnly,
    required this.readOnlyBecauseOfVersion,
    required this.strokes,
    required this.images,
    required this.nextImageId,
    this.backgroundColor,
    required this.backgroundPattern,
    required this.lineHeight,
    required this.pages,
    required this.initialPageIndex,
    double? fallbackPageWidth,
    double? fallbackPageHeight,
  }) {
    _handleEmptyPages(fallbackPageWidth, fallbackPageHeight);
    _handleEmptyImageIds();
  }

  factory EditorCoreInfo.fromJson(Map<String, dynamic> json, {
    required String filePath,
    bool readOnly = false,
  }) {
    bool readOnlyBecauseOfVersion = (json["v"] as int? ?? 0) > fileVersion;
    readOnly = readOnly || readOnlyBecauseOfVersion;

    return EditorCoreInfo._(
      filePath: filePath,
      readOnly: readOnly,
      readOnlyBecauseOfVersion: readOnlyBecauseOfVersion,
      strokes: _parseStrokesJson(json["s"] as List),
      images: _parseImagesJson(
        json["i"] as List? ?? [],
        allowCalculations: !readOnly,
      ),
      nextImageId: json["ni"] as int? ?? 0,
      backgroundColor: json["b"] != null ? Color(json["b"] as int) : null,
      backgroundPattern: json["p"] as String? ?? CanvasBackgroundPatterns.none,
      lineHeight: json["l"] as int? ?? Prefs.lastLineHeight.value,
      pages: _parsePagesJson(json["z"] as List?),
      initialPageIndex: json["c"] as int?,
      fallbackPageWidth: json["w"] as double?,
      fallbackPageHeight: json["h"] as double?,
    );
  }
  /// Old json format is just a list of strokes
  EditorCoreInfo.fromOldJson(List<dynamic> json, {
    required this.filePath,
  }):
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
    if (jsonString == null) return EditorCoreInfo(filePath: path, readOnly: readOnly);

    try {
      final dynamic json = await Executor().execute(fun1: _jsonDecodeIsolate, arg1: jsonString);
      if (json is List) { // old format
        return EditorCoreInfo.fromOldJson(json, filePath: path);
      } else {
        return EditorCoreInfo.fromJson(
          json as Map<String, dynamic>,
          filePath: path,
          readOnly: readOnly
        );
      }
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return EditorCoreInfo(filePath: path, readOnly: readOnly);
      }
    }
  }

  static dynamic _jsonDecodeIsolate(String json, TypeSendPort port) {
    return jsonDecode(json);
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
    'c': initialPageIndex,
  };

  EditorCoreInfo copyWith({
    String? filePath,
    bool? readOnly,
    bool? readOnlyBecauseOfVersion,
    List<Stroke>? strokes,
    List<EditorImage>? images,
    int? nextImageId,
    Color? backgroundColor,
    String? backgroundPattern,
    int? lineHeight,
    QuillController? quillController,
    List<EditorPage>? pages,
  }) {
    return EditorCoreInfo._(
      filePath: filePath ?? this.filePath,
      readOnly: readOnly ?? this.readOnly,
      readOnlyBecauseOfVersion: readOnlyBecauseOfVersion ?? this.readOnlyBecauseOfVersion,
      strokes: strokes ?? this.strokes,
      images: images ?? this.images,
      nextImageId: nextImageId ?? this.nextImageId,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundPattern: backgroundPattern ?? this.backgroundPattern,
      lineHeight: lineHeight ?? this.lineHeight,
      pages: pages ?? this.pages,
      initialPageIndex: initialPageIndex,
    );
  }
}
