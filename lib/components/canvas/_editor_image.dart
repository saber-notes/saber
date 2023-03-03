
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as image;
import 'package:saber/components/canvas/_svg_editor_image.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:worker_manager/worker_manager.dart';

/// The data for an image in the editor.
/// This is listenable for changes to the image's position ([dstRect]).
class EditorImage extends ChangeNotifier {
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

  /// The maximum image size allowed for this image.
  /// If null, Prefs.maxImageSize will be used instead.
  Size? maxSize;

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

  int pageIndex;
  void Function(EditorImage, Rect)? onMoveImage;
  void Function(EditorImage)? onDeleteImage;
  void Function()? onMiscChange;
  final VoidCallback? onLoad;

  Rect srcRect = Rect.zero;
  Size naturalSize = Size.zero;

  Rect _dstRect = Rect.zero;
  Rect get dstRect => _dstRect;
  set dstRect(Rect dstRect) {
    _dstRect = dstRect;
    notifyListeners();
  }

  /// If the image is new, it will be [active] (draggable) when loaded
  bool newImage = false;

  /// Whether this image is inverted if Prefs.editorAutoInvert.value
  bool invertible;

  /// The BoxFit used if this is a page's background image
  BoxFit backgroundFit;

  EditorImage({
    required this.id,
    required this.extension,
    required this.bytes,
    required this.pageIndex,
    required Size pageSize,
    this.maxSize,
    this.invertible = true,
    this.backgroundFit = BoxFit.contain,
    required this.onMoveImage,
    required this.onDeleteImage,
    required this.onMiscChange,
    this.onLoad,
    this.newImage = true,
    Rect dstRect = Rect.zero,
    this.srcRect = Rect.zero,
    this.naturalSize = Size.zero,
    this.thumbnailBytes,
    this.invertedThumbnailBytes,
    bool isThumbnail = false,
  }) :  assert(extension.startsWith('.')) {
    this.dstRect = dstRect;
    _isThumbnail = isThumbnail;
    getImage(
      pageSize: pageSize,
    ).then((_) => onLoad?.call());
  }

  factory EditorImage.fromJson(Map<String, dynamic> json, {
    bool isThumbnail = false,
  }) {
    String? extension = json['e'];
    if (extension == '.svg') {
      return SvgEditorImage.fromJson(json, isThumbnail: isThumbnail);
    }

    return EditorImage(
      id: json['id'] ?? -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
      extension: extension ?? '.jpg',
      bytes: Uint8List.fromList((json['b'] as List<dynamic>?)?.cast<int>() ?? []),
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
      thumbnailBytes: json['t'] != null ? Uint8List.fromList((json['t'] as List<dynamic>).cast<int>()) : null,
      invertedThumbnailBytes: json['it'] != null ? Uint8List.fromList((json['it'] as List<dynamic>).cast<int>()) : null,
      isThumbnail: isThumbnail,
    );
  }

  Map<String, dynamic> toJson() {
    final json = {
      'id': id,
      'e': extension,
      'i': pageIndex,
      'v': invertible,
      'f': backgroundFit.index,
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

  @protected
  Future<void> getImage({Size? pageSize}) async {
    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      ImageDescriptor image = await ImageDescriptor.encoded(await ImmutableBuffer.fromUint8List(bytes));
      naturalSize = Size(image.width.toDouble(), image.height.toDouble());

      if (maxSize == null) {
        await Prefs.maxImageSize.waitUntilLoaded();
        maxSize = Size.square(Prefs.maxImageSize.value);
      }
      final Size reducedSize = resize(naturalSize, maxSize!);
      if (naturalSize.width != reducedSize.width && !isThumbnail) {
        await null; // wait for next event-loop iteration

        Uint8List? resized = await Executor().execute(
          fun3: resizeImageIsolate,
          arg1: bytes,
          arg2: reducedSize,
          arg3: extension,
        );
        if (resized != null) bytes = resized;

        naturalSize = reducedSize;
      } else if (!isThumbnail) { // otherwise make sure orientation is baked in
        Uint8List? rotated = await Executor().execute(
          fun2: _bakeOrientationIsolate,
          arg1: bytes,
          arg2: extension,
        );
        if (rotated != null) bytes = rotated;
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

    if ((thumbnailBytes?.isEmpty ?? true) && !isThumbnail) {
      thumbnailSize = resize(naturalSize, const Size(300, 300));
      // if [naturalSize] is big enough to warrant a thumbnail
      if (thumbnailSize.width * 1.5 < naturalSize.width) {
        await null; // wait for next event-loop iteration
        thumbnailBytes = await Executor().execute(
          fun3: resizeImageIsolate,
          arg1: bytes,
          arg2: thumbnailSize,
          arg3: extension,
        );
      } else { // no need to resize
        thumbnailBytes = null; // will fall back to full-size image
      }
    }
    if (isThumbnail) {
      isThumbnail = true; // updates bytes and srcRect
    }

    if (invertible && (invertedThumbnailBytes?.isEmpty ?? true) && !isThumbnail) {
      invertedThumbnailBytes = await Executor().execute(
        fun2: invertImageIsolate,
        arg1: thumbnailBytes ?? bytes,
        arg2: thumbnailBytes != null ? '.png' : extension, // thumbnail is always png
      );
    }
    if (isThumbnail) {
      isThumbnail = true;
    }

    loaded = true;
  }

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

    return Image.memory(
      bytes,
      fit: boxFit,
    );
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

  /// Resizes the image to [newSize].
  /// Also bakes the image orientation into the image data.
  @visibleForTesting
  static Uint8List? resizeImageIsolate(Uint8List bytes, Size newSize, String? extension, TypeSendPort port) {
    image.Image? decoded = _decodeImage(bytes, extension);
    if (decoded == null) return null;

    decoded = image.copyResize(decoded, width: newSize.width.toInt(), height: newSize.height.toInt());
    decoded = image.bakeOrientation(decoded);

    return image.encodePng(decoded);
  }

  /// Bakes the image orientation into the image data.
  /// This is only necessary if [_resizeImageIsolate] is not called.
  static Uint8List? _bakeOrientationIsolate(Uint8List bytes, String? extension, TypeSendPort port) {
    image.Image? decoded = _decodeImage(bytes, extension);
    if (decoded == null) return null;

    decoded = image.bakeOrientation(decoded);

    return image.encodePng(decoded);
  }

  /// Inverts each pixel of the image
  static Uint8List? invertImageIsolate(Uint8List originalImageBytes, String? extension, TypeSendPort port) {
    image.Image? decoded = _decodeImage(originalImageBytes, extension);
    if (decoded == null) return null;

    for (image.Pixel pixel in decoded) {
      Color inverted = Color.fromRGBO(
        pixel.r.toInt(),
        pixel.g.toInt(),
        pixel.b.toInt(),
        1,
      ).withInversion();

      pixel.r = inverted.red;
      pixel.g = inverted.green;
      pixel.b = inverted.blue;
    }

    return image.encodePng(decoded);
  }

  /// Decodes the image from [bytes].
  ///
  /// This is faster than [image.decodeImage] since the image format is known.
  ///
  /// If [extension] is null, or parsing fails,
  /// we just fall back to [image.decodeImage].
  /// This is because we can't be sure that the extension is correct.
  static image.Image? _decodeImage(Uint8List bytes, String? extension) {
    if (extension != null) {
      final decoded = image.decodeNamedImage('image$extension', bytes);
      if (decoded != null) return decoded;
    }

    return image.decodeImage(bytes);
  }
}
