#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# prepare_signing.sh —— 准备签名材料,并把配置写进 ohos/build-profile.json5
#
# 这是一个薄封装:真正的实现是 harmony/toolchain/prepare_signing.py,
# 两个平台共用同一份(以前 bash 一份、Python 一份,两份已经漂移过)。
#
# 三种情况,按优先级自动判断:
#
#   1. AGC(华为开发者账号)签发的材料齐全
#      (signing/app.p12 + signing/app.p7b + signing/app.cer)
#      -> 校验证书与 profile 是否配套,写配置
#      -> 产物能装到「调试 Profile 白名单里的 HarmonyOS NEXT 真机」
#
#   2. 已有 OpenHarmony 社区证书材料(signing/saber.p12 + signing/saber.p7b)
#      -> 直接写配置
#      -> 产物只能装到 OpenHarmony 设备 / DevEco 模拟器
#
#   3. 什么都没有
#      -> 用 SDK 自带的社区证书现场生成一套
#      -> 同上,只能装到 OpenHarmony 设备 / 模拟器
#
# 用法:
#   bash harmony/toolchain/prepare_signing.sh [--password 123456] [--alias saber-key]
#
# 环境变量:
#   STORE_PWD  密钥库密码(默认 123456)
#   ALIAS      密钥别名(默认 saber-key)
# ---------------------------------------------------------------------------
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

exec python3 "$HERE/prepare_signing.py" "$@"
