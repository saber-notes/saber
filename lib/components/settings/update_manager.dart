import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class UpdateManager {
  static final Uri versionUrl = Uri.parse("https://raw.githubusercontent.com/adil192/saber/main/lib/data/version.dart");
  /// The availability of an update.
  static final ValueNotifier<UpdateStatus> status = ValueNotifier(UpdateStatus.upToDate);

  static Future<void> showUpdateDialog(BuildContext context, {bool userTriggered = false}) async {
    // non-web only
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
