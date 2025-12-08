import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:saber/data/is_this_a_test.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_filter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

export 'package:sentry_flutter/sentry_flutter.dart' show SentryWidget;

/// Whether the Sentry SDK is available for use.
/// Also see [isSentryEnabled].
///
/// This flag will be:
/// - false if the foss patches were applied before this build
/// - false on Linux (except in tests)
/// - true otherwise
@pragma('vm:platform-const-if', !kDebugMode)
bool get isSentryAvailable => !Platform.isLinux || isThisATest;

/// Whether Sentry was initialized when the app started.
///
/// This flag does not change after initialization. Changes to the user's consent
/// (mostly*) take place after restarting the app.
/// (*When revoked, [SentryFilter.beforeSend] discards all further events.)
bool get isSentryEnabled => _isSentryEnabled;
late bool _isSentryEnabled;

FutureOr<void> initSentry(FutureOr<void> Function() appRunner) async {
  SentryWidgetsFlutterBinding.ensureInitialized();
  Stows.markAsOnMainIsolate();
  await stows.sentryConsent.waitUntilRead();
  _isSentryEnabled = switch (stows.sentryConsent.value) {
    .unknown => false,
    .granted => true,
    .denied => false,
  };

  if (!isSentryAvailable || !isSentryEnabled) {
    return appRunner();
  }

  await SentryFlutter.init(populateSentryOptions, appRunner: appRunner);
}

@visibleForTesting
void populateSentryOptions(SentryFlutterOptions options) {
  options.dsn =
      'https://66937061678418b37c7b29cbfa1a0105@o4509780708229120.ingest.de.sentry.io/4509780710654032';
  options.addIntegration(LoggingIntegration());
  options.environment = kDebugMode ? 'debug' : 'release';
  // Filter data before sending
  options.beforeSend = SentryFilter.beforeSend;
  // Reduce data collection
  options.sendDefaultPii = false;
  options.enableAutoPerformanceTracing = false;
  options.enableUserInteractionTracing = false;
  options.reportViewHierarchyIdentifiers = false;
  options.useFlutterBreadcrumbTracking(); // disable native breadcrumbs
  options.enableAppLifecycleBreadcrumbs = false;
  options.enableBrightnessChangeBreadcrumbs = false;
  options.enableUserInteractionBreadcrumbs = false;
}

/// Tests typically don't use [initSentry] so this just sets the flag
/// so we don't get late initialization errors.
@visibleForTesting
void disableSentryForTesting() {
  _isSentryEnabled = false;
}
