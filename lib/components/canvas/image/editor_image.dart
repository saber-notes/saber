import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:fast_image_resizer/fast_image_resizer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:saber/components/canvas/_asset_cache.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/invert_widget.dart';
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

  var _isThumbnail = false;
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

  late var _dstRect = Rect.fromLTWH(
    0,
    0,
    CanvasImage.minImageSize,
    CanvasImage.minImageSize,
  );
  Rect get dstRect => _dstRect;
  set dstRect(Rect dstRect) {
    _dstRect = dstRect;
    if (_dstRect.width < CanvasImage.minImageSize ||
        _dstRect.height < CanvasImage.minImageSize) {
      final scale = max(
        CanvasImage.minImageSize / _dstRect.width,
        CanvasImage.minImageSize / _dstRect.height,
      );
      _dstRect = Rect.fromLTWH(
        _dstRect.left,
        _dstRect.top,
        _dstRect.width * scale,
        _dstRect.height * scale,
      );
    }
    notifyListeners();
  }

  /// Defines the aspect ratio of the image.
  Size naturalSize;

  /// The size of the page this image is on,
  /// used to make sure the image isn't too big.
  Size? pageSize;

  /// If the image is new, it will be [active] (draggable) when loaded
  var newImage = false;

  /// Whether this image is inverted if Prefs.editorAutoInvert.value
  bool invertible;

  /// The BoxFit used if this is a page's background image
  BoxFit backgroundFit;

  @protected
  EditorImage({
    required this.id,
    required this.assetCache,
    required this.extension,
    required this.pageIndex,
    required this.pageSize,
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
  }) : assert(extension.startsWith('.')),
       _dstRect = dstRect,
       _isThumbnail = isThumbnail;

  factory EditorImage.fromJson(
    Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    bool isThumbnail = false,
    required String sbnPath,
    required AssetCache assetCache,
  }) {
    final extension = json['e'] as String?;
    if (extension == '.svg') {
      return SvgEditorImage.fromJson(
        json,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
        sbnPath: sbnPath,
        assetCache: assetCache,
      );
    } else if (extension == '.pdf') {
      return PdfEditorImage.fromJson(
        json,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
        sbnPath: sbnPath,
        assetCache: assetCache,
      );
    } else {
      return PngEditorImage.fromJson(
        json,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
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
    if (naturalSize.width != 0) 'nw': naturalSize.width,
    if (naturalSize.height != 0) 'nh': naturalSize.height,
  };

  /// Images are loaded out after 5 seconds of not being visible.
  ///
  /// Set this to true to load out immediately.
  ///
  /// This is useful for tests that can't have pending timers.
  @visibleForTesting
  static var shouldLoadOutImmediately = false;

  Completer? _firstLoadStatus;
  Completer<bool>? _shouldLoadOut;
  var _loadedIn = false;
  bool get loadedIn => _loadedIn;

  Future<void> firstLoad();

  /// Called when the image becomes visible,
  /// and often involves loading the image from disk.
  ///
  /// The [firstLoad] method is called the first time this is called.
  /// Subsequent calls will wait for the first load to complete.
  ///
  /// See also:
  /// * [loadOut], which unloads the image from memory
  /// * [precache], which adds the image to Flutter's image cache
  /// * [loadedIn], which is true after [loadIn] and false after [loadOut]
  @mustBeOverridden
  @mustCallSuper
  Future<void> loadIn() async {
    _firstLoadStatus ??= Completer()..complete(firstLoad());
    if (!_firstLoadStatus!.isCompleted) {
      await _firstLoadStatus!.future;
    }

    _loadedIn = true;
    if (_shouldLoadOut?.isCompleted == false) _shouldLoadOut?.complete(false);
  }

  /// Free up resources when the image is no longer visible.
  ///
  /// See also:
  /// * [loadIn], which will be called again when the image is visible again.
  /// * [loadedIn], which is true after [loadIn] and false after [loadOut]
  @mustBeOverridden
  @mustCallSuper
  Future<bool> loadOut() async {
    if (_shouldLoadOut == null) {
      _shouldLoadOut = Completer();
      if (shouldLoadOutImmediately) {
        _shouldLoadOut!.complete(true);
      } else {
        Future.delayed(const Duration(seconds: 5)).then((_) {
          // load out if [loadIn] isn't called again in 5 seconds
          if (_shouldLoadOut == null) return;
          if (_shouldLoadOut!.isCompleted) return;
          _shouldLoadOut!.complete(true);
        });
      }
    }

    final shouldLoadOut = await _shouldLoadOut!.future;
    _shouldLoadOut = null;
    if (shouldLoadOut) {
      _loadedIn = false;
    }
    return shouldLoadOut;
  }

  /// Adds the image to Flutter's image cache.
  Future<void> precache(BuildContext context);

  Widget buildImageWidget({
    required BuildContext context,
    required BoxFit? overrideBoxFit,
    required bool isBackground,
    required bool invert,
  });

  EditorImage copy();

  /// Resizes [before] to fit inside [max] while maintaining aspect ratio
  @visibleForTesting
  static Size resize(Size before, Size max) {
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
