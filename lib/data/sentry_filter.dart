import 'dart:async';

import 'package:sentry_flutter/sentry_flutter.dart';

abstract class SentryFilter {
  static FutureOr<SentryEvent?> beforeSend(SentryEvent event, Hint hint) async {
    var message = event.message?.formatted;
    if (message != null) {
      // Remove SaberSyncFile(...)
      final saberSyncFileRegex = RegExp(r'SaberSyncFile\(.+\)');
      if (message.contains(saberSyncFileRegex)) {
        message =
            message.replaceAll(saberSyncFileRegex, 'SaberSyncFile([redacted])');
        event.message = SentryMessage(message);
      }

      // Redact remote file paths
      final remoteFileRegex = RegExp(r'([a-zA-Z0-9]+\.sbe)');
      if (message.contains(remoteFileRegex)) {
        message = message.replaceAll(remoteFileRegex, '[redacted].sbe');
        event.message = SentryMessage(message);
      }
    }
    return event;
  }
}
