import 'package:flutter/material.dart';

abstract class AdState {
  static bool get adsSupported => false;

  static void init() {}

  static void showConsentForm() {}
}

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({
    super.key,
    required this.adSize,
  });

  final AdSize adSize;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class AdSize {
  const AdSize({
    required this.width,
    required this.height,
  });

  final int width;
  final int height;
}
