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

class SentryWidget extends StatelessWidget {
  const SentryWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => child;
}
