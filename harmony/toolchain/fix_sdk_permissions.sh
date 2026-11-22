#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# fix_sdk_permissions.sh
#
# Toolchain-side fix (lives in harmony/toolchain/, not part of the app itself).
#
# The SDK archives are extracted with plain `unzip` / `tar`, which does not
# carry the POSIX execute bit. hvigor then fails with
#
#     /bin/sh: 1: .../ets-loader/bin/ark/build/bin/es2abc: Permission denied
#
# Rather than blanket `chmod -R +x` (which would also mark .d.ts / .json /
# .ts payload files executable and is therefore not reproducible), this script
# only restores the execute bit where it actually belongs:
#
#   * ELF binaries      (magic bytes \x7fELF)
#   * scripts with a    (#!...)
#     shebang
#
# Everything else keeps its original 0644 mode.
#
# Usage
# -----
#   ./fix_sdk_permissions.sh [dir ...]
#   default: the DevEco SDK tree + the OpenHarmony SDK tree
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
ROOT="$SABER_OHOS_ROOT"

TARGETS=("$@")
if [ ${#TARGETS[@]} -eq 0 ]; then
  TARGETS=(
    "$ROOT/deveco-tools/command-line-tools/sdk/default"
    "$ROOT/ohos-sdk-root/ohos-sdk/18"
  )
fi

fixed=0
for base in "${TARGETS[@]}"; do
  [ -d "$base" ] || { echo "skip (missing): $base"; continue; }
  echo "--> $base"

  while IFS= read -r -d '' f; do
    # ELF binary?  (read the magic bytes without tripping bash's null-byte
    # warning: `head -c 4` can emit a NUL which $( ) would strip)
    magic=$(head -c 4 "$f" 2>/dev/null | od -An -tx1 2>/dev/null | tr -d ' \n')
    if [ "$magic" = "7f454c46" ]; then
      chmod u+x "$f"; fixed=$((fixed+1)); continue
    fi
    # script with shebang?
    if head -c 2 "$f" 2>/dev/null | grep -q '^#!'; then
      chmod u+x "$f"; fixed=$((fixed+1)); continue
    fi
  done < <(find "$base" -type f ! -perm -u+x -print0 2>/dev/null)
done

echo "==> restored execute bit on $fixed file(s)"
