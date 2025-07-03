import 'dart:convert';

import 'package:saber/components/settings/nextcloud_profile.dart';

class QuotaCodec extends Codec<Quota, List> {
  const QuotaCodec();

  @override
  final encoder = const _QuotaEncoder();

  @override
  final decoder = const _QuotaDecoder();
}

class _QuotaEncoder extends Converter<Quota, List<String>> {
  const _QuotaEncoder();

  @override
  List<String> convert(Quota input) {
    return [input.used.toString(), input.total.toString()];
  }
}

class _QuotaDecoder extends Converter<List<dynamic>, Quota> {
  const _QuotaDecoder();

  @override
  Quota convert(List<dynamic> input) {
    if (input.length != 2) {
      throw FormatException('Invalid quota format: $input');
    }
    final used = int.tryParse(input[0]) ?? 0;
    final total = int.tryParse(input[1]) ?? 0;
    return Quota.fromJson({
      'free': total - used,
      'used': used,
      'total': total,
      'relative': used / total * 100,
      // I don't know what this [quota] field is for, but I don't use it
      'quota': total,
    });
  }
}
