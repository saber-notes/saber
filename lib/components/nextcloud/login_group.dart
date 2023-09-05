import 'package:collapsible/collapsible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:saber/components/nextcloud/spinning_loading_icon.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/theming/adaptive_button.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/adaptive_text_field.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/user/login.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginInputGroup extends StatefulWidget {
  const LoginInputGroup({
    super.key,
    required this.tryLogin,
  });

  final Future<void> Function(LoginDetailsStruct loginDetails) tryLogin;

  @override
  State<LoginInputGroup> createState() => _LoginInputGroupState();

  /// Validates a username. Returns null if valid, otherwise a message.
  @visibleForTesting
  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return t.login.feedbacks.checkUsername;
    }
    if (username.contains('@') && !validator.email(username)) {
      return t.login.feedbacks.checkUsername;
    }
    return null;
  }

  /// Validates a nextcloud password. Returns null if valid, otherwise a message.
  @visibleForTesting
  static String? validateNcPassword(String? ncPassword) {
    if (ncPassword == null || ncPassword.isEmpty) {
      return t.login.feedbacks.enterNcPassword;
    }
    return null;
  }

  /// Validates an encryption password. Returns null if valid, otherwise a message.
  @visibleForTesting
  static String? validateEncPassword(String? encPassword) {
    if (encPassword == null || encPassword.isEmpty) {
      return t.login.feedbacks.enterEncPassword;
    }
    return null;
  }

  /// Validates a custom server. Returns null if valid, otherwise a message.
  @visibleForTesting
  static String? validateCustomServer(String? customServer) {
    if (customServer == null || !validator.url(customServer)) {
      return t.login.feedbacks.checkUrl;
    }
    return null;
  }

  /// Adds "https://" to the beginning of the [url] if it
  /// doesn't already start with "http://" or "https://".
  @visibleForTesting
  static String prefixUrlWithHttps(String url) {
    if (url.startsWith('http://')) return url;
    if (url.startsWith('https://')) return url;
    return 'https://$url';
  }
}

class _LoginInputGroupState extends State<LoginInputGroup> {
  String? _errorMessage;

  bool _usingCustomServer = false;

  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _customServerController = TextEditingController(
    text: NextcloudClientExtension.defaultNextcloudUri.toString(),
  );
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ncPasswordController = TextEditingController();
  final TextEditingController _encPasswordController = TextEditingController();

