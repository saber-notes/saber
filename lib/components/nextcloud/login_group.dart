
import 'package:collapsible/collapsible.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:saber/components/nextcloud/spinning_loading_icon.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginInputGroup extends StatefulWidget {
  const LoginInputGroup({
    super.key,
    required this.tryLogin,
  });

  final Future<bool> Function(LoginDetailsStruct loginDetails) tryLogin;

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
    if (username.isEmpty || (username.contains('@') && !Fzregex.hasMatch(username, FzPattern.email))) {
      setState(() {
        _errorMessage = t.login.feedbacks.checkUsername;
      });
      return false;
    } else if (ncPassword.isEmpty) {
      setState(() {
        _errorMessage = t.login.feedbacks.enterNcPassword;
      });
      return false;
    } else if (encPassword.isEmpty) {
      setState(() {
        _errorMessage = t.login.feedbacks.enterEncPassword;
      });
      return false;
    } else if (_usingCustomServer && !Fzregex.hasMatch(_customServerController.text, FzPattern.url)) {
      setState(() {
        _errorMessage = t.login.feedbacks.checkUrl;
      });
      return false;
    } else {
      setState(() {
        _errorMessage = null;
      });
      return true;
    }
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
        _errorMessage = t.login.feedbacks.loginSuccess;
      });
    } else {
      setState(() {
        _errorMessage = t.login.feedbacks.loginFailed;
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
              TextField(
                controller: _customServerController,
                autofillHints: const [AutofillHints.url],
                decoration: InputDecoration(
                  labelText: t.login.form.customServerUrl,
                  prefixIcon: const Icon(Icons.link),
                  filled: true,
                ),
              ),
              const SizedBox(height: 8),
            ])
          ),

          TextField(
            controller: _usernameController,
            autofillHints: const [AutofillHints.username, AutofillHints.email],
            decoration: InputDecoration(
              labelText: t.login.form.username,
              prefixIcon: const Icon(Icons.person),
              filled: true,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _ncPasswordController,
            obscureText: !_showNcPassword,
            autofillHints: const [AutofillHints.password],
            decoration: InputDecoration(
              labelText: t.login.form.ncPassword,
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
              labelText: t.login.form.encPassword,
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
            text: t.login.form.agreeToPrivacyPolicy(
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
          ElevatedButton(
            onPressed: _isLoading ? null : _login,
            child: _isLoading ? const SpinningLoadingIcon() : Text(t.login.form.login),
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
