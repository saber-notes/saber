import 'dart:async';
import 'dart:convert';

import 'package:archive/archive_io.dart';
import 'package:bson/bson.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/canvas/_asset_cache.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/stroke_properties.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:worker_manager/worker_manager.dart';

class EditorCoreInfo {
  static final log = Logger('EditorCoreInfo');

  /// The version of the file format.
  /// Increment this if earlier versions of the app can't satisfiably read the file.
  ///
  /// Version history:
  /// - 19: Assets are now stored in separate files, and added the `sba` file format.
  /// - 18: [Pencil] tool introduced
  /// - 17: [PdfEditorImage] introduced
  /// - 16: [ShapePen] tool introduced
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
  static const sbnVersion = 19;
  var readOnly = false;
  var readOnlyBecauseOfVersion = false;
  var readOnlyBecauseWatchingServer = false;

  String filePath;

  /// The file name without its parent directories.
  String get fileName => filePath.substring(filePath.lastIndexOf('/') + 1);

  AssetCache assetCache;
  int nextImageId;
  Color? backgroundColor;
  CanvasBackgroundPattern backgroundPattern;
  int lineHeight;
  int lineThickness;
  List<EditorPage> pages;

  /// Stores the current page index so that it can be restored when the file is reloaded.
  int? initialPageIndex;

  static final empty =
      EditorCoreInfo._(
        filePath: '',
        readOnly: true,
        readOnlyBecauseOfVersion: false,
        nextImageId: 0,
        backgroundColor: null,
        backgroundPattern: CanvasBackgroundPattern.none,
        lineHeight: stows.lastLineHeight.value,
        lineThickness: stows.lastLineThickness.value,
        pages: [],
        initialPageIndex: null,
        assetCache: null,
      ).._migrateOldStrokesAndImages(
        fileVersion: sbnVersion,
        strokesJson: null,
        imagesJson: null,
        inlineAssets: null,
        onlyFirstPage: true,
      );

  bool get isEmpty => pages.every((EditorPage page) => page.isEmpty);
  bool get isNotEmpty => !isEmpty;

  EditorCoreInfo({
    required this.filePath,
    this.readOnly =
        true, // default to read-only, until it's loaded with [loadFromFilePath]
  }) : nextImageId = 0,
       backgroundPattern = stows.lastBackgroundPattern.value,
       lineHeight = stows.lastLineHeight.value,
       lineThickness = stows.lastLineThickness.value,
       pages = [],
       assetCache = AssetCache();

  EditorCoreInfo._({
    required this.filePath,
    required this.readOnly,
    required this.readOnlyBecauseOfVersion,
    required this.nextImageId,
    this.backgroundColor,
    required this.backgroundPattern,
    required this.lineHeight,
    required this.lineThickness,
    required this.pages,
    required this.initialPageIndex,
    required AssetCache? assetCache,
  }) : assetCache = assetCache ?? AssetCache() {
    _handleEmptyImageIds();
  }

  factory EditorCoreInfo.fromJson(
    Map<String, dynamic> json, {
    required String filePath,
    required bool readOnly,
    required bool onlyFirstPage,
  }) {
    final fileVersion = json['v'] as int? ?? 0;
    final readOnlyBecauseOfVersion = fileVersion > sbnVersion;
    readOnly = readOnly || readOnlyBecauseOfVersion;

    /// Note that inline assets aren't used anymore
    /// since sbnVersion 19.
    final List<Uint8List>? inlineAssets = (json['a'] as List?)
        ?.map(
          (asset) => switch (asset) {
            (final String base64) => base64Decode(base64),
            (final Uint8List bytes) => bytes,
            (final List<dynamic> bytes) => Uint8List.fromList(
              bytes.cast<int>(),
            ),
            (final BsonBinary bsonBinary) => bsonBinary.byteList,
            _ => () {
              log.severe('Invalid asset type: ${asset.runtimeType}');
              return Uint8List(0);
            }(),
          },
        )
        .toList();

    final Color? backgroundColor;
    switch (json['b']) {
      case (final int value):
        backgroundColor = Color(value);
      case (final Int64 value):
        backgroundColor = Color(value.toInt());
      case null:
        backgroundColor = null;
      default:
        throw Exception(
          'Invalid color value: (${json['b'].runtimeType}) ${json['b']}',
        );
    }

    final assetCache = AssetCache();

    return EditorCoreInfo._(
        filePath: filePath,
        readOnly: readOnly,
        readOnlyBecauseOfVersion: readOnlyBecauseOfVersion,
        nextImageId: json['ni'] as int? ?? 0,
        backgroundColor: backgroundColor,
        backgroundPattern: () {
          final pattern = json['p'] as String?;
          for (final p in CanvasBackgroundPattern.values) {
            if (p.name == pattern) return p;
          }
          return CanvasBackgroundPattern.none;
        }(),
        lineHeight: json['l'] as int? ?? stows.lastLineHeight.value,
        lineThickness: json['lt'] as int? ?? stows.lastLineThickness.value,
        pages: _parsePagesJson(
          json['z'] as List?,
          inlineAssets: inlineAssets,
          readOnly: readOnly,
          onlyFirstPage: onlyFirstPage,
          fileVersion: fileVersion,
          sbnPath: filePath,
          assetCache: assetCache,
        ),
        initialPageIndex: json['c'] as int?,
        assetCache: assetCache,
      )
      .._migrateOldStrokesAndImages(
        fileVersion: fileVersion,
        strokesJson: json['s'] as List?,
        imagesJson: json['i'] as List?,
        inlineAssets: inlineAssets,
        fallbackPageSize: json['w'] != null && json['h'] != null
            ? Size(json['w'] as double, json['h'] as double)
            : null,
        onlyFirstPage: onlyFirstPage,
      )
      .._sortStrokes();
  }

