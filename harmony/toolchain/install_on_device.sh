#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# 把已构建的 HAP 安装到通过 hdc 连接的鸿蒙设备,并启动 Saber。
#
# 用法:
#   bash toolchain/install_on_device.sh            # 安装 + 启动
#   bash toolchain/install_on_device.sh --no-start # 只安装
#
# 前置条件:
#   * 平板已开启「开发者选项 → USB 调试」,并用「允许 USB 安装」授权;
#   * 已 source 过 env.sh(提供 DEVECO_SDK_HOME / HDC);
#   * HAP 已经构建出来(saber/build/ohos/hap/entry-default-signed.hap)。
#
# 说明:
#   HarmonyOS NEXT 真机只认华为开发者账号签发的材料,当前工程里用的是
#   OpenHarmony 官方调试证书,真机会拒绝安装(签名校验不通过)。
#   拿到 AGC 的正式签名材料后,本脚本可以直接用。
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
SDK="$DEVECO_SDK_ROOT"
HAP="$SABER_REPO_ROOT/build/ohos/hap/entry-default-signed.hap"
BUNDLE="com.sabernotes.saber"
ABILITY="EntryAbility"

START=1
for arg in "$@"; do
  case "$arg" in
    --no-start) START=0 ;;
    *) echo "未知参数: $arg"; exit 1 ;;
  esac
done

# hdc 在 HMS SDK 里,优先用它(支持更多设备类型)
if [ -x "$SDK/hms/toolchains/hdc" ]; then
  HDC="$SDK/hms/toolchains/hdc"
elif command -v hdc > /dev/null 2>&1; then
  HDC="$(command -v hdc)"
else
  echo "错误:找不到 hdc,请先 source env.sh" >&2
  exit 1
fi

if [ ! -f "$HAP" ]; then
  echo "错误:找不到 $HAP,请先执行 flutter build hap --debug" >&2
  exit 1
fi

echo "==> 1/4 列出已连接设备"
TARGETS=$("$HDC" list targets 2>&1)
echo "$TARGETS"

# hdc 失败时退出码可能仍是 0,所以文本也要判断
if [ -z "$(echo "$TARGETS" | tr -d '[:space:]')" ] || \
   echo "$TARGETS" | grep -q "^\[Empty\]"; then
  echo
  echo "✗ 没有检测到设备。检查:"
  echo "  1) 平板:设置 → 关于平板 → 连点版本号开启开发者选项"
  echo "  2) 设置 → 系统和更新 → 开发人员选项 → 打开「USB 调试」"
  echo "  3) 用数据线连电脑,弹窗里点「允许 USB 安装」"
  echo "  4) 换个 USB 口/线(有些线只供电不传数据)"
  exit 1
fi

echo
echo "==> 2/4 安装 HAP"
set +e
INSTALL_OUT=$("$HDC" install -r "$HAP" 2>&1)
INSTALL_RC=$?
set -e
echo "$INSTALL_OUT"

# hdc 出错时退出码可能仍是 0,所以两个都要判断
if [ "$INSTALL_RC" -ne 0 ] || echo "$INSTALL_OUT" | grep -q "^\[Fail\]\|error:"; then
  echo
  echo "✗ 安装失败。按错误信息排查:"
  echo
  if echo "$INSTALL_OUT" | grep -q "9568257\|fail to verify pkcs7"; then
    echo "  [pkcs7 校验失败]"
    echo "    设备不信任当前签名材料的根证书。"
    echo "    常见原因:HarmonyOS NEXT 真机只认华为开发者账号签发的证书,"
    echo "    而工程里现在用的是 OpenHarmony 官方调试证书。"
    echo "    → 见 docs/ohos.md §4「装到 HarmonyOS NEXT 真机」"
  elif echo "$INSTALL_OUT" | grep -q "9568393\|签名证书不匹配\|signature.*mismatch"; then
    echo "  [签名/包名不匹配]"
    echo "    profile 里的 bundle-name 与应用实际包名不一致。"
    echo "    三处必须相同:AGC 应用包名 / AppScope/app.json5 / .p7b 的 bundle-name"
  else
    echo "  [其它错误] 把上面的原始输出贴出来分析。"
  fi
  echo
  echo "  调试日志: $HDC shell hilog -x | grep -i install"
  exit 1
fi

if [ "$START" -eq 0 ]; then
  echo
  echo "==> 安装完成(未启动)"
  exit 0
fi

echo
echo "==> 3/4 启动 $BUNDLE / $ABILITY"
"$HDC" shell aa start -a "$ABILITY" -b "$BUNDLE"

echo
echo "==> 4/4 查看日志(实时,Ctrl-C 退出)"
echo "    如应用崩溃,日志里会有 Dart 异常栈。"
"$HDC" shell hilog -x || true
