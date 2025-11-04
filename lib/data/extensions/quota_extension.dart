import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/data/nextcloud/readable_bytes.dart';

extension QuotaExtension on Quota {
  double get progressIndicatorValue {
    // At least 4% so the rounded corners render properly
    return relative.clamp(4, 100) / 100;
  }

  double get percentRounded {
    return (relative * 10).round() / 10;
  }
}

extension MaybeQuotaExtension on Quota? {
  String get summary {
    final used = readableBytes(this?.used);
    final total = readableBytes(this?.total);
    return '$used / $total';
  }
}
