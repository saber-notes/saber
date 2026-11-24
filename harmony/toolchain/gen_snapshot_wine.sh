#!/usr/bin/env bash
# 用 Wine 运行 Windows 版 gen_snapshot(鸿蒙 AOT 交叉编译器)。
#
# 背景:Flutter-OH fork 从未发布过 Linux 主机的 gen_snapshot,
# 而旧版 OBS 上的 linux-x64 版本是 kernel 130(Dart 3.12.2),
# 与本工具链的 kernel 138 不兼容,报
#   "Invalid kernel binary format version (expected 130, found 138)"。
#
# 3.47.4-ohos-1.0.4 提供了 Windows 版(kernel 138),用 Wine 就能在 Linux 上跑。
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
# exe 可能在同目录(装到 flutter cache 时),也可能在 ohos-aot-win/ 下
if [ -f "$HERE/gen_snapshot.exe" ]; then
  EXE="$HERE/gen_snapshot.exe"
elif [ -f "$HERE/ohos-aot-win/gen_snapshot.exe" ]; then
  EXE="$HERE/ohos-aot-win/gen_snapshot.exe"
else
  EXE="$HERE/gen_snapshot.exe"
fi
WINE="${WINE_BIN:-/usr/lib/wine/wine64}"

if [ ! -x "$WINE" ]; then
  echo "错误:找不到 wine64 ($WINE)" >&2
  echo "  安装:apt-get install -y --no-install-recommends wine64" >&2
  exit 1
fi
if [ ! -f "$EXE" ]; then
  echo "错误:找不到 $EXE" >&2
  exit 1
fi

export WINEDEBUG="${WINEDEBUG:--all}"
exec "$WINE" "$EXE" "$@"
