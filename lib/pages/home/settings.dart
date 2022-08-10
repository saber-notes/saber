
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final Uri privacyPolicyUrl = Uri.parse('https://github.com/adil192/saber/blob/main/privacy_policy.md');

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text("Settings"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            launchUrl(
              privacyPolicyUrl,
              mode: LaunchMode.externalApplication,
            );
          },
          child: Text("Tap here to view the privacy policy"),
        ),
      ),
    );
  }
}
