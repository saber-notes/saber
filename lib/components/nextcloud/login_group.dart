
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
import 'package:saber/pages/nextcloud/login.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginInputGroup extends StatefulWidget {
  const LoginInputGroup({
    super.key,
    required this.tryLogin,
  });

  final Future<void> Function(LoginDetailsStruct loginDetails) tryLogin;

  @override
  State<LoginInputGroup> createState() => _LoginInputGroupState();

  /// Validates the login details. Returns an error message
  /// if validation fails, or null if it succeeds.
  @visibleForTesting
  static String? validate({
    required String username,
    required String ncPassword,
    required String encPassword,
    required String? customServer,
  }) {
    if (username.isEmpty || (username.contains('@') && !validator.email(username))) {
      return t.login.feedbacks.checkUsername;
    }
    if (ncPassword.isEmpty) {
      return t.login.feedbacks.enterNcPassword;
    }
    if (encPassword.isEmpty) {
      return t.login.feedbacks.enterEncPassword;
    }
    if (customServer != null && !validator.url(customServer)) {
      return t.login.feedbacks.checkUrl;
    }
    return null;
  }
}

class _LoginInputGroupState extends State<LoginInputGroup> {
  String? _errorMessage;

  bool _usingCustomServer = false;

  bool _isLoading = false;

  final TextEditingController _customServerController = TextEditingController(
    text: NextcloudClientExtension.defaultNextCloudUri.toString(),
  );
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ncPasswordController = TextEditingController();
  final TextEditingController _encPasswordController = TextEditingController();

  /// Returns whether validation passes.
  /// Updates [_errorMessage] with any resulting validation error.
  bool _validate() {
    String? validationError = LoginInputGroup.validate(
      username: _usernameController.text,
      ncPassword: _ncPasswordController.text,
      encPassword: _encPasswordController.text,
      customServer: _usingCustomServer ? _customServerController.text : null,
    );
    setState(() {
      _errorMessage = validationError;
    });
    return validationError == null;
  }

  void _login() async {
    if (!_validate()) return;

    if (!_customServerController.text.contains("https://")) {
      _customServerController.text = "https://${_customServerController.text}";
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
    } on NcLoginFailure {
      setState(() {
        _errorMessage = t.login.feedbacks.ncLoginFailed;
      });
    } on EncLoginFailure {
      setState(() {
        _errorMessage = t.login.feedbacks.encLoginFailed;
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
      if (url != NextcloudClientExtension.defaultNextCloudUri.toString()) _toggleCustomServer(true);
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
    return AutofillGroup(
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
                autofillHints: const [AutofillHints.url],
                prefixIcon: const AdaptiveIcon(
                  icon: Icons.link,
                  cupertinoIcon: CupertinoIcons.link,
                ),
              ),
              const SizedBox(height: 8),
            ])
          ),

          AdaptiveTextField(
            controller: _usernameController,
            autofillHints: const [AutofillHints.username, AutofillHints.email],
            placeholder: t.login.form.username,
            prefixIcon: const AdaptiveIcon(
              icon: Icons.person,
              cupertinoIcon: CupertinoIcons.person_fill,
            ),
          ),
          const SizedBox(height: 8),
          AdaptiveTextField(
            controller: _ncPasswordController,
            autofillHints: const [AutofillHints.password],
            placeholder: t.login.form.ncPassword,
            prefixIcon: const Icon(Icons.lock_person),
            isPassword: true,
          ),
          const SizedBox(height: 8),
          AdaptiveTextField(
            controller: _encPasswordController,
            autofillHints: const [AutofillHints.password],
            placeholder: t.login.form.encPassword,
            prefixIcon: const Icon(Icons.sync_lock),
            isPassword: true,
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
                  launchUrl(
                    NcLoginPage.signupUrl,
                    mode: LaunchMode.externalApplication,
                  );
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
                  launchUrl(
                    AppInfo.privacyPolicyUrl,
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 16),
          AdaptiveButton(
            onPressed: _isLoading ? null : _login,
            child: _isLoading ? const SpinningLoadingIcon() : Text(t.login.form.login),
          ),
        ],
      ),
    );
  }
}

class LoginDetailsStruct {
  final String url;
  final String loginName;
  final String ncPassword;
  final String encPassword;

  LoginDetailsStruct({
    String? url,
    required this.loginName,
    required this.ncPassword,
    required this.encPassword,
  }) : url = url ?? NextcloudClientExtension.defaultNextCloudUri;
}

abstract class LoginFailure implements Exception {
  final String message = "Login failed";
}
class NcLoginFailure implements LoginFailure {
  @override
  final String message = t.login.feedbacks.ncLoginFailed;
}
class EncLoginFailure implements LoginFailure {
  @override
  final String message = t.login.feedbacks.encLoginFailed;
}
