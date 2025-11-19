import 'dart:io';

import 'package:logging/logging.dart';
import 'package:saber/data/prefs.dart';

class NcHttpOverrides extends HttpOverrides {
  static String? temporarilyExemptHost;

  /// Temporarily accept a self-signed certificate from [uri]
  /// (if [stows.allowInsecureConnections] is true),
  /// before you set Prefs.url.
  static void tempAcceptBadCertificateFrom(Uri uri) {
    temporarilyExemptHost = uri.host;
  }

  static final log = Logger('NcHttpOverrides');

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = badCertificateCallback;
  }

  // Called when encountering a self-signed certificate.
  // Returns true if the certificate should be accepted,
  // false if it should be rejected.
  static bool badCertificateCallback(
    X509Certificate cert,
    String host,
    int port,
  ) {
    if (!stows.allowInsecureConnections.loaded || !stows.url.loaded) {
      log.severe(
        'The Prefs [allowInsecureConnections] or [url] are not loaded yet. Make sure to await pref.waitUntilRead() for both.',
      );
      return false;
    }

    if (host == Uri.tryParse(stows.url.value)?.host ||
        host == temporarilyExemptHost) {
      // Allow self-signed certificates for self-hosted Nextcloud servers
      return stows.allowInsecureConnections.value;
    } else {
      // Reject insecure certificates from other hosts
      return false;
    }
  }
}
