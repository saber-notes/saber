import 'dart:convert';
import 'dart:typed_data';

import 'package:stow_codecs/stow_codecs.dart';

class const Base64StowCodec() extends AbstractCodec<Uint8List, String> {
  @override
  String encode(Uint8List input) => base64.encode(input);

  @override
  Uint8List decode(String encoded) => base64.decode(encoded);
}
