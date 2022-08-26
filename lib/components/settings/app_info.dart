
import 'package:collapsible/collapsible.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:saber/data/version.dart' show buildNumber;
import 'package:url_launcher/url_launcher.dart';

const String licenseNotice = "Saber  Copyright (C) 2022  Adil Hanney\n"
"This program comes with absolutely no warranty. "
"This is free software, and you are welcome to redistribute it under certain conditions.\n\n";

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  static final Uri privacyPolicyUrl = Uri.parse('https://github.com/adil192/saber/blob/main/privacy_policy.md');
  static final Uri licenseUrl = Uri.parse("https://github.com/adil192/saber/blob/main/LICENSE.md");
  static final Uri releasesUrl = Uri.parse("https://github.com/adil192/saber/releases");

  @override
  State<AppInfo> createState() => _AppInfoState();
}
class _AppInfoState extends State<AppInfo> {
  String message = "";
  bool moreInfoShown = false;

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  Future getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String version = packageInfo.version;

    setState(() {
      message = "$appName $version ($buildNumber)";
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Center(
          child: Text(message),
        ),
        
        TextButton(
          onPressed: () { setState(() { moreInfoShown = !moreInfoShown; }); },
          child: IntrinsicWidth(
            child: Row(children: [
              moreInfoShown ? const Text("Hide more info") : const Text("Show more info"),
              moreInfoShown ? const Icon(Icons.expand_more) : const Icon(Icons.expand_less),
            ]),
          ),
        ),

        Collapsible(
          collapsed: !moreInfoShown,
          axis: CollapsibleAxis.vertical,
          alignment: Alignment.topCenter,
          maintainState: true,
          child: RichText(text: TextSpan(
            style: TextStyle(color: colorScheme.onBackground),
            children: [
              const TextSpan(text: licenseNotice),
              TextSpan(
                text: "Tap here to view more license information.\n\n",
                style: TextStyle(
                  color: colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  launchUrl(
                    AppInfo.licenseUrl,
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
              TextSpan(
                text: "Tap here to view the privacy policy.\n",
                style: TextStyle(
                  color: colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  launchUrl(
                    AppInfo.privacyPolicyUrl,
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
            ],
          ))
        ),
      ],
    );
  }
}
