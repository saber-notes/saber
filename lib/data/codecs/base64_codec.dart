import 'dart:convert';
import 'dart:typed_data';

class Base64StowCodec extends Codec<Uint8List?, Object?> {
  const Base64StowCodec();

  @override
  final encoder = const Base64StowEncoder();

  @override
  final decoder = const Base64StowDecoder();
}

class Base64StowEncoder extends Converter<Uint8List?, String?> {
  const Base64StowEncoder();

  @override
  String? convert(Uint8List? input) {
    if (input == null) return null;
    return base64.encode(input);
  }
}

class Base64StowDecoder extends Converter<Object?, Uint8List?> {
  const Base64StowDecoder();

  @override
  Uint8List? convert(Object? input) {
    if (input == null) return null;
    if (input is String) return base64.decode(input);
    if (input is Uint8List) return input;
    throw ArgumentError('Base64StowDecoder can only decode Strings, '
        'got: $input');
  }
}
