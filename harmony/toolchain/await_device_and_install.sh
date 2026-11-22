#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# 等设备的 hdc 恢复,然后把最新的 HAP 装上去。
#
# 用法:
#   bash harmony/toolchain/await_device_and_install.sh [轮询间隔秒] [最长等待秒]
#   SABER_DEVICE=192.168.1.40:45059 bash harmony/toolchain/await_device_and_install.sh
#
# 背景:
#   debug 包的 HAP 有 266MB,无线(hdc over easytier)传一次要十几分钟,
#   而 HarmonyOS 的「无线调试」端口在设备息屏/重启后会失效。手动守着
#   等设备上线很费 token,所以这里后台轮询,一连上就自动装。
#
# 装完会打印关键信息:
#   * 安装是否成功
#   * 已安装包里 module.json 里有没有 entity.system.browsable
#     (有 = 新包真的装上了,url_launcher 的补丁生效)
# ---------------------------------------------------------------------------
set -uo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

# hdc 在 HMS SDK 里优先(支持的设备类型更多),否则用 PATH 上的
if [ -x "${DEVECO_TOOLS}/sdk/default/hms/toolchains/hdc" ]; then
  HDC="${DEVECO_TOOLS}/sdk/default/hms/toolchains/hdc"
elif command -v hdc > /dev/null 2>&1; then
  HDC="$(command -v hdc)"
else
  echo "错误:找不到 hdc" >&2
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
HAP="$REPO_ROOT/build/ohos/hap/entry-default-signed.hap"
BUNDLE="com.sabernotes.saber"
TARGET="${SABER_DEVICE:-<device-ip>:<wireless-debug-port>}"

INTERVAL="${1:-30}"
MAX_WAIT="${2:-7200}"
HAP_SIZE=$(du -m "$HAP" 2>/dev/null | cut -f1)

echo "==> 等待设备 $TARGET (最长 ${MAX_WAIT}s,每 ${INTERVAL}s 探一次)"
echo "    HAP: $HAP (${HAP_SIZE}MB)"

waited=0
while [ "$waited" -lt "$MAX_WAIT" ]; do
  "$HDC" tconn "$TARGET" >/dev/null 2>&1
  if "$HDC" list targets 2>/dev/null | grep -q "$TARGET"; then
    if "$HDC" shell "echo alive" 2>/dev/null | grep -q alive; then
      echo "==> 设备已上线 (等待了 ${waited}s),开始安装"
      break
    fi
  fi
  waited=$((waited + INTERVAL))
  [ $((waited % 300)) -eq 0 ] && echo "    ... 已等待 ${waited}s"
  sleep "$INTERVAL"
done

if [ "$waited" -ge "$MAX_WAIT" ]; then
  echo "==> 超时:设备仍未上线"
  exit 2
fi

echo "==> 安装中(266MB 走无线,可能要十几到几十分钟)..."
"$HDC" install -r "$HAP" 2>&1
rc=$?
echo "==> hdc install 退出码: $rc"

echo "==> 校验:已安装包里有没有 entity.system.browsable"
"$HDC" shell "grep -c browsable /data/app/el2/100/base/$BUNDLE/haps/entry/module.json 2>/dev/null" 2>/dev/null

echo "==> 完成,设备上的应用:"
"$HDC" shell "aa start -a EntryAbility -b $BUNDLE" 2>&1 | head -3
