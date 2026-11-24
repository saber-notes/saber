#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# install_host_strip.sh
#
# Toolchain-side fix (lives in harmony/toolchain/, not part of the app itself).
#
# Problem
# -------
# The DevEco SDK ships the *cross* LLVM toolchain under
#
#     sdk/default/openharmony/native/llvm/bin/llvm-strip
#
# whose binaries are built for **aarch64** (e_machine = 0xB7). Running them on
# an x86-64 build host does not work -- /bin/sh falls back to interpreting the
# ELF image as a shell script and dies with
#
#     llvm-strip: 1: Syntax error: ")" unexpected
#
# hvigor's `DoNativeStrip` task then fails and the build aborts.
#
# Fix
# ---
# Point the SDK's llvm-strip / llvm-objcopy at the *host* LLVM, which is
# architecture-agnostic (LLVM can strip aarch64 objects from an x86-64 host).
#
# The host toolchain is preferred, because it also matches the SDK's own
# x86-64 `es2abc` / `ark_disasm` / `restool` binaries that we already use.
#
# Usage
# -----
#   ./install_host_strip.sh [--host-llvm <dir>]
#   default host llvm: /usr/lib/llvm-18/bin  (auto-detected)
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
ROOT="$SABER_OHOS_ROOT"
SDK="$ROOT/deveco-tools/command-line-tools/sdk/default"

HOST_LLVM=""
while [ $# -gt 0 ]; do
  case "$1" in
    --host-llvm) HOST_LLVM="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

# --- auto-detect a host (x86-64) llvm ---------------------------------------
if [ -z "$HOST_LLVM" ]; then
  for c in /usr/lib/llvm-*/bin /usr/local/llvm*/bin /usr/bin; do
    [ -x "$c/llvm-strip" ] || continue
    m=$(od -An -tx1 -j18 -N2 "$(readlink -f "$c/llvm-strip")" 2>/dev/null | tr -d ' \n')
    if [ "$m" = "3e00" ]; then HOST_LLVM="$c"; break; fi
  done
fi

if [ -z "$HOST_LLVM" ] || [ ! -x "$HOST_LLVM/llvm-strip" ]; then
  echo "ERROR: no host (x86-64) llvm-strip found." >&2
  echo "       install it, e.g.:  apt-get install -y llvm-18" >&2
  echo "       or pass --host-llvm <dir>" >&2
  exit 1
fi

echo "==> host llvm : $HOST_LLVM"

# --- replace the aarch64 cross tools with the host ones --------------------
# llvm-strip is a symlink to llvm-objcopy; replace both so the link stays
# intact inside the SDK tree.
changed=0
for tree in openharmony hms; do
  bin="$SDK/$tree/native/llvm/bin"
  [ -d "$bin" ] || continue
  for tool in llvm-strip llvm-objcopy; do
    tgt="$bin/$tool"
    [ -e "$tgt" ] || continue
    # keep the SDK copy around, it is the aarch64 cross toolchain
    if [ ! -e "$bin/$tool.ohos-aarch64" ]; then
      mv "$tgt" "$bin/$tool.ohos-aarch64"
    fi
    cp -f "$HOST_LLVM/$tool" "$bin/$tool" 2>/dev/null || {
      # llvm-strip is often a symlink -> copy the resolved binary instead
      cp -fL "$HOST_LLVM/$tool" "$bin/$tool"
    }
    chmod u+x "$bin/$tool"
    echo "    $tree: $tool -> $(readlink -f "$bin/$tool")"
    changed=$((changed+1))
  done
done

echo "==> $changed tool(s) installed"
