import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

const _width = 400.0;

/// Lighter than the actual Saber color for better contrast
const _saberColor = Color(0xFFffd642);
const _onSaberColor = Colors.black;
const _saberColorDarkened = Color(0xFFc29800);
const _ncColor = Color(0xFF0082c9);

class NcLoginStep extends HookWidget {
  const new({super.key, required this.recheckCurrentStep});

  final void Function() recheckCurrentStep;

  SaberLoginFlow _createLoginFlow(BuildContext context, Uri serverUrl) {
    final loginFlow = SaberLoginFlow.start(serverUrl: serverUrl);

    showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _LoginFlowDialog(loginFlow: loginFlow),
    );

    loginFlow.future.then((credentials) async {
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

      recheckCurrentStep();
    });

    return loginFlow;
  }

  @override
  Widget build(BuildContext context) {
    final loginFlow = useState<SaberLoginFlow?>(null);
    // dispose the login flow when it changes or the widget is disposed
    useEffect(() => loginFlow.value?.dispose, [loginFlow.value]);

    final screenSize = MediaQuery.sizeOf(context);
    final shouldUseTwoColumns = _shouldUseTwoColumns(screenSize);
    if (shouldUseTwoColumns) {
      return Center(
        child: Padding(
          padding: const .all(64),
          child: SizedBox(
            width: _width * 3,
            child: Row(
              mainAxisAlignment: .center,
              crossAxisAlignment: .end,
              spacing: 64,
              children: [
                const Expanded(child: _Header()),
                Expanded(
                  child: Column(
                    mainAxisSize: .min,
                    spacing: 48,
                    children: [
                      _LoginWithSaber(
                        login: () => loginFlow.value = _createLoginFlow(
                          context,
                          NextcloudClientExtension.defaultNextcloudUri,
                        ),
                      ),
                      _LoginWithNextcloud(
                        login: (url) => loginFlow.value = _createLoginFlow(
                          context,
                          Uri.parse(url),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return ListView(
        padding: .symmetric(
          horizontal: screenSize.width > _width
              ? (screenSize.width - _width) / 2
              : 16,
          vertical: 16,
        ),
        children: [
          const SizedBox(height: 16),
          const _Header(),
          const SizedBox(height: 32),
          _LoginWithSaber(
            login: () => loginFlow.value = _createLoginFlow(
              context,
              NextcloudClientExtension.defaultNextcloudUri,
            ),
          ),
          const SizedBox(height: 32),
          _LoginWithNextcloud(
            login: (url) =>
                loginFlow.value = _createLoginFlow(context, Uri.parse(url)),
          ),
        ],
      );
    }
  }
}

class const _Header() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        const _HeaderImage(),
        Text(
          t.login.ncLoginStep.whereToStoreData,
          style: theme.textTheme.headlineSmall,
        ),
        Text.rich(
          t.login.form.agreeToPrivacyPolicy(
            linkToPrivacyPolicy: (text) => TextSpan(
              text: text,
              style: TextStyle(color: theme.colorScheme.primary),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(AppInfo.privacyPolicyUrl);
                },
            ),
          ),
        ),
      ],
    );
  }
}

class const _HeaderImage() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    // Remove banner image on tiny screens to save space
    if (screenSize.height < 500) return const SizedBox();

    final maxHeight = _shouldUseTwoColumns(screenSize)
        ? screenSize.height * 0.3
        : screenSize.height * 0.25;

    return Padding(
      padding: .only(bottom: min(64, screenSize.height * 0.05)),
      child: SvgPicture.asset(
        'assets/images/undraw_cloud_sync_re_02p1.svg',
        width: _width,
        height: min(_width * 576 / 844.6693, maxHeight),
        excludeFromSemantics: true,
      ),
    );
  }
}

class const _LoginWithSaber({required final VoidCallback login})
    extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final buttonStyle = useMemoized(
      () => _buttonStyleFromBrand(_saberColor, _onSaberColor),
      const [],
    );

    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Row(
          mainAxisAlignment: .end,
          children: [
            SvgPicture.asset('assets/icon/icon.svg', width: 32, height: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                t.login.ncLoginStep.saberNcServer,
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: login,
          style: buttonStyle,
          child: Text(t.login.ncLoginStep.loginWithSaber),
        ),
        const SizedBox(height: 4),
        Text.rich(
          t.login.signup(
            linkToSignup: (text) => TextSpan(
              text: text,
              style: TextStyle(
                color: theme.colorScheme.brightness == .dark
                    ? _saberColor
                    : _saberColorDarkened,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(NcLoginPage.signupUrl);
                },
            ),
          ),
        ),
      ],
    );
  }
}

class const _LoginWithNextcloud({
  required final void Function(String url) login,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final serverUrlController = useTextEditingController();

    final isServerUrlValid = useListenableSelector(serverUrlController, () {
      final url = _prependHttpsIfMissing(serverUrlController.text);
      return validator.url(url);
    });

    final buttonStyle = useMemoized(
      () => _buttonStyleFromBrand(_ncColor),
      const [],
    );

    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: .stretch,
      children: [
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
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          autocorrect: false,
          autofillHints: const [AutofillHints.url],
          controller: serverUrlController,
          decoration: InputDecoration(
            labelText: t.login.ncLoginStep.serverUrl,
            hintText: 'https://nc.example.com',
          ),
        ),
        const SizedBox(height: 4),
        ElevatedButton(
          onPressed: isServerUrlValid
              ? () {
                  serverUrlController.text = _prependHttpsIfMissing(
                    serverUrlController.text,
                  );
                  login(serverUrlController.text);
                }
              : null,
          style: buttonStyle,
          child: Text(t.login.ncLoginStep.loginWithNextcloud),
        ),
      ],
    );
  }
}

class const _LoginFlowDialog({required final SaberLoginFlow loginFlow})
    extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useMemoized(
      () => loginFlow.future.then((_) {
        if (!context.mounted) return;
        Navigator.of(context).pop();
      }),
      [loginFlow],
    );

    return AlertDialog.adaptive(
      title: Text(t.login.ncLoginStep.loginFlow.pleaseAuthorize),
      content: Column(
        mainAxisSize: .min,
        children: [
          Text(t.login.ncLoginStep.loginFlow.followPrompts),
          TextButton(
            onPressed: loginFlow.openLoginUrl,
            child: Text(t.login.ncLoginStep.loginFlow.browserDidntOpen),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            loginFlow.dispose();
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
/// When pressed, the text will be replaced with a spinner for 2 seconds.
class const _FakeDoneButton({required final Widget child}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final pressed = useState(false);
    final timer = useRef<Timer?>(null);
    useEffect(() => timer.value?.cancel, [timer.value]);

    return TextButton(
      onPressed: pressed.value
          ? null
          : () {
              timer.value?.cancel();
              timer.value = Timer(const Duration(seconds: 2), () {
                pressed.value = false;
              });
              pressed.value = true;
            },
      child: pressed.value
          ? const SizedBox(
              width: 16,
              height: 16,
              child: AdaptiveCircularProgressIndicator(),
            )
          : child,
    );
  }
}

bool _shouldUseTwoColumns(Size screenSize) {
  const minWidthForTwoColumns = _width * 2;
  const minHeightForTwoColumns = _width * 1.5;
  return screenSize.width > minWidthForTwoColumns &&
      screenSize.height > minHeightForTwoColumns;
}

String _prependHttpsIfMissing(String url) =>
    url.startsWith(RegExp(r'https?://')) ? url : 'https://$url';

ButtonStyle _buttonStyleFromBrand(Color primary, [Color? onPrimary]) {
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
