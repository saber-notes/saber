import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/theming/adaptive_circular_progress_indicator.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class NcLoginStep extends StatefulWidget {
  const NcLoginStep({super.key, required this.recheckCurrentStep});

  final void Function() recheckCurrentStep;

  @override
  State<NcLoginStep> createState() => _NcLoginStepState();
}

class _NcLoginStepState extends State<NcLoginStep> {
  static const width = 400.0;
  static const ncColor = Color(0xFF0082c9);

  final _serverUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _serverUrlValid = ValueNotifier(false);
  final _loading = ValueNotifier(false);

  var _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _serverUrlController.addListener(_validateUrl);
  }

  void _validateUrl() {
    final url = _prependHttpsIfMissing(_serverUrlController.text);
    _serverUrlValid.value = validator.url(url);
  }

  @override
  void dispose() {
    _serverUrlController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  static String _prependHttpsIfMissing(String url) {
    if (!url.startsWith(RegExp(r'https?://'))) {
      return 'https://$url';
    }
    return url;
  }

  Future<void> _login() async {
    if (_loading.value) return;
    _loading.value = true;

    try {
      final urlStr = _prependHttpsIfMissing(_serverUrlController.text);
      final url = Uri.parse(urlStr);
      final username = _usernameController.text;
      final password = _passwordController.text;

      final client = NextcloudClient(
        url,
        loginName: username,
        password: password,
        httpClient: NextcloudClientExtension.newHttpClient(),
      );

      final userId = await client.getUsername();

      stows.url.value = urlStr;
      stows.username.value = userId;
      stows.ncPassword.value = password;
      stows.encPassword.value = '';

      stows.pfp.value = null;
      // Fire and forget avatar fetch
      client.core.avatar
          .getAvatar(userId: userId, size: AvatarGetAvatarSize.$512)
          .then((response) => response.body)
          .then((pfp) => stows.pfp.value = pfp)
          .catchError((e) {
            // Ignore avatar fetch errors
            return e;
          });

      widget.recheckCurrentStep();
    } catch (e) {
      debugPrint('Login failed: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      _loading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return ListView(
      padding: .symmetric(
        horizontal: screenWidth > width ? (screenWidth - width) / 2 : 16,
        vertical: 16,
      ),
      children: [
        const SizedBox(height: 16),
        if (screenHeight > 500) ...[
          SvgPicture.asset(
            'assets/images/undraw_cloud_sync_re_02p1.svg',
            width: width,
            height: min(width * 576 / 844.6693, screenHeight * 0.25),
            excludeFromSemantics: true,
          ),
          SizedBox(height: min(64, screenHeight * 0.05)),
        ],
        Text(
          t.login.ncLoginStep.whereToStoreData,
          style: textTheme.headlineSmall,
        ),
        Text.rich(
          t.login.form.agreeToPrivacyPolicy(
            linkToPrivacyPolicy: (text) => TextSpan(
              text: text,
              style: TextStyle(color: colorScheme.primary),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(AppInfo.privacyPolicyUrl);
                },
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Login Form
        TextField(
          autocorrect: false,
          autofillHints: const [AutofillHints.url],
          controller: _serverUrlController,
          decoration: InputDecoration(
            labelText: t.login.ncLoginStep.serverUrl,
            hintText: 'https://nc.example.com',
            prefixIcon: const Icon(Icons.link),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          autocorrect: false,
          autofillHints: const [AutofillHints.username],
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: 'Username', // TODO: Add to i18n
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 16),
        StatefulBuilder(
          builder: (context, setState) {
            return TextField(
              autocorrect: false,
              autofillHints: const [AutofillHints.password],
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password', // TODO: Add to i18n
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 32),

        ValueListenableBuilder<bool>(
          valueListenable: _loading,
          builder: (context, loading, child) {
            if (loading) {
              return const Center(child: AdaptiveCircularProgressIndicator());
            }
            return ValueListenableBuilder<bool>(
              valueListenable: _serverUrlValid,
              builder: (context, urlValid, _) {
                return ElevatedButton(
                  onPressed: urlValid ? _login : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ncColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: Text(t.login.ncLoginStep.loginWithNextcloud),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
