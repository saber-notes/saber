import 'dart:convert';

import 'package:bson/bson.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:worker_manager/worker_manager.dart';

class EditorCoreInfo {
  static final log = Logger('EditorCoreInfo');

  /// The version of the file format.
  /// Increment this if earlier versions of the app can't satisfiably read the file.
  /// 
  /// Version history:
  /// - 17: [PdfEditorImage] introduced
  /// - 16: [ShapePen] introduced
  /// - 15: Tablature background pattern
  /// - 14: Store images as BsonBinary
  /// - 13: Save points as BsonBinary
  /// - 12: Don't store empty pressure
  /// - 11: Centralise storage of image assets
  /// - 10: Remove old inversion code
  /// - 9: Add [Stroke.offset] property
  /// - 8: Store strokes and images in their respective pages
  /// - 7: Set image as background
  /// - 6: Save Quill data
  /// - 5: Store images' file extension
  /// - 4: Store page sizes in [EditorPage.size]
  /// - 3: Store page sizes for each page
  /// - 2: Store width and height in sbn
  /// - 1: Store version in sbn
  static const int sbnVersion = 17;
  bool readOnly = false;
  bool readOnlyBecauseOfVersion = false;

  String filePath;

  int nextImageId;
  Color? backgroundColor;
  CanvasBackgroundPattern backgroundPattern;
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
    backgroundPattern: CanvasBackgroundPattern.none,
    lineHeight: Prefs.lastLineHeight.value,
    pages: [],
    initialPageIndex: null,
  )
    .._migrateOldStrokesAndImages(
      fileVersion: sbnVersion,
      strokesJson: null,
      imagesJson: null,
      assets: const [],
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
    final fileVersion = json['v'] as int? ?? 0;
    bool readOnlyBecauseOfVersion = fileVersion > sbnVersion;
    readOnly = readOnly || readOnlyBecauseOfVersion;

    List<Uint8List>? assets = (json['a'] as List<dynamic>?)
        ?.map((asset) => switch (asset) {
          (String base64) => base64Decode(base64),
          (Uint8List bytes) => bytes,
          (List<dynamic> bytes) => Uint8List.fromList(bytes.cast<int>()),
          (BsonBinary bsonBinary) => bsonBinary.byteList,
          _ => (){
            log.severe('Invalid asset type in $filePath: ${asset.runtimeType}');
            return Uint8List(0);
          }(),
        })
        .toList();

    final Color? backgroundColor;
    switch (json['b']) {
      case (int value):
        backgroundColor = Color(value);
      case (Int64 value):
        backgroundColor = Color(value.toInt());
      case null:
        backgroundColor = null;
      default:
        throw Exception('Invalid color value: (${json['b'].runtimeType}) ${json['b']}');
    }

    return EditorCoreInfo._(
      filePath: filePath,
      readOnly: readOnly,
      readOnlyBecauseOfVersion: readOnlyBecauseOfVersion,
      nextImageId: json['ni'] as int? ?? 0,
      backgroundColor: backgroundColor,
      backgroundPattern: (){
        final String? pattern = json['p'] as String?;
        for (CanvasBackgroundPattern p in CanvasBackgroundPattern.values) {
          if (p.name == pattern) return p;
        }
        return CanvasBackgroundPattern.none;
      }(),
      lineHeight: json['l'] as int? ?? Prefs.lastLineHeight.value,
      pages: _parsePagesJson(
        json['z'] as List?,
        assets: assets,
        readOnly: readOnly,
        onlyFirstPage: onlyFirstPage,
        fileVersion: fileVersion,
      ),
      initialPageIndex: json['c'] as int?,
    )
      .._migrateOldStrokesAndImages(
        fileVersion: fileVersion,
        strokesJson: json['s'] as List?,
        imagesJson: json['i'] as List?,
        assets: assets,
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
      backgroundPattern = CanvasBackgroundPattern.none,
      lineHeight = Prefs.lastLineHeight.value,
      pages = [] {
    _migrateOldStrokesAndImages(
      fileVersion: 0,
      strokesJson: json,
      imagesJson: null,
      assets: null,
      onlyFirstPage: onlyFirstPage,
    );
    _sortStrokes();
  }

  static List<EditorPage> _parsePagesJson(List<dynamic>? pages, {
    required List<Uint8List>? assets,
    required bool readOnly,
    required bool onlyFirstPage,
    required int fileVersion,
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
          assets: assets ?? const [],
          readOnly: readOnly,
          fileVersion: fileVersion,
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

  /// Performs the following migrations:
  /// 
  /// Migrates from fileVersion 7 to 8.
  /// In version 8, strokes and images are stored in their respective pages.
  ///
  /// Creates a page if there are no pages.
  /// 
  /// Migrates from fileVersion 11 to 12.
  /// In version 12, points are deleted if they are too close to each other.
  void _migrateOldStrokesAndImages({
    required int fileVersion,
    required List<dynamic>? strokesJson,
    required List<dynamic>? imagesJson,
    required List<Uint8List>? assets,
    double? fallbackPageWidth,
    double? fallbackPageHeight,
    required bool onlyFirstPage,
  }) {
    if (strokesJson != null) {
      final strokes = EditorPage.parseStrokesJson(
        strokesJson,
        onlyFirstPage: onlyFirstPage,
        fileVersion: fileVersion,
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
        assets: assets ?? const [],
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

    // delete points that are too close to each other
    if (fileVersion < 12) {
      for (EditorPage page in pages) {
        for (Stroke stroke in page.strokes) {
          stroke.optimisePoints();
        }
      }
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
    final bsonBytes = await FileManager.readFile(path + Editor.extension);

    final String? jsonString;
    if (bsonBytes != null) {
      jsonString = null;
    } else {
      final jsonBytes = await FileManager.readFile(path + Editor.extensionOldJson);
      jsonString = jsonBytes != null ? utf8.decode(jsonBytes) : null;
    }
    
    if (bsonBytes == null && jsonString == null) {
      return EditorCoreInfo(filePath: path, readOnly: readOnly);
    }

    return loadFromFileContents(
      jsonString: jsonString,
      bsonBytes: bsonBytes,
      path: path,
      readOnly: readOnly,
      onlyFirstPage: onlyFirstPage,
    );
  }

  @visibleForTesting
  static Future<EditorCoreInfo> loadFromFileContents({
    String? jsonString,
    Uint8List? bsonBytes,
    required String path,
    required bool readOnly,
    required bool onlyFirstPage,
    bool alwaysUseIsolate = false,
  }) async {
    EditorCoreInfo coreInfo;
    try {
      EditorCoreInfo isolate() => _loadFromFileIsolate(
        jsonString,
        bsonBytes,
        path,
        readOnly,
        onlyFirstPage,
      );

      final length = jsonString?.length ?? bsonBytes!.length;
      if (alwaysUseIsolate || length > 2 * 1024 * 1024) { // 2 MB
        coreInfo = await workerManager.execute(
          isolate,
          priority: WorkPriority.veryHigh, // less important than [WorkPriority.immediately]
        );
      } else {
        // if the file is small, just run it on the main thread
        coreInfo = isolate();
      }
    } catch (e) {
      log.severe('Failed to load file from $path: $e', e);
      if (kDebugMode) {
        rethrow;
      } else {
        coreInfo = EditorCoreInfo(filePath: path, readOnly: readOnly);
      }
    }

    // now that we're back on the main thread,
    // we can parse the images
    for (final page in coreInfo.pages) {
      for (final image in page.images) {
        await image.getImage(pageSize: page.size);
      }
      page.backgroundImage?.getImage(pageSize: page.size);
    }

    return coreInfo;
  }

  static EditorCoreInfo _loadFromFileIsolate(
      String? jsonString,
      Uint8List? bsonBytes,
      String path,
      bool readOnly,
      bool onlyFirstPage,
  ) {
    final dynamic json;
    try {
      if (bsonBytes != null) {
        final bsonBinary = BsonBinary.from(bsonBytes);
        json = BSON().deserialize(bsonBinary);
      } else if (jsonString != null) {
        json = jsonDecode(jsonString);
      } else {
        throw ArgumentError('Both bsonBytes and jsonString are null');
      }
    } catch (e) {
      log.severe('Failed to parse file from $path: $e', e);
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

  Map<String, dynamic> toJson() {
    /// This will be populated in various [toJson] methods.
    final List<Uint8List> assets = [];

    final json = {
      'v': sbnVersion,
      'ni': nextImageId,
      'b': backgroundColor?.value,
      'p': backgroundPattern.name,
      'l': lineHeight,
      'z': pages.map((EditorPage page) => page.toJson(assets)).toList(),
      'c': initialPageIndex,
    };

    json['a'] = assets.map((Uint8List asset) => BsonBinary.from(asset)).toList();
    return json;
  }

  EditorCoreInfo copyWith({
    String? filePath,
    bool? readOnly,
    bool? readOnlyBecauseOfVersion,
    int? nextImageId,
    Color? backgroundColor,
    CanvasBackgroundPattern? backgroundPattern,
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
