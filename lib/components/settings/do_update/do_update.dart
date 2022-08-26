
import 'package:saber/components/settings/app_info.dart';
import 'package:url_launcher/url_launcher.dart';

void doUpdate() => launchUrl(
  AppInfo.releasesUrl,
  mode: LaunchMode.externalApplication,
);
