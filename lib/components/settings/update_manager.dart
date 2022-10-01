
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saber/data/prefs.dart';
import 'package:saber/data/version.dart' as version;
import 'package:saber/components/settings/do_update/do_update.dart'
  if (dart.library.html) 'package:saber/components/settings/do_update/do_update_web.dart';

abstract class UpdateManager {
  static final Uri versionUrl = Uri.parse("https://raw.githubusercontent.com/adil192/saber/main/lib/data/version.dart");
  /// The availability of an update.
  static final ValueNotifier<UpdateStatus> status = ValueNotifier(UpdateStatus.upToDate);

  static bool _hasShownUpdateDialog = false;
  static Future<void> showUpdateDialog(BuildContext context, {bool userTriggered = false}) async {
    if (!userTriggered) {
      if (status.value == UpdateStatus.upToDate) { // check for updates if not already done
        if (!Prefs.shouldCheckForUpdates.value) return;
        status.value = await _checkForUpdate();
      }
      if (status.value != UpdateStatus.updateRecommended) return; // no update available
      if (_hasShownUpdateDialog) return; // already shown
    }

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

  static Future<UpdateStatus> _checkForUpdate() async {
    const int currentVersion = version.buildNumber;

    // download the latest version.dart
    final http.Response response;
    try {
      response = await http.get(versionUrl);
      if (response.statusCode >= 400) return UpdateStatus.upToDate;
    } catch (e) {
      return UpdateStatus.upToDate;
    }

    // extract the number from the latest version.dart
    final RegExp numberRegex = RegExp(r'(\d+)');
    final RegExpMatch? newestVersionMatch = numberRegex.firstMatch(response.body);
    if (newestVersionMatch == null) return UpdateStatus.upToDate;

    final int newestVersion = int.tryParse(newestVersionMatch[0] ?? "0") ?? 0;
    if (newestVersion == 0) return UpdateStatus.upToDate;

    if (newestVersion > currentVersion + 1) {
      // ignore 1 minor update so the user isn't prompted too often
      return UpdateStatus.updateRecommended;
    } else if (newestVersion > currentVersion && kDebugMode) {
      // debug should be upgraded as soon as possible
      return UpdateStatus.updateOptional;
    } else {
      return UpdateStatus.upToDate;
    }
  }
}

enum UpdateStatus {
  /// The app is up to date, or we failed to check for an update.
  upToDate,
  /// An update is available, but the user doesn't need to be notified
  updateOptional,
  // An update is available and the user should be notified
  updateRecommended,
}