  /// Old json format is just a list of strokes
  EditorCoreInfo.fromOldJson(
    List<dynamic> json, {
    required this.filePath,
    this.readOnly = false,
    required bool onlyFirstPage,
  }) : nextImageId = 0,
       backgroundPattern = CanvasBackgroundPattern.none,
       lineHeight = stows.lastLineHeight.value,
       lineThickness = stows.lastLineThickness.value,
       pages = [],
       assetCache = AssetCache() {
    _migrateOldStrokesAndImages(
      fileVersion: 0,
      strokesJson: json,
      imagesJson: null,
      inlineAssets: null,
      onlyFirstPage: onlyFirstPage,
    );
    _sortStrokes();
  }

  static List<EditorPage> _parsePagesJson(
    List<dynamic>? pages, {
    required List<Uint8List>? inlineAssets,
    required bool readOnly,
    required bool onlyFirstPage,
    required int fileVersion,
    required String sbnPath,
    required AssetCache assetCache,
  }) {
    if (pages == null || pages.isEmpty) return [];
    if (pages[0] is List) {
      // old format (list of [width, height])
      return pages
          .take(onlyFirstPage ? 1 : pages.length)
          .map(
            (dynamic page) => EditorPage(
              width: page[0] as double?,
              height: page[1] as double?,
            ),
          )
          .toList();
    } else {
      return pages
          .take(onlyFirstPage ? 1 : pages.length)
          .map(
            (dynamic page) => EditorPage.fromJson(
              page as Map<String, dynamic>,
              inlineAssets: inlineAssets,
              readOnly: readOnly,
              fileVersion: fileVersion,
              sbnPath: sbnPath,
              assetCache: assetCache,
            ),
          )
          .toList();
    }
  }

