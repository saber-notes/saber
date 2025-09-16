import 'dart:convert';
import 'dart:typed_data';

import 'package:stow_codecs/stow_codecs.dart';

class Base64StowCodec extends AbstractCodec<Uint8List?, Object?> {
  const Base64StowCodec();

  @override
  String? encode(Uint8List? input) {
    if (input == null) return null;
    return base64.encode(input);
  }

  @override
  Uint8List? decode(Object? encoded) {
    if (encoded == null) return null;
    if (encoded is String) return base64.decode(encoded);
    if (encoded is Uint8List) return encoded;
    throw ArgumentError('Base64StowDecoder can only decode Strings, '
        'got: $encoded');
  }
}
