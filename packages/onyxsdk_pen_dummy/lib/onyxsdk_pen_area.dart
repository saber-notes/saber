import 'package:flutter/material.dart';

class OnyxSdkPenArea extends StatelessWidget {
  const OnyxSdkPenArea({
    super.key,
    this.refreshDelay = const Duration(seconds: 1),
    required this.child,
  });

  final Duration refreshDelay;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  static Future<bool> init() async {
    return false;
  }
}
