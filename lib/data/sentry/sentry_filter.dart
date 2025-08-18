import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class SentryFilter {
  /// Patterns to redact in Sentry events.
  ///
  /// Note: When editing these, also update the server-side filters in
  /// https://saber-yf.sentry.io/settings/security-and-privacy/
  /// so users on older versions of Saber still get their data scrubbed.
  @visibleForTesting
  static final replacements = <Pattern, String>{
    // SaberSyncFile(...)
    RegExp(r'SaberSyncFile\(.+\)'): 'SaberSyncFile([redacted])',
    // Remote file paths
    RegExp(r'[a-zA-Z0-9]+\.sbe'): 'abef1289.sbe',
    // Local file paths
    RegExp(r'[/\\][^/\\]+\.sbn2'): '/somefile.sbn2',
    // Domain names
    RegExp(r'://[a-zA-Z0-9.-]+'): '://example.com',
    // Login flow token
    RegExp(r'/flow/[a-zA-Z0-9/-]+'): '/flow/XXXXXXXXXX',
    // Session passphrase
    RegExp(r'oc_sessionPassphrase=[^;)}]+'): 'oc_sessionPassphrase=XXXXXXXXXX',
    // WebDAV paths
    RegExp(r'/webdav/[^ ;)\],]+'): '/webdav/path/to/something',
  };

  /// A list of known user credentials that should be redacted.
  @visibleForTesting
  static List<String> getSecrets() => [
        stows.username.value,
        stows.ncPassword.value,
        stows.encPassword.value,
        stows.key.value,
        stows.iv.value,
      ];

  static FutureOr<SentryEvent?> beforeSend(SentryEvent event, Hint hint) async {
    if (stows.sentryConsent.value != SentryConsent.granted) {
      // The user revoked consent but hasn't restarted the app yet.
      // Return null to discard (not send) this event.
      return null;
    }

    if (event.message != null) {
      var message = event.message!.formatted;
      var messageChanged = false;

      // Redact known patterns
      for (final entry in replacements.entries) {
        if (message.contains(entry.key)) {
          message = message.replaceAll(entry.key, entry.value);
          messageChanged = true;
        }
      }

      // Redact user credentials
      for (final secret in getSecrets()) {
        if (secret.isEmpty) continue;
        if (message.contains(secret)) {
          message = message.replaceAll(secret, '[redacted]');
          messageChanged = true;
        }
      }

      if (messageChanged) {
        event.message = SentryMessage(message);
      }
    }
    return event;
  }
}
