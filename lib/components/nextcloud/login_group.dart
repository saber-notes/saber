
import 'package:collapsible/collapsible.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/nextcloud/spinning_loading_icon.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginInputGroup extends StatefulWidget {
  const LoginInputGroup({
    super.key,
    required this.tryLogin,
  });

  final Future<bool> Function(LoginDetailsStruct loginDetails) tryLogin;

  static final RegExp usernameRegex = RegExp(r"^[a-z0-9_\-.]+$", caseSensitive: false);
  /// https://emailregex.com
  static final RegExp emailRegex = RegExp(r"(^[a-z0-9_.+-]+@[a-z0-9-]+\.[a-z0-9-.]+$)", caseSensitive: false);
  /// https://urlregex.com (modified)
  static final RegExp urlRegex = RegExp(r"^(http[s]?://)?(?:[a-zA-Z]|[0-9]|[$\-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+$", caseSensitive: false);

  static const String usernameError = "Please double check your username or email.";

  @override
  State<LoginInputGroup> createState() => _LoginInputGroupState();
}

class _LoginInputGroupState extends State<LoginInputGroup> {
  bool _showNcPassword = false;
  bool _showEncPassword = false;

  String? _errorMessage;

  bool _usingCustomServer = false;

  bool _isLoading = false;

  final TextEditingController _customServerController = TextEditingController(
    text: NextCloudClientExtension.defaultNextCloudUri.toString(),
  );
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ncPasswordController = TextEditingController();
  final TextEditingController _encPasswordController = TextEditingController();

  bool _validate() {
    String username = _usernameController.text;
    String ncPassword = _ncPasswordController.text;
    String encPassword = _encPasswordController.text;
    if (!LoginInputGroup.emailRegex.hasMatch(username) && !LoginInputGroup.usernameRegex.hasMatch(username)) {
      setState(() {
        _errorMessage = LoginInputGroup.usernameError;
      });
      return false;
    } else if (ncPassword.isEmpty) {
      setState(() {
        _errorMessage = "Please enter your Nextcloud password.";
      });
      return false;
    } else if (encPassword.isEmpty) {
      setState(() {
        _errorMessage = "Please enter your encryption password.";
      });
      return false;
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
      success = await widget.tryLogin(LoginDetailsStruct(
        urlString: _usingCustomServer ? _customServerController.text : null,
        username: _usernameController.text,
        ncPassword: _ncPasswordController.text,
        encPassword: _encPasswordController.text,
      ));
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
            controller: _ncPasswordController,
            obscureText: !_showNcPassword,
            autofillHints: const [AutofillHints.password],
            decoration: InputDecoration(
              labelText: "Nextcloud password",
              prefixIcon: const Icon(Icons.lock_person),
              suffixIcon: IconButton(
                icon: Icon(_showNcPassword ? Icons.visibility : Icons.visibility_off),
                iconSize: 18,
                onPressed: () { setState(() { _showNcPassword = !_showNcPassword; }); },
              ),
              filled: true,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _encPasswordController,
            obscureText: !_showEncPassword,
            autofillHints: const [AutofillHints.password],
            decoration: InputDecoration(
              labelText: "Encryption password",
              prefixIcon: const Icon(Icons.sync_lock),
              suffixIcon: IconButton(
                icon: Icon(_showEncPassword ? Icons.visibility : Icons.visibility_off),
                iconSize: 18,
                onPressed: () { setState(() { _showEncPassword = !_showEncPassword; }); },
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

class LoginDetailsStruct {
  final Uri url;
  final String username;
  final String ncPassword;
  final String encPassword;

  LoginDetailsStruct({
    String? urlString,
    required this.username,
    required this.ncPassword,
    required this.encPassword,
  }) : url = urlString != null ? Uri.parse(urlString) : NextCloudClientExtension.defaultNextCloudUri;
}
