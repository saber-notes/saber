import 'package:stow_codecs/stow_codecs.dart';

class DateTimeCodec extends AbstractCodec<DateTime, String> {
  const DateTimeCodec();

  @override
  String encode(DateTime input) => input.toIso8601String();

  @override
  DateTime decode(String encoded) => DateTime.parse(encoded);
}
