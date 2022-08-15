
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  State<AppInfo> createState() => _AppInfoState();
}
class _AppInfoState extends State<AppInfo> {
  String message = "";

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  Future getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    setState(() {
      message = "$appName $version";
      if (buildNumber.isNotEmpty) message += " ($buildNumber)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
