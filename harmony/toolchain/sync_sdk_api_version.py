#!/usr/bin/env python3
"""把 OpenHarmony SDK 各组件的 API 版本元数据统一。

背景
----
官方 SDK 的每个组件目录(ets / js / native / previewer / toolchains)里都有
一个 `oh-uni-package.json`,里面写着这个组件的 `apiVersion`。
hvigor 的 SDK loader 会校验各组件的 apiVersion 是否一致,不一致就报:

    00303168 Configuration Error
    Error Message: SDK component missing.

本机的情况是:
  * ets / js / toolchains 换成了官方 5.1.0(API 18)的 linux-x64 版本
    —— 因为原来那份是 aarch64 的,restool / es2abc 在 x86_64 主机上跑不起来;
  * native / previewer 仍是 6.0.0.49(API 20)那份(构建用不到其中的可执行文件)。

所以这里把各组件的 apiVersion 统一成 18,并把 SDK 根目录也改名成 18。

用法: python3 sync_sdk_api_version.py [api=18]
"""

from __future__ import annotations

import os
import json
import pathlib
import shutil
import sys

ROOT = pathlib.Path(
    os.environ.get("SABER_OHOS_ROOT", str(pathlib.Path(__file__).resolve().parents[3]))
)
SDK_ROOT = ROOT / "ohos-sdk-root/ohos-sdk"
DEVECO_SDK = ROOT / "deveco-tools/command-line-tools/sdk/default"
COMPONENTS = ("ets", "js", "native", "previewer", "toolchains")


# 组件版本号必须与目标 API 的平台版本一致,否则 loader 认为「组件缺失」
VERSION_BY_API = {
    12: "5.0.0.1",
    13: "5.0.1.1",
    14: "5.0.2.1",
    15: "5.0.3.1",
    16: "5.1.0.1",
    17: "5.1.0.1",
    18: "5.1.0.107",
    19: "5.1.1.1",
    20: "6.0.0.49",
    21: "6.0.1.1",
    22: "6.1.0.1",
    23: "6.1.0.1",
    24: "6.1.1.125",
    21: "6.0.1.112",
}


def set_api_version(path: pathlib.Path, api: int) -> bool:
    if not path.exists():
        return False
    try:
        d = json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError:
        return False
    want_version = VERSION_BY_API.get(api)
    changed = False
    if d.get("apiVersion") != str(api):
        d["apiVersion"] = str(api)
        changed = True
    if want_version and d.get("version") != want_version:
        d["version"] = want_version
        changed = True
    if not changed:
        return False
    path.write_text(json.dumps(d, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    return True


def main() -> None:
    api = int(sys.argv[1]) if len(sys.argv) > 1 else 18

    # 1) 各组件的 oh-uni-package.json
    trees = [DEVECO_SDK / "hms", DEVECO_SDK / "openharmony"]
    for api_dir in sorted(SDK_ROOT.glob("*")):
        if api_dir.is_dir() and api_dir.name.isdigit():
            trees.append(api_dir)
    for tree in trees:
        for comp in COMPONENTS:
            p = tree / comp / "oh-uni-package.json"
            if set_api_version(p, api):
                print(f"  [ok] {p} -> apiVersion {api}")

    # 2) SDK 根目录按 API 版本命名
    old = SDK_ROOT / "20"
    new = SDK_ROOT / str(api)
    if old.exists() and not new.exists():
        old.rename(new)
        print(f"  [ok] {old} -> {new}")

    # 3) SDK 根的 sdk-pkg.json
    pkg = SDK_ROOT / str(api) / "sdk-pkg.json"
    if pkg.exists():
        d = json.loads(pkg.read_text(encoding="utf-8"))
        data = d.get("data", {})
        if data.get("apiVersion") != str(api):
            data["apiVersion"] = str(api)
            data.setdefault("displayName", f"HarmonyOS {data.get('platformVersion', '5.1.0')}")
            pkg.write_text(json.dumps(d, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
            print(f"  [ok] {pkg} -> apiVersion {api}")

    print(f"==> 完成 (API {api})")


if __name__ == "__main__":
    main()
