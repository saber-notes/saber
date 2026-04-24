/*
  This file gets replaced during the CI build process with:

  `custom_directory_selector_foss.dart`

  for the FOSS build only.

  Play Store build uses this noop stub custom directory selector
*/
import 'package:flutter/material.dart';

bool isCustomDirSupported() => false;

Future<void> onConfirmAndroid(BuildContext context, String directory) async {
  return;
}
