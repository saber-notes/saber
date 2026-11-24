#!/usr/bin/env python3
"""把「对上游文件的改动」重新导出成 harmony/patches/upstream/*.patch。

背景:本仓库是上游 Saber 的移植版,对上游文件的每一处改动都放在
harmony/patches/upstream/ 下,这样 `fetch_upstream.sh` + `apply_upstream_patches.sh`
随时能在一份干净的上游代码上重放我们的改动。

上游文件本身**不入库**(工作树里改,提交时只提交补丁),所以改了上游文件之后,
必须用这个脚本把补丁同步过去,否则下次重放上游代码时改动就丢了。

规矩(apply_upstream_patches.sh 按文件名顺序逐个应用/撤销):
  * 一个上游文件只能被一个补丁碰 —— 否则先撤销的那个会因上下文变了而失败;
  * 补丁之间要能独立 reverse-check,所以这个脚本一个文件生成一个补丁。

用法:
    python3 harmony/toolchain/refresh_patches.py                 # 重新生成已有的那几个
    python3 harmony/toolchain/refresh_patches.py lib/i18n/fr.i18n.yaml ...
        # 为指定文件生成新补丁(编号接在现有最大号之后)
    python3 harmony/toolchain/refresh_patches.py --check         # 只看现状
"""

import re
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
PATCH_DIR = REPO / "harmony/patches/upstream"
# 已有的补丁 -> 它管的是哪个上游文件(重生成时用)
EXISTING = {
    "0012-lib-i18n-en-yaml.patch": "lib/i18n/en.i18n.yaml",
    "0013-lib-i18n-zh-yaml.patch": "lib/i18n/zh-Hans-CN.i18n.yaml",
    "0014-lib-i18n-en-generated.patch": "lib/i18n/strings_en.g.dart",
    "0015-lib-i18n-zh-generated.patch": "lib/i18n/strings_zh_Hans_CN.g.dart",
}


def slug(path: str) -> str:
    """lib/i18n/strings_fr.g.dart -> lib-i18n-strings-fr-g-dart"""
    return re.sub(r"[^a-z0-9]+", "-", path.lower()).strip("-")


def diff_for(path: str) -> str:
    out = subprocess.run(
        ["git", "-C", str(REPO), "diff", "HEAD", "--", path],
        capture_output=True, text=True, check=True,
    ).stdout
    return out


def write_patch(num: int, path: str, body: str) -> Path:
    name = f"{num:04d}-{slug(path)}.patch"
    target = PATCH_DIR / name
    target.write_text(body, encoding="utf-8")
    return target


def main() -> None:
    check = "--check" in sys.argv
    args = [a for a in sys.argv[1:] if not a.startswith("--")]

    if not args:
        # 只重生成已有的那几个
        args = list(EXISTING.values())

    next_num = max(
        (int(p.name[:4]) for p in PATCH_DIR.glob("*.patch") if p.name[:4].isdigit()),
        default=0,
    ) + 1

    for path in args:
        body = diff_for(path)
        if not body.strip():
            print(f"  [跳过] {path}: 没有改动")
            continue
        # 已有的补丁就原地覆盖,新的接在后面
        target = None
        for name, upstream in EXISTING.items():
            if upstream == path:
                target = PATCH_DIR / name
                break
        if target is None:
            # 按补丁头里的文件路径认领:同一个上游文件只能有一个补丁
            for cand in sorted(PATCH_DIR.glob("*.patch")):
                head = cand.read_text(encoding="utf-8").split("\n")[:6]
                if any(line.startswith("+++ b/" + path) for line in head):
                    target = cand
                    break
        if target is None:
            if check:
                print(f"  [待建] {path} -> {next_num:04d}-{slug(path)}.patch")
                next_num += 1
                continue
            target = write_patch(next_num, path, body)
            next_num += 1
        else:
            if not check:
                target.write_text(body, encoding="utf-8")
        print(f"  {'[检查] ' if check else '[已写] '}{target.name}: {path}")


if __name__ == "__main__":
    main()
