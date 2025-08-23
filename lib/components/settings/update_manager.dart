import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saber/components/settings/update_dialog.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/saber_version.dart';
import 'package:saber/data/version.dart' as version;

abstract class UpdateManager {
  static final log = Logger('UpdateManager');

  static final Uri versionUrl = Uri.parse(
      'https://raw.githubusercontent.com/saber-notes/saber/main/lib/data/version.dart');
  static final Uri apiUrl = Uri.parse(
      'https://api.github.com/repos/saber-notes/saber/releases/latest');

  /// The availability of an update.
  static final ValueNotifier<UpdateStatus> status =
      ValueNotifier(UpdateStatus.upToDate);
  static int? newestVersion;

  static bool _hasShownUpdateDialog = false;
  static Future<void> showUpdateDialog(BuildContext context,
      {bool userTriggered = false}) async {
    if (!userTriggered) {
      if (status.value == UpdateStatus.upToDate) {
        // check for updates if not already done
        await stows.shouldCheckForUpdates.waitUntilRead();
        if (!stows.shouldCheckForUpdates.value) return;
        status.value = await _checkForUpdate();
      }
      if (status.value != UpdateStatus.updateRecommended)
        return; // no update available
      if (_hasShownUpdateDialog) return; // already shown
    }

    if (!context.mounted) return;
    _hasShownUpdateDialog = true;
    return await showDialog(
      context: context,
      builder: (context) => const UpdateDialog(),
    );
  }

  static Future<UpdateStatus> _checkForUpdate() async {
    const int currentVersion = version.buildNumber;

    try {
      newestVersion = await getNewestVersion();
    } catch (e) {
      log.severe('Failed to check for update: $e', e);
      return UpdateStatus.upToDate;
    }

    return getUpdateStatus(currentVersion, newestVersion ?? 0);
  }

  /// Returns the version number hosted on GitHub (at [versionUrl]).
  /// If you provide a [latestVersionFile] (i.e. for testing),
  /// it will be used instead of downloading from GitHub.
  @visibleForTesting
  static Future<int?> getNewestVersion([String? latestVersionFile]) async {
    latestVersionFile ??= await _downloadLatestVersionFileFromGitHub();

    // extract the number from the latest version.dart
    final RegExp numberRegex = RegExp(r'(\d+)');
    final RegExpMatch? newestVersionMatch =
        numberRegex.firstMatch(latestVersionFile);
    if (newestVersionMatch == null) return null;

    final int newestVersion = int.tryParse(newestVersionMatch[0] ?? '0') ?? 0;
    if (newestVersion == 0) return null;

    return newestVersion;
  }

  static Future<String> _downloadLatestVersionFileFromGitHub() async {
    // download the latest version.dart
    final http.Response response;
    try {
      response = await http.get(versionUrl);
    } catch (e) {
      throw SocketException('Failed to download version.dart, ${e.toString()}');
    }
    if (response.statusCode >= 400)
      throw SocketException(
          'Failed to download version.dart, HTTP status code ${response.statusCode}');

    return response.body;
  }

  @visibleForTesting
  static UpdateStatus getUpdateStatus(
      int currentVersionNumber, int newestVersionNumber) {
    final currentVersion =
        SaberVersion.fromNumber(currentVersionNumber).copyWith(revision: 0);
    final newestVersion =
        SaberVersion.fromNumber(newestVersionNumber).copyWith(revision: 0);

    // Check if we're up to date
    if (newestVersion.buildNumber <= currentVersion.buildNumber) {
      return UpdateStatus.upToDate;
    }

    // Check if the update is low priority
    if (!stows.shouldAlwaysAlertForUpdates.value) {
      // Only prompt user every second patch
      if (newestVersion.buildNumber - currentVersion.buildNumber <
          SaberVersion.fromName('0.0.2').buildNumber) {
        return UpdateStatus.updateOptional;
      }

      // Don't prompt user when patch version is 0 (e.g. 0.15.0)
      // since there might still be bugs to fix
      if (newestVersion.patch == 0) {
        return UpdateStatus.updateOptional;
      }
    }

    return UpdateStatus.updateRecommended;
  }

  static Future<String?> getLatestDownloadUrl([
    String? apiResponse,
    TargetPlatform? platform,
  ]) async {
    platform ??= defaultTargetPlatform;

    if (platform == TargetPlatform.android) {
      if (FlavorConfig.flavor.isNotEmpty) return null;
    }

    if (!UpdateManager.platformFileRegex.containsKey(platform)) return null;

    if (apiResponse == null) {
      final http.Response response;
      try {
        response = await http.get(apiUrl);
      } catch (e) {
        throw const SocketException('Failed to fetch latest release');
      }
      if (response.statusCode >= 400)
        throw SocketException(
            'Failed to fetch latest release, HTTP status code ${response.statusCode}');
      apiResponse = response.body;
    }

    final Map<String, dynamic> json = jsonDecode(apiResponse);
    final RegExp platformFileRegex = UpdateManager.platformFileRegex[platform]!;
    final Map<String, dynamic>? asset = (json['assets'] as List).firstWhere(
      (asset) => platformFileRegex.hasMatch(asset['name']),
      orElse: () => null,
    );
    return asset?['browser_download_url'];
  }

  static final Map<TargetPlatform, RegExp> platformFileRegex = {
    TargetPlatform.windows: RegExp(r'\.exe'),

    // e.g. Saber_v0.9.8.apk not Saber_FOSS_v0.9.8.apk
    TargetPlatform.android: RegExp(r'Saber_v.*\.apk'),
  };

  /// Downloads the update file from [downloadUrl] and installs it.
  // TODO(adil192): use a downloader like background_downloader for progress
  static Future<void> directlyDownloadUpdate(String downloadUrl) async {
    final Uint8List bytes = await http.readBytes(Uri.parse(downloadUrl));

    final tempDir = await getTemporaryDirectory();
    final fileName = downloadUrl.substring(downloadUrl.lastIndexOf('/') + 1);

    final file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
  }

  static Future<String?> getChangelog({
    String localeCode = 'en-US',
    @visibleForTesting int? newestVersion,
  }) async {
    newestVersion ??= UpdateManager.newestVersion;
    assert(newestVersion != null);

    final url = 'https://raw.githubusercontent.com/saber-notes/saber/main/'
        'metadata/$localeCode/changelogs/$newestVersion.txt';
    log.info('Downloading changelog from $url');

    final http.Response response;
    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      log.severe('Failed to download changelog: $e', e);
      return null;
    }
    if (response.statusCode >= 400) return null;

    if (response.body.isEmpty) return null;
    return response.body;
  }
}

enum UpdateStatus {
  /// The app is up to date, or we failed to check for an update.
  upToDate,

  /// An update is available, but the user doesn't need to be notified
  updateOptional,

  /// An update is available and the user should be notified
  updateRecommended,
}
