#!/bin/bash
#
# Our rust dependencies are hardcoded to use the latest `stable` version
# of Rust. This script patches those dependencies to use the Rust version
# specified in our `rust-toolchain.toml` file.
#
# This script should only be run in CI since it directly edits files in
# the pub cache.
# If you accidentally run this locally, run `flutter pub cache repair`
# to undo the changes.

set -e

RUST_VERSION=$(grep 'channel =' rust-toolchain.toml | cut -d '"' -f2)
if [ -z "$RUST_VERSION" ]; then
  echo "Could not determine Rust version from rust-toolchain.toml"
  exit 1
fi
if ! [[ "$RUST_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid Rust version format: '$RUST_VERSION'"
  exit 1
fi
echo "Found Rust version: '$RUST_VERSION'"
echo

if [ -z "$PUB_CACHE" ]; then
  echo "Warning: PUB_CACHE is not set. Defaulting to \$HOME/.pub-cache"
  echo "Please set PUB_CACHE to silence this warning in the future."
  echo
  PUB_CACHE="$HOME/.pub-cache"
fi

TARGET_FILES=$(find "${PUB_CACHE}/hosted/pub.dev/" -type f -path "*/cargokit/build_tool/lib/src/builder.dart")
if [ -z "$TARGET_FILES" ]; then
  echo "Couldn't find cargokit dependencies. Maybe you haven't run 'flutter pub get' yet?"
  exit 0
fi

for file in $TARGET_FILES; do
  echo "Patching Rust version in $file"
  sed -i "/^  String get _toolchain/ s/=>.*/=> '${RUST_VERSION}';/" "$file"
  # Print the patched line
  grep "^  String get _toolchain" "$file"
done
