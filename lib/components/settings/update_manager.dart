
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/data/version.dart' as version;
import 'package:url_launcher/url_launcher.dart';
import 'package:saber/components/settings/do_update/do_update.dart'
  if (dart.library.html) 'package:saber/components/settings/do_update/do_update_web.dart';

abstract class UpdateManager {
  static final Uri versionUrl = Uri.parse("https://raw.githubusercontent.com/adil192/saber/main/lib/data/version.dart");

  static bool _hasShownUpdateDialog = false;
  static Future<void> showUpdateDialog(BuildContext context) async {
    if (_hasShownUpdateDialog) return;
    if (!await _checkForUpdate()) return;

    _hasShownUpdateDialog = true;
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Available'),
        content: const Text('A new version of the app is available.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Dismiss'),
          ),
          const TextButton(
            onPressed: doUpdate,
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  static Future<bool> _checkForUpdate() async {
    const int currentVersion = version.buildNumber;

    // download the latest version.dart
    final http.Response response;
    try {
      response = await http.get(versionUrl);
      if (response.statusCode >= 400) return false;
    } catch (e) {
      return false;
    }

    // extract the number from the latest version.dart
    final RegExp numberRegex = RegExp(r'(\d+)');
    final RegExpMatch? newestVersionMatch = numberRegex.firstMatch(response.body);
    if (newestVersionMatch == null) return false;

    final int newestVersion = int.tryParse(newestVersionMatch[0] ?? "0") ?? 0;
    if (newestVersion == 0) return false;

    // ignore 1 minor update so the user isn't prompted too often
    return newestVersion > currentVersion + 1;
  }
}
