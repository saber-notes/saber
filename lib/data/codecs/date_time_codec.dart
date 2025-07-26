import 'dart:convert';

class DateTimeCodec extends Codec<DateTime, String> {
  const DateTimeCodec();

  @override
  final encoder = const DateTimeEncoder();

  @override
  final decoder = const DateTimeDecoder();
}

class DateTimeEncoder extends Converter<DateTime, String> {
  const DateTimeEncoder();

  @override
  String convert(DateTime input) => input.toIso8601String();
}

class DateTimeDecoder extends Converter<String, DateTime> {
  const DateTimeDecoder();

  @override
  DateTime convert(String input) => DateTime.parse(input);
}
