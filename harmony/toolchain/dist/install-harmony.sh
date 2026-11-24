#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# install-harmony.sh —— 在 macOS / Linux 上把 Saber 装到鸿蒙平板
#
# 用法:
#   bash install-harmony.sh                 # 装 + 启动
#   bash install-harmony.sh --no-start      # 只装
#   bash install-harmony.sh --hdc <路径>     # 指定 hdc,不指定就自动找
# ---------------------------------------------------------------------------
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
HAP="$HERE/entry-default-signed.hap"
BUNDLE="com.sabernotes.saber"
ABILITY="EntryAbility"

START=1
HDC=""
while [ $# -gt 0 ]; do
  case "$1" in
    --no-start) START=0; shift ;;
    --hdc)      HDC="$2"; shift 2 ;;
    -h|--help)  sed -n '2,10p' "$0"; exit 0 ;;
    *)          echo "未知参数: $1"; exit 1 ;;
  esac
done

# ---- 找 hdc -----------------------------------------------------------------
find_hdc() {
  if [ -n "$HDC" ] && [ -x "$HDC" ]; then echo "$HDC"; return; fi
  if command -v hdc > /dev/null 2>&1; then command -v hdc; return; fi

  # DevEco Studio 的常见安装位置
  for p in \
    "$HOME/Library/Huawei/Sdk" \
    "$HOME/Library/Huawei/sdk" \
    "/Applications/DevEco-Studio.app/Contents/sdk" \
    "$HOME/DevEcoStudio/sdk" \
    "$HOME/Huawei/Sdk" \
    "$HOME/harmonyos-sdk"
  do
    [ -d "$p" ] || continue
    found=$(find "$p" -name hdc -type f -perm -u+x 2>/dev/null | head -1)
    if [ -n "$found" ]; then echo "$found"; return; fi
  done

  # 命令行工具解压目录
  for p in "$HOME"/command-line-tools* "$HERE"/command-line-tools*; do
    [ -d "$p" ] || continue
    found=$(find "$p" -name hdc -type f -perm -u+x 2>/dev/null | head -1)
    if [ -n "$found" ]; then echo "$found"; return; fi
  done

  return 1
}

if ! HDC=$(find_hdc); then
  cat >&2 <<'EOF'
✗ 找不到 hdc。

装一个就行:
  * 已装 DevEco Studio → 它自带 hdc
  * 或者用 --hdc <路径> 手动指定,例如:
      bash install-harmony.sh --hdc ~/command-line-tools/sdk/default/hms/toolchains/hdc
EOF
  exit 1
fi

echo "==> hdc: $HDC"

# ---- 检查安装包 -------------------------------------------------------------
if [ ! -f "$HAP" ]; then
  echo "✗ 找不到 $HAP" >&2
  echo "  请确保 entry-default-signed.hap 和本脚本在同一个目录" >&2
  exit 1
fi
echo "==> 安装包: $(ls -lh "$HAP" | awk '{print $5}')"

# ---- 检查设备 ---------------------------------------------------------------
echo
echo "==> 检查设备"
TARGETS=$("$HDC" list targets 2>&1 || true)
echo "$TARGETS"
if ! echo "$TARGETS" | grep -qE "^\s*[0-9A-Za-z]{8,}"; then
  cat >&2 <<'EOF'

✗ 没检测到设备。检查:
  1) 平板:设置 → 关于平板 → 连点「版本号」7 次开开发者模式
  2) 设置 → 系统和更新 → 开发人员选项 → 打开「USB 调试」
  3) 数据线连接(要能传数据的线,不是只充电的)
  4) 平板弹窗点「允许 USB 安装」
EOF
  exit 1
fi

# ---- 安装 -------------------------------------------------------------------
echo
echo "==> 安装到平板(246MB,要等一会儿)"
set +e
OUT=$("$HDC" install -r "$HAP" 2>&1)
RC=$?
set -e
echo "$OUT"

# hdc 出错时退出码可能仍是 0,所以两样都判断
if [ "$RC" -ne 0 ] || echo "$OUT" | grep -qiE "fail|error|失败"; then
  echo
  echo "✗ 安装失败。常见原因:" >&2
  if echo "$OUT" | grep -q "9568257\|pkcs7"; then
    echo "  签名不被设备信任。这个 HAP 的证书可能没绑定你这台设备。" >&2
  elif echo "$OUT" | grep -q "9568393"; then
    echo "  Profile 和设备不匹配 —— 需要重新生成绑定 UDID 的 Profile。" >&2
  elif echo "$OUT" | grep -qi "already exist\|已存在"; then
    echo "  已装过同包名应用。先卸载:" >&2
    echo "    $HDC uninstall com.sabernotes.saber" >&2
  else
    echo "  把上面的原始输出发我看。" >&2
  fi
  exit 1
fi

echo "==> 安装成功"

# ---- 启动 -------------------------------------------------------------------
if [ "$START" -eq 0 ]; then
  echo "==> (未启动)"
  exit 0
fi

echo
echo "==> 启动 Saber"
"$HDC" shell aa start -a "$ABILITY" -b "$BUNDLE" || {
  echo "⚠️ 启动命令失败,可以手动在平板桌面上点图标打开" >&2
}

echo
echo "════════════════════════════"
echo " 完成。平板上应该能看到 Saber 了。"
echo "════════════════════════════"
echo
echo "如果打开后闪退,把日志发我:"
echo "  $HDC shell hilog -x | grep -iE 'saber|flutter|dart'"
