#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# common.sh —— 鸿蒙工具链的公共路径解析
#
# 所有 toolchain/ohos/ 下的脚本都 source 这个文件,保证:
#   * 脚本可以放在仓库里的任何位置;
#   * 换一台机器 / 换一个目录布局,只要设置 SABER_OHOS_ROOT 就能跑。
#
# 目录约定(默认):
#
#   <SABER_OHOS_ROOT>/                 工作区根目录
#   ├── flutter/                       Flutter-OH SDK
#   ├── ohos-sdk-root/ohos-sdk/        OpenHarmony SDK
#   ├── deveco-tools/command-line-tools/  DevEco 命令行工具(ohpm / hvigor / SDK)
#   └── saber/                         本仓库(toolchain/ohos/ 在它下面)
#
# 覆盖方式(按优先级):
#   SABER_OHOS_ROOT   工作区根目录
#   SABER_REPO_ROOT   本仓库根目录
#   FLUTTER_ROOT / DEVECO_TOOLS / OHOS_SDK_HOME / PUB_CACHE ...
# ---------------------------------------------------------------------------

# --- 本脚本所在目录 -------------------------------------------------------
COMMON_SH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- 仓库根目录 -----------------------------------------------------------
# toolchain/ohos/common.sh  ->  toolchain/ohos  ->  toolchain  ->  <repo>
SABER_REPO_ROOT="${SABER_REPO_ROOT:-$(cd "$COMMON_SH_DIR/../.." && pwd)}"

# --- 工作区根目录 ---------------------------------------------------------
SABER_OHOS_ROOT="${SABER_OHOS_ROOT:-$(cd "$SABER_REPO_ROOT/.." && pwd)}"

# --- 各组件 ---------------------------------------------------------------
FLUTTER_ROOT="${FLUTTER_ROOT:-$SABER_OHOS_ROOT/flutter}"
DEVECO_TOOLS="${DEVECO_TOOLS:-$SABER_OHOS_ROOT/deveco-tools/command-line-tools}"

# DEVECO_SDK_HOME 是 Flutter-OH 认的「HarmonyOS SDK 根」,它按
# `sdk/<sdk-pkg.json 里 apiVersion 对应的目录名>` 去定位真正的 SDK。
# 本机布局是 sdk/default(sdk-pkg.json 里 apiVersion=21),所以:
#
#   DEVECO_SDK_HOME = <tools>/sdk          <- 给 flutter 用(必须是这一层)
#   DEVECO_SDK_ROOT = <tools>/sdk/default  <- 真正放 openharmony/ 与 hms/ 的一层
#
# 工具脚本要访问 openharmony/toolchains/lib/hap-sign-tool.jar 这类路径时
# 必须用 DEVECO_SDK_ROOT,用 DEVECO_SDK_HOME 会找不到。
DEVECO_SDK_HOME="${DEVECO_SDK_HOME:-$DEVECO_TOOLS/sdk}"
DEVECO_SDK_ROOT="${DEVECO_SDK_ROOT:-$DEVECO_TOOLS/sdk/default}"

OHOS_SDK_HOME="${OHOS_SDK_HOME:-$SABER_OHOS_ROOT/ohos-sdk-root/ohos-sdk}"
OHOS_API_DIR="${OHOS_API_DIR:-$OHOS_SDK_HOME/18}"
PUB_CACHE="${PUB_CACHE:-$SABER_OHOS_ROOT/.pub-cache}"

# 工具链自身(本目录)
TOOLCHAIN_DIR="${TOOLCHAIN_DIR:-$COMMON_SH_DIR}"

# Saber 工程里的固定位置
SIGN_DIR="${SIGN_DIR:-$SABER_REPO_ROOT/ohos/signing}"
OHOS_PROJECT_DIR="${OHOS_PROJECT_DIR:-$SABER_REPO_ROOT/ohos}"
BUILD_PROFILE="${BUILD_PROFILE:-$SABER_REPO_ROOT/ohos/build-profile.json5}"
APP_JSON5="${APP_JSON5:-$SABER_REPO_ROOT/ohos/AppScope/app.json5}"

# 打包给终端用户用的安装脚本
DIST_DIR="${DIST_DIR:-$TOOLCHAIN_DIR/dist}"

export SABER_REPO_ROOT SABER_OHOS_ROOT FLUTTER_ROOT DEVECO_TOOLS DEVECO_SDK_HOME \
       DEVECO_SDK_ROOT OHOS_SDK_HOME OHOS_API_DIR PUB_CACHE TOOLCHAIN_DIR

# --- 小工具 ---------------------------------------------------------------
say() { echo; echo "==> $*"; }
die() { echo "错误: $*" >&2; exit 1; }

# 检查某个必需的文件/目录是否存在,不存在就给出可操作的提示
require_path() {
  local p="$1" what="${2:-路径}" hint="${3:-}"
  if [ ! -e "$p" ]; then
    echo "错误:找不到 $what: $p" >&2
    [ -n "$hint" ] && echo "  $hint" >&2
    exit 1
  fi
}

# 载入完整构建环境(PATH 里加 flutter / node / llvm / hdc)。
# 可重复调用;env.sh 内部会再 source 一次 common.sh,没有副作用。
load_build_env() {
  if [ -f "$COMMON_SH_DIR/env.sh" ]; then
    # shellcheck disable=SC1091
    source "$COMMON_SH_DIR/env.sh"
  fi
}
