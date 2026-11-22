#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# use_agc_signing.sh —— 切换到「华为开发者联盟(AGC)签发」的签名材料,
#                        用于 HarmonyOS NEXT 真机。
#
# 这是一个薄封装:真正的实现是 harmony/toolchain/prepare_signing.py
# (两个平台共用同一份)。
#
# 前提:已经把 AGC 下载的 .cer(证书链)和 .p7b(描述文件)放到 signing/ 目录,
#       并且有本机生成的 app.p12(见 harmony/toolchain/gen_csr.sh)。
#
# 用法:
#   bash harmony/toolchain/use_agc_signing.sh <密码> [密钥别名]
#
#   <密码>     app.p12 的密钥库密码(默认 123456)
#   [密钥别名]  app.p12 里的别名(默认 saber-key)
#
# 它做三件事:
#   1. 用 encrypt_signing_password.js 把明文密码加密成 hvigor 要的 hex 串
#   2. 把 .cer 拼成证书链放到 app-cert.pem
#   3. 改写 build-profile.json5 的 signingConfigs
# ---------------------------------------------------------------------------
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PWD_PLAIN="${1:-123456}"
ALIAS="${2:-saber-key}"

exec python3 "$HERE/prepare_signing.py" --password "$PWD_PLAIN" --alias "$ALIAS"
