#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# 从 OpenHarmony 官方 SDK 压缩包里抽取指定组件(不把整包落盘)。
#
# 官方 SDK 只提供整包:
#   https://repo.huaweicloud.com/openharmony/os/<ver>/ohos-sdk-windows_linux-public.tar.gz
# 里面按 host 架构分装成若干 zip(ets/js/native/previewer/toolchains)。
#
# 实现:把大文件切成若干小分片,每个分片用一次 range 请求(单连接长时间下载
# 会被 CDN 限速,小分片不会),分片通过 FIFO 按顺序喂给 tar,
# 因此磁盘上不会出现整个大包。
#
# 用法: fetch_ohos_sdk_parts.sh <版本目录> <目标目录> [组件...]
#   例: fetch_ohos_sdk_parts.sh 5.1.0-Release <download-dir> toolchains
# ---------------------------------------------------------------------------
set -euo pipefail

VER="${1:?用法: fetch_ohos_sdk_parts.sh <版本目录> <目标目录> [组件...]}"
DEST="${2:?缺少目标目录}"
shift 2
COMPONENTS=("$@")
if [ ${#COMPONENTS[@]} -eq 0 ]; then
  COMPONENTS=(toolchains)
fi

BASE="https://repo.huaweicloud.com/openharmony/os"
U="$BASE/$VER/ohos-sdk-windows_linux-public.tar.gz"
SIZE=$(curl -sIL -m 30 "$U" | awk 'BEGIN{IGNORECASE=1}/^content-length:/{v=$2}END{gsub(/\r/,"",v);print v}')
if [ -z "$SIZE" ] || [ "$SIZE" -lt 1000000 ]; then
  echo "无法获取包大小: $U" >&2
  exit 1
fi

CHUNK=$((16 * 1024 * 1024))   # 16 MB 一个分片
NCHUNK=$(( (SIZE + CHUNK - 1) / CHUNK ))
WORKERS=8
echo "==> $U"
echo "==> 大小 $(( SIZE / 1048576 )) MB,分 $NCHUNK 片(每片 $(( CHUNK / 1048576 )) MB),$WORKERS 个并行下载"

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

# 每个分片一个 FIFO,文件名补零保证 cat 的顺序正确
for i in $(seq 0 $((NCHUNK - 1))); do
  mkfifo "$WORK/$(printf 'f.%04d' "$i")"
done

for w in $(seq 0 $((WORKERS - 1))); do
  (
    for i in $(seq "$w" "$WORKERS" "$NCHUNK"); do
      start=$(( i * CHUNK ))
      end=$(( start + CHUNK - 1 ))
      [ "$end" -ge "$SIZE" ] && end=$(( SIZE - 1 ))
      curl -s --retry 5 --retry-delay 2 -r "${start}-${end}" "$U" \
        > "$WORK/$(printf 'f.%04d' "$i")"
    done
  ) &
done

PATTERNS=()
for c in "${COMPONENTS[@]}"; do
  PATTERNS+=(--wildcards "ohos-sdk/linux/${c}-linux-x64-*.zip")
done

echo "==> 解压: ${COMPONENTS[*]}"
mkdir -p "$DEST"
( cd "$DEST" && cat "$WORK"/f.* | tar xz "${PATTERNS[@]}" )
wait

echo "==> 完成"
ls -lh "$DEST"
