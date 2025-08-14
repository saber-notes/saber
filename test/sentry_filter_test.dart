import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:saber/data/sentry/sentry_filter.dart';
import 'package:saber/data/sentry/sentry_init.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  group('Sentry filter:', () {
    const remoteFile = 'Saber/a7c452ee393a9c995efce3cccd27bf7b.sbe';
    const localFile = '/path/to/somenote.sbn2';

    FlavorConfig.setup();
    setUp(() {
      stows.sentryConsent.value = SentryConsent.granted;
    });

    test('Filter is used', () {
      final options = SentryFlutterOptions();
      populateSentryOptions(options);
      expect(options.beforeSend, SentryFilter.beforeSend);
    });

    test('Returns null if consent is not granted', () async {
      stows.sentryConsent.value = SentryConsent.denied;

      final originalEvent =
          SentryEvent(message: SentryMessage('User revoked consent'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent, isNull);
    });

    test('Redacts SaberSyncFile', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage('Uploaded: SaberSyncFile(SECRET)'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Uploaded: SaberSyncFile([redacted])');
    });

    test('Redacts remote file paths', () async {
      final originalEvent =
          SentryEvent(message: SentryMessage('Remote file path: $remoteFile'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Remote file path: Saber/abef1289.sbe');
    });

    test('Redacts local file paths', () async {
      final originalEvent =
          SentryEvent(message: SentryMessage('Local file path: $localFile'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Local file path: /path/to/somefile.sbn2');
    });

    test('Redacts local asset paths', () async {
      final originalEvent =
          SentryEvent(message: SentryMessage('Asset: $localFile.0'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(
          filteredEvent?.message?.formatted, 'Asset: /path/to/somefile.sbn2.0');
    });

    test('Redacts domain names', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage('Domain: https://john.doe/nc/index.php/#/'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Domain: https://example.com/nc/index.php/#/');
    });

    test('Redacts login flow token', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage(
              'https://nc.saber.adil.hanney.org/index.php/login/v2/flow/ok8y2HIAYUGg2euh90sdhj'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'https://example.com/index.php/login/v2/flow/XXXXXXXXXX');
    });

    test('Redacts username', () async {
      stows.username.value = 'john.doe';
      final originalEvent =
          SentryEvent(message: SentryMessage('john doe john.doe'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted, 'john doe [redacted]');
    });

    test('Redacts ncPassword and encPassword', () async {
      const ncPassword = 'myNcPassword';
      const encPassword = 'myEncPassword';
      stows.ncPassword.value = ncPassword;
      stows.encPassword.value = encPassword;
      final originalEvent = SentryEvent(
          message: SentryMessage('Passwords: $ncPassword, $encPassword'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Passwords: [redacted], [redacted]');
    });

    test('Redacts key and iv', () async {
      const key = '0123456789abcdef';
      const iv = 'abc123';
      stows.key.value = key;
      stows.iv.value = iv;
      final originalEvent =
          SentryEvent(message: SentryMessage('Key: $key, IV: $iv'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(
          filteredEvent?.message?.formatted, 'Key: [redacted], IV: [redacted]');
    });
  });
}
