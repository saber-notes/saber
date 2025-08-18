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

    test('Redacts local file paths (Windows)', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage('Local file path: \\path\\to\\secrets.sbn2'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Local file path: \\path\\to/somefile.sbn2');
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

    test('Redacts session passphrase', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage(
              'headers: {set-cookie: oc_sessionPassphrase=Abcdefg%123456%%2F4; path=/; secure; HttpOnly}'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'headers: {set-cookie: oc_sessionPassphrase=XXXXXXXXXX; path=/; secure; HttpOnly}');
    });

    test('Redacts webdav paths', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage(
              'uri=https://website.org/remote.php/webdav/Saber; failed'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'uri=https://example.com/remote.php/webdav/path/to/something; failed');
    });

    test('Redacts Windows user folder', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage('C:\\Users\\bill\\Documents\\Saber'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'C:\\Users\\[USER]\\Documents\\Saber');
    });

    test('Redacts Linux user folder', () async {
      final originalEvent =
          SentryEvent(message: SentryMessage('/home/linus/Documents/Saber'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted, '/home/[USER]/Documents/Saber');
    });

    test('Redacts macOS user folder', () async {
      final originalEvent =
          SentryEvent(message: SentryMessage('/Users/steve/Documents/Saber'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(
          filteredEvent?.message?.formatted, '/Users/[USER]/Documents/Saber');
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

    test('Redacts previous and current secrets', () async {
      stows.username.value = 'john.doe';
      final originalEvent =
          SentryEvent(message: SentryMessage('john.doe and jane.doe'));
      var filteredEvent = await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted, '[redacted] and jane.doe');

      stows.username.value = 'jane.doe';
      filteredEvent = await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted, '[redacted] and [redacted]');
    });
  });
}