  void _login() async {
    bool valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    if (_usingCustomServer) {
      _customServerController.text = LoginInputGroup.prefixUrlWithHttps(_customServerController.text);
    }

    try {
      setState(() {
        _isLoading = true;
      });
      await widget.tryLogin(LoginDetailsStruct(
        url: _usingCustomServer ? _customServerController.text : null,
        loginName: _usernameController.text,
        ncPassword: _ncPasswordController.text,
        encPassword: _encPasswordController.text,
      ));
      setState(() {
        _errorMessage = t.login.feedbacks.loginSuccess;
      });
      FileSyncer.startSync();
    } on LoginFailure catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleCustomServer(bool? usingCustomServer) {
    setState(() {
      _usingCustomServer = usingCustomServer!;
    });
  }

  @override
  void initState() {
    final url = Prefs.url.value;
    final username = Prefs.username.value;

    if (url.isNotEmpty) {
      if (_customServerController.text.isEmpty) _customServerController.text = url;
      if (url != NextcloudClientExtension.defaultNextcloudUri.toString()) _toggleCustomServer(true);
    }
    if (_usernameController.text.isEmpty) {
      _usernameController.text = username;
    }

    super.initState();
  }

  @override
  void dispose() {
    _customServerController.dispose();
    _usernameController.dispose();
    _ncPasswordController.dispose();
    _encPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: AutofillGroup(
        child: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _toggleCustomServer(!_usingCustomServer);
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: _usingCustomServer,
                      onChanged: _toggleCustomServer,
                    ),
                    Expanded(child: Text(t.login.form.useCustomServer)),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              Collapsible(
                collapsed: !_usingCustomServer,
                axis: CollapsibleAxis.vertical,
                alignment: Alignment.topCenter,
                fade: true,
                maintainState: true,
                child: Column(children: [
                  const SizedBox(height: 4),
                  AdaptiveTextField(
                    controller: _customServerController,
                    placeholder: t.login.form.customServerUrl,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                    focusOrder: const NumericFocusOrder(1),
                    autofillHints: const [AutofillHints.url],
                    prefixIcon: const AdaptiveIcon(
                      icon: Icons.link,
                      cupertinoIcon: CupertinoIcons.link,
                    ),
                    validator: (String? value) {
                      if (!_usingCustomServer) return null;
                      return LoginInputGroup.validateCustomServer(value);
                    },
                  ),
                  const SizedBox(height: 8),
                ])
              ),

              AdaptiveTextField(
                controller: _usernameController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusOrder: const NumericFocusOrder(2),
                autofillHints: const [AutofillHints.username, AutofillHints.email],
                placeholder: t.login.form.username,
                prefixIcon: const AdaptiveIcon(
                  icon: Icons.person,
                  cupertinoIcon: CupertinoIcons.person_fill,
                ),
                validator: LoginInputGroup.validateUsername,
              ),
              const SizedBox(height: 8),
              AdaptiveTextField(
                controller: _ncPasswordController,
                textInputAction: TextInputAction.next,
                focusOrder: const NumericFocusOrder(3),
                autofillHints: const [AutofillHints.password],
                placeholder: t.login.form.ncPassword,
                prefixIcon: const Icon(Icons.lock_person),
                isPassword: true,
                validator: LoginInputGroup.validateNcPassword,
              ),
              const SizedBox(height: 8),
              AdaptiveTextField(
                controller: _encPasswordController,
                textInputAction: TextInputAction.done,
                focusOrder: const NumericFocusOrder(4),
                autofillHints: const [AutofillHints.password],
                placeholder: t.login.form.encPassword,
                prefixIcon: const Icon(Icons.sync_lock),
                isPassword: true,
                validator: LoginInputGroup.validateEncPassword,
              ),
              const SizedBox(height: 16),

              if (_errorMessage != null) ...[
                Text(
                  _errorMessage!,
                  style: TextStyle(color: colorScheme.secondary),
                ),
                const SizedBox(height: 8),
              ],

              Text.rich(
                t.login.signup(
                  linkToSignup: (text) => TextSpan(
                    text: text,
                    style: TextStyle(color: colorScheme.primary),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      launchUrl(NcLoginPage.signupUrl);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text.rich(
                t.login.form.agreeToPrivacyPolicy(
                  linkToPrivacyPolicy: (text) => TextSpan(
                    text: text,
                    style: TextStyle(color: colorScheme.primary),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      launchUrl(AppInfo.privacyPolicyUrl);
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),
              FocusTraversalOrder(
                order: const NumericFocusOrder(5),
                child: AdaptiveButton(
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading ? const SpinningLoadingIcon() : Text(t.login.form.login),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginDetailsStruct {
  final Uri uri;
  final String loginName;
  final String ncPassword;
  final String encPassword;

  LoginDetailsStruct({
    String? url,
    required this.loginName,
    required this.ncPassword,
    required this.encPassword,
  }): uri = url != null
        ? Uri.parse(url)
        : NextcloudClientExtension.defaultNextcloudUri;
}

abstract class LoginFailure implements Exception {
  final String message = 'Login failed';
}
class NcLoginFailure implements LoginFailure {
  @override
  final String message = t.login.feedbacks.ncLoginFailed;
}
class NcUnsupportedFailure implements LoginFailure {
  /// The Nextcloud version of the server
  final int? currentVersion;
  /// The Nextcloud version supported with the [nextcloud] package
  final int supportedVersion;

  NcUnsupportedFailure({
    required this.currentVersion,
    required this.supportedVersion,
  });

  @override
  late final String message = t.login.feedbacks.ncUnsupportedFailure(
    v: currentVersion ?? '?',
    s: supportedVersion,
  );
}
class EncLoginFailure implements LoginFailure {
  @override
  final String message = t.login.feedbacks.encLoginFailed;
}
