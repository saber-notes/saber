import 'dart:async';

import 'package:flutter/material.dart';

const isSentryEnabled = false;

Future<void> initSentry(FutureOr<void> Function() appRunner) async =>
    appRunner();

class SentryWidget extends StatelessWidget {
  const SentryWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => child;
}
