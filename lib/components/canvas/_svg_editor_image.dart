import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/data/extensions/color_extensions.dart';

class SvgEditorImage extends EditorImage {
  String svgString;
  String? invertedSvgString;

  @override
  Uint8List get bytes => Uint8List.fromList(utf8.encode(svgString));
  @override
  set bytes(Uint8List bytes) {}

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
  }) :  super(
          extension: '.svg',
          bytes: Uint8List(0),
        );

  factory SvgEditorImage.fromJson(Map<String, dynamic> json, {
    bool isThumbnail = false,
  }) {
    String? extension = json['e'] as String?;
    assert(extension == null || extension == '.svg');
    return SvgEditorImage(
      id: json['id'] ?? -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
      svgString: json['b'] as String,
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
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();

    // remove non-svg fields
    json.remove('b'); // bytes
    json.remove('t'); // thumbnail bytes
    json.remove('it'); // inverted thumbnail bytes

    json['b'] = svgString;

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

    invertedSvgString ??= await invertSvgString(svgString);

    loaded = true;
  }

  @override
  Widget buildImageWidget({
    required Brightness imageBrightness,
    required BoxFit? overrideBoxFit,
    required bool isBackground,
  }) {
    String svgString;
    String keySuffix;
    if (imageBrightness == Brightness.light) {
      svgString = this.svgString;
      keySuffix = 'light';
    } else {
      svgString = invertedSvgString ?? this.svgString;
      keySuffix = 'dark';
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
      svgString,
      fit: boxFit,
      key: Key('Image$id-$keySuffix'),
      theme: SvgTheme(
        currentColor: imageBrightness == Brightness.light
            ? Colors.black
            : Colors.white,
      ),
    );
  }

  /// Inverts all the colors in the svg string by replacing
  /// all "fill" and "stroke" attributes (and their css counterparts)
  /// with their inverted color.
  @visibleForTesting
  static Future<String> invertSvgString(String svgString) async {
    const properties = ['fill', 'stroke', 'color'];
    for (final String property in properties) {
      svgString = svgString
          // property="..."
          .replaceAllMapped(RegExp('$property=["\'][^"\']+["\']'), (match) {
            String colorString = match.group(0)!
                .substring(
                  property.length + 2,
                  match.group(0)!.length - 1,
                );
            return '$property="${_invertColorMatch(colorString)}"';
          })
          // style="property: ...;"
          .replaceAllMapped(RegExp('$property:[^;"\']+'), (match) {
            String colorString = match.group(0)!
                .substring(property.length + 1)
                .trim();
            return '$property: ${_invertColorMatch(colorString)}';
          });
    }
    return svgString;
  }

  static String _invertColorMatch(String colorString) {
    String lower = colorString.toLowerCase();
    if (lower == 'none' || lower == 'transparent'
        || lower == 'currentcolor' || lower.startsWith('url(')) {
      return colorString;
    } else {
      Color color;
      try {
        color = fromCssColor(colorString);
      } on FormatException {
        if (kDebugMode) rethrow;
        return colorString;
      }
      return color
          .withInversion()
          .toCssString(format: CssColorString.hex);
    }
  }
}
