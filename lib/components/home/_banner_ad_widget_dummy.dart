import 'package:flutter/material.dart';

abstract class AdState {
  static bool get adsSupported => false;

  static void init() {}
}

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
