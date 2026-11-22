#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# env.sh —— Saber 鸿蒙(HarmonyOS NEXT)构建环境变量
#
# 用法:
#   source toolchain/ohos/env.sh
#
# 路径全部可覆盖;不设置时按下面的默认布局推导:
#
#   <SABER_OHOS_ROOT>/
#   ├── flutter/                         Flutter-OH SDK
#   ├── ohos-sdk-root/ohos-sdk/          OpenHarmony SDK
#   ├── deveco-tools/command-line-tools/ DevEco 命令行工具(ohpm / hvigor / SDK)
#   └── saber/                           本仓库
#
# SABER_OHOS_ROOT 默认取「仓库的上一级目录」。
# ---------------------------------------------------------------------------

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

export SABER_OHOS_ROOT

# --- Flutter-OH SDK (tag 3.47.9-ohos-1.0.0) ------------------------------
export FLUTTER_ROOT
export PATH="$FLUTTER_ROOT/bin:$PATH"

# --- OpenHarmony SDK ------------------------------------------------------
# 布局: <OHOS_SDK_HOME>/18/{ets,js,native,previewer,toolchains}
export OHOS_SDK_HOME
export OHOS_HOME="$OHOS_SDK_HOME"
export HOS_SDK_HOME="$OHOS_SDK_HOME"
export OHOS_API_DIR

# --- DevEco 命令行工具 (ohpm 6.0.1 / hvigor 6.21.1) -----------------------
export DEVECO_TOOLS
export DEVECO_NODE_HOME="$DEVECO_TOOLS/tool/node"
export PATH="$DEVECO_TOOLS/bin:$DEVECO_TOOLS/tool/node/bin:$PATH"

# --- 原生工具链 (llvm / clang for ohos targets) + hdc ---------------------
export OHOS_NDK_HOME="$OHOS_API_DIR/native"
export PATH="$OHOS_API_DIR/native/llvm/bin:$OHOS_API_DIR/toolchains:$PATH"

# --- Flutter 配置 ---------------------------------------------------------
# Flutter 引擎产物(artifacts)走国内镜像。
export FLUTTER_STORAGE_BASE_URL="${FLUTTER_STORAGE_BASE_URL:-https://storage.flutter-io.cn}"

# pub 包走 pub.dev 官方源,**不要**改成 pub.flutter-io.cn。
#
# 原因:镜像的 API 元数据里 archive_url 指向
#   storage.flutter-io.cn/dartlang-pub-public-packages/packages/<pkg>.tar.gz
# 而当前 pub 客户端不认 archive_url、自己按上面那个模板拼地址;那个路径现在
# 对所有包都返回一个几百字节的错误页,于是 pub 会报
#   "Downloaded archive for <pkg> had wrong content-hash"
# 直接解析失败。走 pub.dev 则一切正常(实测 0.2s 内返回)。
#
# 另外,仓库里的 pubspec.lock 记的就是 pub.dev 的 URL,保持一致才能复用锁文件、
# 避免每次构建都重新解析升级一整棵依赖树(那会连带把 patches/ohos 里针对
# 特定版本做的补丁全部作废)。
export PUB_HOSTED_URL="${PUB_HOSTED_URL:-https://pub.dev}"
export FLUTTER_SUPPRESS_ANALYTICS=true
export LANG=C.UTF-8

export PUB_CACHE
