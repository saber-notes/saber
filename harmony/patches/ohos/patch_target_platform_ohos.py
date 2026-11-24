#!/usr/bin/env python3
"""给依赖包里的 switch 补上 `TargetPlatform.ohos` 分支。

背景:
  Flutter-OH 给 `TargetPlatform` 加了 `ohos` 成员。Flutter 3.32 之后
  `cupertino` / `material` 被拆成 `cupertino_ui` / `material_ui` 两个 pub 包,
  它们(以及 flutter_quill、super_clipboard、background_downloader、
  flex_color_picker 等)内部对 TargetPlatform 的 switch 是**穷尽的**,
  少了 ohos 分支会直接编译失败:

      "The type 'TargetPlatform' is not exhaustively matched by the switch
       cases since it doesn't match 'TargetPlatform.ohos'."

做法:
  扫 pub cache 里所有 hosted 包的 lib/ 源码,找出所有**以 TargetPlatform
  成员做分支**的 switch(语句和表达式都算),在最后一个分支之后补上
  ohos 分支:

    * switch 语句   ->  `case TargetPlatform.ohos:`
    * switch 表达式 ->  `TargetPlatform.ohos => <与最后一个分支相同的值>`

  已经有 ohos 分支、或者已经有 default 分支的 switch 会被跳过。

脚本可重复执行。

用法:
  python3 patches/ohos/patch_target_platform_ohos.py [--cache <PUB_CACHE>]
"""

import argparse
import os
import pathlib
import re
import sys

# switch ( ... ) {   —— 表达式与语句共用同一种写法
SWITCH_RE = re.compile(r"\bswitch\s*\(")
CASE_RE = re.compile(r"case\s+TargetPlatform\.[A-Za-z0-9_]+\s*:")
ARM_RE = re.compile(r"TargetPlatform\.[A-Za-z0-9_]+\s*=>")
DEFAULT_RE = re.compile(r"(?<![\w.])default\s*(:|=>)")
OHOS = "TargetPlatform.ohos"


def find_switch_blocks(source: str):
    """产出所有 switch 的花括号块 (含开头 '{' 与结尾 '}')。"""
    for match in SWITCH_RE.finditer(source):
        # 跳过 "switch" 作为标识符的一部分(例如 someSwitch)
        if match.start() > 0 and (source[match.start() - 1].isalnum() or source[match.start() - 1] == "_"):
            continue
        # 找到与之配对的 '{'
        index = match.end()
        paren = 1
        while index < len(source):
            char = source[index]
            if char == "(":
                paren += 1
            elif char == ")":
                paren -= 1
                if paren == 0:
                    break
            index += 1
        else:
            return
        index += 1  # 跳过 ')' 本身
        # 跳过 '{' 之前可能存在的空白
        while index < len(source) and source[index] in " \t\r\n":
            index += 1
        if index >= len(source) or source[index] != "{":
            continue
        start = index
        depth = 0
        for pos in range(start, len(source)):
            char = source[pos]
            if char == "{":
                depth += 1
            elif char == "}":
                depth -= 1
                if depth == 0:
                    yield source[start : pos + 1]
                    break


def _line_indent(block: str, position: int) -> str:
    """取 position 所在行的前导空白(只看行首缩进,不管后面是什么)。"""
    line_start = block.rfind("\n", 0, position) + 1
    line = block[line_start:position]
    stripped = line.lstrip(" \t")
    return line[: len(line) - len(stripped)]


def _strip_inserted(source: str) -> str:
    """去掉之前插入的 ohos 分支,让脚本可以重复执行并修正旧结果。"""
    # switch 语句里的 `case TargetPlatform.ohos:` 独占一行。
    source = "\n".join(
        line
        for line in source.split("\n")
        if line.strip() != "case TargetPlatform.ohos:"
    )
    # switch 表达式里的 `TargetPlatform.ohos => ...` 分支。
    while True:
        index = source.find("TargetPlatform.ohos =>")
        if index < 0:
            break
        line_start = source.rfind("\n", 0, index) + 1
        cursor = index + len("TargetPlatform.ohos =>")
        depth = 0
        while cursor < len(source):
            char = source[cursor]
            if char in "([{":
                depth += 1
            elif char in ")]}":
                if depth == 0:
                    break
                depth -= 1
            elif char == "," and depth == 0:
                cursor += 1
                break
            cursor += 1
        source = source[:line_start] + source[cursor:]
    return source


