
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as image;
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:worker_manager/worker_manager.dart';

class EditorImage {
  /// id for this image, unique within a note
  int id;

  /// The image's file extension, e.g. [".jpg"].
  /// This is used when "downloading" the image to the user's photo gallery.
  final String extension;

  Uint8List bytes;
  Uint8List? invertedBytesCache;

  Uint8List? thumbnailBytes;
  Uint8List? invertedThumbnailBytes;
  Size thumbnailSize = Size.zero;

  bool loaded = false;

  bool _isThumbnail = false;
  bool get isThumbnail => _isThumbnail;
  set isThumbnail(bool isThumbnail) {
    _isThumbnail = isThumbnail;
    if (isThumbnail && thumbnailBytes != null) {
      bytes = thumbnailBytes!;
      final scale = thumbnailSize.width / naturalSize.width;
      srcRect = Rect.fromLTWH(srcRect.left * scale, srcRect.top * scale, srcRect.width * scale, srcRect.height * scale);
    }
    if (isThumbnail && invertedThumbnailBytes != null) {
      invertedBytesCache = invertedThumbnailBytes;
    }
  }

  final int pageIndex;
  void Function(EditorImage, Rect)? onMoveImage;
  void Function(EditorImage)? onDeleteImage;
  void Function()? onMiscChange;
  final VoidCallback? onLoad;

  Rect srcRect = Rect.zero;
  Rect dstRect = Rect.zero;
  Size naturalSize = Size.zero;

  /// If the image is new, it will be [active] (draggable) when loaded
  bool newImage = false;

  /// Whether this image is inverted if Prefs.editorAutoInvert.value
  bool invertible;

  EditorImage({
    required this.id,
    required this.extension,
    required this.bytes,
    required this.pageIndex,
    required Size pageSize,
    required this.onMoveImage,
    required this.onDeleteImage,
    required this.onMiscChange,
    this.onLoad,
    this.newImage = true,
  }): invertible = true {
    _getImage(pageSize: pageSize).then((_) => onLoad?.call());
  }

  EditorImage.fromJson(Map<String, dynamic> json, {bool allowCalculations = true}) :
        id = json['id'] ?? -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
        extension = json['e'] ?? ".jpg",
        pageIndex = json['i'] ?? 0,
        invertible = json['v'] ?? true,
        onLoad = null,
        dstRect = Rect.fromLTWH(
          json['x'] ?? 0,
          json['y'] ?? 0,
          json['w'] ?? 0,
          json['h'] ?? 0,
        ),
        srcRect = Rect.fromLTWH(
          json['sx'] ?? 0,
          json['sy'] ?? 0,
          json['sw'] ?? 0,
          json['sh'] ?? 0,
        ),
        naturalSize = Size(
          json['nw'] ?? 0,
          json['nh'] ?? 0,
        ),
        thumbnailBytes = json['t'] != null ? Uint8List.fromList((json['t'] as List<dynamic>).cast<int>()) : null,
        invertedThumbnailBytes = json['it'] != null ? Uint8List.fromList((json['it'] as List<dynamic>).cast<int>()) : null,
        bytes = Uint8List.fromList((json['b'] as List<dynamic>?)?.cast<int>() ?? []) {
    _getImage(allowCalculations: allowCalculations);
  }

  Map<String, dynamic> toJson() {
    final json = {
      'id': id,
      'e': extension,
      'i': pageIndex,
      'v': invertible,
      'x': dstRect.left,
      'y': dstRect.top,
      'w': dstRect.width,
      'h': dstRect.height,
      'b': bytes,
    };

    if (srcRect.left != 0) json['sx'] = srcRect.left;
    if (srcRect.top != 0) json['sy'] = srcRect.top;
    if (srcRect.width != 0) json['sw'] = srcRect.width;
    if (srcRect.height != 0) json['sh'] = srcRect.height;

    if (naturalSize.width != 0) json['nw'] = naturalSize.width;
    if (naturalSize.height != 0) json['nh'] = naturalSize.height;

    if (thumbnailBytes != null) json['t'] = thumbnailBytes!;
    if (invertible && invertedThumbnailBytes != null) json['it'] = invertedThumbnailBytes!;

    return json;
  }

