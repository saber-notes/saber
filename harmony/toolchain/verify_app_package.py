#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""验收打好的上架包(.app / .hap)。

检查项(对应华为应用市场审核里反复出现的那几条):

1. 包内图标**没有 alpha 通道**且是 RGB ——「图标有透明背景」是第 1、2 轮的阻塞项。
   坑:restool 的 iconCheck 会把图标归一化到 512×512,1024 缩到 512 要走 SDK 的
   图像转码器,转码器输出的是 **RGBA alpha=254**。源图 ≤512 才是干净的 RGB。
2. 签名有效(`hap-sign-tool verify-app`),且包内 profile 是**发布 Profile**
   (`type == "release"`),并且与 `ohos/signing/app-release.p7b` 完全一致。
3. `pack.info` 里的包名 / 版本号。
4. 包内应用名是「赛博手写笔记」(审核员在桌面和最近任务列表里看到的名字)。

用法:
    python3 harmony/toolchain/verify_app_package.py                     # 验默认产物
    python3 harmony/toolchain/verify_app_package.py <包路径> [...]       # 验指定的包
    python3 harmony/toolchain/verify_app_package.py --skip-signature    # 只看图标/版本
"""

from __future__ import annotations

import argparse
import hashlib
import io
import json
import os
import pathlib
import subprocess
import sys
import tempfile
import zipfile

ROOT = pathlib.Path(__file__).resolve().parents[2]
SIGN_DIR = ROOT / "ohos" / "signing"
DEFAULT_PACKAGES = [
    ROOT / "build" / "ohos" / "app" / "ohos-default-signed.app",
]

EXPECTED_PACKAGE_NAME = "com.sabernotes.saber"
EXPECTED_APP_NAME = "赛博手写笔记"

# 签名工具:优先用商用 SDK(HMS)里的那份,和构建用的是同一个
SIGN_TOOL_CANDIDATES = [
    pathlib.Path(os.environ.get("DEVECO_TOOLS", "<devEco-tools>/command-line-tools"))
    / "sdk/default/hms/toolchains/lib/hap-sign-tool.jar",
    pathlib.Path("<devEco-tools>/command-line-tools/sdk/default/openharmony/toolchains/lib/hap-sign-tool.jar"),
]

ICON_ENTRIES = ("resources/base/media/icon.png", "resources/base/media/app_icon.png")

ok_count = 0
fail_count = 0


def ok(msg: str) -> None:
    global ok_count
    ok_count += 1
    print(f"  ✅ {msg}")


def bad(msg: str) -> None:
    global fail_count
    fail_count += 1
    print(f"  ❌ {msg}")


def info(msg: str) -> None:
    print(f"     {msg}")


def read_hap_bytes(package: pathlib.Path) -> bytes:
    """从 .app(外层 zip)或 .hap 里取出 entry hap 的字节。"""
    with zipfile.ZipFile(package) as z:
        names = z.namelist()
        if "entry-default.hap" in names:
            return z.read("entry-default.hap")
        # 本来就是个 hap
        with tempfile.NamedTemporaryFile(suffix=".hap", delete=False) as tmp:
            tmp.write(z.read(names[0]))
            tmp_path = pathlib.Path(tmp.name)
    return tmp_path.read_bytes()


def find_hap_entry(package: pathlib.Path) -> str:
    with zipfile.ZipFile(package) as z:
        for n in z.namelist():
            if n.endswith(".hap"):
                return n
    return ""


def check_icons(hap_bytes: bytes) -> None:
    from PIL import Image

    with zipfile.ZipFile(io.BytesIO(hap_bytes)) as h:
        for entry in ICON_ENTRIES:
            if entry not in h.namelist():
                bad(f"包里没有 {entry}")
                continue
            data = h.read(entry)
            im = Image.open(io.BytesIO(data))
            if im.mode in ("RGBA", "LA"):
                alpha = im.getchannel("A").getextrema()
                bad(
                    f"{entry} 带 alpha 通道(mode={im.mode}, alpha={alpha})"
                    " —— 审核会判「图标有透明背景」"
                )
            elif im.mode != "RGB":
                bad(f"{entry} 的 mode 是 {im.mode},不是 RGB")
            else:
                ok(f"{entry} {im.size[0]}×{im.size[1]} {im.mode},无 alpha 通道")


def check_pack_info(package: pathlib.Path) -> None:
    with zipfile.ZipFile(package) as z:
        if "pack.info" not in z.namelist():
            bad("包里没有 pack.info")
            return
        info_obj = json.loads(z.read("pack.info").decode("utf-8"))
    app = info_obj["summary"]["app"]
    version = app["version"]
    if app["bundleName"] == EXPECTED_PACKAGE_NAME:
        ok(f"包名 {app['bundleName']}")
    else:
        bad(f"包名是 {app['bundleName']},期望 {EXPECTED_PACKAGE_NAME}")
    ok(f"版本 versionName={version['name']} versionCode={version['code']}")


def check_app_name(hap_bytes: bytes) -> None:
    with zipfile.ZipFile(io.BytesIO(hap_bytes)) as h:
        names = h.namelist()
        candidates = [
            n for n in names
            if n.endswith("string.json") or n.endswith("resources.index")
        ]
        blob = b""
        for n in candidates:
            blob += h.read(n)
    text = blob.decode("utf-8", errors="replace")
    if EXPECTED_APP_NAME in text:
        ok(f"包内能找到应用名「{EXPECTED_APP_NAME}」")
    else:
        bad(f"包里没找到应用名「{EXPECTED_APP_NAME}」")


def check_signature(package: pathlib.Path) -> None:
    """校验签名。

    注意:上架用的 `.app` 是**整包签名**(app-level)—— 签名块在 .app 自己身上,
    里面的 hap 是不带签名的。所以要对 .app 跑 verify-app,不是对里面的 hap。
    """
    tool = next((p for p in SIGN_TOOL_CANDIDATES if p.is_file()), None)
    if tool is None:
        bad("找不到 hap-sign-tool.jar,跳过签名校验")
        return
    with tempfile.TemporaryDirectory() as tmp:
        tmpdir = pathlib.Path(tmp)
        chain = tmpdir / "chain.cer"
        profile = tmpdir / "profile.p7b"
        proc = subprocess.run(
            ["java", "-jar", str(tool), "verify-app", "-inFile", str(package),
             "-outCertChain", str(chain), "-outProfile", str(profile)],
            capture_output=True, text=True, timeout=300,
        )
        if proc.returncode != 0 or not profile.is_file():
            bad(f"签名校验失败:{(proc.stderr or proc.stdout).strip()[-300:]}")
            return
        ok("签名校验通过(hap-sign-tool verify-app)")

        payload = tmpdir / "profile.json"
        subprocess.run(
            ["openssl", "smime", "-verify", "-noverify", "-in", str(profile),
             "-inform", "DER", "-out", str(payload)],
            capture_output=True, timeout=60,
        )
        try:
            prof = json.loads(payload.read_text(encoding="utf-8"))
        except Exception as exc:  # noqa: BLE001
            bad(f"解析包内 profile 失败: {exc}")
            return
        ptype = prof.get("type")
        if ptype == "release":
            ok("包内 profile 类型 = release(发布 Profile)")
        else:
            bad(f"包内 profile 类型 = {ptype},上架包必须是 release")

        release = SIGN_DIR / "app-release.p7b"
        if release.is_file():
            want = hashlib.md5(release.read_bytes()).hexdigest()
            got = hashlib.md5(profile.read_bytes()).hexdigest()
            if want == got:
                ok("包内 profile 与 ohos/signing/app-release.p7b 完全一致")
            else:
                bad(f"包内 profile 与 app-release.p7b 不一致({got} != {want})")


def check_no_third_party_sdk(hap_bytes: bytes) -> None:
    """确认包里没有第三方崩溃上报/埋点 SDK,且只申请了声明过的权限。

    应用市场里写的是「不采集崩溃日志、不收集任何个人信息、仅申请 INTERNET」,
    这一项就是对这些声明的机器校验:上游自带 Sentry 崩溃上报(DSN 写死),
    移植版本已经整体移除,这里防止它被误带回来。
    """
    with zipfile.ZipFile(io.BytesIO(hap_bytes)) as h:
        names = h.namelist()
        blob = b""
        for n in names:
            if n.endswith(".so"):
                blob += h.read(n)
        lib_names = [n for n in names if "sentry" in n.lower()]

    markers = [b"sentry.io", b"o4509780708229120", b"ingest.sentry"]
    found = [m.decode() for m in markers if m in blob]
    if found or lib_names:
        bad(f"包里发现了第三方崩溃上报 SDK 的痕迹:{found or lib_names}")
    else:
        ok("包内无第三方崩溃上报/埋点 SDK(无 sentry 痕迹)")

    with zipfile.ZipFile(io.BytesIO(hap_bytes)) as h:
        module = json.loads(h.read("module.json").decode("utf-8"))
    perms = {p["name"] for p in module.get("module", {}).get("requestPermissions", [])}
    for ability in module.get("module", {}).get("abilities", []):
        perms |= {p["name"] for p in (ability.get("permissions") or [])}
    if perms == {"ohos.permission.INTERNET"}:
        ok("包内只申请 ohos.permission.INTERNET 一个权限(与商店声明一致)")
    else:
        bad(f"包内申请的权限是 {sorted(perms)},商店声明里只写了 INTERNET")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("packages", nargs="*", help="要验收的 .app / .hap 路径")
    ap.add_argument("--skip-signature", action="store_true", help="不跑签名校验")
    args = ap.parse_args()

    packages = [pathlib.Path(p) for p in args.packages] or [
        p for p in DEFAULT_PACKAGES if p.is_file()
    ]
    if not packages:
        print("没有找到可验收的包(默认路径 ohos/build/outputs/default/ohos-default-signed.app)")
        return 1

    for package in packages:
        print(f"\n=== {package} ({package.stat().st_size / 1024 / 1024:.2f} MB) ===")
        if not package.is_file():
            bad("文件不存在")
            continue
        hap_bytes = read_hap_bytes(package)
        check_icons(hap_bytes)
        check_pack_info(package)
        check_app_name(hap_bytes)
        check_no_third_party_sdk(hap_bytes)
        if not args.skip_signature:
            check_signature(package)

    print(f"\n合计: {ok_count} 项通过, {fail_count} 项失败")
    return 1 if fail_count else 0


if __name__ == "__main__":
    raise SystemExit(main())
