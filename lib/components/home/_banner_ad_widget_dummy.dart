import 'dart:async';

import 'package:flutter/material.dart';

const _kDummyAdMessage = 'This is a dummy class for when ads are disabled.';

@Deprecated(_kDummyAdMessage)
abstract class AdState {
  @Deprecated(_kDummyAdMessage)
  static bool get adsSupported => false;
  @Deprecated(_kDummyAdMessage)
  static bool get adsEnabled => false;

  @Deprecated(_kDummyAdMessage)
  static void init() {}

  @Deprecated(_kDummyAdMessage)
  static void showConsentForm() {}
}

@Deprecated(_kDummyAdMessage)
class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({
    super.key,
    this.adSize = AdSize.banner,
  }) : fallbackAdSize = adSize;

  const BannerAdWidget.adaptive({
    super.key,
    required double screenWidth,
    this.fallbackAdSize = AdSize.banner,
  }) : adSize = fallbackAdSize;

  final AdSize adSize;
  final AdSize fallbackAdSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: adSize.width.toDouble(),
      height: adSize.height.toDouble(),
      child: const Placeholder(),
    );
  }
}

@Deprecated(_kDummyAdMessage)
class AdSize {
  const AdSize({
    required this.width,
    required this.height,
  });

  final int width;
  final int height;

  @Deprecated(_kDummyAdMessage)
  static const banner = AdSize(width: 320, height: 50);

  @Deprecated(_kDummyAdMessage)
  static Future<AdSize> getCurrentOrientationAnchoredAdaptiveBannerAdSize(
    int width,
  ) async {
    return banner;
  }
}
