#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# make_install_kit.sh —— 把签名好的 HAP 和安装脚本打成一个自包含目录
#
# 用法:
#   bash toolchain/make_install_kit.sh
#
# 产物: saber-ohos-kit/
#   ├── entry-default-signed.hap
#   ├── install-harmony.sh        (macOS / Linux)
#   ├── install-harmony.bat       (Windows)
#   └── 怎么装.md
#
# 把整个目录拷到你自己电脑上,连上平板,跑 install-harmony.* 即可。
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
KIT="${KIT:-$SABER_OHOS_ROOT/saber-ohos-kit}"
HAP="$SABER_REPO_ROOT/build/ohos/hap/entry-default-signed.hap"

if [ ! -f "$HAP" ]; then
  echo "错误:找不到 $HAP,请先构建" >&2
  echo "  bash $TOOLCHAIN_DIR/saber-harmony.sh build" >&2
  exit 1
fi

echo "==> 准备安装包目录: $KIT"
mkdir -p "$KIT"

echo "==> 复制 HAP"
cp -f "$HAP" "$KIT/entry-default-signed.hap"

echo "==> 复制安装脚本"
cp -f "$DIST_DIR/install-harmony.sh"  "$KIT/"
cp -f "$DIST_DIR/install-harmony.bat" "$KIT/"
chmod +x "$KIT/install-harmony.sh"

echo "==> 写说明"
cat > "$KIT/怎么装.md" <<'EOF'
# Saber 鸿蒙版 · 安装说明

这个目录里有四个文件:

| 文件 | 用途 |
|---|---|
| `entry-default-signed.hap` | 签名好的安装包(约 250MB) |
| `install-harmony.bat` | Windows 双击运行 |
| `install-harmony.sh` | macOS / Linux 运行 |
| `怎么装.md` | 本文件 |

---

## 1. 平板开开发者模式

1. 设置 → 关于平板 → 连点「版本号」7 次 → 输入锁屏密码
2. 设置 → 系统和更新 → 开发人员选项 → 打开 **「USB 调试」**

## 2. 装 hdc(电脑上没有的话)

`hdc` 是鸿蒙设备连接工具:

- 装了 **DevEco Studio** → 自带,脚本会自动找到
- 否则下载「Command Line Tools」,解压后在 `sdk/default/hms/toolchains/hdc`
- Windows 还需要 HarmonyOS USB 驱动(DevEco 安装时一并装)

## 3. 连平板、跑脚本

数据线连上平板,平板弹窗点「允许 USB 安装」。

**Windows** —— 双击 `install-harmony.bat`

**macOS / Linux**:

```bash
cd <这个目录>
bash install-harmony.sh
```

脚本找不到 hdc 时手动指定:

```bash
# macOS / Linux
bash install-harmony.sh --hdc /path/to/hdc
```
```bat
REM Windows
install-harmony.bat --hdc "C:\path\to\hdc.exe"
```

## 4. 装完

脚本会自动启动 Saber,平板上应该就看到界面了。

---

## 出问题怎么办

| 现象 | 原因 | 处理 |
|---|---|---|
| 脚本说找不到设备 | USB 调试没开 / 线只供电 | 换线换口,确认平板点了「允许」 |
| `9568257` / `pkcs7` | 签名不被这台设备信任 | 证书没绑定你这台机器的 UDID,要重新签发 |
| `9568393` 签名证书不匹配 | Profile 与应用包名不一致 | 联系我重新生成 |
| 说已存在同包名 | 装过旧版本 | `hdc uninstall com.sabernotes.saber` 再装 |
| 装上了但打开闪退 | 运行时缺插件 | 抓日志:`hdc shell hilog -x \| grep -iE "saber\|flutter\|dart"` |
EOF

echo
echo "════ 完成 ════"
ls -lh "$KIT" | sed 's/^/  /'
echo
echo "把这个目录整个拷到你自己电脑上就能装。"
du -sh "$KIT" 2>/dev/null | awk '{print "  目录大小: "$1}'
