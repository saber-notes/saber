#!/usr/bin/env bash

# find "path: packages/onyxsdk_pen" and replace with "path: packages/onyxsdk_pen_dummy"
echo -n "Replacing onyxsdk_pen with onyxsdk_pen_dummy: "
# check if pubspec.yaml contains onyxsdk_pen_dummy
if grep -q "onyxsdk_pen_dummy" pubspec.yaml; then
  echo "already done"
else
  echo "found"
  sed -i -e 's!/onyxsdk_pen!/onyxsdk_pen_dummy!' pubspec.yaml
fi

# remove Onyx maven repo
echo -n "Removing Onyx,jitpack maven repo: "
# check if android/build.gradle contains "repo.boox.com"
if grep -q "repo.boox.com" "android/build.gradle"; then
  echo "found"
  sed -i -e '18,24d' android/build.gradle
else
  echo "already done"
fi

# Update flavor
echo "Updating flavor to FOSS"
sed -i -e "s!flavor: null,!flavor: 'FOSS',!" lib/main.dart

# Remove google_mobile_ads package and related code
echo "Removing Google Ads"
# Remove google_mobile_ads from pubspec.yaml
sed -i -e '/google_mobile_ads/d' pubspec.yaml
# Replace banner_ad_widget.dart with _banner_ad_widget_dummy.dart
mv lib/components/home/_banner_ad_widget_dummy.dart lib/components/home/banner_ad_widget.dart

# Remove AD_ID permission
echo "Removing AD_ID permission"
sed -i -e '/com.google.android.gms.permission.AD_ID/d' android/app/src/main/AndroidManifest.xml
