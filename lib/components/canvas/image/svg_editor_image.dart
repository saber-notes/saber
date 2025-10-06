part of 'editor_image.dart';

class SvgEditorImage extends EditorImage {
  late SvgLoader svgLoader;
  int assetId;

  static final log = Logger('SvgEditorImage');

  SvgEditorImage({
    required super.id,
    required super.assetCacheAll,
    required this.assetId,
    required String? svgString,
    required File? svgFile,
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
        ) {
    if (svgString != null) {
      svgLoader = SvgStringLoader(svgString);
    } else {
      svgLoader = SvgFileLoader(svgFile!);
    }
  }

  factory SvgEditorImage.fromJson(
    Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    bool isThumbnail = false,
    required String sbnPath,
    required AssetCacheAll assetCacheAll,
  }) {
    String? extension = json['e'] as String?;
    assert(extension == null || extension == '.svg');

    final assetIndexJson = json['a'] as int?;
    final int? assetIndex;
    final String? svgString;
    File? svgFile;
    if (assetIndexJson != null) {
      if (inlineAssets == null) {
        svgFile =
            FileManager.getFile('$sbnPath${Editor.extension}.$assetIndexJson');
      } else {
        svgString = utf8.decode(inlineAssets[assetIndexJson]);
      }
    } else if (json['b'] != null) {
      svgString = json['b'] as String;
    } else {
      log.warning('SvgEditorImage.fromJson: no svg string found');
      svgString = '';
    }
    if (svgFile != null) {
      assetIndex = assetCacheAll.addSync(svgFile);
    }
    else {
      throw Exception('EditorImage.fromJson: svg image not in assets');
    }
    if (assetIndex<0){
      throw Exception('EditorImage.fromJson: svg image not in assets');
    }

    return SvgEditorImage(
      id: json['id'] ??
          -1, // -1 will be replaced by EditorCoreInfo._handleEmptyImageIds()
      assetCacheAll: assetCacheAll,
      assetId: assetIndex,
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
  Map<String, dynamic> toJson() {
    final json = super.toJson();

    // remove non-svg fields
    json.remove('t'); // thumbnail bytes
    assert(!json.containsKey('a'));
    assert(!json.containsKey('b'));

    final svgData = _extractSvg();
    json['a'] = assetId;

    return json;
  }

  ({String? string, File? file}) _extractSvg() => switch (svgLoader) {
        (SvgStringLoader loader) => (
            string: loader.provideSvg(null),
            file: null
          ),
        (SvgFileLoader loader) => (string: null, file: loader.file),
        (_) => throw ArgumentError.value(svgLoader, 'svgLoader',
            'SvgEditorImage.toJson: svgLoader must be a SvgStringLoader or SvgFileLoader'),
      };

  @override
  Future<void> firstLoad() async {
    if (srcRect.shortestSide == 0 || dstRect.shortestSide == 0) {
      final pictureInfo = await vg.loadPicture(svgLoader, null);
      naturalSize = pictureInfo.size;
      pictureInfo.picture.dispose();

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

    if (naturalSize == Size.zero) {
      naturalSize = Size(srcRect.width, srcRect.height);
    }
  }

  @override
  Future<void> loadIn() async => await super.loadIn();

  @override
  Future<bool> loadOut() async => await super.loadOut();

  @override
  Future<void> precache(BuildContext context) async {
    final pictureInfo = await vg.loadPicture(svgLoader, null);
    pictureInfo.picture.dispose();
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
      child: SvgPicture(
        svgLoader,
        fit: boxFit,
      ),
    );
  }

  @override
  SvgEditorImage copy() {
    final svgData = _extractSvg();
    return SvgEditorImage(
      id: id,
      // ignore: deprecated_member_use_from_same_package
      assetCacheAll: assetCacheAll,
      assetId: assetId,
      svgString: svgData.string,
      svgFile: svgData.file,
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
}
