
import 'dart:typed_data';
import 'dart:ui';

class EditorImage {
  final Uint8List bytes;
  final int pageIndex;
  void Function(EditorImage, Rect)? onMoveImage;
  final VoidCallback? onLoad;

  Rect srcRect = Rect.zero;
  Rect dstRect = Rect.zero;

  /// If the image is new, it will be [active] (draggable) when loaded
  bool newImage = false;

  EditorImage({
    required this.bytes,
    required this.pageIndex,
    required Size pageSize,
    required this.onMoveImage,
    this.onLoad,
    this.newImage = true,
  }) {
    _getImage(pageSize).then((_) => onLoad?.call());
  }

  EditorImage.fromJson(Map<String, dynamic> json) :
        bytes = Uint8List.fromList((json['b'] as List<dynamic>?)?.cast<int>() ?? []),
        pageIndex = json['i'] ?? 0,
        onLoad = null,
        dstRect = Rect.fromLTWH(
          json['x'] ?? 0,
          json['y'] ?? 0,
          json['w'] ?? 0,
          json['h'] ?? 0,
        ),
        srcRect = Rect.fromLTWH(
          json['sx'] ?? 0,
          json['sy'] ?? 0,
          json['sw'] ?? 0,
          json['sh'] ?? 0,
        ) {
    _getImage();
  }

  Map<String, dynamic> toJson() {
    final json = {
      'b': bytes,
      'i': pageIndex,
      'x': dstRect.left,
      'y': dstRect.top,
      'w': dstRect.width,
      'h': dstRect.height,
    };

    if (srcRect.left != 0) json['sx'] = srcRect.left;
    if (srcRect.top != 0) json['sy'] = srcRect.top;
    if (srcRect.width != 0) json['sw'] = srcRect.width;
    if (srcRect.height != 0) json['sh'] = srcRect.height;

    return json;
  }

  Future<void> _getImage([Size? pageSize]) async {
    ImageDescriptor imageDescriptor = await ImageDescriptor.encoded(await ImmutableBuffer.fromUint8List(bytes));
    Codec codec = await imageDescriptor.instantiateCodec();
    FrameInfo frameInfo = await codec.getNextFrame();
    Image image = frameInfo.image;
    try {
      if (srcRect.width == 0 || srcRect.height == 0) {
        srcRect = Rect.fromLTWH(srcRect.left, srcRect.top, image.width.toDouble(), image.height.toDouble());
      }
      if (dstRect.width == 0 || dstRect.height == 0) {
        double width = image.width.toDouble(),
            height = image.height.toDouble();
        if (pageSize != null) {
          double aspectRatio = width / height;
          if (width > pageSize.width) {
            width = pageSize.width;
            height = width / aspectRatio;
          }
          if (height > pageSize.height) {
            height = pageSize.height;
            width = height * aspectRatio;
          }
        }
        dstRect = Rect.fromLTWH(dstRect.left, dstRect.top, width, height);
      }
    } finally {
      image.dispose();
    }
  }

}
