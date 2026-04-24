#!/usr/bin/env bash
#
# Enables custom directories for the Android FOSS build

MANIFEST="android/app/src/main/AndroidManifest.xml"

echo -n "Adding MANAGE_EXTERNAL_STORAGE permission to AndroidManifest.xml: "
if grep -q "MANAGE_EXTERNAL_STORAGE" "$MANIFEST"; then
  echo "already done"
else
  echo "adding"
  sed -i 's|<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />|<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />\n    <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />|' "$MANIFEST"
fi

