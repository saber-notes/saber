import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

const isSentryAvailable = false;
const isSentryEnabled = false;

Future<void> initSentry(FutureOr<void> Function() appRunner) async {
  WidgetsFlutterBinding.ensureInitialized();
  Stows.markAsOnMainIsolate();
  await stows.sentryConsent.waitUntilRead();

  return appRunner();
}

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
