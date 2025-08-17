import 'dart:async';

import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class SentryFilter {
  static final saberSyncFileRegex = RegExp(r'SaberSyncFile\(.+\)');
  static final remoteFileRegex = RegExp(r'([a-zA-Z0-9]+\.sbe)');
  static final localFileRegex = RegExp(r'/[a-zA-Z0-9_.-]+\.sbn2');
  static final domainRegex = RegExp(r'://[a-zA-Z0-9.-]+');
  static final loginFlowRegex = RegExp(r'/flow/[a-zA-Z0-9/-]+');
  static final ocSessionPassphraseRegex =
      RegExp(r'oc_sessionPassphrase=[^;)}]+');

  static const redacted = '[redacted]';

  static FutureOr<SentryEvent?> beforeSend(SentryEvent event, Hint hint) async {
    if (stows.sentryConsent.value != SentryConsent.granted) {
      // The user revoked consent but hasn't restarted the app yet.
      return null;
    }

    var message = event.message?.formatted;
    if (message != null) {
      // Remove SaberSyncFile(...)
      if (message.contains(saberSyncFileRegex)) {
        message =
            message.replaceAll(saberSyncFileRegex, 'SaberSyncFile($redacted)');
        event.message = SentryMessage(message);
      }

      // Redact remote file paths
      if (message.contains(remoteFileRegex)) {
        message = message.replaceAll(remoteFileRegex, 'abef1289.sbe');
        event.message = SentryMessage(message);
      }

      // Redact local file paths
      if (message.contains(localFileRegex)) {
        message = message.replaceAll(localFileRegex, '/somefile.sbn2');
        event.message = SentryMessage(message);
      }

      // Redact domain names
      if (message.contains(domainRegex)) {
        message = message.replaceAll(domainRegex, '://example.com');
        event.message = SentryMessage(message);
      }

      // Redact login flow token
      if (message.contains(loginFlowRegex)) {
        message = message.replaceAll(loginFlowRegex, '/flow/XXXXXXXXXX');
        event.message = SentryMessage(message);
      }

      // Redact session passphrase
      if (message.contains('oc_sessionPassphrase=')) {
        message = message.replaceAll(
            ocSessionPassphraseRegex, 'oc_sessionPassphrase=XXXXXXXXXX');
        event.message = SentryMessage(message);
      }

      // Redact current user credentials
      final credentials = [
        stows.username.value,
        stows.ncPassword.value,
        stows.encPassword.value,
        stows.key.value,
        stows.iv.value,
      ];
      for (final credential in credentials) {
        if (credential.isEmpty) continue;
        if (message!.contains(credential)) {
          message = message.replaceAll(credential, redacted);
          event.message = SentryMessage(message);
        }
      }
    }
    return event;
  }
}
