#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# saber-harmony.sh —— Saber 鸿蒙版一键流程
#
#   ./saber-harmony.sh setup      准备构建环境(已就绪则跳过)
#   ./saber-harmony.sh build      构建签名 HAP
#   ./saber-harmony.sh sign       申请 AGC 调试证书+Profile 并重新构建
#   ./saber-harmony.sh install    安装到平板并启动
#   ./saber-harmony.sh device     平板连接体检
#   ./saber-harmony.sh all        sign + install 全流程
#
# sign 命令需要 AGC 凭据:
#   ./saber-harmony.sh sign --creds <凭据文件> [--project-id <id>] [--udid <udid>]
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
ROOT="$SABER_OHOS_ROOT"
TOOLCHAIN="$TOOLCHAIN_DIR"
SABER="$SABER_REPO_ROOT"
export ROOT

# 自动加载构建环境(FLUTTER_ROOT / OHOS_SDK_HOME 等)
if [ -f "$TOOLCHAIN/env.sh" ]; then
  # shellcheck disable=SC1091
  source "$TOOLCHAIN/env.sh"
fi

cmd="${1:-help}"
shift || true

case "$cmd" in
  setup)
    echo "==> 检查构建环境"
    [ -d "$ROOT/flutter" ] && echo "    ✓ Flutter-OH SDK" || echo "    ✗ 缺 Flutter SDK"
    [ -d "$ROOT/deveco-tools" ] && echo "    ✓ DevEco 工具链" || echo "    ✗ 缺 DevEco 工具链"

    # 固定 Flutter 认到的 HarmonyOS SDK 路径,避免受环境变量优先级影响。
    # (不设的话 `flutter pub get` 会打印 "No Hmos SDK found" 的告警;
    #  那是无害噪音 —— 构建本身能找到 SDK,产物不受影响。)
    flutter config --ohos-sdk="$ROOT/deveco-tools/command-line-tools/sdk" \
      > /dev/null 2>&1 || true
    echo "    ✓ flutter config --ohos-sdk 已固定"

    [ -x "$TOOLCHAIN/agc-cli/node_modules/.bin/agc" ] \
      && echo "    ✓ AGC CLI" \
      || { echo "    → 安装 AGC CLI"; bash "$TOOLCHAIN/install_agc_cli.sh"; }
    echo
    echo "环境就绪。构建:bash $SABER/harmony/scripts/build_ohos.sh"
    ;;

  build)
    bash "$SABER/harmony/scripts/build_ohos.sh"
    ;;

  sign)
    CREDS=""
    ARGS=()
    while [ $# -gt 0 ]; do
      case "$1" in
        --creds)       CREDS="$2"; shift 2 ;;
        --credentials) CREDS="$2"; shift 2 ;;
        *)             ARGS+=("$1"); shift ;;
      esac
    done
    if [ -z "$CREDS" ]; then
      echo "用法:./saber-harmony.sh sign --creds <凭据文件> [其它选项]" >&2
      echo "  凭据获取:AGC → 用户和权限 → API 密钥 → Connect API → Service Account" >&2
      exit 1
    fi
    bash "$TOOLCHAIN/agc_provision.sh" "$CREDS" "${ARGS[@]}"
    ;;

  install)
    bash "$TOOLCHAIN/install_on_device.sh"
    ;;

  device)
    bash "$TOOLCHAIN/device.sh" "${@:-check}"
    ;;

  all)
    bash "$TOOLCHAIN/install_on_device.sh"
    ;;

  help|*)
    sed -n '2,18p' "$0"
    ;;
esac
