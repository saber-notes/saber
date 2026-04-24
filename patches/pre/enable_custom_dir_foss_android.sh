#!/usr/bin/env bash
#
# Enables custom directories for the Android FOSS build

# Update Manifest

MANIFEST="android/app/src/main/AndroidManifest.xml"

echo -n "Adding MANAGE_EXTERNAL_STORAGE permission to AndroidManifest.xml: "
if grep -q "MANAGE_EXTERNAL_STORAGE" "$MANIFEST"; then
  echo "already done"
else
  echo "adding"
  sed -i 's|<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />|<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />\n    <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />|' "$MANIFEST"
fi

# replace stub with FOSS version of custom directory selector

ANDROID_DART="lib/components/settings/custom_directory_selector_android.dart"
FOSS_DART="lib/components/settings/custom_directory_selector_foss.dart"

echo -n "Replacing custom_directory_selector_android.dart with FOSS version: "
if diff -q "$ANDROID_DART" "$FOSS_DART" > /dev/null 2>&1; then
  echo "already done"
else
  echo "replacing"
  cp "$FOSS_DART" "$ANDROID_DART"
fi