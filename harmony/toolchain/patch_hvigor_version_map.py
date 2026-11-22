#!/usr/bin/env python3
"""给 hvigor 的 SDK 版本映射表补上较新的 HarmonyOS 版本。

hvigor 自带的 `osVersionMapper` 只认到 5.1.0(18)(OpenHarmony 5.1.0 / HarmonyOS 5.1.0),
而 DevEco 6.0.1 的 HarmonyOS SDK 是 6.0.1(API 21),不在表里,
于是 loader 认为组件“不兼容”,报:

    00303168 Configuration Error
    Error Message: SDK component missing.

这里往 `hos-config.json` / `ohos-config.json` 的 osVersionMapper 里补上新版本。

用法: python3 patch_hvigor_version_map.py [platform=api, ...]
"""
from __future__ import annotations

import os
import json
import pathlib
import sys

ROOT = pathlib.Path(
    os.environ.get(
        "DEVECO_TOOLS",
        str(pathlib.Path(__file__).resolve().parents[3] / "deveco-tools/command-line-tools"),
    )
) / "hvigor/hvigor-ohos-plugin/node_modules/@ohos"
DEFAULT = {"6.0.0": "20", "6.0.1": "21"}


def patch(path: pathlib.Path, extra: dict[str, str]) -> bool:
    if not path.exists():
        return False
    d = json.loads(path.read_text(encoding="utf-8"))
    m = d.setdefault("osVersionMapper", {})
    changed = False
    for k, v in extra.items():
        if m.get(k) != v:
            m[k] = v
            changed = True
    if changed:
        path.write_text(json.dumps(d, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    return changed


def main() -> None:
    extra = dict(DEFAULT)
    if len(sys.argv) > 1:
        extra = {}
        for item in sys.argv[1].split(","):
            k, v = item.split("=")
            extra[k] = v
    for name in ("hos-sdkmanager-common/build/res/hos-config.json",
                 "sdkmanager-common/build/res/ohos-config.json"):
        p = ROOT / name
        if p.exists() and patch(p, extra):
            print(f"  [ok] {p}")
    print("==> 完成")


if __name__ == "__main__":
    main()
