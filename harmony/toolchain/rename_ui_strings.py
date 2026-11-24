#!/usr/bin/env python3
"""把界面文案里「应用自称 Saber」的地方改成「赛博手写笔记」。

为什么要改:应用在应用市场里叫「赛博手写笔记」(第 2 轮审核:与已有的
「Saber」应用名称/图标相似,被要求改名并重画图标),但**应用内**的文案
——登录按钮、同步设置、隐私同意弹窗、注销说明等——还一口一个「Saber」。
审核报告的知识产权那条还特意提醒:「修改应用名称时,请务必同步更新应用介绍、
**应用内容**及应用安装包的名称配置」,「应用内容」就包括这些界面文案。

有两处 **故意不改**:
  * `licenseNotice` 里的「Saber  版权所有 © 2022-…  Adil Hanney」——
    这是上游的版权声明,GPL-3.0 要求保留原样,只在前面加一行说明本移植版本;
  * 「删除服务器上的『Saber』文件夹」——服务器上那个数据文件夹**确实叫
    Saber**(上游定的名字),改名反而会让用户找不到文件夹。

用法:
    python3 harmony/toolchain/rename_ui_strings.py            # 改工作树
    python3 harmony/toolchain/rename_ui_strings.py --check     # 只检查
"""

import sys

ZH = [
    # (原, 新)
    ("帮助改进 Saber？", "帮助改进赛博手写笔记？"),
    ("自动检查 Saber 更新", "自动检查赛博手写笔记更新"),
    ("自定义 Saber 文件夹", "自定义本机应用数据文件夹"),
    ("（不推荐）允许 Saber 连接到具有自签名/不受信任证书的服务器",
     "（不推荐）允许赛博手写笔记连接到具有自签名/不受信任证书的服务器"),
    ("打开 Saber 文件夹", "打开本机的「Saber」应用数据文件夹"),
    ("您需要同意隐私政策才能使用 Saber 的 Nextcloud 同步功能。是否退出应用?",
     "您需要同意隐私政策才能使用赛博手写笔记的 Nextcloud 同步功能。是否退出应用?"),
    ("Saber 的 Nextcloud 服务器", "赛博手写笔记的 Nextcloud 服务器"),
    ("使用 Saber 登录", "使用赛博手写笔记登录"),
    ("请授权 Saber 访问您的 Nextcloud 帐户", "请授权赛博手写笔记访问您的 Nextcloud 帐户"),
    ("Saber 新手？只需输入新的加密密码即可。", "赛博手写笔记新手？只需输入新的加密密码即可。"),
    ("Saber 将从此密码自动生成您的加密密钥。", "赛博手写笔记将从此密码自动生成您的加密密钥。"),
    ("更改密码后，您需要注销并重新登录 Saber。", "更改密码后，您需要注销并重新登录赛博手写笔记。"),
    ("1.退出 Saber 登录。", "1.退出赛博手写笔记登录。"),
    ("3.重新登录 Saber。", "3.重新登录赛博手写笔记。"),
    ("4.不要忘记在您的其他设备上注销并重新登录 Saber。",
     "4.不要忘记在您的其他设备上注销并重新登录赛博手写笔记。"),
    ("如果您使用的是官方 Saber 服务器，您的帐户将在 1 周的宽限期后被删除。",
     "如果您使用的是官方 Saber 服务器(上游项目提供的服务器)，您的帐户将在 1 周的宽限期后被删除。"),
    ("此笔记使用新版 Saber 编辑而成", "此笔记使用新版赛博手写笔记编辑而成"),
]