def _arm_value(block: str, arm_start: int):
    """取 switch 表达式某个分支 `=>` 之后的值文本,以及该分支的结束位置。

    返回 (值文本, 插入位置)。插入位置是该分支**整个**结束之后 ——
    也就是那个分隔逗号之后(没有逗号时是块尾之前)。
    """
    arrow = block.find("=>", arm_start)
    if arrow < 0:
        return "", 0
    index = arrow + 2
    depth = 0
    while index < len(block):
        char = block[index]
        if char in "([{":
            depth += 1
        elif char in ")]}":
            if depth == 0:
                break
            depth -= 1
        elif char == "," and depth == 0:
            return block[arrow + 2 : index].strip(), index + 1
        index += 1
    return block[arrow + 2 : index].strip(), index


def patch_source(source: str):
    """给所有缺 ohos 分支的 TargetPlatform switch 补上,返回 (新内容, 处数)。"""
    changed = 0
    # 先把之前插入的 ohos 分支删掉,保证重复执行的结果一致。
    source = _strip_inserted(source)
    blocks = sorted(find_switch_blocks(source), key=len, reverse=True)
    for block in blocks:
        if OHOS in block:
            continue
        if DEFAULT_RE.search(block):
            # 已经有 default 分支,穷尽性没问题。
            continue
        cases = list(CASE_RE.finditer(block))
        arms = list(ARM_RE.finditer(block))
        if cases:
            # switch 语句:在最后一个 case 标签之后插入 ohos 分支。
            last = cases[-1]
            indent = _line_indent(block, last.start())
            patched = (
                block[: last.end()]
                + f"\n{indent}case {OHOS}:"
                + block[last.end() :]
            )
            source = source.replace(block, patched, 1)
            changed += 1
        elif arms:
            # switch 表达式:补一个和最后一个分支取值相同的 ohos 分支。
            last = arms[-1]
            value, arm_end = _arm_value(block, last.start())
            if not value or arm_end == 0:
                continue
            indent = _line_indent(block, block.find("=>", last.start()))
            patched = (
                block[:arm_end]
                + f"\n{indent}{OHOS} => {value},"
                + block[arm_end:]
            )
            source = source.replace(block, patched, 1)
            changed += 1
    return source, changed


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--cache",
        default=os.environ.get("PUB_CACHE", os.path.expanduser("~/.pub-cache")),
        help="pub 缓存目录",
    )
    args = parser.parse_args()

    # hosted/<host>/<pkg>-<ver>/  是 pub.dev 等源拉下来的包;
    # git/<pkg>-<hash>/              是 git 依赖(例如 material_ui 迁移用的
    #                                yaru / flutter_quill 分支)。
    roots: list[pathlib.Path] = []
    hosted = pathlib.Path(args.cache) / "hosted"
    if hosted.is_dir():
        # hosted/<host>/<pkg>-<ver>/ —— 要下探到**包**这一层。
        # 以前只把 hosted/<host> 当成包,于是 hosted/<host>/lib 不存在,
        # 所有 pub.dev 上的包(material_ui / cupertino_ui / ...)一个都没被补,
        # 编译时集体报 "TargetPlatform is not exhaustively matched"。
        for host in sorted(p for p in hosted.iterdir() if p.is_dir()):
            roots.extend(sorted(p for p in host.iterdir() if p.is_dir()))
    git_root = pathlib.Path(args.cache) / "git"
    if git_root.is_dir():
        roots.extend(sorted(p for p in git_root.iterdir() if p.is_dir()))
    if not roots:
        print(f"[skip] {args.cache} 下没有可处理的包")
        return 0

    patched_files = 0
    patched_switches = 0
    for package in roots:
        lib = package / "lib"
        if not lib.is_dir():
            continue
        for path in sorted(lib.rglob("*.dart")):
            try:
                source = path.read_text(encoding="utf-8")
            except (OSError, UnicodeDecodeError):
                continue
            if "TargetPlatform" not in source:
                continue
            new_source, count = patch_source(source)
            if count:
                path.write_text(new_source, encoding="utf-8")
                patched_files += 1
                patched_switches += count
                rel = path.relative_to(package)
                print(f"    {package.name}/{rel}: {count} 处")

    print(
        f"  [ok] TargetPlatform.ohos 穷尽性:修补 {patched_switches} 处"
        f"({patched_files} 个文件)"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
