import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/data/nextcloud/readable_bytes.dart';

extension QuotaExtension on Quota {
  double get progressIndicatorValue {
    if (relative < 0) return 0;
    // At least 4% so the rounded corners render properly
    return relative.clamp(4, 100) / 100;
  }

  double get percentRounded {
    if (relative < 0) return 0;
    return (relative * 10).round() / 10;
  }
}

extension MaybeQuotaExtension on Quota? {
  String get summary {
    final used = readableBytes(this?.used);
    // Nextcloud returns -3 for unlimited quota (SPACE_UNLIMITED).
    // -2 is unknown (SPACE_UNKNOWN) and -1 is not computed (SPACE_NOT_COMPUTED).
    // We treat all negative values as unlimited ('∞') for simplicity.
    final total = (this?.total ?? 0) < 0 ? '∞' : readableBytes(this?.total);
    return '$used / $total';
  }
}
