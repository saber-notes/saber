import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:stow_codecs/stow_codecs.dart';

class QuotaCodec extends AbstractCodec<Quota, List> {
  const QuotaCodec();

  @override
  List<String> encode(Quota input) {
    return [input.used.toString(), input.total.toString()];
  }

  @override
  Quota decode(List<dynamic> encoded) {
    if (encoded.length != 2) {
      throw FormatException('Invalid quota format: $encoded');
    }
    final used = int.tryParse(encoded[0]) ?? 0;
    final total = int.tryParse(encoded[1]) ?? 0;
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
