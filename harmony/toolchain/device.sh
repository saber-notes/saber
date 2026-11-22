#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# device.sh —— 平板连接与 UDID 获取助手
#
# 用法:
#   bash toolchain/device.sh list              # 列出已连接设备
#   bash toolchain/device.sh udid              # 打印当前设备的 UDID
#   bash toolchain/device.sh tconn <ip:port>   # 无线连接(hdc tconn)
#   bash toolchain/device.sh check             # 全面体检(连接/UDID/开发者模式)
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
SDK="$DEVECO_SDK_ROOT"

if [ -x "$SDK/hms/toolchains/hdc" ]; then
  HDC="$SDK/hms/toolchains/hdc"
elif command -v hdc > /dev/null 2>&1; then
  HDC="$(command -v hdc)"
else
  echo "错误:找不到 hdc,请先 source env.sh" >&2
  exit 1
fi

get_udid() {
  "$HDC" shell bm get --udid 2>/dev/null \
    | tr -d '\r' \
    | grep -oE '[0-9A-Fa-f]{32,}' \
    | head -1
}

case "${1:-check}" in
  list)
    "$HDC" list targets -v
    ;;

  udid)
    U=$(get_udid)
    if [ -z "$U" ]; then
      echo "✗ 拿不到 UDID。请先连接设备" >&2
      exit 1
    fi
    echo "$U"
    ;;

  tconn)
    if [ -z "${2:-}" ]; then
      echo "用法:bash toolchain/device.sh tconn <ip:port>" >&2
      exit 1
    fi
    echo "==> 无线连接 $2"
    "$HDC" tconn "$2"
    echo
    "$HDC" list targets
    ;;

  check)
    echo "==> 已连接设备"
    TARGETS=$("$HDC" list targets 2>&1)
    echo "$TARGETS"
    echo
    if echo "$TARGETS" | grep -q "^\[Empty\]"; then
      echo "✗ 没有设备。三种连接方式任选其一:"
      echo
      echo "  [A] USB(推荐)"
      echo "    1) 平板:设置 → 关于平板 → 连点「版本号」7 次 → 输入锁屏密码"
      echo "    2) 设置 → 系统和更新 → 开发人员选项 → 打开「USB 调试」"
      echo "    3) 数据线连电脑(必须能传数据,有些线只供电)"
      echo "    4) 弹窗里点「允许 USB 安装」"
      echo
      echo "  [B] 无线"
      echo "    平板:开发者选项 → 打开「USB 调试」+「仅充电模式下允许 ADB」"
      echo "    平板上看 IP:设置 → WLAN → 当前网络 → IP 地址"
      echo "    然后:bash toolchain/device.sh tconn <平板IP>:5555"
      echo
      echo "  [C] 你自己电脑上跑(不用连到这台服务器)"
      echo "    hdc shell bm get --udid   # 把输出的 UDID 告诉我即可"
      exit 1
    fi
    echo "==> UDID"
    U=$(get_udid)
    if [ -z "$U" ]; then
      echo "  ✗ 拿不到 UDID(设备可能没开开发者模式)"
      exit 1
    fi
    echo "  $U"
    echo
    echo "==> 设备信息"
    "$HDC" shell param get const.product.name 2>/dev/null | sed 's/^/  型号: /'
    "$HDC" shell param get const.product.software.version 2>/dev/null | sed 's/^/  系统: /'
    "$HDC" shell param get const.ohos.apiversion 2>/dev/null | sed 's/^/  API:  /'
    ;;

  *)
    sed -n '2,12p' "$0"
    ;;
esac
