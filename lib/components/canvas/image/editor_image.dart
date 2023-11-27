import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:fast_image_resizer/fast_image_resizer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:saber/components/canvas/_asset_cache.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

part 'png_editor_image.dart';
part 'pdf_editor_image.dart';
part 'svg_editor_image.dart';

/// The data for an image in the editor.
/// This is listenable for changes to the image's position ([dstRect]).
sealed class EditorImage extends ChangeNotifier {
  /// id for this image, unique within a note
  int id;

  /// The image's file extension, e.g. [".jpg"].
  /// This is used when "downloading" the image to the user's photo gallery.
  final String extension;

  final AssetCache assetCache;

  bool loaded = false;

  bool _isThumbnail = false;
  bool get isThumbnail => _isThumbnail;
  @mustCallSuper
  set isThumbnail(bool isThumbnail) {
    _isThumbnail = isThumbnail;
  }

  int pageIndex;
  void Function(EditorImage, Rect)? onMoveImage;
  void Function(EditorImage)? onDeleteImage;
  void Function()? onMiscChange;
  final VoidCallback? onLoad;

  Rect srcRect = Rect.zero;

  Rect _dstRect = Rect.zero;
  Rect get dstRect => _dstRect;
  set dstRect(Rect dstRect) {
    _dstRect = dstRect;
    notifyListeners();
  }

  /// Defines the aspect ratio of the image.
  Size naturalSize;

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
    required this.pageIndex,
    required Size pageSize,
    this.naturalSize = Size.zero,
    this.invertible = true,
    this.backgroundFit = BoxFit.contain,
    required this.onMoveImage,
    required this.onDeleteImage,
    required this.onMiscChange,
    this.onLoad,
    this.newImage = true,
    Rect dstRect = Rect.zero,
    this.srcRect = Rect.zero,
    bool isThumbnail = false,
    /// If [onMainThread], the image will be loaded automatically.
    /// Otherwise, [getImage] must be called manually.
    bool onMainThread = true,
  }): assert(extension.startsWith('.')),
      _dstRect = dstRect,
      _isThumbnail = isThumbnail {
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
    } else {
      return PngEditorImage.fromJson(
        json,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
        onMainThread: onMainThread,
        sbnPath: sbnPath,
        assetCache: assetCache,
      );
    }
  }

  @mustBeOverridden
  @mustCallSuper
  Map<String, dynamic> toJson(OrderedAssetCache assets) => {
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
  };

  Future<void> getImage({Size? pageSize});

  Future<void> precache(BuildContext context);

  Widget buildImageWidget({
    required BoxFit? overrideBoxFit,
    required bool isBackground,
  });

  EditorImage copy();

  /// Resizes [before] to fit inside [max] while maintaining aspect ratio
  @visibleForTesting
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
}
