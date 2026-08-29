import 'package:flutter/foundation.dart';
import 'package:nextcloud/provisioning_api.dart' show UserDetailsQuota;
import 'package:saber/data/nextcloud/readable_bytes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:stow_codecs/stow_codecs.dart';

typedef QuotaRaw = UserDetailsQuota;

extension type Quota(@visibleForTesting QuotaRaw raw) {
  /// For unlimited quotas, this amount of used storage will be represented by 0.5 in [usedRatio].
  // ignore: constant_identifier_names
  static const _5gb = 5 * 1024 * 1024 * 1024;

  /// Returns a number between 0.0 and 1.0 representing how much storage is being used.
  /// - For finite quotas, this is simply [QuotaRaw.used] divided by [QuotaRaw.total].
  /// - For unlimited quotas, we use an asymptotic curve on [QuotaRaw.used] to have a somewhat plausible value.
  double get usedRatio {
    if (isUncapped) {
      return 1 - 1 / (1 + raw.used / _5gb);
    }
    return raw.used / raw.total;
  }

  /// Whether the user has unlimited (uncapped) storage space.
  bool get isUncapped => raw.total < 0;

  /// Returns [usedRatio], clamped between 4% and 100%.
  /// (Less than 4% makes the progress bar a bit ugly.)
  double get progressIndicatorValue {
    // At least 4% so the rounded corners render properly
    return usedRatio.clamp(0.04, 1.0);
  }

  /// Formats the [usedRatio] as a percentage with up to one decimal place:
  /// e.g. `50` or `33.3`.
  ///
  /// Do not use this on uncapped quotas.
  double get _percentRounded {
    assert(!isUncapped, 'Percentages do not make sense with uncapped quotas.');
    final usedRatio = this.usedRatio;
    if (!usedRatio.isFinite) return 100.0;
    return (usedRatio * 100 * 10).round() / 10;
  }

  /// Describes this quota in natural language:
  /// - For finite quotas, see [Translations$profile$en.quotaUsage].
  /// - For uncapped quotas, see [Translations$profile$en.quotaUsageUncapped].
  String describe() {
    if (isUncapped) {
      return t.profile.quotaUsageUncapped(used: readableBytes(raw.used));
    }
    return t.profile.quotaUsage(
      used: readableBytes(raw.used),
      total: readableBytes(raw.total),
      percent: _percentRounded,
    );
  }

  /// Describes this quota succinctly,
  /// e.g. `819 MB / 2.0.0 GB`
  String describeConcise() {
    final used = readableBytes(raw.used);
    if (isUncapped) return used;
    final total = readableBytes(raw.total);
    return '$used / $total';
  }

  static String describePlaceholder() =>
      t.profile.quotaUsageUncapped(used: '... B');
  static String describeConcisePlaceholder() => '... B / ... B';
}

class const QuotaCodec() extends AbstractCodec<Quota, List> {
  @override
  List<String> encode(Quota input) {
    return [input.raw.used.toString(), input.raw.total.toString()];
  }

  @override
  Quota decode(List<dynamic> encoded) {
    if (encoded.length != 2) {
      throw FormatException('Invalid quota format: $encoded');
    }
    final used = int.tryParse(encoded[0]) ?? 0;
    final total = int.tryParse(encoded[1]) ?? 0;
    return Quota(
      .fromJson({
        'free': total - used,
        'used': used,
        'total': total,
        'relative': used / total * 100,
        // I don't know what this [quota] field is for, but I don't use it
        'quota': total,
      }),
    );
  }
}
