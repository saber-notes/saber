import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/version.dart' as version;
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UpdateManager {
  static final Uri versionUrl = Uri.parse("https://raw.githubusercontent.com/adil192/saber/main/lib/data/version.dart");
  /// The availability of an update.
  static final ValueNotifier<UpdateStatus> status = ValueNotifier(UpdateStatus.upToDate);

  static bool _hasShownUpdateDialog = false;
  static Future<void> showUpdateDialog(BuildContext context, {bool userTriggered = false}) async {
    if (!userTriggered) {
      if (status.value == UpdateStatus.upToDate) { // check for updates if not already done
        await Prefs.shouldCheckForUpdates.waitUntilLoaded();
        if (!Prefs.shouldCheckForUpdates.value) return;
        status.value = await _checkForUpdate();
      }
      if (status.value != UpdateStatus.updateRecommended) return; // no update available
      if (_hasShownUpdateDialog) return; // already shown
    }

    if (!context.mounted) return;
    _hasShownUpdateDialog = true;
    return await showDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog(
        title: Text(t.update.updateAvailable),
        content: Text(t.update.updateAvailableDescription),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text(MaterialLocalizations.of(context).modalBarrierDismissLabel),
          ),
          CupertinoDialogAction(
            onPressed: () {
              launchUrl(
                AppInfo.releasesUrl,
                mode: LaunchMode.externalApplication,
              );
            },
            child: Text(t.update.update),
          ),
        ],
      ),
    );
  }

  static Future<UpdateStatus> _checkForUpdate() async {
    const int currentVersion = version.buildNumber;

    final int newestVersion;
    try {
      newestVersion = await getNewestVersion() ?? 0;
    } catch (e) {
      return UpdateStatus.upToDate;
    }

    return getUpdateStatus(currentVersion, newestVersion);
  }

  /// Returns the version number hosted on GitHub (at [versionUrl]).
  /// If you provide a [latestVersionFile] (i.e. for testing),
  /// it will be used instead of downloading from GitHub.
  @visibleForTesting
  static Future<int?> getNewestVersion([String? latestVersionFile]) async {
    latestVersionFile ??= await _downloadLatestVersionFileFromGitHub();
    if (latestVersionFile == null) return null;

    // extract the number from the latest version.dart
    final RegExp numberRegex = RegExp(r'(\d+)');
    final RegExpMatch? newestVersionMatch = numberRegex.firstMatch(latestVersionFile);
    if (newestVersionMatch == null) return null;

    final int newestVersion = int.tryParse(newestVersionMatch[0] ?? "0") ?? 0;
    if (newestVersion == 0) return null;

    return newestVersion;
  }

  static Future<String?> _downloadLatestVersionFileFromGitHub() async {
    // download the latest version.dart
    final http.Response response;
    try {
      response = await http.get(versionUrl);
    } catch (e) {
      throw const SocketException("Failed to download version.dart");
    }
    if (response.statusCode >= 400) throw SocketException("Failed to download version.dart, HTTP status code ${response.statusCode}");

    return response.body;
  }

  @visibleForTesting
  static UpdateStatus getUpdateStatus(int currentVersion, int newestVersion) {
    final int versionDifference = newestVersion ~/ 10 - currentVersion ~/ 10;

    if (versionDifference <= 0) {
      return UpdateStatus.upToDate;
    } else if (versionDifference <= Prefs.updatesToIgnore.value) {
      return UpdateStatus.updateOptional;
    } else {
      return UpdateStatus.updateRecommended;
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
