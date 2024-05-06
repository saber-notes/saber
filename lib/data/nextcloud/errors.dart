abstract class LoginFailure implements Exception {
  final String message = 'Login failed';
}

class NcLoginFailure implements LoginFailure {
  // TODO(adil192): Replace this
  @override
  final String message = 't.login.feedbacks.ncLoginFailed';
}

class EncLoginFailure implements LoginFailure {
  // TODO(adil192): Replace this
  @override
  final String message = 't.login.feedbacks.encLoginFailed';
}
