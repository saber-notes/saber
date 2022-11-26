
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as image;

class EditorImage {
  static int _nextId = 0;
  final int id = _nextId++;

  Uint8List bytes;
  Uint8List? invertedBytesCache;

  final int pageIndex;
  void Function(EditorImage, Rect)? onMoveImage;
  void Function(EditorImage)? onDeleteImage;
  final VoidCallback? onLoad;

  Rect srcRect = Rect.zero;
  Rect dstRect = Rect.zero;

  /// If the image is new, it will be [active] (draggable) when loaded
  bool newImage = false;

  /// Whether this image is inverted if Prefs.editorAutoInvert.value
  bool invertible;

  EditorImage({
    required this.bytes,
    required this.pageIndex,
    required Size pageSize,
    required this.onMoveImage,
    required this.onDeleteImage,
    this.onLoad,
    this.newImage = true,
  }): invertible = true {
    _getImage(pageSize).then((_) => onLoad?.call());
  }

  EditorImage.fromJson(Map<String, dynamic> json) :
        bytes = Uint8List.fromList((json['b'] as List<dynamic>?)?.cast<int>() ?? []),
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
        ) {
    _getImage();
  }

  Map<String, dynamic> toJson() {
    final json = {
      'b': bytes,
      'i': pageIndex,
      'v': invertible,
      'x': dstRect.left,
      'y': dstRect.top,
      'w': dstRect.width,
      'h': dstRect.height,
    };

    if (srcRect.left != 0) json['sx'] = srcRect.left;
    if (srcRect.top != 0) json['sy'] = srcRect.top;
    if (srcRect.width != 0) json['sw'] = srcRect.width;
    if (srcRect.height != 0) json['sh'] = srcRect.height;

    return json;
  }

  Future<void> _getImage([Size? pageSize]) async {
    Uint8List? resized = await compute(_resizeImageIsolate, bytes);
    if (resized != null) bytes = resized;

    ImageDescriptor imageDescriptor = await ImageDescriptor.encoded(await ImmutableBuffer.fromUint8List(bytes));
    Codec codec = await imageDescriptor.instantiateCodec();
    FrameInfo frameInfo = await codec.getNextFrame();
    Image image = frameInfo.image;
    try {
      if (srcRect.width == 0 || srcRect.height == 0) {
        srcRect = Rect.fromLTWH(srcRect.left, srcRect.top, image.width.toDouble(), image.height.toDouble());
      }
      if (dstRect.width == 0 || dstRect.height == 0) {
        Size size = Size(image.width.toDouble(), image.height.toDouble());
        if (pageSize != null) {
          size = resize(size, pageSize);
        }
        dstRect = Rect.fromLTWH(dstRect.left, dstRect.top, size.width, size.height);
      }
    } finally {
      image.dispose();
    }
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

  /// Resizes the image to no larger than 1000x1000 while maintaining aspect ratio
  static Uint8List? _resizeImageIsolate(Uint8List originalImageBytes) {
    image.Image? decoded = image.decodeImage(originalImageBytes);
    if (decoded == null) return null;

    Size resized = resize(Size(decoded.width.toDouble(), decoded.height.toDouble()), const Size(1000, 1000));
    if (resized.width.round() == decoded.width) return null;

    decoded = image.copyResize(decoded, width: resized.width.toInt(), height: resized.height.toInt());

    return image.encodePng(decoded) as Uint8List;
  }

}
