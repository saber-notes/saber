#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# apply_ohos_patches.sh —— 构建前对 pub cache 里的依赖打鸿蒙适配补丁。
#
# 这是一个薄封装:真正的实现是 harmony/toolchain/apply_ohos_patches.py,
# 两个平台共用同一份(以前是 bash 一份、Python 一份,两份已经漂移过)。
#
# 用法:
#   bash harmony/patches/ohos/apply_ohos_patches.sh [--cache <PUB_CACHE>]
#
# 需要修的五个点见 apply_ohos_patches.py 的文档字符串。
# ---------------------------------------------------------------------------
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

exec python3 "$HERE/../../toolchain/apply_ohos_patches.py" "$@"
