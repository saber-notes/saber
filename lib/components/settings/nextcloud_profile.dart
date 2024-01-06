import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';

typedef Quota = UserDetailsQuota;

class NextcloudProfile extends StatefulWidget {
  const NextcloudProfile({super.key});

  @override
  State<NextcloudProfile> createState() => _NextcloudProfileState();

  @visibleForTesting
  static Future<Quota?> getStorageQuota() async {
    final client = NextcloudClientExtension.withSavedDetails();
    if (client == null) return null;

    final user = await client.provisioningApi.users.getCurrentUser();
    Prefs.lastStorageQuota.value = user.body.ocs.data.quota;
    return Prefs.lastStorageQuota.value;
  }
}

class _NextcloudProfileState extends State<NextcloudProfile> {
  @override
  Widget build(BuildContext context) {
    final String heading, subheading;
    final bool loggedIn = Prefs.username.value.isNotEmpty;
    if (loggedIn) {
      heading = Prefs.username.value;
      subheading = t.login.status.loggedIn;
    } else {
      heading = t.login.status.loggedOut;
      subheading = t.login.status.tapToLogin;
    }

    var colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        context.push(loggedIn ? RoutePaths.profile : RoutePaths.login);
      },
      leading: ValueListenableBuilder(
        valueListenable: Prefs.pfp,
        builder: (BuildContext context, Uint8List? pfp, _) {
          if (pfp == null) {
            return const Icon(Icons.account_circle, size: 48);
          } else {
            return ClipPath(
              clipper: ShapeBorderClipper(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Image.memory(
                pfp,
                width: 48,
                height: 48,
              ),
            );
          }
        },
      ),
      title: Text(heading),
      subtitle: Text(subheading),
      trailing: loggedIn
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FutureBuilder(
                  future: NextcloudProfile.getStorageQuota(),
                  initialData: Prefs.lastStorageQuota.value,
                  builder:
                      (BuildContext context, AsyncSnapshot<Quota?> snapshot) {
                    final Quota? quota = snapshot.data;
                    final double? relativePercent;
                    if (quota != null) {
                      relativePercent = quota.relative / 100;
                    } else {
                      relativePercent = null;
                    }

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: relativePercent,
                          backgroundColor: colorScheme.primary.withOpacity(0.1),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colorScheme.primary.withOpacity(0.5),
                          ),
                          strokeWidth: 8,
                          semanticsLabel: 'Storage usage',
                          semanticsValue: snapshot.data != null
                              ? '${snapshot.data}%'
                              : null,
                        ),
                        Text(readableQuota(quota)),
                      ],
                    );
                  },
                ),
                IconButton(
                  icon: const AdaptiveIcon(
                    icon: Icons.cloud_upload,
                    cupertinoIcon: CupertinoIcons.cloud_upload,
                  ),
                  tooltip: t.settings.resyncEverything,
                  onPressed: () async {
                    final allFiles = await FileManager.getAllFiles(false);
                    Prefs.fileSyncResyncEverythingDate.value = DateTime.now();
                    for (final file in allFiles) {
                      FileSyncer.addToUploadQueue(file);
                      // upload also all file assets if any
                      int i=0;
                      while (true) {
                        String assetFile='$file.$i';  // asset file name
                        if (await FileManager.doesFileExist(assetFile)) {
                          // asset file exists, upload it
                          FileSyncer.addToUploadQueue(assetFile);
                          i++; // try next asset
                        }
                        else {
                          // there are no more assets finish
                          break;
                        }
                      }

                    }
                  },
                ),
              ],
            )
          : null,
    );
  }

  static String readableQuota(Quota? quota) {
    final used = readableBytes(quota?.used);
    final total = readableBytes(quota?.total);
    return '$used / $total';
  }

  static String readableBytes(num? bytes) {
    if (bytes == null) {
      return '... B';
    } else if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 2) {
      // e.g. 1.5 KB
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).round()} KB';
    } else if (bytes < 1024 * 1024 * 2) {
      // e.g. 1.5 MB
      return '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / 1024 / 1024).round()} MB';
    } else if (bytes < 1024 * 1024 * 1024 * 2) {
      // e.g. 1.5 GB
      return '${(bytes / 1024 / 1024 / 1024).toStringAsFixed(1)} GB';
    } else if (bytes < 1024 * 1024 * 1024 * 1024) {
      return '${(bytes / 1024 / 1024 / 1024).round()} GB';
    } else if (bytes < 1024 * 1024 * 1024 * 1024 * 2) {
      // e.g. 1.5 TB
      return '${(bytes / 1024 / 1024 / 1024 / 1024).toStringAsFixed(1)} TB';
    } else {
      return '${(bytes / 1024 / 1024 / 1024 / 1024).round()} TB';
    }
  }
}
