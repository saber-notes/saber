#!/usr/bin/env python3
"""真机 UI 自检:验证历轮整改在真机上确实生效。

要检查的 7 件事:
  1. 应用标题显示「赛博手写笔记」(改名后与市场上已有应用不再重名)
  2. 设置 → 应用信息 里的版本号是 1.0.3 / 1000003(之前显示的是上游的 1.37.1 / 137010)
  3. 设置里不再有「主题类型」(那一项是 Linux/Yaru 主题,鸿蒙上会灰屏)
  4. Nextcloud 登录页有隐私政策复选框 + 「不同意并退出」,且未勾选时登录按钮不可点
  5. **设置里没有「错误报告」开关**(崩溃上报 SDK 已整个去掉 —— 第 7 轮整改)
  6. **首启没有「是否希望自动报告意外错误」弹窗**(同上,别再弹一次)
  7. **首启没有「可用更新」弹窗**(启动时不再联网查更新,离线承诺成立 —— 第 9 轮整改)

用法:
  python3 harmony/toolchain/verify_device_ui.py [--ip <device-ip>] [--port <wireless-debug-port>]

前提:
  * 平板已开「无线调试」,屏幕已解锁(锁屏时 aa start 会被系统拒绝);
  * 平板上已装好 app(见 harmony/toolchain/install_on_device.sh)。

退出码:0 = 全部通过;1 = 有检查项没通过。
"""

import argparse
import json
import os
import re
import subprocess
import sys
import time

HDC = os.environ.get(
    "HDC",
    "<ohos-sdk-root>/ohos-sdk/18/toolchains/hdc",
)
BUNDLE = "com.sabernotes.saber"
APP_NAME = "赛博手写笔记"
VERSION_NAME = "1.0.3"
VERSION_CODE = "1000003"
PRIVACY_TEXT = "我已阅读并同意"
DISAGREE_TEXT = "不同意并退出"
THEME_TYPE_TEXT = "主题类型"
# 崩溃上报 SDK 已去掉:这两处文字都不该再出现
SENTRY_SWITCH_TEXT = "错误报告"
SENTRY_CONSENT_TEXT = "自动报告意外错误"
# 启动时不再联网查更新:这个弹窗不该出现
UPDATE_DIALOG_TEXT = "可用更新"


def sh(cmd, timeout=180):
    return subprocess.run(
        [HDC, "shell", cmd], capture_output=True, text=True, timeout=timeout
    )


def recv(remote, local):
    subprocess.run(
        [HDC, "file", "recv", remote, local], capture_output=True, text=True, timeout=180
    )


def dump(tag):
    remote = f"/data/local/tmp/vui_{tag}.json"
    sh(f"uitest dumpLayout -p {remote}")
    local = f"/tmp/vui_{tag}.json"
    recv(remote, local)
    with open(local, encoding="utf-8") as fh:
        return json.load(fh)


def walk(node):
    yield node
    for child in node.get("children") or []:
        yield from walk(child)


def texts(layout):
    out = []
    for node in walk(layout):
        t = (node.get("attributes", {}).get("text") or "").strip()
        if t:
            out.append(t)
    return out


def bounds(node):
    m = re.match(
        r"\[(-?\d+),(-?\d+)\]\[(-?\d+),(-?\d+)\]",
        node.get("attributes", {}).get("bounds") or "",
    )
    return tuple(map(int, m.groups())) if m else None


