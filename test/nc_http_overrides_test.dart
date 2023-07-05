import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/nextcloud/nc_http_overrides.dart';

void main() {
  group('Insecure certificates should be blocked for', () {
    test('nc.saber.adil.hanney.org', () {
      expect(NcHttpOverrides.doesHostNeedToBeSecure('nc.saber.adil.hanney.org'), isTrue);
    });
    test('github.com', () {
      expect(NcHttpOverrides.doesHostNeedToBeSecure('github.com'), isTrue);
    });
  });
}
