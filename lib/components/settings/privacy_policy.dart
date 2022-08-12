
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  static final Uri privacyPolicyUrl = Uri.parse('https://github.com/adil192/saber/blob/main/privacy_policy.md');

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        launchUrl(
          privacyPolicyUrl,
          mode: LaunchMode.externalApplication,
        );
      },
      child: const Text("Tap here to view the privacy policy"),
    );
  }
}
