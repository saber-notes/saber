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

  /// rectangle used to display image (image crop region to be displayed). Full image dimension is given by naturalSize
  Rect srcRect = Rect.zero;

  /// rectangle used to display image on canvas (area of cropped image)
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

  /// rectangle used to display full size of image (without cropping it)
  Rect _dstFullRect = Rect.zero;
  Rect get dstFullRect => _dstFullRect;
  set dstFullRect(Rect dstFullRect) {
    _dstFullRect = dstFullRect;
    notifyListeners();
  }

  /// show only cropped image, if false then show full image (it is used to select crop rect)
  bool showCroppedImage = true;

  /// Defines the aspect ratio of the original image - image size
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

  /// Rotates the image's [dstRect] and [dstFullRect] by [angle] radians
  /// around the given [center] point.
  void rotate(double angle, Offset center) {
    if (angle == 0) return;
    final cosA = cos(angle);
    final sinA = sin(angle);
    final cx = center.dx;
    final cy = center.dy;

    // Rotate the top-left corner of dstRect around center
    final dx = _dstRect.left - cx;
    final dy = _dstRect.top - cy;
    final newLeft = cx + dx * cosA - dy * sinA;
    final newTop = cy + dx * sinA + dy * cosA;

    // For 90° and 270° (and close to those) rotations, swap width and height
    // so that the image dimensions match the rotated selection area.
    final width = _dstRect.width;
    final height = _dstRect.height;
    final isNear90 = (sinA - 1).abs() < 0.01 && cosA.abs() < 0.01;   // ~90°
    final isNear270 = (sinA + 1).abs() < 0.01 && cosA.abs() < 0.01;  // ~270°
    if (isNear90 || isNear270) {
      _dstRect = Rect.fromLTWH(newLeft, newTop, height, width);
      // Also swap naturalSize so that dstFullRect calculates correct scale
      naturalSize = Size(naturalSize.height, naturalSize.width);
    } else {
      _dstRect = Rect.fromLTWH(newLeft, newTop, width, height);
    }

    _dstFullRect = getDstFullRect();
    notifyListeners();
  }

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

  // image cropping functions

  /// function returning rectangle in destination coordinates (canvas) to be used to draw full image
  Rect getDstFullRect() {
    double scaleX;
    double scaleY;
    if (srcRect.width != 0 && srcRect.height != 0) {
      scaleX = dstRect.width / srcRect.width;
      scaleY = dstRect.height / srcRect.height;
    } else {
      // src rect is not set. Assume it is naturalSize
      // srcrect is zero for pdf images
      scaleX = dstRect.width / naturalSize.width;
      scaleY = dstRect.height / naturalSize.height;
    }
    Offset cs = srcRect.topLeft; // offset of crop origin (topleft) from image origin (0,0)
    Offset srcOriginInDest = -Offset(cs.dx * scaleX, cs.dy * scaleY); // offset of image origin (0,0) with respect to cropped origin in canvas dst coordinates
    dstFullRect = Rect.fromLTWH(
      srcOriginInDest.dx,
      srcOriginInDest.dy,
      naturalSize.width * scaleX,
      naturalSize.height * scaleY,
    ).shift(dstRect.topLeft); // this is Rect in dst coordinates of full size image
    return dstFullRect;
  }

  /// recalculates rectangle from destination coordinates given by dstR to image source coordinates given by srcRect
  /// function is called during defining cropped part of image - dstR is rectangle in canvas coordinates
  /// and represents a part of dstFullRect. From their difference we calculate srcRect - part of image to be displayed
  Rect transformRectFromDstToSrcDuringCrop(Rect dstR) {
    double scaleX;
    double scaleY;
    if (srcRect.width != 0 && srcRect.height != 0) {
      scaleX = dstRect.width / srcRect.width;
      scaleY = dstRect.height / srcRect.height;
    } else {
      // src rect is not set. Assume it is naturalSize
      // srcrect is zero for pdf images
      scaleX = dstRect.width / naturalSize.width;
      scaleY = dstRect.height / naturalSize.height;
    }
    Rect rct = dstR.shift(-dstFullRect.topLeft); // remove destination rect position - position 0,0 is top left corner cropRect
    double dx = rct.left / scaleX; // offset of dstR from src topleft
    double dy = rct.top / scaleY;
    double width = rct.width / scaleX;
    double height = rct.height / scaleY;
    Rect crp = Rect.fromLTWH(0 + dx, 0 + dy, width, height);
    return crp; // this is new srcRect of image
  }
}