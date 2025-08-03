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

# remove sentry dependencies (Sentry is open source but removed anyway)
echo -n "Removing sentry dependencies: "
if grep -q "sentry_flutter" pubspec.yaml; then
  echo -n "sentry_flutter, "
  sed -i -e '/sentry_flutter/d' pubspec.yaml
fi
if grep -q "sentry_logging" pubspec.yaml; then
  echo -n "sentry_logging, "
  sed -i -e '/sentry_logging/d' pubspec.yaml
fi
if grep -q "sentry_dart_plugin" pubspec.yaml; then
  echo -n "sentry_dart_plugin, "
  sed -i -e '/sentry_dart_plugin/d' pubspec.yaml
fi
echo "done"

# remove sentry code
echo -n "Removing sentry code: "
if [ -f "lib/data/sentry/_sentry_init_foss.dart" ]; then
  echo "found"
  mv lib/data/sentry/_sentry_init_foss.dart lib/data/sentry/sentry_init.dart
  rm lib/data/sentry/sentry_filter.dart
  rm test/sentry_filter_test.dart
else
  echo "not found"
fi
