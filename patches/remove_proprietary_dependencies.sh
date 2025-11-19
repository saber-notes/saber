#!/usr/bin/env bash

echo -n "Removing onyxsdk_pen dependency from pubspec.yaml: "
if grep -q "onyxsdk_pen" pubspec.yaml; then
  echo "found"
  sed -i -e '/onyxsdk_pen/d' pubspec.yaml
else
  echo "already done"
fi

echo -n "Removing onyxsdk_pen usage from lib/main.dart: "
if grep -q "onyxsdk_pen" lib/main.dart; then
  echo "found"
  sed -i -e '/onyxsdk_pen/d' lib/main.dart
  sed -i -e '/OnyxSdkPenArea.init()/d' lib/main.dart
else
  echo "already done"
fi

echo -n "Removing onyxsdk_pen usage from lib/components/canvas/canvas.dart: "
if grep -q "onyxsdk_pen" lib/components/canvas/canvas.dart; then
  echo "found"
  sed -i -e '/onyxsdk_pen/d' lib/components/canvas/canvas.dart
  sed -i -e 's/OnyxSdkPenArea(/SizedBox(/g' lib/components/canvas/canvas.dart
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
