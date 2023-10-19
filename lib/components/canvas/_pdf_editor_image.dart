import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:saber/components/canvas/_editor_image.dart';

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

  @override
  Future<void> precache(BuildContext context) async {
    final memoryImage = await rasterized;
    if (!context.mounted) return;
    return await precacheImage(memoryImage, context);
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

    return FutureBuilder(
      future: rasterized,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          log.severe('Error rasterizing PDF: ${snapshot.error}');
          return const SizedBox.shrink();
        }
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }
        return Image(
          image: snapshot.data!,
          fit: boxFit,
        );
      },
    );
  }

  late final Future<ImageProvider> rasterized = () async {
    final raster = await Printing.raster(
      pdfBytes,
      pages: [pdfPage],
      dpi: PdfPageFormat.inch * 2,
    ).single;
    final png = await raster.toPng();
    return MemoryImage(png);
  }();
}
