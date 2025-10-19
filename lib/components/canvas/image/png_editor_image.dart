part of 'editor_image.dart';

class PngEditorImage extends EditorImage {
  ImageProvider? imageProvider;

  Uint8List? thumbnailBytes;
  Size thumbnailSize = Size.zero;

  /// The maximum image size allowed for this image.
  /// If null, Prefs.maxImageSize will be used instead.
  Size? maxSize;

  @override
  set isThumbnail(bool isThumbnail) {
    super.isThumbnail = isThumbnail;
    if (isThumbnail && thumbnailBytes != null) {
      imageProvider = MemoryImage(thumbnailBytes!);
      final scale = thumbnailSize.width / naturalSize.width;
      srcRect = Rect.fromLTWH(
        srcRect.left * scale,
        srcRect.top * scale,
        srcRect.width * scale,
        srcRect.height * scale,
      );
    }
  }

  PngEditorImage({
    required super.id,
    required super.assetCache,
    required super.extension,
    required this.imageProvider,
    required super.pageIndex,
    required super.pageSize,
    this.maxSize,
    super.invertible,
    super.backgroundFit,
    required super.onMoveImage,
    required super.onDeleteImage,
    required super.onMiscChange,
    super.onLoad,
    super.newImage,
    super.dstRect,
    super.srcRect,
    super.naturalSize,
    this.thumbnailBytes,
    super.isThumbnail,
  });

  factory PngEditorImage.fromJson(
    Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    bool isThumbnail = false,
    required String sbnPath,
    required AssetCache assetCache,
  }) {
    final assetIndex = json['a'] as int?;
    final Uint8List? bytes;
    File? imageFile;
    if (assetIndex != null) {
      if (inlineAssets == null) {
        imageFile = FileManager.getFile(
          '$sbnPath${Editor.extension}.$assetIndex',
        );
        bytes = assetCache.get(imageFile);
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
    assert(
      bytes != null || imageFile != null,
      'Either bytes or imageFile must be non-null',
    );

    return PngEditorImage(
      // -1 will be replaced by [EditorCoreInfo._handleEmptyImageIds()]
      id: json['id'] ?? -1,
      assetCache: assetCache,
      extension: json['e'] ?? '.jpg',
      imageProvider: bytes != null
          ? MemoryImage(bytes) as ImageProvider
          : FileImage(imageFile!),
      pageIndex: json['i'] ?? 0,
      pageSize: Size.infinite,
      invertible: json['v'] ?? true,
      backgroundFit: json['f'] != null
          ? BoxFit.values[json['f']]
          : BoxFit.contain,
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
      naturalSize: Size(json['nw'] ?? 0, json['nh'] ?? 0),
      thumbnailBytes: json['t'] != null
          ? Uint8List.fromList((json['t'] as List<dynamic>).cast<int>())
          : null,
      isThumbnail: isThumbnail,
    );
  }

  @override
  Map<String, dynamic> toJson(OrderedAssetCache assets) =>
      super.toJson(assets)
        ..addAll({if (imageProvider != null) 'a': assets.add(imageProvider!)});

  @override
  Future<void> firstLoad() async {
    assert(Isolate.current.debugName == 'main');

    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      final Uint8List bytes;
      if (imageProvider is MemoryImage) {
        bytes = (imageProvider as MemoryImage).bytes;
      } else if (imageProvider is FileImage) {
        bytes = await (imageProvider as FileImage).file.readAsBytes();
      } else {
        throw Exception(
          'EditorImage.getImage: imageProvider is ${imageProvider.runtimeType}',
        );
      }

      naturalSize = await ui.ImmutableBuffer.fromUint8List(bytes)
          .then((buffer) => ui.ImageDescriptor.encoded(buffer))
          .then(
            (descriptor) =>
                Size(descriptor.width.toDouble(), descriptor.height.toDouble()),
          );

      if (maxSize == null) {
        await stows.maxImageSize.waitUntilRead();
        maxSize = Size.square(stows.maxImageSize.value);
      }
      final Size reducedSize = EditorImage.resize(naturalSize, maxSize!);
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
        final Size dstSize = pageSize != null
            ? EditorImage.resize(naturalSize, pageSize!)
            : naturalSize;
        dstRect = dstRect.topLeft & dstSize;
      }
    }

    if (naturalSize.shortestSide == 0) {
      naturalSize = Size(srcRect.width, srcRect.height);
    }

    if (isThumbnail) {
      isThumbnail = true; // updates bytes and srcRect
    }
  }

  @override
  Future<void> loadIn() async => await super.loadIn();
  @override
  Future<bool> loadOut() async => await super.loadOut();

  @override
  Future<void> precache(BuildContext context) async {
    if (imageProvider == null) return;
    return await precacheImage(imageProvider!, context);
  }

  @override
  Widget buildImageWidget({
    required BuildContext context,
    required BoxFit? overrideBoxFit,
    required bool isBackground,
    required bool invert,
  }) {
    final BoxFit boxFit;
    if (overrideBoxFit != null) {
      boxFit = overrideBoxFit;
    } else if (isBackground) {
      boxFit = backgroundFit;
    } else {
      boxFit = BoxFit.fill;
    }

    return InvertWidget(
      invert: invert,
      child: Image(image: imageProvider!, fit: boxFit),
    );
  }

  @override
  PngEditorImage copy() => PngEditorImage(
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
  );
}
