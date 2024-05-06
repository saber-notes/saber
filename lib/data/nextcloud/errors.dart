import 'package:saber/i18n/strings.g.dart';

abstract class LoginFailure implements Exception {
  final String message = 'Login failed';
}

class NcLoginFailure implements LoginFailure {
  @override
  final String message = t.login.feedbacks.ncLoginFailed;
}

class NcUnsupportedFailure implements LoginFailure {
  /// The Nextcloud version of the server
  final int currentVersion;

  /// The minimum Nextcloud version supported with the [nextcloud] package
  final int minVersion;

  /// The maximum Nextcloud version supported with the [nextcloud] package
  final int maxVersion;

  NcUnsupportedFailure({
    required this.currentVersion,
    required this.minVersion,
    required this.maxVersion,
  });

  @override
  late final String message = t.login.feedbacks.ncUnsupportedFailure(
    v: currentVersion,
    s: minVersion,
    t: maxVersion,
  );
}

class EncLoginFailure implements LoginFailure {
  @override
  final String message = t.login.feedbacks.encLoginFailed;
}
