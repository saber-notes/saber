import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/nextcloud/readable_bytes.dart';
import 'package:saber/data/nextcloud/saber_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/user/login.dart';

typedef Quota = UserDetailsQuota;

class NextcloudProfile extends StatefulWidget {
  const NextcloudProfile({super.key});

  @override
  State<NextcloudProfile> createState() => _NextcloudProfileState();

  /// If non-null, this will be used instead of the actual login state.
  @visibleForTesting
  static LoginStep? forceLoginStep;
}

class _NextcloudProfileState extends State<NextcloudProfile> {
  @override
  void initState() {
    stows.username.addListener(_usernameChanged);
    stows.encPassword.addListener(_usernameChanged);
    stows.key.addListener(_usernameChanged);
    stows.iv.addListener(_usernameChanged);
    super.initState();
  }

  @override
  void dispose() {
    stows.username.removeListener(_usernameChanged);
    stows.encPassword.removeListener(_usernameChanged);
    stows.key.removeListener(_usernameChanged);
    stows.iv.removeListener(_usernameChanged);
    super.dispose();
  }

  late var getStorageQuotaFuture = getStorageQuota();
  void _usernameChanged() {
    getStorageQuotaFuture = getStorageQuota();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final loginStep =
        NextcloudProfile.forceLoginStep ?? NcLoginPage.getCurrentStep();
    final heading = switch (loginStep) {
      LoginStep.waitingForPrefs => '',
      LoginStep.nc => t.login.status.loggedOut,
      LoginStep.enc ||
      LoginStep.done => t.login.status.hi(u: stows.username.value),
    };
    final subheading = switch (loginStep) {
      LoginStep.waitingForPrefs => '',
      LoginStep.nc => t.login.status.tapToLogin,
      LoginStep.enc => t.login.status.almostDone,
      LoginStep.done => t.login.status.loggedIn,
    };
    const pfpSize = 48.0;

    final colorScheme = ColorScheme.of(context);
    return ListTile(
      visualDensity: VisualDensity.standard,
      onTap: () => context.push(RoutePaths.login),
      leading: ValueListenableBuilder(
        valueListenable: stows.pfp,
        builder: (BuildContext context, Uint8List? pfp, _) {
          return ClipRSuperellipse(
            borderRadius: BorderRadius.circular(18),
            child: pfp == null
                ? const _UnknownPfp(size: pfpSize)
                : Image.memory(pfp, width: pfpSize, height: pfpSize),
          );
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
                  initialData: stows.lastStorageQuota.value,
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
                              backgroundColor: colorScheme.primary.withValues(
                                alpha: 0.1,
                              ),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                colorScheme.primary.withValues(alpha: 0.5),
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
                    stows.fileSyncResyncEverythingDate.value = DateTime.now();
                    final allFiles = await FileManager.getAllFiles(
                      includeExtensions: true,
                      includeAssets: true,
                    );
                    for (final file in allFiles) {
                      syncer.uploader.enqueueRel(file);
                    }
                  },
                ),
              ],
            )
          : null,
    );
  }

  static Future<Quota?> getStorageQuota() async {
    if (NextcloudProfile.forceLoginStep != null)
      return stows.lastStorageQuota.value;

    final client = NextcloudClientExtension.withSavedDetails();
    if (client == null) return null;

    final user = await client.provisioningApi.users.getCurrentUser();
    stows.lastStorageQuota.value = user.body.ocs.data.quota;
    return stows.lastStorageQuota.value;
  }

  static String readableQuota(Quota? quota) {
    final used = readableBytes(quota?.used);
    final total = readableBytes(quota?.total);
    return '$used / $total';
  }
}

class _UnknownPfp extends StatelessWidget {
  const _UnknownPfp({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return SizedBox(
      width: size,
      height: size,
      child: ColoredBox(
        color: colorScheme.primaryContainer,
        child: Icon(
          Icons.person,
          color: colorScheme.onPrimaryContainer,
          size: size * 0.7,
        ),
      ),
    );
  }
}
