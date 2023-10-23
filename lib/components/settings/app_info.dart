import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/version.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';


class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  static final Uri sponsorUrl = Uri.parse('https://github.com/sponsors/adil192');
  static final Uri privacyPolicyUrl = Uri.parse('https://github.com/saber-notes/saber/blob/main/privacy_policy.md');
  static final Uri licenseUrl = Uri.parse('https://github.com/saber-notes/saber/blob/main/LICENSE.md');
  static final Uri releasesUrl = Uri.parse('https://github.com/saber-notes/saber/releases');

  static String get info => [
    'v$buildName',
    if (FlavorConfig.flavor.isNotEmpty)
      FlavorConfig.flavor,
    if (FlavorConfig.dirty)
      t.appInfo.dirty,
    if (kDebugMode)
      t.appInfo.debug,
    '($buildNumber)',
  ].join(' ');

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showAboutDialog(context),
      child: ValueListenableBuilder(
        valueListenable: Prefs.locale,
        builder: (context, _, __) => Text(info),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) => showAboutDialog(
    context: context,
    applicationVersion: info,
    applicationIcon: Image.asset(
      'assets/icon/resized/icon-128x128.png',
      width: 50,
      height: 50,
    ),
    applicationLegalese: t.appInfo.licenseNotice(buildYear: buildYear),
    children: [
      const SizedBox(height: 10),
      TextButton(
        onPressed: () => launchUrl(sponsorUrl),
        child: SizedBox(
          width: double.infinity,
          child: Text(t.appInfo.sponsorButton)
        ),
      ),
      TextButton(
        onPressed: () => launchUrl(licenseUrl),
        child: SizedBox(
          width: double.infinity,
          child: Text(t.appInfo.licenseButton),
        ),
      ),
      TextButton(
        onPressed: () => launchUrl(privacyPolicyUrl),
        child: SizedBox(
          width: double.infinity,
          child: Text(t.appInfo.privacyPolicyButton)
        ),
      ),
    ],
  );
}
