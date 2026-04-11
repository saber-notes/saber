import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/adaptive_linear_progress_indicator.dart';
import 'package:saber/data/extensions/quota_extension.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/nextcloud/saber_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/user/login.dart';

typedef Quota = UserDetailsQuota;

class NextcloudProfile extends HookWidget {
  const NextcloudProfile({super.key});

  /// If non-null, this will be used instead of the actual login state.
  @visibleForTesting
  static LoginStep? forceLoginStep;

  @override
  Widget build(BuildContext context) {
    final username = useValueListenable(stows.username);
    final encPassword = useValueListenable(stows.encPassword);
    final key = useValueListenable(stows.key);
    final iv = useValueListenable(stows.iv);
    final pfp = useValueListenable(stows.pfp);

    final quota = useValueListenable(stows.lastStorageQuota);
    useMemoized(getStorageQuota, [username, encPassword, key, iv]);

    final loginStep = forceLoginStep ?? NcLoginPage.getCurrentStep();
    final heading = switch (loginStep) {
      .waitingForPrefs => '',
      .nc => t.login.status.loggedOut,
      .enc || .done => t.login.status.hi(u: stows.username.value),
    };
    final subheading = switch (loginStep) {
      .waitingForPrefs => '',
      .nc => t.login.status.tapToLogin,
      .enc => t.login.status.almostDone,
      .done => t.login.status.loggedIn,
    };
    const pfpSize = 48.0;

    return ListTile(
      visualDensity: VisualDensity.standard,
      onTap: () => context.push(RoutePaths.login),
      leading: ClipRSuperellipse(
        borderRadius: const .all(.circular(18)),
        child: pfp == null
            ? const _UnknownPfp(size: pfpSize)
            : Image.memory(pfp, width: pfpSize, height: pfpSize),
      ),
      title: Text(heading),
      subtitle: Text(subheading),
      trailing: loginStep == .done
          ? Row(
              mainAxisSize: .min,
              spacing: 8,
              children: [
                _QuotaSummary(quota: quota),
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
    if (forceLoginStep != null) return stows.lastStorageQuota.value;

    final client = NextcloudClientExtension.withSavedDetails();
    if (client == null) return stows.lastStorageQuota.value = null;

    final user = await client.provisioningApi.users.getCurrentUser();
    return stows.lastStorageQuota.value = user.body.ocs.data.quota;
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

class _QuotaSummary extends StatelessWidget {
  const _QuotaSummary({required this.quota});

  final Quota? quota;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return IntrinsicWidth(
      child: Column(
        mainAxisSize: .min,
        spacing: 2,
        children: [
          AdaptiveLinearProgressIndicator(
            semanticsLabel: 'Storage usage',
            value: quota?.progressIndicatorValue,
            backgroundColor: colorScheme.primary.withValues(alpha: 0.3),
            color: colorScheme.primary.withValues(alpha: 0.8),
            minHeight: 8,
          ),
          Text(quota.summary),
        ],
      ),
    );
  }
}
