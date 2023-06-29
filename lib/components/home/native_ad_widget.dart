import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:saber/data/extensions/color_extensions.dart';

abstract class AdState {
  static bool _isInitialized = false;
  static late final String _nativeAdUnitId;

  static void init() {
    MobileAds.instance.initialize()
      .then((_) => _isInitialized = true);

    if (kDebugMode) { // test ads
      if (Platform.isAndroid) {
        _nativeAdUnitId = 'ca-app-pub-3940256099942544/2247696110';
      } else if (Platform.isIOS) {
        _nativeAdUnitId = 'ca-app-pub-3940256099942544/3986624511';
      } else {
        _nativeAdUnitId = '';
      }
    } else { // actual ads
      if (Platform.isAndroid) {
        _nativeAdUnitId = 'ca-app-pub-1312561055261176/2068585242';
      } else if (Platform.isIOS) {
        _nativeAdUnitId = 'ca-app-pub-1312561055261176/8606073431';
      } else {
        _nativeAdUnitId = '';
      }
    }
  }
  
  static Future<NativeAd?> _createNativeAd(ColorScheme colorScheme) async {
    if (_nativeAdUnitId.isEmpty) {
      if (kDebugMode) print('Native ad unit ID is empty.');
      return null;
    }

    while (!_isInitialized) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return NativeAd(
      adUnitId: _nativeAdUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          if (kDebugMode) print('Ad loaded!');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          if (kDebugMode) print('Ad failed to load: $error');
          ad.dispose();
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: colorScheme.primary.withOpacity(0.05),
        cornerRadius: 16,
        callToActionTextStyle: NativeTemplateTextStyle(
          backgroundColor: colorScheme.primary,
          textColor: colorScheme.onPrimary,
          size: 16,
        ),
      ),
    )..load();
  }
}

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  Future<NativeAd?>? nativeAd;

  @override
  Widget build(BuildContext context) {
    nativeAd ??= AdState._createNativeAd(Theme.of(context).colorScheme);
    return FutureBuilder(
      future: nativeAd,
      builder: (context, snapshot) {
        late final colorScheme = Theme.of(context).colorScheme;
        final nativeAd = snapshot.data;
        if (nativeAd == null) {
          return AspectRatio(
            aspectRatio: 1,
            child: Card(
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.rectangleAd,
                  color: colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ),
          );
        } else {
          return AdWidget(ad: nativeAd);
        }
      },
    );
  }

  @override
  void dispose() {
    nativeAd?.then((nativeAd) => nativeAd?.dispose());
    super.dispose();
  }
}
