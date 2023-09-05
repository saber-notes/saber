import 'dart:io';

import 'package:logging/logging.dart';
import 'package:saber/data/prefs.dart';

class NcHttpOverrides extends HttpOverrides {
  static String? temporarilyExemptHost;
  static void tempAcceptBadCertificateFrom(Uri uri) {
    temporarilyExemptHost = uri.host;
  }

  static final log = Logger('NcHttpOverrides');

  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = _badCertificateCallback;
  }

  // Called when encountering a self-signed certificate.
  // Returns true if the certificate should be accepted,
  // false if it should be rejected.
  bool _badCertificateCallback(X509Certificate cert, String host, int port) {
    if (!Prefs.allowInsecureConnections.loaded || !Prefs.url.loaded) {
      log.severe('The Prefs [allowInsecureConnections] or [url] are not loaded yet. Make sure to await pref.waitUntilLoaded() for both.');
      return false;
    }

    if (host == Uri.tryParse(Prefs.url.value)?.host || host == temporarilyExemptHost) {
      // Allow self-signed certificates for self-hosted Nextcloud servers
      return Prefs.allowInsecureConnections.value;
    } else {
      // Reject insecure certificates from other hosts
      return false;
    }
  }
}