def find_by_text(layout, needle, exact=False):
    """按文字找节点,返回 (节点, 中心坐标)。"""
    for node in walk(layout):
        t = (node.get("attributes", {}).get("text") or "").strip()
        if not t:
            continue
        hit = (t == needle) if exact else (needle in t)
        if hit:
            b = bounds(node)
            if b:
                return node, ((b[0] + b[2]) // 2, (b[1] + b[3]) // 2)
    return None, None


def tap(x, y):
    sh(f"uitest uiInput click {x} {y}")
    time.sleep(2.5)


def swipe(x1, y1, x2, y2, ms=400):
    sh(f"uitest uiInput swipe {x1} {y1} {x2} {y2} {ms}")
    time.sleep(2.5)


def launch():
    r = sh(f"aa start -a EntryAbility -b {BUNDLE}")
    out = (r.stdout or "") + (r.stderr or "")
    if "screen is locked" in out or "10106102" in out:
        print("  !! 平板屏幕处于锁屏状态,系统拒绝启动应用。")
        print("     请先在平板上手动解锁(需要锁屏密码),再重跑本脚本。")
        sys.exit(2)
    time.sleep(8)


results = []


def check(name, ok, detail=""):
    results.append((name, ok, detail))
    print(f"  {'[通过]' if ok else '[失败]'} {name}" + (f" —— {detail}" if detail else ""))
    return ok


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--ip", default="192.168.1.100")
    ap.add_argument("--port", default="39551")
    ap.add_argument("--connect", action="store_true", help="先执行 hdc tconn")
    args = ap.parse_args()

    if args.connect:
        subprocess.run(
            [HDC, "tconn", f"{args.ip}:{args.port}"], capture_output=True, text=True
        )
        time.sleep(3)

    print("== 启动应用 ==")
    launch()
    layout = dump("home")
    ts = texts(layout)
    print("  首页文字:", ts[:12])

    # 1. 标题
    check("应用标题显示新名称", any(APP_NAME in t for t in ts), f"找 {APP_NAME!r}")

    # 6/7. 首启不该有的两个弹窗(崩���上报 / 更新检查)
    check(
        "首启没有「自动报告意外错误」弹窗",
        not any(SENTRY_CONSENT_TEXT in t for t in ts),
        f"不该出现 {SENTRY_CONSENT_TEXT!r}",
    )
    check(
        "首启没有「可用更新」弹窗",
        not any(UPDATE_DIALOG_TEXT in t for t in ts),
        f"不该出现 {UPDATE_DIALOG_TEXT!r}",
    )

    # 2/3. 设置页
    print("== 打开设置 ==")
    node, xy = find_by_text(layout, "设置")
    if not xy:
        # 底部导航的图标可能没有文字,退回到扫一遍底部区域
        sh("uitest uiInput click 2800 1950")
        time.sleep(3)
    else:
        tap(*xy)
    layout = dump("settings")
    ts = texts(layout)
    print("  设置页文字:", ts[:25])
    # 设置项可能在首屏之下(「错误报告」那一项就在下面),
    # 所以往下滚两屏再抓一次,把两屏的文字合起来查。
    for i in range(2):
        swipe(2800, 1600, 2800, 700)
        layout2 = dump(f"settings_scroll{i}")
        ts = ts + texts(layout2)
    print("  滚动后累计文字条数:", len(ts))
    check(
        f"版本号显示为 {VERSION_NAME}",
        any(VERSION_NAME in t for t in ts),
        f"找 {VERSION_NAME!r}",
    )
    check(
        f"版本号显示为 {VERSION_CODE}",
        any(VERSION_CODE in t for t in ts),
        f"找 {VERSION_CODE!r}",
    )
    check(
        "「主题类型」已隐藏",
        not any(THEME_TYPE_TEXT in t for t in ts),
        f"不该出现 {THEME_TYPE_TEXT!r}",
    )
    check(
        "设置里没有「错误报告」开关",
        not any(SENTRY_SWITCH_TEXT in t for t in ts),
        f"不该出现 {SENTRY_SWITCH_TEXT!r}",
    )

    # 4. 登录页的隐私复选框
    print("== 打开 Nextcloud 登录页 ==")
    # 刚才为了找「错误报告」往下滚过两屏,这里先滚回顶部,
    # 否则「点击以使用 Nextcloud 登录」不在可视区,坐标会点到别的地方
    # (点到隐私政策链接就会把浏览器拉出来 —— 第 11 轮踩过)。
    # 滚的次数不固定,一直滚到那个入口回到屏幕上半部分为止。
    layout = None
    for i in range(6):
        for _ in range(2):
            swipe(2800, 700, 2800, 1600)
        layout = dump(f"settings_top{i}")
        node, xy = find_by_text(layout, "点击以使用 Nextcloud 登录")
        if xy and xy[1] < 1200:
            break
    if xy:
        tap(*xy)
    else:
        # 用户入口通常在应用栏右侧的人形头像上
        sh("uitest uiInput click 2950 150")
        time.sleep(3)
        layout = dump("user")  # 顶部右上角的人形头像 → 用户页
        node, xy = find_by_text(layout, "点击以使用 Nextcloud 登录")
        if xy:
            tap(*xy)
    # 登录页第一次打开要初始化一点时间,点完等久一点;没跳过去就再点一次
    layout = dump("login")
    if not any(PRIVACY_TEXT in t for t in texts(layout)):
        if xy:
            tap(*xy)
            time.sleep(4)
        layout = dump("login")
    ts = texts(layout)
    print("  登录页文字:", ts[:25])
    check("有隐私政策复选框", any(PRIVACY_TEXT in t for t in ts), f"找 {PRIVACY_TEXT!r}")
    check("有「不同意并退出」", any(DISAGREE_TEXT in t for t in ts), f"找 {DISAGREE_TEXT!r}")

    # 未勾选时登录按钮应不可点
    disabled = []
    for node in walk(layout):
        a = node.get("attributes", {})
        t = (a.get("text") or "").strip()
        if t and a.get("enabled") in ("false", "False", False):
            disabled.append(t)
    print("  登录页里不可点的控件:", disabled)
    check(
        "未勾选时登录按钮不可点",
        any("登录" in t for t in disabled),
        "找 disabled 的登录按钮",
    )

    print()
    bad = [r for r in results if not r[1]]
    print(f"== 结论:{len(results) - len(bad)}/{len(results)} 项通过 ==")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
