import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/sentry_filter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  group('Sentry filter:', () {
    const remoteFile = 'Saber/a7c452ee393a9c995efce3cccd27bf7b.sbe';
    const localFile = '/somenote.sbn2';
    const syncFile = 'SaberSyncFile(local: $localFile, remote: $remoteFile)';

    test('Redacts SaberSyncFile', () async {
      final originalEvent = SentryEvent(
          message: SentryMessage('Uploaded: SaberSyncFile(SECRET)'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Transfer complete: SaberSyncFile([redacted])');
    });

    test('Redacts remote file paths', () async {
      final originalEvent =
          SentryEvent(message: SentryMessage('Remote file path: $remoteFile'));
      final filteredEvent =
          await SentryFilter.beforeSend(originalEvent, Hint());
      expect(filteredEvent?.message?.formatted,
          'Remote file path: Saber/[redacted].sbe');
    });
  });
}
