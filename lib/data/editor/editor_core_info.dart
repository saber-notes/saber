import 'dart:convert';

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
  static const int sbnVersion = 9;
  bool readOnly = false;
  bool readOnlyBecauseOfVersion = false;

  String filePath;

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
    nextImageId: 0,
    backgroundColor: null,
    backgroundPattern: '',
    lineHeight: Prefs.lastLineHeight.value,
    pages: [],
    initialPageIndex: null,
  )
    .._migrateOldStrokesAndImages(
      strokesJson: null,
      imagesJson: null,
      onlyFirstPage: true,
    );

  bool get isEmpty => pages.every((EditorPage page) => page.isEmpty);
  bool get isNotEmpty => !isEmpty;

  EditorCoreInfo({
    required this.filePath,
    this.readOnly = true, // default to read-only, until it's loaded with [loadFromFilePath]
  }):
        nextImageId = 0,
        backgroundPattern = Prefs.lastBackgroundPattern.value,
        lineHeight = Prefs.lastLineHeight.value,
        pages = [];

  EditorCoreInfo._({
    required this.filePath,
    required this.readOnly,
    required this.readOnlyBecauseOfVersion,
    required this.nextImageId,
    this.backgroundColor,
    required this.backgroundPattern,
    required this.lineHeight,
    required this.pages,
    required this.initialPageIndex,
  }) {
    _handleEmptyImageIds();
  }

  factory EditorCoreInfo.fromJson(Map<String, dynamic> json, {
    required String filePath,
    required bool readOnly,
    required bool onlyFirstPage,
  }) {
    bool readOnlyBecauseOfVersion = (json['v'] as int? ?? 0) > sbnVersion;
    readOnly = readOnly || readOnlyBecauseOfVersion;

    return EditorCoreInfo._(
      filePath: filePath,
      readOnly: readOnly,
      readOnlyBecauseOfVersion: readOnlyBecauseOfVersion,
      nextImageId: json['ni'] as int? ?? 0,
      backgroundColor: json['b'] != null ? Color(json['b'] as int) : null,
      backgroundPattern: json['p'] as String? ?? CanvasBackgroundPatterns.none,
      lineHeight: json['l'] as int? ?? Prefs.lastLineHeight.value,
      pages: _parsePagesJson(
        json['z'] as List?,
        readOnly: readOnly,
        onlyFirstPage: onlyFirstPage,
      ),
      initialPageIndex: json['c'] as int?,
    )
      .._migrateOldStrokesAndImages(
        strokesJson: json['s'] as List?,
        imagesJson: json['i'] as List?,
        fallbackPageWidth: json['w'] as double?,
        fallbackPageHeight: json['h'] as double?,
        onlyFirstPage: onlyFirstPage,
      )
      .._sortStrokes();
  }
  /// Old json format is just a list of strokes
  EditorCoreInfo.fromOldJson(List<dynamic> json, {
    required this.filePath,
    this.readOnly = false,
    required bool onlyFirstPage,
  }): nextImageId = 0,
      backgroundPattern = CanvasBackgroundPatterns.none,
      lineHeight = Prefs.lastLineHeight.value,
      pages = [] {
    _migrateOldStrokesAndImages(
      strokesJson: json,
      imagesJson: null,
      onlyFirstPage: onlyFirstPage,
    );
    _sortStrokes();
  }

  static List<EditorPage> _parsePagesJson(List<dynamic>? pages, {
    required bool readOnly,
    required bool onlyFirstPage,
  }) {
    if (pages == null || pages.isEmpty) return [];
    if (pages[0] is List) { // old format (list of [width, height])
      return pages
        .take(onlyFirstPage ? 1 : pages.length)
        .map((dynamic page) => EditorPage(
          width: page[0] as double?,
          height: page[1] as double?,
        ))
        .toList();
    } else {
      return pages
        .take(onlyFirstPage ? 1 : pages.length)
        .map((dynamic page) => EditorPage.fromJson(
          page as Map<String, dynamic>,
          readOnly: readOnly,
        ))
        .toList();
    }
  }

  void _handleEmptyImageIds() {
    for (EditorPage page in pages) {
      for (EditorImage image in page.images) {
        if (image.id == -1) image.id = nextImageId++;
      }
    }
  }

  /// Migrates from fileVersion 7 to 8.
  /// In version 8, strokes and images are stored in their respective pages.
  ///
  /// Also creates a page if there are no pages.
  void _migrateOldStrokesAndImages({
    required List<dynamic>? strokesJson,
    required List<dynamic>? imagesJson,
    double? fallbackPageWidth,
    double? fallbackPageHeight,
    required bool onlyFirstPage,
  }) {
    if (strokesJson != null) {
      final strokes = EditorPage.parseStrokesJson(
        strokesJson,
        onlyFirstPage: onlyFirstPage,
      );
      for (Stroke stroke in strokes) {
        if (onlyFirstPage) assert(stroke.pageIndex == 0);
        while (stroke.pageIndex >= pages.length) {
          pages.add(EditorPage(width: fallbackPageWidth, height: fallbackPageHeight));
        }
        pages[stroke.pageIndex].insertStroke(stroke);
      }
    }

    if (imagesJson != null) {
      final images = EditorPage.parseImagesJson(
        imagesJson,
        isThumbnail: readOnly,
        onlyFirstPage: onlyFirstPage,
      );
      for (EditorImage image in images) {
        if (onlyFirstPage) assert(image.pageIndex == 0);
        while (image.pageIndex >= pages.length) {
          pages.add(EditorPage(width: fallbackPageWidth, height: fallbackPageHeight));
        }
        pages[image.pageIndex].images.add(image);
      }
    }

    // add a page if there are no pages,
    // or if the last page is not empty
    if (pages.isEmpty || pages.last.isNotEmpty && !onlyFirstPage) {
      pages.add(EditorPage(width: fallbackPageWidth, height: fallbackPageHeight));
    }
  }

  void _sortStrokes() {
    for (EditorPage page in pages) {
      page.sortStrokes();
    }
  }

  static Future<EditorCoreInfo> loadFromFilePath(String path, {
    bool readOnly = false,
    bool onlyFirstPage = false,
  }) async {
    String? jsonString = await FileManager.readFile(path + Editor.extension);
    if (jsonString == null) return EditorCoreInfo(filePath: path, readOnly: readOnly);

    return loadFromFileContents(
      jsonString,
      path: path,
      readOnly: readOnly,
      onlyFirstPage: onlyFirstPage,
    );
  }

  @visibleForTesting
  static Future<EditorCoreInfo> loadFromFileContents(String jsonString, {
    required String path,
    required bool readOnly,
    required bool onlyFirstPage,
  }) async {
    try {
      // decide whether to use isolate or not
      if (jsonString.length < 2 * 1024 * 1024) { // 2 MB
        return _loadFromFileIsolate(
          jsonString,
          path,
          readOnly,
          onlyFirstPage,
        );
      } else {
        return await Executor().execute(
          fun4: _loadFromFileIsolate,
          arg1: jsonString,
          arg2: path,
          arg3: readOnly,
          arg4: onlyFirstPage,
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

  static EditorCoreInfo _loadFromFileIsolate(
      String jsonString,
      String path,
      bool readOnly,
      bool onlyFirstPage,

      [TypeSendPort? port]
  ) {
    final dynamic json;
    try {
      json = jsonDecode(jsonString);
    } catch (e) {
      if (kDebugMode) print('Failed to parse json from $path: $e');
      rethrow;
    }

    if (json == null) {
      throw Exception('Failed to parse json from $path');
    } else if (json is List) { // old format
      return EditorCoreInfo.fromOldJson(
        json,
        filePath: path,
        readOnly: readOnly,
        onlyFirstPage: onlyFirstPage,
      );
    } else {
      return EditorCoreInfo.fromJson(
        json as Map<String, dynamic>,
        filePath: path,
        readOnly: readOnly,
        onlyFirstPage: onlyFirstPage,
      );
    }
  }

  Map<String, dynamic> toJson() => {
    'v': sbnVersion,
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
      nextImageId: nextImageId ?? this.nextImageId,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundPattern: backgroundPattern ?? this.backgroundPattern,
      lineHeight: lineHeight ?? this.lineHeight,
      pages: pages ?? this.pages,
      initialPageIndex: initialPageIndex,
    );
  }
}
