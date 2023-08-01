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
    required this.adSize,
  });

  final AdSize adSize;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
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
}
