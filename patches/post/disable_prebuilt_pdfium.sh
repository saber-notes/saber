#!/bin/bash
# The `pdfium_dart` package downloads prebuilt libs
# from https://github.com/bblanchon/pdfium-binaries.
# This patch disables that download.
#
# Make sure to run `./scripts/build_pdfium.sh` after this.
#
# This script should only be run in CI since it directly edits files in
# the pub cache.
# If you accidentally run this locally, run `flutter pub cache repair`
# to undo the changes.

set -e

if [ -z "$PUB_CACHE" ]; then
  echo "Warning: PUB_CACHE is not set. Defaulting to \$HOME/.pub-cache"
  echo "Please set PUB_CACHE to silence this warning in the future."
  echo
  PUB_CACHE="$HOME/.pub-cache"
fi

TARGET_FILES=("${PUB_CACHE}"/hosted/pub.dev/pdfium_dart-*/hook/build.dart)
for SCRIPT in "${TARGET_FILES[@]}"; do
  if [ ! -f "$SCRIPT" ]; then
    echo "Couldn't find pdfium_dart in your pub cache."
    echo "Run 'flutter pub get' and try again."
    exit 1
  fi

  patch "$SCRIPT" -p3 < patches/post/0001-Disable-prebuilt-pdfium.patch
done
