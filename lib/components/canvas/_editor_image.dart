import 'dart:io';
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:fast_image_resizer/fast_image_resizer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_asset_cache.dart';
import 'package:saber/components/canvas/_pdf_editor_image.dart';
import 'package:saber/components/canvas/_svg_editor_image.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

/// The data for an image in the editor.
/// This is listenable for changes to the image's position ([dstRect]).
class EditorImage extends ChangeNotifier {
  /// id for this image, unique within a note
  int id;

  /// The image's file extension, e.g. [".jpg"].
  /// This is used when "downloading" the image to the user's photo gallery.
  final String extension;

  ImageProvider? imageProvider;

  final AssetCache assetCache;

  Uint8List? thumbnailBytes;
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
      imageProvider = MemoryImage(thumbnailBytes!);
      final scale = thumbnailSize.width / naturalSize.width;
      srcRect = Rect.fromLTWH(srcRect.left * scale, srcRect.top * scale, srcRect.width * scale, srcRect.height * scale);
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
    required this.assetCache,
    required this.extension,
    required this.imageProvider,
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
    bool isThumbnail = false,
    /// If [onMainThread], the image will be loaded automatically.
    /// Otherwise, [getImage] must be called manually.
    bool onMainThread = true,
  }) :  assert(extension.startsWith('.')) {
    this.dstRect = dstRect;
    _isThumbnail = isThumbnail;

    if (onMainThread) {
      loadOnMainThread(
        pageSize: pageSize,
      );
    }
  }

  /// Loads the image. This should be called on the main thread.
  void loadOnMainThread({
    required Size pageSize,
  }) async {
    assert(Isolate.current.debugName == 'main');
    await getImage(
      pageSize: pageSize,
    );
    onLoad?.call();
  }

  factory EditorImage.fromJson(Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    bool isThumbnail = false,
    required bool onMainThread,
    required String sbnPath,
    required AssetCache assetCache,
  }) {
    String? extension = json['e'];
    if (extension == '.svg') {
      return SvgEditorImage.fromJson(
        json,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
        onMainThread: onMainThread,
        sbnPath: sbnPath,
        assetCache: assetCache,
      );
    } else if (extension == '.pdf') {
      return PdfEditorImage.fromJson(
        json,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
        onMainThread: onMainThread,
        sbnPath: sbnPath,
        assetCache: assetCache,
      );
    }

    final assetIndex = json['a'] as int?;
    final Uint8List? bytes;
    File? imageFile;
    if (assetIndex != null) {
      if (inlineAssets == null) {
        imageFile = FileManager.getFile('$sbnPath${Editor.extension}.$assetIndex');
        bytes = assetCache.get(imageFile.path);
      } else {
        bytes = inlineAssets[assetIndex];
      }
    } else if (json['b'] != null) {
      bytes = Uint8List.fromList((json['b'] as List<dynamic>).cast<int>());
    } else {
      if (kDebugMode) {
        throw Exception('EditorImage.fromJson: image bytes not found');
      }
      bytes = Uint8List(0);
    }
    assert(bytes != null || imageFile != null, 'Either bytes or imageFile must be non-null');

    return EditorImage(
      // -1 will be replaced by [EditorCoreInfo._handleEmptyImageIds()]
      id: json['id'] ?? -1,
      assetCache: assetCache,
      extension: extension ?? '.jpg',
      imageProvider: bytes != null
        ? MemoryImage(bytes) as ImageProvider
        : FileImage(imageFile!),
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
      isThumbnail: isThumbnail,
      onMainThread: onMainThread,
    );
  }

  Map<String, dynamic> toJson(OrderedAssetCache assets) {
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

      if (srcRect.left != 0) 'sx': srcRect.left,
      if (srcRect.top != 0) 'sy': srcRect.top,
      if (srcRect.width != 0) 'sw': srcRect.width,
      if (srcRect.height != 0) 'sh': srcRect.height,

      if (naturalSize.width != 0) 'nw': naturalSize.width,
      if (naturalSize.height != 0) 'nh': naturalSize.height,

      // only export thumbnails in first page
      if (thumbnailBytes != null && pageIndex == 0)
        't': thumbnailBytes,
    };

    if (imageProvider != null) {
      json['a'] = assets.add(imageProvider!);
    }

    return json;
  }

  Future<void> getImage({Size? pageSize}) async {
    assert(Isolate.current.debugName == 'main');

    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      final Uint8List bytes;
      if (imageProvider is MemoryImage) {
        bytes = (imageProvider as MemoryImage).bytes;
      } else if (imageProvider is FileImage) {
        bytes = await (imageProvider as FileImage).file.readAsBytes();
      } else {
        throw Exception('EditorImage.getImage: imageProvider is ${imageProvider.runtimeType}');
      }

      naturalSize = await ui.ImmutableBuffer.fromUint8List(bytes)
          .then((buffer) => ui.ImageDescriptor.encoded(buffer))
          .then((descriptor) => Size(descriptor.width.toDouble(), descriptor.height.toDouble()));

      if (maxSize == null) {
        await Prefs.maxImageSize.waitUntilLoaded();
        maxSize = Size.square(Prefs.maxImageSize.value);
      }
      final Size reducedSize = resize(naturalSize, maxSize!);
      if (naturalSize.width != reducedSize.width && !isThumbnail) {
        await null; // wait for next event-loop iteration

        final resizedByteData = await resizeImage(
          bytes,
          width: reducedSize.width.toInt(),
          height: reducedSize.height.toInt(),
        );
        if (resizedByteData != null) {
          imageProvider = MemoryImage(resizedByteData.buffer.asUint8List());
        }

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

    if ((thumbnailBytes?.isEmpty ?? true) && !isThumbnail && imageProvider is MemoryImage) {
      thumbnailSize = resize(naturalSize, const Size(300, 300));
      // if [naturalSize] is big enough to warrant a thumbnail
      if (thumbnailSize.width * 1.5 < naturalSize.width) {
        await null; // wait for next event-loop iteration
        final resizedByteData = await resizeImage(
          (imageProvider as MemoryImage).bytes,
          width: thumbnailSize.width.toInt(),
          height: thumbnailSize.height.toInt(),
        );
        thumbnailBytes = resizedByteData?.buffer.asUint8List();
      } else { // no need to resize
        thumbnailBytes = null; // will fall back to full-size image
      }
    }
    if (isThumbnail) {
      isThumbnail = true; // updates bytes and srcRect
    }

    loaded = true;
  }

  Future<void> precache(BuildContext context) async {
    if (imageProvider == null) return;
    return await precacheImage(imageProvider!, context);
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

    return Image(
      image: imageProvider!,
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

  EditorImage copy() => EditorImage(
    id: id,
    assetCache: assetCache,
    extension: extension,
    imageProvider: imageProvider,
    pageIndex: pageIndex,
    pageSize: Size.infinite,
    invertible: invertible,
    backgroundFit: backgroundFit,
    onMoveImage: onMoveImage,
    onDeleteImage: onDeleteImage,
    onMiscChange: onMiscChange,
    onLoad: onLoad,
    newImage: true,
    dstRect: dstRect,
    srcRect: srcRect,
    naturalSize: naturalSize,
    thumbnailBytes: thumbnailBytes,
    isThumbnail: isThumbnail,
    onMainThread: true,
  );
}
