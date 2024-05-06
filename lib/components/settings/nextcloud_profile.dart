import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/nextcloud/readable_bytes.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/user/login.dart';

typedef Quota = UserDetailsQuota;

class NextcloudProfile extends StatefulWidget {
  const NextcloudProfile({super.key});

  @override
  State<NextcloudProfile> createState() => _NextcloudProfileState();
}

class _NextcloudProfileState extends State<NextcloudProfile> {
  @override
  void initState() {
    Prefs.username.addListener(_usernameChanged);
    Prefs.encPassword.addListener(_usernameChanged);
    super.initState();
  }

  @override
  void dispose() {
    Prefs.username.removeListener(_usernameChanged);
    Prefs.encPassword.removeListener(_usernameChanged);
    super.dispose();
  }

  late var getStorageQuotaFuture = getStorageQuota();
  void _usernameChanged() {
    getStorageQuotaFuture = getStorageQuota();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final loginStep = NcLoginPage.getCurrentStep();
    final heading = switch (loginStep) {
      LoginStep.waitingForPrefs => '',
      LoginStep.nc => t.login.status.loggedOut,
      LoginStep.enc ||
      LoginStep.done =>
        t.login.status.hi(u: Prefs.username.value),
    };
    final subheading = switch (loginStep) {
      LoginStep.waitingForPrefs => '',
      LoginStep.nc => t.login.status.tapToLogin,
      LoginStep.enc => t.login.status.almostDone,
      LoginStep.done => t.login.status.loggedIn,
    };

    var colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () => context.push(RoutePaths.login),
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
      trailing: loginStep == LoginStep.done
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FutureBuilder(
                  future: getStorageQuotaFuture,
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
                    final allFiles = await FileManager.getAllFiles(
                        includeExtensions: true, includeAssets: true);
                    Prefs.fileSyncResyncEverythingDate.value = DateTime.now();
                    for (final file in allFiles) {
                      FileSyncer.addToUploadQueue(file);
                    }
                  },
                ),
              ],
            )
          : null,
    );
  }

  static Future<Quota?> getStorageQuota() async {
    final client = NextcloudClientExtension.withSavedDetails();
    if (client == null) return null;

    final user = await client.provisioningApi.users.getCurrentUser();
    Prefs.lastStorageQuota.value = user.body.ocs.data.quota;
    return Prefs.lastStorageQuota.value;
  }

  static String readableQuota(Quota? quota) {
    final used = readableBytes(quota?.used);
    final total = readableBytes(quota?.total);
    return '$used / $total';
  }
}
