
import 'dart:typed_data';
import 'dart:ui';

class EditorImage {
  final Uint8List bytes;
  final int pageIndex;
  final VoidCallback? onLoad;

  Rect _srcRect = Rect.zero;
  Rect _dstRect = Rect.zero;
  Rect get srcRect => _srcRect;
  Rect get dstRect => _dstRect;

  EditorImage({
    required this.bytes,
    required this.pageIndex,
    this.onLoad,
  }) {
    _getImage().then((_) => onLoad?.call());
  }

  EditorImage.fromJson(Map<String, dynamic> json) :
        bytes = Uint8List.fromList((json['b'] as List<dynamic>?)?.cast<int>() ?? []),
        pageIndex = json['i'] ?? 0,
        onLoad = null,
        _dstRect = Rect.fromLTWH(
          json['x'] ?? 0,
          json['y'] ?? 0,
          json['w'] ?? 0,
          json['h'] ?? 0,
        ),
        _srcRect = Rect.fromLTWH(
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

  Future<void> _getImage() async {
    ImageDescriptor imageDescriptor = await ImageDescriptor.encoded(await ImmutableBuffer.fromUint8List(bytes));
    Codec codec = await imageDescriptor.instantiateCodec();
    FrameInfo frameInfo = await codec.getNextFrame();
    Image image = frameInfo.image;
    try {
      if (srcRect.width == 0 || srcRect.height == 0) {
        _srcRect = Rect.fromLTWH(_srcRect.left, _srcRect.top, image.width.toDouble(), image.height.toDouble());
      }
      if (_dstRect.width == 0 || _dstRect.height == 0) {
        _dstRect = Rect.fromLTWH(_dstRect.left, _dstRect.top, image.width.toDouble(), image.height.toDouble());
      }
    } finally {
      image.dispose();
    }
  }

}
