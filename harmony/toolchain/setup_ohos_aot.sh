#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# setup_ohos_aot.sh —— 在 Linux 主机上打通鸿蒙 release(AOT)构建
#
# 背景(详见 harmony/docs/ohos.md §4.9):
#   Flutter-OH 这个 fork 的 release 构建只发布了 macOS / Windows 主机的
#   AOT 工件,Linux 主机一个都没有。所以默认情况下:
#
#     flutter build hap --release
#     → ERROR: "ohos" is not an allowed value for option "--target-os"
#
# 本脚本分两半:
#
#   A. Linux 专属的三步(本脚本负责)
#      1. 装 Wine
#      2. 下载 Windows 版 gen_snapshot(kernel 138,官方 OBS 上那个 linux-x64
#         的版本是 kernel 130 的老版本)
#      3. 装一个 wine 包装器,让 flutter 把它当 gen_snapshot 用
#
#   B. 三处源码补丁(共用 harmony/toolchain/setup_ohos_aot.py)
#      1. frontend_server 的 --target-os 白名单没有 ohos
#         → 让 flutter_tools 传 'linux'(OHOS 的 Dart 运行时本就是 Linux 系)
#      2. 传 'linux' 会让 Platform.isLinux 变成 AOT 编译期常量 true,
#         框架和插件注册表会把鸿蒙误判成桌面 Linux
#         → 打 FLUTTER_OHOS_AOT_BUILD 开关,强制判定为 ohos
#      3. 插件注册表把 ohos 分支提到最前面
#
#   B 这一半以前在这里用 bash 重写了一遍,和 Python 那份已经漂移
#   (bash 版的补丁锚点对不上现在的 flutter_tools 源码,只是因为早被
#   Python 版打过才没暴露)。现在两边共用同一份实现。
#
# 幂等:可重复执行,已完成的步骤会跳过。
#
# 用法:
#   bash harmony/toolchain/setup_ohos_aot.sh
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
ROOT="$SABER_OHOS_ROOT"
FLUTTER="$FLUTTER_ROOT"
TOOLCHAIN="$TOOLCHAIN_DIR"

GS_DIR="$FLUTTER/bin/cache/artifacts/engine/ohos-arm64-release/linux-x64"
GS_URL="https://atomgit.com/oh-flutter/flutter_flutter/releases/download/3.47.4-ohos-1.0.4/ohos-arm64-release-windows-x64.zip"

say() { echo; echo "==> $*"; }

say "1/4 检查 Wine"
if [ ! -x /usr/lib/wine/wine64 ]; then
  echo "    安装 wine64 ..."
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends wine64
  # 初始化 prefix(首次需要)
  WINEDEBUG=-all /usr/lib/wine/wine64 wineboot --init >/dev/null 2>&1 || true
else
  echo "    已安装"
fi

say "2/4 准备 Windows 版 gen_snapshot(kernel 138)"
mkdir -p "$TOOLCHAIN/ohos-aot-win" "$GS_DIR"
if [ ! -f "$TOOLCHAIN/ohos-aot-win/gen_snapshot.exe" ]; then
  echo "    下载 ..."
  # 注意:atomgit 的 Release 直链必须带 Referer,否则 401
  curl -sL --max-time 300 \
    -H "Referer: https://atomgit.com/oh-flutter/flutter_flutter/releases" \
    -A "Mozilla/5.0 (X11; Linux x86_64)" \
    -o /tmp/ohos-gs-win.zip "$GS_URL"
  unzip -q -o /tmp/ohos-gs-win.zip -d /tmp/ohos-gs-extract
  cp /tmp/ohos-gs-extract/gen_snapshot.exe "$TOOLCHAIN/ohos-aot-win/"
  rm -rf /tmp/ohos-gs-win.zip /tmp/ohos-gs-extract
else
  echo "    已存在"
fi
cp -f "$TOOLCHAIN/ohos-aot-win/gen_snapshot.exe" "$GS_DIR/gen_snapshot.exe"
echo "    版本检查:"
"$TOOLCHAIN/gen_snapshot_wine.sh" --version 2>&1 | sed 's/^/      /'

say "3/4 安装 gen_snapshot 包装器"
cp -f "$TOOLCHAIN/gen_snapshot_wine.sh" "$GS_DIR/gen_snapshot"
chmod +x "$GS_DIR/gen_snapshot"
echo "    $GS_DIR/gen_snapshot"

say "4/4 三处源码补丁(与 Windows 共用 setup_ohos_aot.py)"
python3 "$TOOLCHAIN/setup_ohos_aot.py" --flutter "$FLUTTER"

say "自检"
export WINEDEBUG=-all
echo -n "  gen_snapshot: "
"$GS_DIR/gen_snapshot" --version 2>&1 | head -1
echo -n "  wine:         "
[ -x /usr/lib/wine/wine64 ] && echo ok || echo MISSING

cat <<'EOF'

════════════════════════════════════════
 完成。现在可以构建 release:
     bash harmony/toolchain/saber-harmony.sh build
════════════════════════════════════════
EOF
