#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# sync_api21_declarations.sh
#
# Toolchain-side fix (lives in harmony/toolchain/, not part of the app itself).
#
# Problem
# -------
# The DevEco SDK tree that we assembled carries the *stale* OpenHarmony 5.1.0
# (API 18) ArkTS declaration files:
#
#   openharmony/ets/api/@ohos.window.d.ts      7642 lines   (API 18)
#   openharmony/ets/component/common.d.ts     27863 lines   (API 18)
#
# The ArkTS compiler type-checks against exactly these files, so every symbol
# introduced after API 18 is reported as "does not exist":
#
#   KeyEvent.isCapsLockOn / isNumLockOn        (API 19)
#   global BusinessError                       (API 19)
#   window.getGlobalWindowMode / GlobalWindowMode
#   Window.enableDrag
#
# Fix
# ---
# Overlay the *official* HarmonyOS 6.0.1 (API 21) declaration set that ships
# with commandline-tools 6.0.1.251:
#
#   openharmony/ets/api        497 files, @ohos.window.d.ts = 9477 lines
#   openharmony/ets/component  123 files, common.d.ts      = 31493 lines
#   openharmony/ets/kits        47 files
#
# The compiler reads the *global* ArkUI scope from
#
#   openharmony/ets/build-tools/ets-loader/declarations/
#
# which is the union of the component trees plus three loader-only files:
#
#   global.d.ts            -> declares the global `console`, `setTimeout`,
#                             `clearTimeout` ... (dropping it breaks EVERY
#                             file that logs or uses a timer)
#   ability_component.d.ts -> loader-internal
#   featureability.d.ts    -> loader-internal
#
# so the refresh must be additive and must never delete those three.
#
# Usage
# -----
#   ./sync_api21_declarations.sh [--src <official-sdk-default-dir>]
#   default src: <repo>/toolchain/official-api21
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
ROOT="$SABER_OHOS_ROOT"
SDK="$DEVECO_SDK_ROOT"
# 默认直接用 DevEco SDK 自带的官方 API-21 声明树(它就在 $SDK/openharmony/ets),
# 不需要在仓库里再放一份拷贝。
SRC="$SDK"
EXTRA="$TOOLCHAIN_DIR/loader-declarations-extra"

while [ $# -gt 0 ]; do
  case "$1" in
    --src) SRC="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

if [ ! -d "$SRC/openharmony/ets/api" ]; then
  echo "ERROR: official API-21 declaration set not found at: $SRC/openharmony/ets/api" >&2
  exit 1
fi

echo "==> source : $SRC"
echo "==> target : $SDK/openharmony/ets"

# --- backup (once) -------------------------------------------------------
BK="$TOOLCHAIN_DIR/backup/sdk-ets-backup"
mkdir -p "$BK"
for d in api component kits; do
  if [ ! -d "$BK/$d" ] && [ -d "$SDK/openharmony/ets/$d" ]; then
    echo "--> backup $d"
    cp -a "$SDK/openharmony/ets/$d" "$BK/$d"
  fi
done

# --- overlay api / component / kits --------------------------------------
for d in api component kits; do
  echo "--> overlay $d"
  DST="$SDK/openharmony/ets/$d"
  rm -rf "$DST"
  cp -a "$SRC/openharmony/ets/$d" "$DST"
done

# --- refresh the loader's global declaration mirror ----------------------
#
# Priority (later wins):
#   1. loader-only files (global.d.ts, ability_component.d.ts,
#      featureability.d.ts)          -- never remove these
#   2. official API-21 component tree -- authoritative, newest
#   3. HMS component tree             -- fills gaps only (location_button.d.ts)
DECL="$SDK/openharmony/ets/build-tools/ets-loader/declarations"

if [ -d "$DECL" ]; then
  echo "--> refresh ets-loader/declarations"

  # (1) restore the loader-only files
  if [ -d "$EXTRA" ]; then
    for f in "$EXTRA"/*.d.ts; do
      [ -e "$f" ] || continue
      cp -f "$f" "$DECL/"
    done
  fi

  # (2) official API-21 component tree wins
  for f in "$SDK/openharmony/ets/component"/*.d.ts; do
    [ -e "$f" ] || continue
    cp -f "$f" "$DECL/"
  done

  # (3) HMS component tree fills the gaps only
  if [ -d "$SDK/hms/ets/component" ]; then
    for f in "$SDK/hms/ets/component"/*.d.ts; do
      [ -e "$f" ] || continue
      base="$(basename "$f")"
      [ -f "$SDK/openharmony/ets/component/$base" ] && continue
      cp -f "$f" "$DECL/"
    done
  fi

  # remove only declarations that vanished from *every* upstream tree
  # (the loader-only files are explicitly protected)
  for f in "$DECL"/*.d.ts; do
    [ -e "$f" ] || continue
    base="$(basename "$f")"
    if [ -f "$EXTRA/$base" ]; then
      continue
    fi
    if [ ! -f "$SDK/openharmony/ets/component/$base" ] \
       && [ ! -f "$SDK/hms/ets/component/$base" ]; then
      rm -f "$f"
    fi
  done
fi

# --- HMS component tree: bring it up to API 21 as well -------------------
# The official HMS ets component ships no component/ directory at all; the one
# we have was seeded from the API-18 tree. Refresh its shared files from the
# official API-21 OpenHarmony tree so both agree on the global scope.
if [ -d "$SDK/hms/ets/component" ]; then
  echo "--> refresh hms/ets/component"
  for f in "$SDK/openharmony/ets/component"/*.d.ts; do
    [ -e "$f" ] || continue
    cp -f "$f" "$SDK/hms/ets/component/"
  done
fi

echo "==> done"
echo "    api files        : $(ls "$SDK/openharmony/ets/api" | wc -l)"
echo "    component files  : $(ls "$SDK/openharmony/ets/component" | wc -l)"
echo "    kits files       : $(ls "$SDK/openharmony/ets/kits" | wc -l)"
echo "    declarations     : $(ls "$DECL"/*.d.ts 2>/dev/null | wc -l)"
echo "    @ohos.window.d.ts: $(wc -l < "$SDK/openharmony/ets/api/@ohos.window.d.ts") lines"
echo "    common.d.ts      : $(wc -l < "$SDK/openharmony/ets/component/common.d.ts") lines"
