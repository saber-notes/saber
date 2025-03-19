import 'package:flutter/material.dart';

class OnyxSdkPenArea extends StatelessWidget {
  const OnyxSdkPenArea({
    super.key,
    this.refreshDelay = const Duration(seconds: 1),
    this.strokeStyle = 0,
    this.strokeColor = 0,
    this.strokeWidth = 3.0,

    required this.child,
  });

  final Duration refreshDelay;
  final int strokeStyle;
  final int strokeColor;
  final double strokeWidth;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  static Future<bool> init() async {
    return false;
  }
}
