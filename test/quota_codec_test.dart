import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/codecs/quota_codec.dart';

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
      expect(decoded.used, quota.used);
      expect(decoded.total, quota.total);
      expect(decoded.free, quota.free);
      expect(
        decoded.relative,
        moreOrLessEquals(quota.relative.toDouble(), epsilon: 0.0001),
      );
    });
  });
}
