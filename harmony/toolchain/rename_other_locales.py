#!/usr/bin/env python3
"""把其余 24 个语言包里「应用自称 Saber」的地方也改成「赛博手写笔记」。

背景:应用在应用市场里叫「赛博手写笔记」(第 2 轮审核:与已有的「Saber」应用
名称/图标相似,被要求改名并重画图标)。第 6 轮已经把**中文**和**英文**的语言包
改完了(见 rename_ui_strings.py),但其余 24 个语言包还一口一个「Saber」——
用户把系统语言切成德语/法语/日语……,界面上还是「Saber」,和商店上的名字对不上。

这里不逐条翻译,而是**把句子里的专有名词换掉**:语言包里「Saber」就是应用名字,
换成「赛博手写笔记」后句子仍然通顺(专有名词不需要本地化)。

有四处**故意不改**:
  * `appInfo.licenseNotice` 里的版权声明 —— 那是上游的版权,GPL-3.0 要求保留原样,
    只在前面加一行说明本移植版本;
  * `openDataDir` / `customDataDir` —— 说的是**本机那个数据文件夹**,
    它在磁盘上确实叫 Saber,改名会让用户找不到;
  * 「删除服务器上『Saber』文件夹」那一句(FAQ 里以 "2." 开头的那行)——
    服务器上那个数据文件夹是上游定的名字;
  * 「官方 Saber 服务器」那一句(带联系邮箱的那句)—— 官方服务器是上游的,不是我们的。

判断这几处不能靠「第几条 FAQ」—— 各语言包 FAQ 条数不一样;这里一律按
**内容**认:关键词、邮箱、以及行首的 "2." 编号。

语言包改完还要改 `lib/i18n/strings_*.g.dart` —— 那是**生成出来**的代码,
工程里 `flutter: generate: true` 没开(开了 `flutter gen-l10n` 在这套 SDK 上会崩),
所以这里两边一起改,规则完全一样:生成文件里一个多行字符串就是一个 Dart 字面量,
按字面量里的 `\n` 拆成若干段,逐段套同样的规则。

用法:
    python3 harmony/toolchain/rename_other_locales.py            # 改工作树
    python3 harmony/toolchain/rename_other_locales.py --check    # 只检查
"""

import re
import sys
from pathlib import Path

I18N = Path("lib/i18n")
APP_NAME = "赛博手写笔记"
# 已经处理过的两个语言包(中文/英文用 rename_ui_strings.py 逐条改的)
DONE = {"zh-Hans-CN.i18n.yaml", "en.i18n.yaml"}

# 这些键说的是本机那个真叫 Saber 的数据文件夹,保持原样
KEEP_KEYS = ("openDataDir", "customDataDir")

# 官方服务器那句里带着上游作者的联系邮箱 —— 有邮箱的那一行整体保留
KEEP_CONTAINS = "adilhanney@disroot.org"


def replace_in_value(line: str, sep: str = ":") -> tuple[str, bool]:
    """只替换「值」里的 Saber,不动键名(键名如 loginWithSaber 是内部标识符)。

    注意两点:
      * 块标量(|-)的续行常常整行都没有冒号,那整行都是「值」;
      * 生成出来的 Dart 代码里,键和值之间是 `=>` 而不是 `:` ——
        按 `:` 切会把 getter 名也换掉,编译期直接报「非 ASCII 字符不能用在标识符里」。
    """
    idx = line.find(sep)
    if idx < 0:
        head, value = "", line
    else:
        head, value = line[: idx + len(sep)], line[idx + len(sep) :]
    if "Saber" not in value:
        return line, False
    # 德语等语言的属格 "Sabers" → "赛博手写笔记",别留下一个孤零零的 s
    value = value.replace("Sabers", APP_NAME)
    return head + value.replace("Saber", APP_NAME), True


