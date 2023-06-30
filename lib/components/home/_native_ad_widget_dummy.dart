import 'package:flutter/material.dart';

abstract class AdState {
  static bool get adsSupported => false;

  static void init() {}
}

class NativeAdWidget extends StatelessWidget {
  const NativeAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
