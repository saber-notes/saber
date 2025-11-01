import 'package:saber/components/settings/nextcloud_profile.dart';

abstract class TestUser {
  static Quota getQuota() {
    const total = 5 * 1024 * 1024 * 1024; // 5 GB
    const usedRatio = 1 - 1 / 1.61803;
    final usedBytes = (total * usedRatio).round();
    return Quota.fromJson({
      'free': total - usedBytes,
      'used': usedBytes,
      'total': total,
      'relative': (1000 * usedRatio).round() / 10,
    });
  }
}
