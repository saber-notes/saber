part of 'editor_image.dart';

class SvgEditorImage extends EditorImage {
  String? svgString;

  /// If the svg needs to be loaded from disk, this is the File
  /// that the svg will be loaded from.
  final File? svgFile;

  static final log = Logger('SvgEditorImage');

  SvgEditorImage({
    required super.id,
    required super.assetCache,
    required this.svgString,
    required this.svgFile,
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
    super.srcRect,
    super.naturalSize,
    super.isThumbnail,
  })  : assert(svgString != null || svgFile != null,
            'svgFile must be set if svgString is null'),
        super(
          extension: '.svg',
        );

  factory SvgEditorImage.fromJson(
    Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    bool isThumbnail = false,
    required String sbnPath,
    required AssetCache assetCache,
  }) {
    String? extension = json['e'] as String?;
    assert(extension == null || extension == '.svg');

    final assetIndex = json['a'] as int?;
    final String? svgString;
    File? svgFile;
    if (assetIndex != null) {
      if (inlineAssets == null) {
        svgFile =
            FileManager.getFile('$sbnPath${Editor.extension}.$assetIndex');
        svgString = assetCache.get(svgFile);
      } else {
        svgString = utf8.decode(inlineAssets[assetIndex]);
      }
    } else if (json['b'] != null) {
      svgString = json['b'] as String;
    } else {
      log.warning('SvgEditorImage.fromJson: no svg string found');
      svgString = '';
    }

    return SvgEditorImage(
      id: json['id'] ??
          -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
      assetCache: assetCache,
      svgString: svgString,
      svgFile: svgFile,
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
      isThumbnail: isThumbnail,
    );
  }

  @override
  Map<String, dynamic> toJson(OrderedAssetCache assets) {
    final json = super.toJson(assets);

    // remove non-svg fields
    json.remove('t'); // thumbnail bytes
    assert(!json.containsKey('a'));
    assert(!json.containsKey('b'));

    // try to load from cache
    svgString ??= assetCache.get(svgFile!);
    if (svgString != null) {
      json['a'] = assets.add(svgString!);
    } else {
      json['a'] = assets.add(svgFile!);
    }

    return json;
  }

  @override
  Future<void> firstLoad() async {
    svgString ??= assetCache.get(svgFile!);
    svgString ??= await svgFile!.readAsString();
    assetCache.addImage(this, svgFile, svgString!);

    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      final pictureInfo =
          await vg.loadPicture(SvgStringLoader(svgString!), null);
      naturalSize = pictureInfo.size;

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
  }

  @override
  Future<void> loadIn() async {
    await super.loadIn();

    svgString ??= assetCache.get(svgFile!);
    svgString ??= await svgFile!.readAsString();
    assetCache.addImage(this, svgFile, svgString!);
  }

  @override
  Future<bool> loadOut() async {
    final shouldLoadOut = await super.loadOut();
    if (!shouldLoadOut) return false;

    if (svgFile != null) {
      svgString = null;
      assetCache.removeImage(this);
    }

    return true;
  }

  @override
  Future<void> precache(BuildContext context) async {
    if (svgString == null) return;
    final loader = SvgStringLoader(svgString!);
    final pictureInfo = await vg.loadPicture(loader, null);
    pictureInfo.picture.dispose();
  }

  @override
  Widget buildImageWidget({
    required BuildContext context,
    required BoxFit? overrideBoxFit,
    required bool isBackground,
    required bool shaderEnabled,
    required ShaderBuilder shaderBuilder,
  }) {
    if (svgString == null) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    final BoxFit boxFit;
    if (overrideBoxFit != null) {
      boxFit = overrideBoxFit;
    } else if (isBackground) {
      boxFit = backgroundFit;
    } else {
      boxFit = BoxFit.fill;
    }

    return ShaderSampler(
      shaderEnabled: shaderEnabled,
      shaderBuilder: shaderBuilder,
      prepareForSnapshot: () => precache(context),
      child: SvgPicture(
        SvgStringLoader(
          svgString!,
          theme: const SvgTheme(
            currentColor: Colors.black,
          ),
        ),
        fit: boxFit,
      ),
    );
  }

  @override
  SvgEditorImage copy() => SvgEditorImage(
        id: id,
        assetCache: assetCache,
        svgString: svgString,
        svgFile: svgFile,
        pageIndex: pageIndex,
        pageSize: Size.infinite,
        invertible: invertible,
        backgroundFit: backgroundFit,
        onMoveImage: onMoveImage,
        onDeleteImage: onDeleteImage,
        onMiscChange: onMiscChange,
        onLoad: onLoad,
        newImage: newImage,
        dstRect: dstRect,
        srcRect: srcRect,
        naturalSize: naturalSize,
        isThumbnail: isThumbnail,
      );
}
