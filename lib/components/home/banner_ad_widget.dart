import 'dart:async';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';
import 'package:saber/data/prefs.dart';

export 'package:google_mobile_ads/google_mobile_ads.dart' show AdSize;

abstract class AdState {
  static bool _initializeStarted = false;
  static bool _initializeCompleted = false;
  static late final String _bannerAdUnitId;

  static bool get adsSupported => _bannerAdUnitId.isNotEmpty;
  static bool get adsEnabled => adsSupported && !Prefs.disableAds.value;

  static final log = Logger('AdState');

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

    if (adsSupported) {
      _startInitialize();
      Prefs.disableAds.addListener(_startInitialize);
    }
  }

  static void _startInitialize() async {
    if (!adsEnabled) return;
    assert(adsSupported);
    if (_initializeStarted) return;
    assert(!_initializeCompleted);

    if (Platform.isIOS) {
      var status = await AppTrackingTransparency.trackingAuthorizationStatus;
      if (status == TrackingStatus.notDetermined) {
        // wait to avoid crash
        await Future.delayed(const Duration(seconds: 3));

        status = await AppTrackingTransparency.requestTrackingAuthorization();
      }
      if (status == TrackingStatus.authorized) {
        _checkForRequiredConsent();
      }
    } else {
      _checkForRequiredConsent();
    }

    _initializeStarted = true;
    await MobileAds.instance.initialize();
    _initializeCompleted = true;
  }

  static void _checkForRequiredConsent() {
    final params = ConsentRequestParameters();
    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        final status = await ConsentInformation.instance.getConsentStatus();
        if (status != ConsentStatus.required) return;
        if (await ConsentInformation.instance.isConsentFormAvailable()) {
          showConsentForm();
        }
      },
      (formError) {},
    );
  }
  static void showConsentForm() {
    ConsentForm.loadConsentForm(
      (ConsentForm consentForm) async {
        consentForm.show(
          (formError) async {
            if (formError != null) {
              // Handle dismissal by reloading form
              showConsentForm();
            }
          }
        );
      },
      (formError) {},
    );
  }

  static Future<BannerAd?> _createBannerAd(AdSize adSize) async {
    if (!adsSupported) {
      log.warning('Banner ad unit ID is empty.');
      return null;
    } else if (!_initializeStarted) {
      log.warning('Ad initialization has not started.');
      return null;
    }

    while (!_initializeCompleted) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return BannerAd(
      adUnitId: _bannerAdUnitId,
      request: const AdRequest(),
      size: adSize,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          log.info('Ad loaded!');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log.severe('Ad failed to load: $error');
          ad.dispose();
        },
      ),
    )..load();
  }
}

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({
    super.key,
    required this.adSize,
  });

  final AdSize adSize;

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> with AutomaticKeepAliveClientMixin {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    AdState._createBannerAd(widget.adSize).then((bannerAd) {
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
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: ExcludeSemantics(
                  child: Text(
                    'Ad',
                    style: TextStyle(
                      color: colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                width: widget.adSize.width.toDouble(),
                height: widget.adSize.height.toDouble(),
                child: _bannerAd == null
                  ? null
                  : AdWidget(ad: _bannerAd!),
              ),
            ),
          ],
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
