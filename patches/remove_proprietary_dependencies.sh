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

# find "name: onyxsdk_pen_dummy" and replace with "name: onyxsdk_pen"
echo -n "Patching onyxsdk_pen_dummy to have name onyxsdk_pen: "
# check if packages/onyxsdk_pen_dummy/pubspec.yaml contains name: onyxsdk_pen_dummy
if grep -q "name: onyxsdk_pen_dummy" packages/onyxsdk_pen_dummy/pubspec.yaml; then
  echo "found"
  sed -i -e 's!name: onyxsdk_pen_dummy!name: onyxsdk_pen!' packages/onyxsdk_pen_dummy/pubspec.yaml
else
  echo "already done"
fi

# remove Onyx maven repo
echo -n "Removing Onyx,jitpack maven repo: "
# check if android/build.gradle.kts contains "repo.boox.com"
if grep -q "repo.boox.com" "android/build.gradle.kts"; then
  echo "found"
  sed -i -e '5,9d' android/build.gradle.kts
else
  echo "already done"
fi
