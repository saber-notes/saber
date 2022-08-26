
import 'package:collapsible/collapsible.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/nextcloud/spinning_loading_icon.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginInputGroup extends StatefulWidget {
  const LoginInputGroup({
    Key? key,
    required this.tryLogin,
  }) : super(key: key);

  final Future<bool> Function(String? url, String username, String password) tryLogin;


  /// Nextcloud can issue "app passwords" but we need to
  /// make sure we have the original password for encryption.
  static final RegExp appPasswordRegex = RegExp(r"^([a-z0-9]{5}-){4}([a-z0-9]{5})$", caseSensitive: false);
  static final RegExp usernameRegex = RegExp(r"^[a-z0-9_\-.]+$", caseSensitive: false);
  /// https://emailregex.com
  static final RegExp emailRegex = RegExp(r"(^[a-z0-9_.+-]+@[a-z0-9-]+\.[a-z0-9-.]+$)", caseSensitive: false);
  /// https://urlregex.com (modified)
  static final RegExp urlRegex = RegExp(r"^(http[s]?://)?(?:[a-zA-Z]|[0-9]|[$\-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+$", caseSensitive: false);

  static const String appPasswordError =
      "Nextcloud's 'app passwords' aren't supported. "
      "If you entered your actual password, "
      "or are unsure, please tap 'Log in' again.";
  static const String usernameError = "Please double check your username or email.";

  @override
  State<LoginInputGroup> createState() => _LoginInputGroupState();
}

class _LoginInputGroupState extends State<LoginInputGroup> {
  bool _showPassword = false;

  String? _errorMessage;

  bool _usingCustomServer = false;

  bool _isLoading = false;

  final TextEditingController _customServerController = TextEditingController(
    text: NextCloudClientExtension.defaultNextCloudUri.toString(),
  );
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _validate() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (!LoginInputGroup.emailRegex.hasMatch(username) && !LoginInputGroup.usernameRegex.hasMatch(username)) {
      setState(() {
        _errorMessage = LoginInputGroup.usernameError;
      });
      return false;
    } else if (password.isEmpty) {
      setState(() {
        _errorMessage = "Please enter a password.";
      });
      return false;
    } else if (LoginInputGroup.appPasswordRegex.hasMatch(password)) {
      // only if user hasn't tapped 'Log in' again
      if (_errorMessage != LoginInputGroup.appPasswordError) {
        setState(() {
          _errorMessage = LoginInputGroup.appPasswordError;
        });
        return false;
      }
    } else if (_usingCustomServer && !LoginInputGroup.urlRegex.hasMatch(_customServerController.text)) {
      setState(() {
        _errorMessage = "Please enter a valid URL.";
      });
      return false;
    }

    setState(() {
      _errorMessage = null;
    });
    return true;
  }

  void _login() async {
    if (!_validate()) return;

    if (!_customServerController.text.contains("https://")) {
      _customServerController.text = "https://${_customServerController.text}";
    }

    final bool success;
    try {
      _isLoading = true;
      success = await widget.tryLogin(
        _usingCustomServer ? _customServerController.text : null,
        _usernameController.text,
        _passwordController.text
      );
    } finally {
      _isLoading = false;
    }

    if (success) {
      setState(() {
        _errorMessage = "Log in successful! Please wait while we set up...";
      });
    } else {
      setState(() {
        _errorMessage = "Log in failed, please check your details and network connection.";
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
      if (url != NextCloudClientExtension.defaultNextCloudUri.toString()) _toggleCustomServer(true);
    }
    if (_usernameController.text.isEmpty) {
      _usernameController.text = username;
    }

    super.initState();
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
                const Expanded(child: Text("I want to use a custom Nextcloud server")),
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
              TextField(
                controller: _customServerController,
                autofillHints: const [AutofillHints.url],
                decoration: const InputDecoration(
                  labelText: "Custom server URL",
                  prefixIcon: Icon(Icons.link),
                  filled: true,
                ),
              ),
              const SizedBox(height: 8),
            ])
          ),

          TextField(
            controller: _usernameController,
            autofillHints: const [AutofillHints.username, AutofillHints.email],
            decoration: const InputDecoration(
              labelText: "Username or email",
              prefixIcon: Icon(Icons.person),
              filled: true,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _passwordController,
            obscureText: !_showPassword,
            autofillHints: const [AutofillHints.password],
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                iconSize: 18,
                onPressed: () { setState(() { _showPassword = !_showPassword; }); },
              ),
              filled: true,
            ),
          ),
          const SizedBox(height: 16),

          if (_errorMessage != null) ...[
            Text(
              _errorMessage!,
              style: TextStyle(color: colorScheme.secondary),
            ),
            const SizedBox(height: 8),
          ],

          RichText(
            text: TextSpan(
              style: TextStyle(color: colorScheme.onBackground),
              children: [
                const TextSpan(text: "By logging in, you agree to the "),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(color: colorScheme.primary),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    launchUrl(
                      AppInfo.privacyPolicyUrl,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
                const TextSpan(text: "."),
              ],
            ),
          ),

          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _login,
            child: _isLoading ? const SpinningLoadingIcon() : const Text("Log in"),
          ),
        ],
      ),
    );
  }
}
