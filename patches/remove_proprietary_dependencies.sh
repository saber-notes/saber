#!/bin/bash

# find "path: packages/onyxsdk_pen" and replace with "path: packages/onyxsdk_pen_dummy"
echo "Replacing onyxsdk_pen with onyxsdk_pen_dummy"
sed -i -e 's!/onyxsdk_pen!/onyxsdk_pen_dummy!' pubspec.yaml

# remove Onyx maven repo
echo -n "Removing Onyx,jitpack maven repo: "
# check if android/build.gradle contains "repo.boox.com"
if grep -q "repo.boox.com" "android/build.gradle"; then
  echo "found"
  sed -i -e '18,24d' android/build.gradle
else
  echo "already removed"
fi

# Delete packages/onyxsdk_pen to make sure it's not used
echo "Deleting packages/onyxsdk_pen"
rm -rf packages/onyxsdk_pen

# Reduce minSdkVersion to 18
echo "Reducing minSdkVersion to 18"
sed -i -e 's!minSdkVersion 23!minSdkVersion 18!' android/app/build.gradle
