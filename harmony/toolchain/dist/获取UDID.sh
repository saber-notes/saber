#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# 获取UDID.sh —— 在鸿蒙 PC(macOS/Linux 同理)上自动找设备 UDID
#
# 用法:
#   bash 获取UDID.sh
#
# 它会依次尝试:
#   A. PATH 里的 hdc
#   B. DevEco Studio 自带的 hdc(几个常见安装位置)
#   C. 直接调 bm(不经过 hdc)
#   D. 无线调试连本机
#
# 找到就打印出来。全失败会告诉你怎么走下一步。
# ---------------------------------------------------------------------------
set -uo pipefail

FOUND=""

report() {
  echo
  echo "════════════════════════════════════════"
  echo " UDID: $1"
  echo "════════════════════════════════════════"
  echo
  echo "把这串发给对方即可。"
  FOUND="$1"
}

try_udid() {
  # $1 = 命令前缀(数组形式不好传,直接用字符串 eval)
  local cmd="$1"
  local out
  out=$(eval "$cmd" 2>&1) || return 1
  local udid
  udid=$(echo "$out" | tr -d '\r' | grep -oE '[0-9A-Fa-f]{32,}' | head -1)
  if [ -n "$udid" ]; then
    report "$udid"
    return 0
  fi
  return 1
}

echo "==> 1. 找 hdc"

HDC=""
if command -v hdc > /dev/null 2>&1; then
  HDC=$(command -v hdc)
  echo "    PATH 里找到: $HDC"
else
  # DevEco Studio 的常见位置
  for cand in \
    "$HOME/Library/Huawei/Sdk" \
    "$HOME/Library/Huawei/sdk" \
    "/Applications/DevEco-Studio.app/Contents/sdk" \
    "$HOME/DevEcoStudio/sdk" \
    "$HOME/Huawei/Sdk" \
    "$HOME/command-line-tools" \
    "/opt/DevEco-Studio/sdk" \
    "/opt/deveco/sdk"
  do
    [ -d "$cand" ] || continue
    f=$(find "$cand" -name hdc -type f 2>/dev/null | head -1)
    if [ -n "$f" ]; then
      chmod +x "$f" 2>/dev/null || true
      HDC="$f"
      echo "    在 $cand 找到: $HDC"
      break
    fi
  done
fi

if [ -z "$HDC" ]; then
  echo "    ✗ 没找到 hdc"
else
  echo
  echo "==> 2. 看 hdc 能连到哪些设备"
  "$HDC" list targets -v 2>&1 | sed 's/^/    /'
  echo
  echo "==> 3. 用 hdc 读 UDID"
  if try_udid "$HDC shell bm get --udid"; then exit 0; fi
  echo "    (上面这条不通,继续试别的)"

  # 列出目标后再指定 -t
  TARGETS=$("$HDC" list targets 2>/dev/null | tr -d '\r' | grep -vE '^\s*$|\[Empty\]' | head -3)
  if [ -n "$TARGETS" ]; then
    echo
    echo "==> 3b. 指定目标再读"
    while IFS= read -r t; do
      [ -z "$t" ] && continue
      echo "    试 target: $t"
      if try_udid "$HDC -t $t shell bm get --udid"; then exit 0; fi
    done <<< "$TARGETS"
  fi
fi

echo
echo "==> 4. 不经过 hdc,直接调 bm"
if command -v bm > /dev/null 2>&1; then
  if try_udid "bm get --udid"; then exit 0; fi
  echo "    bm 存在但读不到(可能权限不够)"
else
  echo "    本机没有 bm 命令"
fi

# 也试试系统里的绝对路径
for p in /system/bin/bm /usr/bin/bm /vendor/bin/bm; do
  if [ -x "$p" ]; then
    echo "    试 $p"
    if try_udid "$p get --udid"; then exit 0; fi
  fi
done

echo
echo "==> 5. 无线调试(需要先在平板上开「无线调试」)"
echo "    如果你知道平板的 IP,可以:"
echo "      hdc tconn <平板IP>:5555"
echo "      hdc shell bm get --udid"
echo "    (脚本不自动扫网段,避免乱扫)"

[ -n "$FOUND" ] && exit 0

cat <<'EOF'

════════════════════════════════════════════════════════
自动尝试都失败了。说明在这台鸿蒙 PC 上读不到自己的 UDID
(系统限制,很多人反馈过)。

四条退路,按省事程度排序:

【1】用 DevEco Studio 的「自动签名」—— 最省事,可能根本不用抄 UDID
     DevEco → 文件 → 项目结构 → Signing Configs → 勾「自动签名」
     → 登录华为账号 → 它会自动把本机注册进 AGC 并生成三件套
     然后把这三个文件发我:.p12 / .cer / .p7b
     (它们一般在 ~/.ohos/config/ 下)

【2】拿另一台电脑(Windows/Mac)USB 连平板
     平板开 USB 调试 → 连电脑 → 跑:
       hdc shell bm get --udid
     这是官方文档给的标准做法,最稳

【3】把平板当普通平板(不是 PC 模式),插到任意电脑上

【4】开无线调试
     平板:开发者选项 → 无线调试 → 记下 IP 和端口
     任意电脑:hdc tconn <IP>:<端口> 然后 hdc shell bm get --udid
════════════════════════════════════════════════════════
EOF
exit 1
