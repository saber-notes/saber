import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/canvas/_editor_image.dart';

class SvgEditorImage extends EditorImage {
  String svgString;

  static final log = Logger('SvgEditorImage');

  SvgEditorImage({
    required super.id,
    required this.svgString,
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
  }) :  super(
          extension: '.svg',
          bytes: Uint8List(0),
        );

  factory SvgEditorImage.fromJson(Map<String, dynamic> json, {
    required List<Uint8List> assets,
    bool isThumbnail = false,
    bool onMainThread = true,
  }) {
    String? extension = json['e'] as String?;
    assert(extension == null || extension == '.svg');

    final assetIndex = json['a'] as int?;
    final String svgString;
    if (assetIndex != null) {
      svgString = utf8.decode(assets[assetIndex]);
    } else if (json['b'] != null) {
      svgString = json['b'] as String;
    } else {
      log.warning('SvgEditorImage.fromJson: no svg string found');
      svgString = '';
    }

    return SvgEditorImage(
      id: json['id'] ?? -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
      svgString: svgString,
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
  Map<String, dynamic> toJson(List<Uint8List> assets) {
    final json = super.toJson(
      assets,
    );

    // remove non-svg fields
    json.remove('t'); // thumbnail bytes
    assert(!json.containsKey('a'));
    assert(!json.containsKey('b'));

    Uint8List svgBytes = Uint8List.fromList(utf8.encode(svgString));
    int assetIndex = assets.indexOf(svgBytes);
    if (assetIndex == -1) {
      assetIndex = assets.length;
      assets.add(svgBytes);
    }
    json['a'] = assetIndex;

    return json;
  }

  @override
  Future<void> getImage({Size? pageSize, bool allowCalculations = true}) async {
    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      final PictureInfo pictureInfo = await vg.loadPicture(SvgStringLoader(svgString), null);
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
    final loader = SvgStringLoader(svgString);
    final pictureInfo = await vg.loadPicture(loader, null);
    pictureInfo.picture.dispose();
  }

  @override
  Widget buildImageWidget({
    required BoxFit? overrideBoxFit,
    required bool isBackground,
  }) {
    final BoxFit boxFit;
    if (overrideBoxFit != null) {
      boxFit = overrideBoxFit;
    } else if (isBackground) {
      boxFit = backgroundFit;
    } else {
      boxFit = BoxFit.fill;
    }

    return SvgPicture.string(
      svgString,
      fit: boxFit,
      theme: const SvgTheme(
        currentColor: Colors.black,
      ),
    );
  }
}
