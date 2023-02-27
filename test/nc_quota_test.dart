import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';

void main() {
  test('Test getting the nc storage quota', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = null; // enable http requests in test

    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    Prefs.username.value = 'test.deletion';
    Prefs.ncPassword.value = 'test.deletion';
    Prefs.encPassword.value = 'test.deletion';

    expect(Prefs.lastStorageQuota.value, isNull);

    final quota = await NextcloudProfile.getStorageQuota();
    expect(quota, isNotNull);
    expect(quota!, Prefs.lastStorageQuota.value);
    expect(quota.used, greaterThan(0));
    expect(quota.total, greaterThan(0));
    expect(quota.used, lessThan(quota.total));
    expect(quota.free, quota.total - quota.used);
    expect(quota.relative, greaterThan(0));
  });
}
