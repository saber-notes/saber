import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/data/editor/page.dart';

class PdfEditorImage extends EditorImage {
  final Uint8List pdfBytes;
  final int pdfPage;

  static final log = Logger('PdfEditorImage');

  PdfEditorImage({
    required super.id,
    required this.pdfBytes,
    required this.pdfPage,
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
    required super.naturalSize,
    super.isThumbnail,
    super.onMainThread,
  }): assert(!naturalSize.isEmpty, 'naturalSize must be set for PdfEditorImage'),
      super(
        extension: '.pdf',
        bytes: Uint8List(0),
        srcRect: Rect.zero,
      );

  factory PdfEditorImage.fromJson(Map<String, dynamic> json, {
    required List<Uint8List> assets,
    bool isThumbnail = false,
    bool onMainThread = true,
  }) {
    String? extension = json['e'] as String?;
    assert(extension == null || extension == '.pdf');

    final assetIndex = json['a'] as int?;
    final Uint8List pdfBytes;
    if (assetIndex != null) {
      pdfBytes = assets[assetIndex];
    } else {
      if (kDebugMode) {
        throw Exception('PdfEditorImage.fromJson: pdf bytes not found');
      }
      pdfBytes = Uint8List(0);
    }

    return PdfEditorImage(
      id: json['id'] ?? -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
      pdfBytes: pdfBytes,
      pdfPage: json['pdfi'],
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

    // remove non-pdf fields
    json.remove('t'); // thumbnail bytes
    assert(!json.containsKey('a'));
    assert(!json.containsKey('b'));

    int assetIndex = assets.indexOf(pdfBytes);
    if (assetIndex == -1) {
      assetIndex = assets.length;
      assets.add(pdfBytes);
    }
    json['a'] = assetIndex;

    json['pdfi'] = pdfPage;

    return json;
  }

  @override
  Future<void> getImage({Size? pageSize, bool allowCalculations = true}) async {
    assert(srcRect.isEmpty);
    assert(!naturalSize.isEmpty);

    if (dstRect.isEmpty) {
      final Size dstSize = pageSize != null
          ? EditorImage.resize(naturalSize, pageSize)
          : naturalSize;
      dstRect = dstRect.topLeft & dstSize;
    }

    loaded = true;
  }

  BuildContext? _lastPrecacheContext;
  @override
  Future<void> precache(BuildContext context) async {
    _lastPrecacheContext = context;
    lowDpiFuture ??= _getRasterizedWithDpi(highDpi: false);
    final memoryImage = await lowDpiFuture!;

    return await _precacheImage(memoryImage);
  }
  Future<void> _precacheImage(ImageProvider imageProvider) async {
    final context = _lastPrecacheContext;
    if (context == null) return;
    if (!context.mounted) return;

    return await precacheImage(imageProvider, context);
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

    lowDpiFuture ??= _getRasterizedWithDpi(highDpi: false);

    return ValueListenableBuilder(
      valueListenable: anyDpiRaster,
      builder: (context, imageProvider, child) {
        if (imageProvider == null) {
          return const SizedBox.shrink();
        }
        return Image(
          image: imageProvider,
          fit: boxFit,
        );
      },
    );
  }

  /// This is equal to [highDpiRaster] if not null, otherwise [lowDpiRaster].
  ///
  /// Don't set this directly. [lowDpiRaster] and [highDpiRaster]
  /// automatically update this value.
  late final ValueNotifier<ImageProvider?> anyDpiRaster = ValueNotifier(null);
  Future<ImageProvider>? lowDpiFuture;
  late final ValueNotifier<ImageProvider?> lowDpiRaster = ValueNotifier(null)
    ..addListener(() {
      anyDpiRaster.value = highDpiRaster.value ?? lowDpiRaster.value;
    });
  Future<ImageProvider>? highDpiFuture;
  late final ValueNotifier<ImageProvider?> highDpiRaster = ValueNotifier(null)
    ..addListener(() {
      anyDpiRaster.value = highDpiRaster.value ?? lowDpiRaster.value;
    });

  Future<ImageProvider> _getRasterizedWithDpi({required bool highDpi}) async {
    final raster = await Printing.raster(
      pdfBytes,
      pages: [pdfPage],
      dpi: PdfPageFormat.inch * (highDpi ? 4 : 2),
    ).single;
    final image = PdfRasterImage(raster);

    if (highDpi) {
      // precache the new image so we don't flash an empty image
      await _precacheImage(image);

      return highDpiRaster.value = image;
    } else {
      return lowDpiRaster.value = image;
    }
  }

  static Timer? _checkIfHighDpiNeededDebounce;
  static Future<void> _checkIfHighDpiNeededDebounceCallback({
    required double Function() getZoom,
    required double Function() getScrollY,
    required List<EditorPage> pages,
    required double screenWidth,
  }) async {
    _checkIfHighDpiNeededDebounce = null;

    final zoom = getZoom();
    final highDpiNeeded = zoom > 1.5;

    final currentPageIndex = CanvasGestureDetector.getPageIndex(
      scrollY: getScrollY(),
      pages: pages,
      screenWidth: screenWidth,
    );

    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      // high dpi on current page, the page before, and the page after
      final highDpiPage = highDpiNeeded && (pageIndex - currentPageIndex).abs() <= 1;

      final page = pages[pageIndex];
      for (final image in [...page.images, page.backgroundImage]) {
        if (image == null) continue;
        if (image is! PdfEditorImage) continue;

        if (highDpiPage) {
          if (image.highDpiFuture != null) continue;
          image.highDpiFuture = image._getRasterizedWithDpi(
            highDpi: true,
          );
        } else {
          image.highDpiFuture = null;
          image.highDpiRaster.value?.evict().ignore();
          image.highDpiRaster.value = null;
        }
      }
    }
  }
  /// When a user has not moved for 500ms,
  /// check if they are zoomed in to a PDF page,
  /// and increase the raster dpi if needed.
  static void checkIfHighDpiNeeded({
    required double Function() getZoom,
    required double Function() getScrollY,
    required List<EditorPage> pages,
    required double screenWidth,
  }) {
    _checkIfHighDpiNeededDebounce?.cancel();
    _checkIfHighDpiNeededDebounce = Timer(
      const Duration(milliseconds: 500),
      () => _checkIfHighDpiNeededDebounceCallback(
        getZoom: getZoom,
        getScrollY: getScrollY,
        pages: pages,
        screenWidth: screenWidth,
      ),
    );
  }
}
