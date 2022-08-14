
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/settings/privacy_policy.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginInputGroup extends StatefulWidget {
  const LoginInputGroup({
    Key? key,
    required this.onLogin,
  }) : super(key: key);

  final bool Function() onLogin;


  /// Nextcloud can issue "app passwords" but we need to
  /// make sure we have the original password for encryption.
  static final RegExp appPasswordRegex = RegExp(r"^([a-z0-9]{5}-){4}([a-z0-9]{5})$", caseSensitive: false);
  static final RegExp usernameRegex = RegExp(r"^[a-z0-9_\-.]+$", caseSensitive: false);
  static final RegExp emailRegex = RegExp(r"(^[a-z0-9_.+-]+@[a-z0-9-]+\.[a-z0-9-.]+$)", caseSensitive: false);

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
    } else if (LoginInputGroup.appPasswordRegex.hasMatch(password)) {
      // only if user hasn't tapped 'Log in' again
      if (_errorMessage != LoginInputGroup.appPasswordError) {
        setState(() {
          _errorMessage = LoginInputGroup.appPasswordError;
        });
        return false;
      }
    }

    setState(() {
      _errorMessage = null;
    });
    return true;
  }

  void _login() {
    if (!_validate()) return;
    widget.onLogin();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        TextField(
          controller: _usernameController,
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
                    PrivacyPolicy.privacyPolicyUrl,
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
          onPressed: _login,
          child: const Text("Log in")
        ),
      ],
    );
  }
}
