
import 'package:collapsible/collapsible.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:saber/data/version.dart' show buildNumber;
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';


class AppInfo extends StatefulWidget {
  const AppInfo({super.key});

  static final Uri privacyPolicyUrl = Uri.parse('https://github.com/adil192/saber/blob/main/privacy_policy.md');
  static final Uri licenseUrl = Uri.parse("https://github.com/adil192/saber/blob/main/LICENSE.md");
  static final Uri releasesUrl = Uri.parse("https://github.com/adil192/saber/releases");

  @override
  State<AppInfo> createState() => _AppInfoState();
}
class _AppInfoState extends State<AppInfo> {
  bool moreInfoShown = false;

  Future<String> getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String version = packageInfo.version;

    String debug = kDebugMode ? " ${t.appInfo.debug}" : "";

    return "$appName$debug $version ($buildNumber)";
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Center(
          child: FutureBuilder(
            future: getInfo(),
            builder: (context, snapshot) {
              return SelectableText(snapshot.data as String? ?? "");
            },
          ),
        ),
        
        TextButton(
          onPressed: () { setState(() { moreInfoShown = !moreInfoShown; }); },
          child: IntrinsicWidth(
            child: Row(children: [
              Text(moreInfoShown ? t.appInfo.showLessInfo : t.appInfo.showMoreInfo),
              Icon(moreInfoShown ? Icons.expand_more : Icons.expand_less),
            ]),
          ),
        ),

        Collapsible(
          collapsed: !moreInfoShown,
          axis: CollapsibleAxis.vertical,
          alignment: Alignment.topCenter,
          maintainState: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SelectableText(t.appInfo.licenseNotice)
              ),
              TextButton(
                onPressed: () => launchUrl(
                  AppInfo.licenseUrl,
                  mode: LaunchMode.externalApplication,
                ),
                child: Text(t.appInfo.licenseButton),
              ),
              TextButton(
                onPressed: () => launchUrl(
                  AppInfo.privacyPolicyUrl,
                  mode: LaunchMode.externalApplication,
                ),
                child: Text(t.appInfo.privacyPolicyButton),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
