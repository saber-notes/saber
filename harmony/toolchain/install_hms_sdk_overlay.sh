#!/usr/bin/env bash
# 按 DevEco 命令行工具包里的真实布局,重装 HarmonyOS / OpenHarmony SDK 组件。
#
# 真实布局(从 commandline-tools-linux-x64-6.0.1.251.zip 里读出来):
#
#   <SDK>/default/sdk-pkg.json                                 ← SDK 描述文件
#   <SDK>/default/hms/<组件>/uni-package.json                  ← HarmonyOS 组件(纯平铺格式)
#   <SDK>/default/openharmony/<组件>/oh-uni-package.json       ← OpenHarmony 组件
#
# hvigor 的 loader 只认这套布局:
#   * 扫描时遇到 default/sdk-pkg.json 就停止下钻,
#     真正的组件由「描述文件 + PlatformSdks」推导出来,
#     位置分别是 default/hms/<组件> 和 default/openharmony/<组件>。
#
# 用法: bash install_hms_sdk_overlay.sh
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
SDK="$DEVECO_SDK_ROOT"
SRC=/tmp/hms_extract2/command-line-tools/sdk/default

[ -d "$SRC" ] || { echo "缺少 $SRC,请先用 fetch_remote_zip.py 下载" >&2; exit 1; }

echo "==> 1) 恢复目录布局"
mkdir -p "$SDK/openharmony"
for c in ets js native previewer toolchains; do
  if [ -d "$SDK/21/$c" ]; then
    rm -rf "$SDK/openharmony/$c"
    mv "$SDK/21/$c" "$SDK/openharmony/$c"
  fi
done
rmdir "$SDK/21" 2>/dev/null || true
# 清掉之前为了试探 loader 建的软链接
for c in ets js native previewer toolchains; do
  if [ -L "$SDK/$c" ]; then rm -f "$SDK/$c"; fi
done

echo "==> 2) 安装官方元数据文件"
cp -f "$SRC/sdk-pkg.json" "$SDK/sdk-pkg.json"
for c in ets native previewer toolchains; do
  [ -f "$SRC/hms/$c/uni-package.json" ] && cp -f "$SRC/hms/$c/uni-package.json" "$SDK/hms/$c/uni-package.json"
done
for c in ets js native previewer toolchains; do
  [ -f "$SRC/openharmony/$c/oh-uni-package.json" ] && cp -f "$SRC/openharmony/$c/oh-uni-package.json" "$SDK/openharmony/$c/oh-uni-package.json"
done

echo "==> 3) 安装 HarmonyOS toolchains 的 lib(含 libimage_transcoder_shared.so 与签名工具)"
mkdir -p "$SDK/hms/toolchains/lib"
if [ -d "$SRC/hms/toolchains/lib" ]; then
  cp -a "$SRC/hms/toolchains/lib/." "$SDK/hms/toolchains/lib/"
fi

echo "==> 4) 安装 OpenHarmony toolchains(官方 x86-64 主机工具)"
if [ -d "$SRC/openharmony/toolchains" ]; then
  cp -a "$SRC/openharmony/toolchains/." "$SDK/openharmony/toolchains/"
fi

echo "==> 5) 校验"
ls -la "$SDK" | sed 's/^/    /'
ls "$SDK/hms/toolchains/lib" 2>/dev/null | sed 's/^/    lib: /'
echo "==> 完成"
