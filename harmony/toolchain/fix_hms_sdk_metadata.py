#!/usr/bin/env python3
"""给 HarmonyOS(hms) 侧的 SDK 组件补上 `sdk-pkg.json`。

背景
----
hvigor 的 SDK loader 对两种 SDK 用两种元数据文件名:

| SDK 类型 | 元数据文件 | 结构 |
|---|---|---|
| OpenHarmony (`openharmony/`) | `oh-uni-package.json` | 平铺:`{"apiVersion": 18, "path": "toolchains", ...}` |
| HarmonyOS (`hms/`) | `sdk-pkg.json` | 带 `data`:`{"meta": {...}, "data": {"apiVersion": 18, ...}}` |

只装了 OpenHarmony 那套元数据时,hvigor 走 hms 分支就会报:

    00303168 Configuration Error
    Error Message: SDK component missing.

本脚本为 `sdk/default/hms/<组件>/` 补齐 `sdk-pkg.json`(HMS 格式),
并把 apiVersion / version 对齐到目标 API。

用法: python3 fix_hms_sdk_metadata.py [api=18]
"""

from __future__ import annotations

import os
import json
import pathlib
import sys

ROOT = pathlib.Path(
    os.environ.get("SABER_OHOS_ROOT", str(pathlib.Path(__file__).resolve().parents[3]))
)
DEVECO_SDK = ROOT / "deveco-tools/command-line-tools/sdk/default"
COMPONENTS = ("ets", "js", "native", "previewer", "toolchains")
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
PLATFORM_BY_API = {
    12: "5.0.0",
    13: "5.0.1",
    14: "5.0.2",
    15: "5.0.3",
    16: "5.1.0",
    17: "5.1.0",
    18: "5.1.0",
    19: "5.1.1",
    20: "6.0.0",
    21: "6.0.1",
    22: "6.1.0",
    23: "6.1.0",
    24: "6.1.1",
    21: "6.0.1",
}


def main() -> None:
    api = int(sys.argv[1]) if len(sys.argv) > 1 else 18
    version = VERSION_BY_API.get(api, "5.1.0.107")
    platform = PLATFORM_BY_API.get(api, "5.1.0")

    # HarmonyOS SDK 的组件直接放在 <sdk>/default/<组件>/(不是 default/hms/<组件>/)
    hms = DEVECO_SDK
    for comp in COMPONENTS:
        d = hms / comp
        if not d.is_dir():
            print(f"  [skip] {d} 不存在")
            continue
        pkg = {
            "meta": {"version": "1.0.0"},
            "data": {
                "apiVersion": str(api),
                "displayName": comp.capitalize(),
                "path": comp,
                "releaseType": "Release",
                "stage": "Release",
                "version": version,
                "platformVersion": platform,
            },
        }
        # loader 扫描 sdk-pkg.json,存在性校验看 uni-package.json,两个都要
        for name in ("sdk-pkg.json", "uni-package.json"):
            p = d / name
            p.write_text(json.dumps(pkg, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
            print(f"  [ok] {p}")

    # 根目录的 sdk-pkg.json 也对齐一下版本
    root_pkg = DEVECO_SDK / "sdk-pkg.json"
    if root_pkg.exists():
        d = json.loads(root_pkg.read_text(encoding="utf-8"))
        data = d.setdefault("data", {})
        data["apiVersion"] = str(api)
        data["version"] = version
        data["platformVersion"] = platform
        data["displayName"] = f"HarmonyOS {platform}"
        data["path"] = f"HarmonyOS-{platform}"
        root_pkg.write_text(json.dumps(d, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        print(f"  [ok] {root_pkg}")
    print(f"==> 完成 (API {api})")


if __name__ == "__main__":
    main()
