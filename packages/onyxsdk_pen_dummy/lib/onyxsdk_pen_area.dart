import 'package:flutter/material.dart';

class OnyxSdkPenArea extends StatelessWidget {
  const OnyxSdkPenArea({
    super.key,
    this.refreshDelayMs = 1000,
    required this.child,
  });

  final int refreshDelayMs;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  static Future<bool> init() async {
    return false;
  }
}
