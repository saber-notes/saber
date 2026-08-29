import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/quota.dart';

import 'utils/test_user.dart';

void main() {
  group('QuotaCodec', () {
    final quota = TestUser.getQuota();
    test('encode', () {
      const codec = QuotaCodec();
      final encoded = codec.encode(quota);
      expect(encoded, ['2050656229', '5368709120']);
    });
    test('decode', () {
      const codec = QuotaCodec();
      final encoded = ['2050656229', '5368709120'];
      final decoded = codec.decode(encoded);
      expect(decoded.raw.used, quota.raw.used);
      expect(decoded.raw.total, quota.raw.total);
      expect(decoded.raw.free, quota.raw.free);
      expect(
        decoded.raw.relative,
        moreOrLessEquals(quota.raw.relative.toDouble(), epsilon: 0.0001),
      );
    });
  });
}
