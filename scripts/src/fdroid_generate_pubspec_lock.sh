#!/usr/bin/env bash
# Generates a pubspec.lock patch for F-Droid builds.
# This is run automatically in ./scripts/bump_version.dart.
#
# In F-Droid builds, the resulting patch can be used like this:
# patch pubspec.lock < patches/pre/pubspec-fdroid.lock.patch

set -e

# prepare temp directory
mkdir -p tmpfdroid
cp pubspec.* tmpfdroid/
cp -rl packages tmpfdroid/

(
  cd tmpfdroid

  # apply patches that F-Droid uses
  ../patches/pre/remove_proprietary_dependencies.sh

  # generate pubspec.lock
  flutter pub get
)

# generate patch
diff -u pubspec.lock tmpfdroid/pubspec.lock | tail -n +3 > patches/pre/pubspec-fdroid.lock.patch

# cleanup
rm -rf tmpfdroid/
