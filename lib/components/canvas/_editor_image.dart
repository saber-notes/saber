
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
  void Function()? onMiscChange;
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
    required this.onMiscChange,
    this.onLoad,
    this.newImage = true,
  }): invertible = true {
    _getImage(pageSize: pageSize).then((_) => onLoad?.call());
  }

  EditorImage.fromJson(Map<String, dynamic> json, {bool allowCalculations = true}) :
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
    _getImage(allowCalculations: allowCalculations);
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

  Future<void> _getImage({Size? pageSize, bool allowCalculations = true}) async {
    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      ImageDescriptor image = await ImageDescriptor.encoded(await ImmutableBuffer.fromUint8List(bytes));
      Size size = Size(image.width.toDouble(), image.height.toDouble());

      final Size reducedSize = resize(size, const Size(1000, 1000));
      if (size.width != reducedSize.width && allowCalculations) {
        await Future.delayed(Duration.zero); // wait for next event-loop iteration

        Uint8List? resized = await compute(_resizeImageIsolate, _ResizeImageIsolateInfo(bytes, reducedSize));
        if (resized != null) bytes = resized;

        size = reducedSize;
      }

      if (srcRect.shortestSide == 0) {
        srcRect = srcRect.topLeft & size;
      }
      if (dstRect.shortestSide == 0) {
        if (pageSize != null) {
          size = resize(size, pageSize);
        }
        dstRect = dstRect.topLeft & size;
      }
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

  /// Resizes the image to [newSize]
  static Uint8List? _resizeImageIsolate(_ResizeImageIsolateInfo info) {
    image.Image? decoded = image.decodeImage(info.bytes);
    if (decoded == null) return null;

    decoded = image.copyResize(decoded, width: info.newSize.width.toInt(), height: info.newSize.height.toInt());

    return image.encodePng(decoded) as Uint8List;
  }

}

class _ResizeImageIsolateInfo {
  final Uint8List bytes;
  final Size newSize;

  _ResizeImageIsolateInfo(this.bytes, this.newSize);
}
