import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/user/login.dart';
import 'package:url_launcher/url_launcher.dart';

class NcLoginStep extends StatefulWidget {
  const NcLoginStep({super.key});

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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > width ? (screenWidth - width) / 2 : 16,
        vertical: 16,
      ),
      children: [
        const SizedBox(height: 16),
        SvgPicture.asset(
          'assets/images/undraw_cloud_sync_re_02p1.svg',
          width: width,
          height: width * 576 / 844.6693,
          excludeFromSemantics: true,
        ),
        const SizedBox(height: 64),
        Text('Choose where you want to store your data:',
            style: textTheme.headlineSmall),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/icon/resized/icon-128x128.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Saber\'s Nextcloud server',
                style: textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: buttonColorStyle(saberColor, onSaberColor),
          child: const Text('Login with Saber'),
        ),
        const SizedBox(height: 4),
        Text.rich(
          t.login.signup(
            linkToSignup: (text) => TextSpan(
              text: text,
              style: TextStyle(
                  color: colorScheme.brightness == Brightness.dark
                      ? saberColor
                      : saberColorDarkened),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(NcLoginPage.signupUrl);
                },
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/images/nextcloud-logo.svg',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Other Nextcloud server',
                style: textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Server URL',
            hintText: 'https://example.com',
          ),
        ),
        const SizedBox(height: 4),
        ElevatedButton(
          onPressed: () {},
          style: buttonColorStyle(ncColor),
          child: const Text('Login with Nextcloud'),
        ),
      ],
    );
  }

  static ButtonStyle buttonColorStyle(Color primary, [Color? onPrimary]) {
    final colorScheme = ColorScheme.fromSeed(
        seedColor: primary, primary: primary, onPrimary: onPrimary);
    return ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    );
  }
}