def process(path: Path, check: bool) -> int:
    lines = path.read_text(encoding="utf-8").split("\n")
    out: list[str] = []
    hits = 0
    section = ""
    in_license = False
    faq_indent = -1   # >0 表示当前在某个 FAQ 条目里

    for line in lines:
        stripped = line.strip()
        indent = len(line) - len(line.lstrip())

        # 顶层小节(appInfo: / profile: ...)
        if indent == 0 and stripped.endswith(":"):
            section = stripped[:-1]
            in_license = False
        # 版权声明整块保留
        if section == "appInfo" and re.match(r"^\s+licenseNotice:", line):
            in_license = True
            out.append(line)
            continue
        if in_license:
            if stripped == "" or indent > 2:
                out.append(line)
                continue
            in_license = False
        # FAQ 条目:「- q: ...」开头,缩进就是条目缩进
        if re.match(r"^\s+- q:", line):
            faq_indent = indent
        elif faq_indent >= 0 and stripped and indent <= faq_indent:
            faq_indent = -1

        # ---- 判断这一行要不要改 ----
        key = line.split(":", 1)[0].strip()
        if in_license:
            keep = True
        elif KEEP_CONTAINS in line:
            keep = True
        elif key.startswith(KEEP_KEYS):
            keep = True
        elif re.match(r"^2[.)]\s", stripped):
            # FAQ 里以 "2." 开头的那句说的是服务器上那个真叫 Saber 的文件夹
            keep = True
        else:
            keep = False

        if keep:
            out.append(line)
            continue

        new_line, changed = replace_in_value(line)
        if changed:
            hits += 1
            out.append(new_line)
        else:
            out.append(line)

    if not check and hits:
        path.write_text("\n".join(out), encoding="utf-8")
    return hits


def process_generated(path: Path, check: bool) -> int:
    """处理生成的 strings_*.g.dart。

    生成文件里一个多行字符串就是一个 Dart 字面量,里面用 \n 分隔;
    按字面量里的 \n 拆成段,逐段套同一套规则,再拼回去。
    """
    text = path.read_text(encoding="utf-8")
    hits = 0
    out_lines = []
    for line in text.split("\n"):
        if "Saber" not in line:
            out_lines.append(line)
            continue
        # 取出行里的键名(getter 名),用来判断是不是 openDataDir / licenseNotice
        m = re.search(r"get\s+([A-Za-z_][A-Za-z0-9_]*)|String\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(", line)
        key = (m.group(1) or m.group(2)) if m else ""
        parts = line.split("\\n")
        new_parts = []
        changed = False
        for part in parts:
            stripped = part.strip()
            if key.startswith(KEEP_KEYS) or "licenseNotice" in key:
                new_parts.append(part)
                continue
            if KEEP_CONTAINS in part:
                new_parts.append(part)
                continue
            if re.search(r"[«»„“”\"\'‘’]Saber[«»„“”\"\'‘’]", part):
                # 引号包着的那个是真叫 Saber 的服务器文件夹
                new_parts.append(part)
                continue
            if re.match(r"^2[.)]\s", stripped):
                new_parts.append(part)
                continue
            new_part, did = replace_in_value(part, sep="=>")
            changed = changed or did
            new_parts.append(new_part)
        if changed:
            hits += 1
        out_lines.append("\\n".join(new_parts))
    new_text = "\n".join(out_lines)
    if not check and hits:
        path.write_text(new_text, encoding="utf-8")
    return hits


def main() -> None:
    check = "--check" in sys.argv
    files = sorted(p for p in I18N.glob("*.i18n.yaml") if p.name not in DONE)
    total = 0
    for path in files:
        n = process(path, check)
        total += n
        print(f"  {'[检查] ' if check else '[已改] '}{path.name}: {n} 处")
    # 生成出来的 Dart 代码也要一起改,否则界面还是旧名字
    gen = sorted(p for p in I18N.glob("strings_*.g.dart")
                 if p.name not in ("strings_en.g.dart", "strings_zh_Hans_CN.g.dart", "strings.g.dart"))
    for path in gen:
        n = process_generated(path, check)
        total += n
        print(f"  {'[检查] ' if check else '[已改] '}{path.name}: {n} 处")
    print(f"==> {'检查' if check else '替换'}完成,{len(files)} 个语言包 + {len(gen)} 个生成文件,共 {total} 处")


if __name__ == "__main__":
    main()
