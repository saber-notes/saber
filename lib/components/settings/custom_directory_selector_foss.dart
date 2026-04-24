/*
  This file is for the FOSS Android build only:

  the stub `custom_directory_selector_android.dart`

  is replaced with this file via the `enable_custom_dir_foss_android.sh` script

  credit for the implementation for the permission selector code goes to @ComputerElite

  original source PR: https://github.com/saber-notes/saber/pull/1448

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/i18n/strings.g.dart';

bool isCustomDirSupported() => true;

Future<void> requestStoragePermission() async {
  final status = await Permission.manageExternalStorage.request();
  if (status.isDenied || status.isPermanentlyDenied) {
    openAppSettings();
  }
}

Future<void> onConfirmAndroid(BuildContext context, String directory) async {
  if (directory.startsWith('/data/user/')) return;
  if (await Permission.manageExternalStorage.isGranted) return;
  if (!context.mounted) return;

  showDialog(
    context: context,
    builder: (context) => AdaptiveAlertDialog(
      title: Text(t.settings.customDataDir.grantPermission),
      content: Text(t.settings.customDataDir.grantPermissionExplanation),
      actions: [
        CupertinoDialogAction(
          onPressed: () => context.pop(),
          child: Text(t.settings.customDataDir.cancel),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            context.pop();
            requestStoragePermission();
          },
          child: Text(t.settings.customDataDir.yes),
        ),
      ],
    ),
  );
}