  Future<void> _getImage({Size? pageSize, bool allowCalculations = true}) async {
    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      ImageDescriptor image = await ImageDescriptor.encoded(await ImmutableBuffer.fromUint8List(bytes));
      naturalSize = Size(image.width.toDouble(), image.height.toDouble());

      final Size reducedSize = resize(naturalSize, const Size(1000, 1000));
      if (naturalSize.width != reducedSize.width && allowCalculations) {
        await Future.delayed(Duration.zero); // wait for next event-loop iteration

        Uint8List? resized = await Executor().execute(fun2: _resizeImageIsolate, arg1: bytes, arg2: reducedSize);
        if (resized != null) bytes = resized;

        naturalSize = reducedSize;
      }

      if (srcRect.shortestSide == 0) {
        srcRect = srcRect.topLeft & naturalSize;
      }
      if (dstRect.shortestSide == 0) {
        final Size dstSize = pageSize != null ? resize(naturalSize, pageSize) : naturalSize;
        dstRect = dstRect.topLeft & dstSize;
      }
    }

    if (naturalSize.shortestSide == 0) {
      naturalSize = Size(srcRect.width, srcRect.height);
    }

    if ((thumbnailBytes?.isEmpty ?? true) && allowCalculations) {
      thumbnailSize = resize(naturalSize, const Size(300, 300));
      if (thumbnailSize.width != naturalSize.width) {
        await Future.delayed(Duration.zero); // wait for next event-loop iteration
        thumbnailBytes = await Executor().execute(fun2: _resizeImageIsolate, arg1: bytes, arg2: thumbnailSize);
      } else { // no need to resize
        thumbnailBytes = null; // will fall back to full-size image
      }
    }
    if (isThumbnail) {
      isThumbnail = true; // updates bytes and srcRect
    }

    if (invertible && (invertedThumbnailBytes?.isEmpty ?? true) && allowCalculations) {
      invertedThumbnailBytes = await Executor().execute(fun1: invertImageIsolate, arg1: thumbnailBytes ?? bytes);
    }
    if (isThumbnail) {
      isThumbnail = true;
    }

    loaded = true;
  }

  /// Resizes [before] to fit inside [max] while maintaining aspect ratio
  static Size resize(final Size before, final Size max) {
    double width = before.width,
        height = before.height,
        aspectRatio = width / height;

    if (width > max.width) {
      width = max.width;
      height = width / aspectRatio;
    }
    if (height > max.height) {
      height = max.height;
      width = height * aspectRatio;
    }

    return Size(width, height);
  }

  /// Resizes the image to [newSize]
  static Uint8List? _resizeImageIsolate(Uint8List bytes, Size newSize, TypeSendPort port) {
    image.Image? decoded = image.decodeImage(bytes);
    if (decoded == null) return null;

    decoded = image.copyResize(decoded, width: newSize.width.toInt(), height: newSize.height.toInt());

    return image.encodePng(decoded) as Uint8List;
  }

  /// Inverts each pixel of the image
  static Uint8List? invertImageIsolate(Uint8List originalImageBytes, TypeSendPort port) {
    image.Image? decoded = image.decodeImage(originalImageBytes);
    if (decoded == null) return null;

    for (int x = 0; x < decoded.width; ++x) {
      for (int y = 0; y < decoded.height; ++y) {
        int pixel = decoded.getPixel(x, y);
        int r = image.getRed(pixel),
            g = image.getGreen(pixel),
            b = image.getBlue(pixel),
            a = image.getAlpha(pixel);
        Color inverted = Color.fromRGBO(r, g, b, 1).withInversion();
        int invertedInt = image.getColor(inverted.red, inverted.green, inverted.blue, a);
        decoded.setPixel(x, y, invertedInt);
      }
    }

    return image.encodePng(decoded) as Uint8List;
  }
}

class _ResizeImageIsolateInfo {
  final Uint8List bytes;
  final Size newSize;

  _ResizeImageIsolateInfo(this.bytes, this.newSize);
}
