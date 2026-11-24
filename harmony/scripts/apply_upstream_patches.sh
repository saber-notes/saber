#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# apply_upstream_patches.sh —— 把「对上游文件的改动」打到工作树上。
#
# 为什么要用补丁而不是直接改文件:
#
#   上游 Saber 的文件(pubspec.yaml / lib/** / .gitignore)在仓库里保持
#   **原样**。我们一共只动了 6 个文件,每一处都改成了补丁放在
#   harmony/patches/upstream/ 下。这样:
#
#     * `git diff <上游基线>` 只会看到**新增**,不会看到"改坏"上游的地方;
#     * 以后合并上游主干时,冲突面最小(只有这些补丁可能需要重放);
#     * 想回到"纯上游"状态,一条命令: bash harmony/scripts/apply_upstream_patches.sh --reverse
#
# 幂等:已经打过的补丁会被跳过,可以反复运行。
#
# 用法:
#   bash harmony/scripts/apply_upstream_patches.sh            # 打补丁(默认)
#   bash harmony/scripts/apply_upstream_patches.sh --reverse  # 撤销,回到纯上游
#   bash harmony/scripts/apply_upstream_patches.sh --check    # 只检查,不修改
# ---------------------------------------------------------------------------
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$(cd "$HERE/../.." && pwd)"
PATCH_DIR="$REPO/harmony/patches/upstream"

MODE="apply"
case "${1:-}" in
  --reverse) MODE="reverse" ;;
  --check)   MODE="check" ;;
  "")        ;;
  *) echo "未知参数: $1" >&2; exit 1 ;;
esac

if ! command -v git > /dev/null 2>&1; then
  echo "错误:找不到 git" >&2
  exit 1
fi

if [ ! -d "$PATCH_DIR" ]; then
  echo "错误:找不到补丁目录: $PATCH_DIR" >&2
  exit 1
fi

applied=0
skipped=0
failed=0

for p in "$PATCH_DIR"/*.patch; do
  [ -e "$p" ] || continue
  name="$(basename "$p")"

  # 能不能正向应用?
  if git -C "$REPO" apply --check "$p" > /dev/null 2>&1; then
    if [ "$MODE" = "check" ]; then
      echo "  [待打] $name"
    elif [ "$MODE" = "reverse" ]; then
      echo "  [跳过] $name (反向模式:未打过)"
    else
      git -C "$REPO" apply "$p"
      echo "  [已打] $name"
    fi
    applied=$((applied + 1))
    continue
  fi

  # 已经打过?(反向能应用 = 当前状态包含这个补丁)
  if git -C "$REPO" apply --reverse --check "$p" > /dev/null 2>&1; then
    if [ "$MODE" = "check" ]; then
      echo "  [已打] $name"
    elif [ "$MODE" = "reverse" ]; then
      git -C "$REPO" apply --reverse "$p"
      echo "  [撤销] $name"
    else
      echo "  [跳过] $name (已打过)"
    fi
    skipped=$((skipped + 1))
    continue
  fi

  echo "  [错误] $name 无法应用 —— 上游文件被改动过,请先解决冲突:" >&2
  failed=$((failed + 1))
done

case "$MODE" in
  apply)
    echo "==> 上游补丁:应用 $applied 个,跳过 $skipped 个(已打过)"
    ;;
  reverse)
    echo "==> 上游补丁:撤销 $skipped 个,保留 $applied 个(未打过)"
    echo "    现在工作树与上游基线一致(除了 harmony/ 与 ohos/ 这两个新增目录)"
    ;;
  check)
    echo "==> 上游补丁:待打 $applied 个,已打 $skipped 个"
    ;;
esac

[ "$failed" -eq 0 ] || exit 1
