import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/codecs/base64_codec.dart';

void main() {
  group('Base64StowCodec', () {
    test('encode', () {
      const base64 = Base64StowCodec();
      const inputString = 'Hello, World!';
      final inputBytes = utf8.encode(inputString);
      final encoded = base64.encode(Uint8List.fromList(inputBytes));
      expect(encoded, 'SGVsbG8sIFdvcmxkIQ==');
    });
    test('decode', () {
      const base64 = Base64StowCodec();
      const encodedString = 'SGVsbG8sIFdvcmxkIQ==';
      final decodedBytes = base64.decode(encodedString);
      final decodedString = utf8.decode(decodedBytes);
      expect(decodedString, 'Hello, World!');
    });
  });
}
