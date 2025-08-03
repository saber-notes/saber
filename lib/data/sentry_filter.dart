import 'dart:async';

import 'package:sentry_flutter/sentry_flutter.dart';

abstract class SentryFilter {
  static final saberSyncFileRegex = RegExp(r'SaberSyncFile\(.+\)');
  static final remoteFileRegex = RegExp(r'([a-zA-Z0-9]+\.sbe)');
  static final localFileRegex = RegExp(r'/[a-zA-Z0-9_.-]+\.sbn2');
  static final domainRegex = RegExp(r'://[a-zA-Z0-9.-]+');

  static FutureOr<SentryEvent?> beforeSend(SentryEvent event, Hint hint) async {
    var message = event.message?.formatted;
    if (message != null) {
      // Remove SaberSyncFile(...)
      if (message.contains(saberSyncFileRegex)) {
        message =
            message.replaceAll(saberSyncFileRegex, 'SaberSyncFile([redacted])');
        event.message = SentryMessage(message);
      }

      // Redact remote file paths
      if (message.contains(remoteFileRegex)) {
        message = message.replaceAll(remoteFileRegex, '[redacted].sbe');
        event.message = SentryMessage(message);
      }

      // Redact local file paths
      if (message.contains(localFileRegex)) {
        message = message.replaceAll(localFileRegex, '/[redacted].sbn2');
        event.message = SentryMessage(message);
      }

      // Redact domain names
      if (message.contains(domainRegex)) {
        message = message.replaceAll(domainRegex, '://[redacted]');
        event.message = SentryMessage(message);
      }
    }
    return event;
  }
}
