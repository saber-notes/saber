import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/canvas/_asset_cache.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/pages/editor/editor.dart';

class SvgEditorImage extends EditorImage {
  String? svgString;

  /// If the svg needs to be loaded from disk, this is the File
  /// that the svg will be loaded from.
  final File? svgFile;

  static final log = Logger('SvgEditorImage');

  SvgEditorImage({
    required super.id,
    required super.assetCache,
    required this.svgString,
    required this.svgFile,
    required super.pageIndex,
    required super.pageSize,
    super.invertible,
    super.backgroundFit,
    required super.onMoveImage,
    required super.onDeleteImage,
    required super.onMiscChange,
    super.onLoad,
    super.newImage,
    super.dstRect,
    super.srcRect,
    super.naturalSize,
    super.isThumbnail,
    super.onMainThread,
  }): assert(svgString != null || svgFile != null, 'svgFile must be set if svgString is null'),
      super(
        extension: '.svg',
        imageProvider: null,
      );

  factory SvgEditorImage.fromJson(Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    bool isThumbnail = false,
    bool onMainThread = true,
    required String sbnPath,
    required AssetCache assetCache,
  }) {
    String? extension = json['e'] as String?;
    assert(extension == null || extension == '.svg');

    final assetIndex = json['a'] as int?;
    final String? svgString;
    File? svgFile;
    if (assetIndex != null) {
      if (inlineAssets == null) {
        svgFile = FileManager.getFile('$sbnPath${Editor.extension}.$assetIndex');
        svgString = assetCache.get(svgFile.path);
      } else {
        svgString = utf8.decode(inlineAssets[assetIndex]);
      }
    } else if (json['b'] != null) {
      svgString = json['b'] as String;
    } else {
      log.warning('SvgEditorImage.fromJson: no svg string found');
      svgString = '';
    }

    return SvgEditorImage(
      id: json['id'] ?? -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
      assetCache: assetCache,
      svgString: svgString,
      svgFile: svgFile,
      pageIndex: json['i'] ?? 0,
      pageSize: Size.infinite,
      invertible: json['v'] ?? true,
      backgroundFit: json['f'] != null ? BoxFit.values[json['f']] : BoxFit.contain,
      onMoveImage: null,
      onDeleteImage: null,
      onMiscChange: null,
      onLoad: null,
      newImage: false,
      dstRect: Rect.fromLTWH(
        json['x'] ?? 0,
        json['y'] ?? 0,
        json['w'] ?? 0,
        json['h'] ?? 0,
      ),
      srcRect: Rect.fromLTWH(
        json['sx'] ?? 0,
        json['sy'] ?? 0,
        json['sw'] ?? 0,
        json['sh'] ?? 0,
      ),
      naturalSize: Size(
        json['nw'] ?? 0,
        json['nh'] ?? 0,
      ),
      isThumbnail: isThumbnail,
      onMainThread: onMainThread,
    );
  }

  @override
  Map<String, dynamic> toJson(OrderedAssetCache assets) {
    final json = super.toJson(assets);

    // remove non-svg fields
    json.remove('t'); // thumbnail bytes
    assert(!json.containsKey('a'));
    assert(!json.containsKey('b'));

    // try to load from cache
    svgString ??= assetCache.get(svgFile!.path);
    if (svgString != null) {
      json['a'] = assets.add(svgString!);
    } else {
      json['a'] = assets.add(svgFile!);
    }

    return json;
  }

  @override
  Future<void> getImage({Size? pageSize, bool allowCalculations = true}) async {
    svgString ??= await svgFile!.readAsString();

    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      final PictureInfo pictureInfo = await vg.loadPicture(SvgStringLoader(svgString!), null);
      naturalSize = pictureInfo.size;

      if (srcRect.shortestSide == 0) {
        srcRect = srcRect.topLeft & naturalSize;
      }
      if (dstRect.shortestSide == 0) {
        final Size dstSize = pageSize != null ? EditorImage.resize(naturalSize, pageSize) : naturalSize;
        dstRect = dstRect.topLeft & dstSize;
      }
    }

    if (naturalSize.shortestSide == 0) {
      naturalSize = Size(srcRect.width, srcRect.height);
    }

    loaded = true;
  }

  @override
  Future<void> precache(BuildContext context) async {
    if (svgString == null) return;
    final loader = SvgStringLoader(svgString!);
    final pictureInfo = await vg.loadPicture(loader, null);
    pictureInfo.picture.dispose();
  }

  @override
  Widget buildImageWidget({
    required BoxFit? overrideBoxFit,
    required bool isBackground,
  }) {
    if (svgString == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final BoxFit boxFit;
    if (overrideBoxFit != null) {
      boxFit = overrideBoxFit;
    } else if (isBackground) {
      boxFit = backgroundFit;
    } else {
      boxFit = BoxFit.fill;
    }

    return SvgPicture.string(
      svgString!,
      fit: boxFit,
      theme: const SvgTheme(
        currentColor: Colors.black,
      ),
    );
  }
}
