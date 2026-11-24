#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# install_agc_cli.sh —— 安装 AGC 命令行工具(@byterm/agc-cli)
#
# 这个 CLI 封装了华为 AppGallery Connect 的 Provisioning API,
# 让我们可以**用脚本**申请调试证书和 Profile,而不必手点网页。
#
# 需要 Node.js >= 18(本机是 v22)。
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
DEST="$TOOLCHAIN_DIR/agc-cli"

echo "==> 安装 @byterm/agc-cli 到 $DEST"
mkdir -p "$DEST"

if [ -x "$DEST/node_modules/.bin/agc" ]; then
  echo "    已安装,跳过"
else
  cat > "$DEST/package.json" <<'EOF'
{
  "name": "saber-agc-tooling",
  "private": true,
  "version": "1.0.0",
  "description": "AGC CLI for Saber HarmonyOS signing automation",
  "dependencies": {
    "@byterm/agc-cli": "^0.8.1"
  }
}
EOF
  (cd "$DEST" && npm install --no-fund --no-audit)
fi

echo
echo "==> 验证"
"$DEST/node_modules/.bin/agc" --version
echo
echo "完成。后续用法:"
echo "  bash toolchain/agc_provision.sh <凭据文件> --project-id <项目ID>"
