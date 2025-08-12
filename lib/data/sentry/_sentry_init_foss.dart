import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

/// Whether the Sentry SDK is available for use.
/// Also see [isSentryEnabled].
///
/// This flag is always false since the foss patches were applied.
const isSentryAvailable = false;

/// Whether Sentry was initialized when the app started.
///
/// This flag is always false since the foss patches were applied.
const isSentryEnabled = false;

Future<void> initSentry(FutureOr<void> Function() appRunner) async {
  WidgetsFlutterBinding.ensureInitialized();
  Stows.markAsOnMainIsolate();
  await stows.sentryConsent.waitUntilRead();

  return appRunner();
}

@visibleForTesting
void populateSentryOptions(dynamic options) {}

/// Tests typically don't use [initSentry] so this just sets the flag
/// so we don't get late initialization errors.
@visibleForTesting
void disableSentryForTesting() {
  // Nothing needed in the FOSS build, since [isSentryEnabled] is const.
}

class SentryWidget extends StatelessWidget {
  const SentryWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => child;
}