  void _handleEmptyImageIds() {
    for (final page in pages) {
      for (final image in page.images) {
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
    required List<Uint8List>? inlineAssets,
    Size? fallbackPageSize,
    required bool onlyFirstPage,
  }) {
    if (strokesJson != null) {
      final hasSize = HasSize(fallbackPageSize ?? EditorPage.defaultSize);
      final strokes = EditorPage.parseStrokesJson(
        strokesJson,
        page: hasSize,
        onlyFirstPage: onlyFirstPage,
        fileVersion: fileVersion,
      );
      for (final stroke in strokes) {
        if (onlyFirstPage) assert(stroke.pageIndex == 0);
        while (stroke.pageIndex >= pages.length) {
          pages.add(EditorPage(size: fallbackPageSize));
        }
        pages[stroke.pageIndex].insertStroke(stroke);
      }
    }

    if (imagesJson != null) {
      final images = EditorPage.parseImagesJson(
        imagesJson,
        inlineAssets: inlineAssets,
        isThumbnail: readOnly,
        onlyFirstPage: onlyFirstPage,
        sbnPath: filePath,
        assetCache: assetCache,
      );
      for (final image in images) {
        if (onlyFirstPage) assert(image.pageIndex == 0);
        while (image.pageIndex >= pages.length) {
          pages.add(EditorPage(size: fallbackPageSize));
        }
        pages[image.pageIndex].images.add(image);
      }
    }

    // add a page if there are no pages,
    // or if the last page is not empty
    if (pages.isEmpty || pages.last.isNotEmpty && !onlyFirstPage) {
      pages.add(EditorPage(size: fallbackPageSize));
    }

    // delete points that are too close to each other
    if (fileVersion < 12) {
      for (final page in pages) {
        for (final stroke in page.strokes) {
          stroke.optimisePoints();
        }
      }
    }
  }

  void _sortStrokes() {
    for (final page in pages) {
      page.sortStrokes();
    }
  }

  static Future<EditorCoreInfo> loadFromFilePath(
    String path, {
    bool readOnly = false,
    bool onlyFirstPage = false,
  }) async {
    final bsonBytes = await FileManager.readFile(path + Editor.extension);

    final String? jsonString;
    if (bsonBytes != null) {
      jsonString = null;
    } else {
      final jsonBytes = await FileManager.readFile(
        path + Editor.extensionOldJson,
      );
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
      if (alwaysUseIsolate || length > 2 * 1024 * 1024) {
        // > 2 MB, run on a separate isolate
        final documentsDirectory = FileManager.documentsDirectory;
        coreInfo = await workerManager.execute(
          () async {
            // We need to rerun some "init" methods in the isolate,
            // see https://github.com/saber-notes/saber/issues/1031.
            FlavorConfig.setupFromEnvironment();
            await FileManager.init(
              documentsDirectory: documentsDirectory,
              shouldWatchRootDirectory: false,
            );
            StrokeOptionsExtension.setDefaults();
            return isolate();
          },
          // less important than [WorkPriority.immediately]
          priority: WorkPriority.veryHigh,
        );
      } else {
        // if the file is small, just run it on the main thread
        coreInfo = isolate();
      }
    } catch (e) {
      log.severe('Failed to load file: $e', e);
      if (kDebugMode) {
        rethrow;
      } else {
        coreInfo = EditorCoreInfo(filePath: path, readOnly: readOnly);
      }
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
        json = BsonCodec.deserialize(bsonBinary);
      } else if (jsonString != null) {
        json = jsonDecode(jsonString);
      } else {
        throw ArgumentError('Both bsonBytes and jsonString are null');
      }
    } catch (e) {
      log.severe('Failed to parse file: $e', e);
      rethrow;
    }

    if (json == null) {
      throw Exception('Failed to parse json');
    } else if (json is List) {
      // old format
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

  /// Returns the json map and a list of assets.
  /// Assets are stored in separate files.
  (Map<String, dynamic> json, OrderedAssetCache) toJson() {
    /// This will be populated in various [toJson] methods.
    final OrderedAssetCache assets = OrderedAssetCache();

    final json = {
      'v': sbnVersion,
      'ni': nextImageId,
      'b': backgroundColor?.toARGB32(),
      'p': backgroundPattern.name,
      'l': lineHeight,
      'lt': lineThickness,
      'z': pages.map((EditorPage page) => page.toJson(assets)).toList(),
      'c': initialPageIndex,
    };

    return (json, assets);
  }

  /// Converts the current note as an SBA (Saber Archive) file,
  /// which contains the main bson file and all the assets
  /// compressed into a zip file.
  ///
  /// In the archive, the main bson file is named `main.sbn2`,
  /// and the assets are named `main.sbn2.0`, `main.sbn2.1`, etc.
  ///
  /// If [currentPageIndex] isn't null,
  /// [initialPageIndex] will be updated to it before saving.
  Future<List<int>> saveToSba({required int? currentPageIndex}) async {
    final (bson, assets) = saveToBinary(currentPageIndex: currentPageIndex);
    const filePath = 'main${Editor.extension}';

    final archive = Archive();
    archive.addFile(ArchiveFile(filePath, bson.length, bson));

    await Future.wait([
      for (int i = 0; i < assets.length; ++i)
        assets
            .getBytes(i)
            .then(
              (bytes) => archive.addFile(
                ArchiveFile('$filePath.$i', bytes.length, bytes),
              ),
            ),
    ]);

    return ZipEncoder().encode(archive);
  }

  /// Returns the bson bytes and the assets.
  (Uint8List bson, OrderedAssetCache assets) saveToBinary({
    required int? currentPageIndex,
  }) {
    initialPageIndex = currentPageIndex ?? initialPageIndex;
    final (json, assets) = toJson();
    final bson = BsonCodec.serialize(json);
    return (bson.byteList, assets);
  }

  void dispose() {
    for (final page in pages) {
      page.dispose();
    }
    assetCache.dispose();
  }

  EditorCoreInfo copyWith({
    String? filePath,
    bool? readOnly,
    bool? readOnlyBecauseOfVersion,
    int? nextImageId,
    Color? backgroundColor,
    CanvasBackgroundPattern? backgroundPattern,
    int? lineHeight,
    int? lineThickness,
    List<EditorPage>? pages,
  }) {
    return EditorCoreInfo._(
      filePath: filePath ?? this.filePath,
      readOnly: readOnly ?? this.readOnly,
      readOnlyBecauseOfVersion:
          readOnlyBecauseOfVersion ?? this.readOnlyBecauseOfVersion,
      nextImageId: nextImageId ?? this.nextImageId,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundPattern: backgroundPattern ?? this.backgroundPattern,
      lineHeight: lineHeight ?? this.lineHeight,
      lineThickness: lineThickness ?? this.lineThickness,
      pages: pages ?? this.pages,
      initialPageIndex: initialPageIndex,
      assetCache: assetCache,
    );
  }
}
