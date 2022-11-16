
import 'dart:typed_data';
import 'dart:ui';

class EditorImage {
  final Uint8List bytes;
  final int pageIndex;

  Image? _image;
  Rect _srcRect = Rect.zero;
  Rect _dstRect = Rect.zero;
  Image? get image => _image;
  Rect get srcRect => _srcRect;
  Rect get dstRect => _dstRect;

  EditorImage({
    required this.bytes,
    required this.pageIndex,
  }) {
    _getImage();
  }

  EditorImage.fromJson(Map<String, dynamic> json) :
        bytes = Uint8List.fromList(json['b'] as List<int>? ?? []),
        pageIndex = json['i'] ?? 0,
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
    json['sw'] = srcRect.width;
    json['sh'] = srcRect.height;

    return json;
  }

  Future<void> _getImage() async {
    ImageDescriptor imageDescriptor = await ImageDescriptor.encoded(await ImmutableBuffer.fromUint8List(bytes));
    Codec codec = await imageDescriptor.instantiateCodec();
    FrameInfo frameInfo = await codec.getNextFrame();
    _image = frameInfo.image;
    _srcRect = Rect.fromLTWH(_srcRect.left, _srcRect.top, _image!.width.toDouble(), _image!.height.toDouble());
    if (_dstRect.width == 0 || _dstRect.height == 0) {
      _dstRect = Rect.fromLTWH(_dstRect.left, _dstRect.top, _image!.width.toDouble(), _image!.height.toDouble());
    }
  }

}
