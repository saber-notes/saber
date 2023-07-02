import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:saber/data/prefs.dart';

abstract class AdState {
  static bool _isInitialized = false;
  static late final String _bannerAdUnitId;

  static bool get adsSupported => _bannerAdUnitId.isNotEmpty;

  static void init() {
    if (kDebugMode) { // test ads
      if (Platform.isAndroid) {
        _bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
      } else if (Platform.isIOS) {
        _bannerAdUnitId = 'ca-app-pub-3940256099942544/2934735716';
      } else {
        _bannerAdUnitId = '';
      }
    } else { // actual ads
      if (Platform.isAndroid) {
        _bannerAdUnitId = 'ca-app-pub-1312561055261176/7616317590';
      } else if (Platform.isIOS) {
        _bannerAdUnitId = 'ca-app-pub-1312561055261176/9191971763';
      } else {
        _bannerAdUnitId = '';
      }
    }

    if (adsSupported && !Prefs.disableAds.value) {
      MobileAds.instance.initialize()
        .then((_) => _isInitialized = true);
    }
  }
  
  static const _bannerSize = AdSize.mediumRectangle;
  static Future<BannerAd?> _createBannerAd() async {
    if (_bannerAdUnitId.isEmpty) {
      if (kDebugMode) print('Banner ad unit ID is empty.');
      return null;
    }

    while (!_isInitialized) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return BannerAd(
      adUnitId: _bannerAdUnitId,
      request: const AdRequest(),
      size: _bannerSize,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          if (kDebugMode) print('Ad loaded!');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          if (kDebugMode) print('Ad failed to load: $error');
          ad.dispose();
        },
      ),
    )..load();
  }
}

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> with AutomaticKeepAliveClientMixin {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    AdState._createBannerAd().then((bannerAd) {
      if (mounted) {
        setState(() => _bannerAd = bannerAd);
      } else {
        _bannerAd = null;
        bannerAd?.dispose();
      }
      updateKeepAlive();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    late final colorScheme = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: FittedBox(
          fit: BoxFit.fill,
          child: SizedBox(
            width: AdState._bannerSize.width.toDouble(),
            height: AdState._bannerSize.height.toDouble(),
            child: _bannerAd == null
                ? Center(
                    child: FaIcon(
                      FontAwesomeIcons.rectangleAd,
                      color: colorScheme.onSurface.withOpacity(0.5),
                    ),
                  )
                : AdWidget(ad: _bannerAd!),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _bannerAd = null;
    super.dispose();
  }
  
  @override
  bool get wantKeepAlive => _bannerAd != null;
}
