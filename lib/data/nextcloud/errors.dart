import 'package:saber/i18n/strings.g.dart';

abstract class LoginFailure implements Exception {
  final String message = 'Login failed';
}

class EncLoginFailure implements LoginFailure {
  @override
  final String message = t.login.encLoginStep.wrongEncPassword;
}
