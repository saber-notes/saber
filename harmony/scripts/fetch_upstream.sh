#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# fetch_upstream.sh —— 取上游 Saber(saber-notes/saber)的最新代码
#
# 用法:
#   bash harmony/scripts/fetch_upstream.sh                  # 经中转机(默认)
#   bash harmony/scripts/fetch_upstream.sh --direct         # 直连 GitHub
#   bash harmony/scripts/fetch_upstream.sh --via user@host  # 指定中转机
#
# 环境变量(都有默认值,按你的实际情况改):
#   JUMP_HOST        中转机          默认 <build-host>
#   JUMP_REPO        中转机上那个仓库的路径
#                    默认 <repo>
#   UPSTREAM_REMOTE  本地的远端名    默认 upstream
#
# 为什么需要它:
#   有些网络环境连不上 github.com,但中转机能连。中转机上克隆了上游仓库
#   (它的 origin = https://github.com/saber-notes/saber.git),所以可以从
#   那里把上游的 main 取回来,更新本地的 upstream/main 引用。
#
# 结果落在 refs/remotes/upstream/main,之后就能:
#   git log --oneline upstream/main
#   git merge upstream/main
#
# 中转机需要能免密登录。密码登录的话,先配好 SSH_ASKPASS:
#   export SSH_ASKPASS=/path/to/askpass.sh
#   export SSH_ASKPASS_REQUIRE=force
#   export DISPLAY=1
# 或者干脆给中转机装个公钥(更省事):
#   ssh-copy-id <build-host>
# ---------------------------------------------------------------------------
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
JUMP_HOST="${JUMP_HOST:-<build-host>}"
JUMP_REPO="${JUMP_REPO:-<repo>}"
UPSTREAM_REMOTE="${UPSTREAM_REMOTE:-upstream}"

MODE="via"
case "${1:-}" in
  --direct) MODE="direct" ;;
  --via)
    JUMP_HOST="${2:?--via 需要给出中转机地址,例如 root@1.2.3.4}"
    shift 2
    ;;
  "") ;;
  *) echo "未知参数: $1" >&2; exit 1 ;;
esac

if [ "$MODE" = "direct" ]; then
  echo "==> 直连 $UPSTREAM_REMOTE"
  if ! git -C "$REPO_ROOT" fetch "$UPSTREAM_REMOTE" main; then
    echo "错误:直连失败。" >&2
    echo "  试试:bash harmony/scripts/fetch_upstream.sh   # 经中转机" >&2
    exit 1
  fi
else
  echo "==> 经 $JUMP_HOST 取上游 main"
  if ! git -C "$REPO_ROOT" fetch "$JUMP_HOST:$JUMP_REPO" \
      'refs/remotes/origin/main:refs/remotes/upstream/main'; then
    cat >&2 <<EOF
错误:经中转机取上游失败。

最常见的原因是 SSH 到中转机需要密码而 git 没有交互终端。
两种解法(选一个):

  1) 给中转机装公钥(推荐,一劳永逸):
       ssh-copy-id $JUMP_HOST

  2) 用 SSH_ASKPASS:
       export SSH_ASKPASS=/path/to/your/askpass.sh
       export SSH_ASKPASS_REQUIRE=force
       export DISPLAY=1
       bash harmony/scripts/fetch_upstream.sh

也可以完全不用本脚本,手工取:
       git fetch $JUMP_HOST:$JUMP_REPO \\
           refs/remotes/origin/main:refs/remotes/upstream/main
EOF
    exit 1
  fi
fi

echo
echo "上游最新 5 个提交:"
git -C "$REPO_ROOT" log --oneline -5 upstream/main
echo
behind="$(git -C "$REPO_ROOT" rev-list --count HEAD..upstream/main 2>/dev/null || echo '?')"
echo "我们落后上游 $behind 个提交"
echo
echo "接下来可以合并:"
echo "  git merge upstream/main          # 或 git rebase upstream/main"
echo "  bash harmony/scripts/apply_upstream_patches.sh --check   # 看补丁还能不能打"
