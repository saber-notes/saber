import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/sentry_filter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  group('Sentry filter:', () {
    const remoteFile = 'Saber/a7c452ee393a9c995efce3cccd27bf7b.sbe';
    const localFile = '/path/to/somenote.sbn2';

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
          'Remote file path: Saber/[redacted].sbe');
    });

    test('Redacts local file paths', () async {
      final originalEvent =
          SentryEvent(message: SentryMessage('Local file path: $localFile'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Local file path: /path/to/[redacted].sbn2');
    });

    test('Redacts local asset paths', () async {
      final originalEvent =
          SentryEvent(message: SentryMessage('Asset: $localFile.0'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Asset: /path/to/[redacted].sbn2.0');
    });

    test('Redacts domain names', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage('Domain: https://example.com/index.php/#/'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Domain: https://[redacted]/index.php/#/');
    });
  });
}
