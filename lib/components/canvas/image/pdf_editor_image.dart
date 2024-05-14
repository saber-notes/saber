part of 'editor_image.dart';

class PdfEditorImage extends EditorImage {
  Uint8List? pdfBytes;
  final int pdfPage;

  /// If the pdf needs to be loaded from disk, this is the File
  /// that the pdf will be loaded from.
  final File? pdfFile;

  static final log = Logger('PdfEditorImage');

  PdfEditorImage({
    required super.id,
    required super.assetCache,
    required this.pdfBytes,
    required this.pdfFile,
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
  })  : assert(
            !naturalSize.isEmpty, 'naturalSize must be set for PdfEditorImage'),
        assert(pdfBytes != null || pdfFile != null,
            'pdfFile must be set if pdfBytes is null'),
        super(
          extension: '.pdf',
          srcRect: Rect.zero,
        );

  factory PdfEditorImage.fromJson(
    Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    bool isThumbnail = false,
    required String sbnPath,
    required AssetCache assetCache,
  }) {
    String? extension = json['e'] as String?;
    assert(extension == null || extension == '.pdf');

    final assetIndex = json['a'] as int?;
    final Uint8List? pdfBytes;
    File? pdfFile;
    if (assetIndex != null) {
      if (inlineAssets == null) {
        pdfFile =
            FileManager.getFile('$sbnPath${Editor.extension}.$assetIndex');
        pdfBytes = assetCache.get(pdfFile);
      } else {
        pdfBytes = inlineAssets[assetIndex];
      }
    } else {
      if (kDebugMode) {
        throw Exception('PdfEditorImage.fromJson: pdf bytes not found');
      }
      pdfBytes = Uint8List(0);
    }

    return PdfEditorImage(
      id: json['id'] ??
          -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
      assetCache: assetCache,
      pdfBytes: pdfBytes,
      pdfFile: pdfFile,
      pdfPage: json['pdfi'],
      pageIndex: json['i'] ?? 0,
      pageSize: Size.infinite,
      invertible: json['v'] ?? true,
      backgroundFit:
          json['f'] != null ? BoxFit.values[json['f']] : BoxFit.contain,
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
    );
  }

  @override
  Map<String, dynamic> toJson(OrderedAssetCache assets) {
    final json = super.toJson(
      assets,
    );

    // remove non-pdf fields
    json.remove('t'); // thumbnail bytes
    assert(!json.containsKey('a'));
    assert(!json.containsKey('b'));

    // try to find the pdf in the cache
    pdfBytes ??= assetCache.get(pdfFile!);
    if (pdfBytes != null) {
      json['a'] = assets.add(pdfBytes!);
    } else {
      json['a'] = assets.add(pdfFile!);
    }

    json['pdfi'] = pdfPage;

    return json;
  }

  @override
  Future<void> firstLoad() async {
    assert(srcRect.isEmpty);
    assert(!naturalSize.isEmpty);

    pdfBytes ??= assetCache.get(pdfFile!);
    pdfBytes ??= await pdfFile!.readAsBytes();
    assetCache.addImage(this, pdfFile, pdfBytes!);

    if (dstRect.isEmpty) {
      final Size dstSize = pageSize != null
          ? EditorImage.resize(naturalSize, pageSize!)
          : naturalSize;
      dstRect = dstRect.topLeft & dstSize;
    }
  }

  @override
  Future<void> loadIn() async {
    await super.loadIn();

    pdfBytes ??= assetCache.get(pdfFile!);
    pdfBytes ??= await pdfFile!.readAsBytes();
    assetCache.addImage(this, pdfFile, pdfBytes!);
  }

  @override
  Future<bool> loadOut() async {
    final shouldLoadOut = await super.loadOut();
    if (!shouldLoadOut) return false;

    if (pdfFile != null) {
      pdfBytes = null;
      assetCache.removeImage(this);
    }

    return true;
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
    required BuildContext context,
    required BoxFit? overrideBoxFit,
    required bool isBackground,
    required bool shaderEnabled,
    required ShaderBuilder shaderBuilder,
  }) {
    final BoxFit boxFit;
    if (overrideBoxFit != null) {
      boxFit = overrideBoxFit;
    } else if (isBackground) {
      boxFit = backgroundFit;
    } else {
      boxFit = BoxFit.fill;
    }

    if (loadedIn) {
      lowDpiFuture ??= _getRasterizedWithDpi(highDpi: false);
    }

    return ValueListenableBuilder(
      valueListenable: anyDpiRaster,
      builder: (context, imageProvider, child) {
        if (imageProvider == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return ShaderImage(
          shaderEnabled: shaderEnabled,
          shaderBuilder: shaderBuilder,
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
    if (pdfBytes == null) await loadIn();

    final raster = await Printing.raster(
      pdfBytes!,
      pages: [pdfPage],
      dpi: PdfPageFormat.inch * (highDpi ? 6 : 2),
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

  @override
  PdfEditorImage copy() => PdfEditorImage(
        id: id,
        assetCache: assetCache,
        pdfBytes: pdfBytes,
        pdfPage: pdfPage,
        pdfFile: pdfFile,
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
        naturalSize: naturalSize,
        isThumbnail: isThumbnail,
      );

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
      final highDpiPage =
          highDpiNeeded && (pageIndex - currentPageIndex).abs() <= 1;

      final page = pages[pageIndex];
      for (final image in [...page.images, page.backgroundImage]) {
        if (image == null) continue;
        if (image is! PdfEditorImage) continue;

        // skip pdfs that aren't loaded in/visible
        if (!image.loadedIn) continue;

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
