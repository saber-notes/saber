import 'dart:io';

import 'package:flutter/foundation.dart';

class NcHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = _badCertificateCallback;
  }

  // Called when encountering a self-signed certificate.
  bool _badCertificateCallback(X509Certificate cert, String host, int port) {
    if (doesHostNeedToBeSecure(host)) {
      return false;
    }

    // Allow self-signed certificates for self-hosted Nextcloud servers
    return true;
  }

  @visibleForTesting
  static bool doesHostNeedToBeSecure(String host) {
    return _hostsThatNeedToBeSecure.any((String h) => host.contains(h));
  }

  static const _hostsThatNeedToBeSecure = [
    // GitHub (e.g. for app updates)
    'github.com',
    'githubusercontent.com',

    // Google
    'google.com',
    'googleapis.com',
    'googleusercontent.com',
    'android.com',

    // Saber Nextcloud server
    'adil.hanney.org',
    'adilhanney.com',

    // known Nextcloud servers (https://github.com/nextcloud/providers)
    'alfacloud.biz',
    'cloud68.co',
    'cloudu.de',
    'commonscloud.coop',
    'cloudamo.com',
    'demindo.com',
    'domedia.net',
    'gwc-systems.de',
    'hkn.de',
    'hosting.de',
    'icdsoft.com',
    'jaba.hosting',
    'librebit.com'
    'librecloud.host',
    'living-bots.net',
    'linuxfabrik.ch',
    'nch.pl',
    'mydazo.com',
    'objectivedatastorage.com',
    'openitstore.com',
    'omricloud.com',
    'omri.cloud',
    'owndrive.com',
    'pathconnect.de',
    'portknox.net',
    's7a.it',
    'spryservers.net',
    'stackhero.io',
    'startupstack.tech',
    'thegood.cloud',
    'veiligeopslagin.nl',
    'webhosting4u.gr',
    'yourcloud.asia',
    'gentoolink.com',
    'zaclys.com',
    'csr-online.net',
  ];
}
