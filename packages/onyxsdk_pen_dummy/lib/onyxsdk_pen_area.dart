import 'package:flutter/material.dart';

class OnyxSdkPenArea extends StatelessWidget {
  const OnyxSdkPenArea({
    Key? key,
    this.refreshDelayMs = 1000,
    required this.child,
  }) : super(key: key);

  final int refreshDelayMs;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