EN = [
    ("Help improve Saber?", "Help improve 赛博手写笔记?"),
    ("Check for Saber updates", "Check for 赛博手写笔记 updates"),
    ("Custom Saber folder", "Custom app data folder on this device"),
    ("(Not recommended) Allow Saber to connect to servers with self-signed/untrusted certificates",
     "(Not recommended) Allow 赛博手写笔记 to connect to servers with self-signed/untrusted certificates"),
    ("Open Saber folder", "Open the \"Saber\" app data folder on this device"),
    ("You must agree to the privacy policy before using Saber's Nextcloud sync. Do you want to exit the app?",
     "You must agree to the privacy policy before using 赛博手写笔记's Nextcloud sync. Do you want to exit the app?"),
    ("Saber's Nextcloud server", "赛博手写笔记's Nextcloud server"),
    ("Login with Saber", "Login with 赛博手写笔记"),
    ("Please authorize Saber to access your Nextcloud account",
     "Please authorize 赛博手写笔记 to access your Nextcloud account"),
    ("New to Saber? Just enter a new encryption password.",
     "New to 赛博手写笔记? Just enter a new encryption password."),
    ("Saber will generate your encryption keys from this password automatically.",
     "赛博手写笔记 will generate your encryption keys from this password automatically."),
    ("You'll need to log out and log back in to Saber after changing your password.",
     "You'll need to log out and log back in to 赛博手写笔记 after changing your password."),
    ("1. Log out of Saber.", "1. Log out of 赛博手写笔记."),
    ("3. Log back in to Saber.", "3. Log back in to 赛博手写笔记."),
    ("4. Don't forget to log out and log back in to Saber on your other devices too.",
     "4. Don't forget to log out and log back in to 赛博手写笔记 on your other devices too."),
    ("If you are using the official Saber server, your account will be deleted after a 1 week grace period.",
     "If you are using the official Saber server (provided by the upstream project), your account will be deleted after a 1 week grace period."),
    ("This note was edited using a newer version of Saber",
     "This note was edited using a newer version of 赛博手写笔记"),
]

# 版权声明:保留上游原文,前面加一行说明本移植版本
ZH_LICENSE_OLD = "Saber  版权所有 © 2022-$buildYear  Adil Hanney"
ZH_LICENSE_NEW = "赛博手写笔记 —— 基于开源项目 Saber 开发\n    Saber  版权所有 © 2022-$buildYear  Adil Hanney"
EN_LICENSE_OLD = "Saber  Copyright © 2022-$buildYear  Adil Hanney"
EN_LICENSE_NEW = "赛博手写笔记 — built on the open-source Saber project\n    Saber  Copyright © 2022-$buildYear  Adil Hanney"


def escape(s: str) -> str:
    """Dart 单引号字符串里,单引号要转义。"""
    return s.replace("'", "\\'")


def apply(path: str, pairs: list[tuple[str, str]], license_pair: tuple[str, str], check: bool) -> int:
    with open(path, encoding="utf-8") as f:
        text = f.read()
    hits = 0
    for old, new in pairs:
        # 旧串在文件里可能是转义形式('...' 里带单引号),新串要用同样的形式,
        # 否则会写出 Dart 语法错误(这坑踩过一次)。
        found = False
        for o in (old, escape(old)):
            if o not in text:
                continue
            n = new if o == old else escape(new)
            if not check:
                text = text.replace(o, n)
            found = True
            hits += 1
        if not found:
            print(f"  ⚠ {path}: 没找到 {old[:40]!r}")
    o, n = license_pair
    for oo, nn in ((o, n), (escape(o), escape(n))):
        if oo in text:
            if not check:
                text = text.replace(oo, nn)
            hits += 1
        else:
            print(f"  ⚠ {path}: 没找到版权声明 {o[:40]!r}")
    if not check and hits:
        with open(path, "w", encoding="utf-8") as f:
            f.write(text)
    return hits


def main() -> None:
    check = "--check" in sys.argv
    root = "."
    total = 0
    for path, pairs, lic in [
        ("lib/i18n/zh-Hans-CN.i18n.yaml", ZH, (ZH_LICENSE_OLD, ZH_LICENSE_NEW)),
        # .g.dart 里是单行 Dart 字符串,换行必须写成转义的 \n(真实换行会编译不过)
        ("lib/i18n/strings_zh_Hans_CN.g.dart", ZH, (ZH_LICENSE_OLD.replace("$buildYear", "${buildYear}"),
                                                   ZH_LICENSE_NEW.replace("$buildYear", "${buildYear}")
                                                   .replace("\n    ", "\\n"))),
        ("lib/i18n/en.i18n.yaml", EN, (EN_LICENSE_OLD, EN_LICENSE_NEW)),
        ("lib/i18n/strings_en.g.dart", EN, (EN_LICENSE_OLD.replace("$buildYear", "${buildYear}"),
                                           EN_LICENSE_NEW.replace("$buildYear", "${buildYear}")
                                           .replace("\n    ", "\\n"))),
    ]:
        n = apply(f"{root}/{path}", pairs, lic, check)
        total += n
        print(f"  {'[检查] ' if check else '[已改] '}{path}: {n} 处")
    print(f"==> {'检查' if check else '替换'}完成,共 {total} 处")


if __name__ == "__main__":
    main()
