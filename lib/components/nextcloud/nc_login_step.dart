import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/theming/adaptive_circular_progress_indicator.dart';
import 'package:saber/data/nextcloud/login_flow.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/user/login.dart';
import 'package:url_launcher/url_launcher.dart';

class NcLoginStep extends StatefulWidget {
  const NcLoginStep({super.key, required this.recheckCurrentStep});

  final void Function() recheckCurrentStep;

  @override
  State<NcLoginStep> createState() => _NcLoginStepState();
}

class _NcLoginStepState extends State<NcLoginStep> {
  static const width = 400.0;

  /// Lighter than the actual Saber color for better contrast
  static const saberColor = Color(0xFFffd642);
  static const onSaberColor = Colors.black;
  static const saberColorDarkened = Color(0xFFc29800);
  static const ncColor = Color(0xFF0082c9);

  SaberLoginFlow? loginFlow;
  void startLoginFlow(Uri serverUrl) {
    loginFlow?.dispose();
    loginFlow = SaberLoginFlow.start(serverUrl: serverUrl);

    showAdaptiveDialog(
      context: context,
      builder: (context) => _LoginFlowDialog(loginFlow: loginFlow!),
    );

    loginFlow!.future.then((credentials) async {
      final client = NextcloudClient(
        Uri.parse(credentials.server),
        loginName: credentials.loginName,
        appPassword: credentials.appPassword,
        httpClient: NextcloudClientExtension.newHttpClient(),
      );
      final username = await client.getUsername();

      stows.url.value =
          credentials.server ==
              NextcloudClientExtension.defaultNextcloudUri.toString()
          ? ''
          : credentials.server;
      stows.username.value = username;
      stows.ncPassword.value = credentials.appPassword;
      stows.encPassword.value = '';

      stows.pfp.value = null;
      client.core.avatar
          .getAvatar(userId: username, size: AvatarGetAvatarSize.$512)
          .then((response) => response.body)
          .then((pfp) => stows.pfp.value = pfp);

      widget.recheckCurrentStep();
    });
  }

  final _serverUrlValid = ValueNotifier(false);
  late final _serverUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _serverUrlController.addListener(() {
      final url = _prependHttpsIfMissing(_serverUrlController.text);
      _serverUrlValid.value = validator.url(url);
    });
  }

  @override
  void dispose() {
    loginFlow?.dispose();
    _serverUrlController.dispose();
    super.dispose();
  }

  static String _prependHttpsIfMissing(String url) {
    if (!url.startsWith(RegExp(r'https?://'))) {
      return 'https://$url';
    }
    return url;
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
        Row(
          mainAxisAlignment: .end,
          children: [
            SvgPicture.asset('assets/icon/icon.svg', width: 32, height: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                t.login.ncLoginStep.saberNcServer,
                style: textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () =>
              startLoginFlow(NextcloudClientExtension.defaultNextcloudUri),
          style: buttonColorStyle(saberColor, onSaberColor),
          child: Text(t.login.ncLoginStep.loginWithSaber),
        ),
        const SizedBox(height: 4),
        Text.rich(
          t.login.signup(
            linkToSignup: (text) => TextSpan(
              text: text,
              style: TextStyle(
                color: colorScheme.brightness == .dark
                    ? saberColor
                    : saberColorDarkened,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(NcLoginPage.signupUrl);
                },
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: .end,
          children: [
            SvgPicture.asset(
              'assets/images/nextcloud-logo.svg',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                t.login.ncLoginStep.otherNcServer,
                style: textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          autocorrect: false,
          autofillHints: const [AutofillHints.url],
          controller: _serverUrlController,
          decoration: InputDecoration(
            labelText: t.login.ncLoginStep.serverUrl,
            hintText: 'https://nc.example.com',
          ),
        ),
        const SizedBox(height: 4),
        ValueListenableBuilder(
          valueListenable: _serverUrlValid,
          builder: (context, valid, child) {
            return ElevatedButton(
              onPressed: valid
                  ? () {
                      _serverUrlController.text = _prependHttpsIfMissing(
                        _serverUrlController.text,
                      );
                      startLoginFlow(Uri.parse(_serverUrlController.text));
                    }
                  : null,
              style: buttonColorStyle(ncColor),
              child: child,
            );
          },
          child: Text(t.login.ncLoginStep.loginWithNextcloud),
        ),
      ],
    );
  }

  static ButtonStyle buttonColorStyle(Color primary, [Color? onPrimary]) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      onPrimary: onPrimary,
    );
    return ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    );
  }
}

class _LoginFlowDialog extends StatefulWidget {
  // ignore: unused_element_parameter
  const _LoginFlowDialog({super.key, required this.loginFlow});

  final SaberLoginFlow loginFlow;

  @override
  State<_LoginFlowDialog> createState() => _LoginFlowDialogState();
}

class _LoginFlowDialogState extends State<_LoginFlowDialog> {
  @override
  void initState() {
    super.initState();
    widget.loginFlow.future.then((_) {
      if (!mounted) return;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(t.login.ncLoginStep.loginFlow.pleaseAuthorize),
      content: Column(
        mainAxisSize: .min,
        children: [
          Text(t.login.ncLoginStep.loginFlow.followPrompts),
          TextButton(
            onPressed: widget.loginFlow.openLoginUrl,
            child: Text(t.login.ncLoginStep.loginFlow.browserDidntOpen),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.loginFlow.dispose();
            Navigator.of(context).pop();
          },
          child: Text(t.common.cancel),
        ),
        _FakeDoneButton(child: Text(t.common.done)),
      ],
    );
  }
}

/// [SaberLoginFlow] polls the login flow and completes automatically.
///
/// The done button isn't needed, but it's added to prevent the user from
/// closing the dialog before the login flow is completed.
///
/// When pressed, the text will be replaced with a spinner for 10 seconds.
class _FakeDoneButton extends StatefulWidget {
  // ignore: unused_element_parameter
  const _FakeDoneButton({super.key, required this.child});

  final Widget child;

  @override
  State<_FakeDoneButton> createState() => _FakeDoneButtonState();
}

class _FakeDoneButtonState extends State<_FakeDoneButton> {
  var pressed = false;

  Timer? timer;

  void _onPressed() {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 10), () {
      if (mounted) setState(() => pressed = false);
    });
    if (mounted) setState(() => pressed = true);
  }

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: pressed ? null : _onPressed,
    child: pressed
        ? const SizedBox(
            width: 16,
            height: 16,
            child: AdaptiveCircularProgressIndicator(),
          )
        : widget.child,
  );
}
