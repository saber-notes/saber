import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:saber/data/sentry/sentry_filter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

export 'package:sentry_flutter/sentry_flutter.dart' show SentryWidget;

bool get isSentryAvailable {
  return true; // false in the FOSS version of this file
}

bool get isSentryEnabled => _isSentryEnabled;
late bool _isSentryEnabled;

FutureOr<void> initSentry(FutureOr<void> Function() appRunner) async {
  SentryWidgetsFlutterBinding.ensureInitialized();
  Stows.markAsOnMainIsolate();
  await stows.sentryConsent.waitUntilRead();
  _isSentryEnabled = switch (stows.sentryConsent.value) {
    SentryConsent.unknown => false,
    SentryConsent.granted => true,
    SentryConsent.denied => false,
  };

  if (!isSentryEnabled) {
    return appRunner();
  }

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://66937061678418b37c7b29cbfa1a0105@o4509780708229120.ingest.de.sentry.io/4509780710654032';
      options.addIntegration(LoggingIntegration());
      // Filter data before sending
      options.beforeSend = SentryFilter.beforeSend;
      // Reduce data collection
      options.sendDefaultPii = false;
      options.enableAutoPerformanceTracing = false;
      options.enableUserInteractionTracing = false;
      options.reportViewHierarchyIdentifiers = false;
      options.useFlutterBreadcrumbTracking();
      options.enableAppLifecycleBreadcrumbs = false;
      options.enableBrightnessChangeBreadcrumbs = false;
      options.enableUserInteractionBreadcrumbs = false;
      // Native SDK fails on Linux for me
      options.enableNativeCrashHandling = !Platform.isLinux;
    },
    appRunner: appRunner,
  );
}

/// Tests typically don't use [initSentry] so this just sets the flag
/// so we don't get late initialization errors.
@visibleForTesting
void disableSentryForTesting() {
  _isSentryEnabled = false;
}
