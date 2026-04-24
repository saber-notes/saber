/*
  This file is for the Play Store build only

  This stub file gets replaced during the CI build process with:
  `custom_directory_selector_foss.dart`
  for the FOSS build.
*/
import 'package:flutter/material.dart';

bool isCustomDirSupported() => false;

Future<void> onConfirmAndroid(BuildContext context, String directory) async {
  return;
}
