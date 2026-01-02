import 'package:flutter_test/flutter_test.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/data/extensions/quota_extension.dart';

void main() {
  group('QuotaExtension', () {
    test('normal quota', () {
      final quota = UserDetailsQuota.fromJson({
        'free': 50,
        'used': 50,
        'total': 100,
        'relative': 50.0,
        'quota': -3,
      });

      expect(quota.percentRounded, 50.0);
      expect(quota.progressIndicatorValue, 0.5);
      expect(quota.summary, '50 B / 100 B');
    });

    test('unlimited quota (negative total)', () {
      final quota = UserDetailsQuota.fromJson({
        'free': 0,
        'used': 54800000,
        'total': -3,
        'relative': -1234567.89,
        'quota': -3,
      });
      expect(quota.percentRounded, 0.0);
      expect(quota.progressIndicatorValue, 0.0);
      expect(quota.summary, contains('/ ∞'));
    });

    test('null quota summary', () {
      const Quota? quota = null;
      expect(quota.summary, '... B / ... B');
    });
  });
}
