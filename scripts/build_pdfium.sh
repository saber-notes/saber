#!/bin/bash
# The `pdfium_dart` package downloads prebuilt libs
# from https://github.com/bblanchon/pdfium-binaries.
# Build it manually to avoid the prebuilts.
#
# When built, the lib will be at one of these paths:
# ./.dart_tool/hooks_runner/shared/pdfium_dart/build/chromium_7811/arm/libpdfium.so
# ./.dart_tool/hooks_runner/shared/pdfium_dart/build/chromium_7811/arm64/libpdfium.so
# ./.dart_tool/hooks_runner/shared/pdfium_dart/build/chromium_7811/x64/libpdfium.so
#
# This file is derived from https://github.com/bblanchon/pdfium-binaries:
# Copyright 2014-2026 Benoit Blanchon, Copyright 2026 Adil Hanney.
# Under the MIT license: https://github.com/bblanchon/pdfium-binaries/blob/master/LICENSE

set -e

export PDFium_BRANCH="chromium/7811"
export PDFium_IS_DEBUG=false
export PDFium_TARGET_OS=android
export PDFium_VERSION="149.0.7811.0"

export PDFium_TARGET_CPU=$1
if [ "$PDFium_TARGET_CPU" != "arm" ] && [ "$PDFium_TARGET_CPU" != "arm64" ] && [ "$PDFium_TARGET_CPU" != "x64" ]; then
  echo "Expected PDFium_TARGET_CPU to be arm/arm64/x64, got: '$PDFium_TARGET_CPU'"
  exit 1
fi

[ -d "submodules/pdfium-binaries" ] || git clone https://github.com/bblanchon/pdfium-binaries.git submodules/pdfium-binaries -b "$PDFium_BRANCH"
pushd submodules/pdfium-binaries/

ENV_FILE=${GITHUB_ENV:-.env}
PATH_FILE=${GITHUB_PATH:-.path}

. steps/00-environment.sh
source "$ENV_FILE"

# Skip `sudo apt-get install unzip`
sed -i 's|sudo |echo SKIPPING ROOT COMMAND: |g' steps/01-install.sh
. steps/01-install.sh
export PATH="$(tr '\n' ':' < "$PATH_FILE")$PATH"

. steps/02-checkout.sh
. steps/03-patch.sh

# These deps are copied from chromium and aren't needed for pdfium, skip them
sed -i 's|  sys.exit(main())|  sys.exit(0)|g' pdfium/build/install-build-deps.py

# Skip tests
truncate -s 0 steps/09-test.sh

# Build pdfium starting from step 4
./build.sh -b "$PDFium_BRANCH" -g 4 "$PDFium_TARGET_OS" "$PDFium_TARGET_CPU"
if [ ! -f "staging/lib/libpdfium.so" ]; then
  echo "Could not find libpdfium.so, did the build fail?"
  find . -name libpdfium.so
  exit 2
fi

popd

TARGET_DIR="./.dart_tool/hooks_runner/shared/pdfium_dart/build/chromium_7811/${PDFium_TARGET_CPU}/"
install -Dm755 "submodules/pdfium-binaries/staging/lib/libpdfium.so" -t "$TARGET_DIR"
