#!/usr/bin/env python3
"""把 Flutter-OH 引擎 har 的 API 版本声明下调到当前 SDK 能提供的版本。

背景
----
Flutter-OH 3.47.9-ohos-1.0.0 的引擎 har(`flutter_embedding_*.har`)里写着:

    oh-package.json5 : "compatibleSdkVersion": 24, "compatibleSdkType": "HarmonyOS"
    module.json      : "minAPIVersion": 60101024, "targetAPIVersion": 60101024
                        "compileSdkVersion": "6.1.1.125"

也就是它要求 HarmonyOS 6.1.1(API 24)。而:

  * 官方 HarmonyOS SDK 需要登录 developer.huawei.com 下载(本机 403);
  * OpenHarmony 公开 SDK 最新只到 API 20;
  * 老版本 hvigor(5.18.5)的 osVersionMapper 只认到 5.1.0(18);
    现在装的 hvigor 6.21.1 已认到 6.0.1(21),但 har 里声明的 24 依然超纲。

于是 hvigor 在 MergeProfile 阶段直接报:
    Specification Limit Violation
    The compatibleSDKVersion 18 cannot be smaller than 24 declared in library flutter.

本脚本把 har 里的 API 声明下调到当前 SDK 的 21(= 6.0.1(21)),让 hvigor 的校验通过,
引擎的 ArkTS 代码则按当前 SDK 编译。

用法: python3 patch_engine_har_api.py [api=21]
"""

from __future__ import annotations

import os
import io
import json
import pathlib
import shutil
import sys
import tarfile

# 版本号编码: major(1) minor(2) patch(2) api(3)  —— 例如 5.1.0(18) -> 50100018
VERSION_BY_API = {
    12: (5, 0, 0, 12),
    13: (5, 0, 1, 13),
    14: (5, 0, 2, 14),
    15: (5, 0, 3, 15),
    16: (5, 1, 0, 16),
    17: (5, 1, 0, 17),
    18: (5, 1, 0, 18),
    21: (6, 0, 1, 21),
    19: (5, 1, 1, 19),
    20: (6, 0, 0, 20),
    21: (6, 0, 0, 21),
    22: (6, 0, 0, 22),
    23: (6, 1, 0, 23),
    24: (6, 1, 1, 24),
}


def encode_version(api: int) -> int:
    major, minor, patch, a = VERSION_BY_API[api]
    return int(f"{major}{minor:02d}{patch:02d}{a:03d}")


def patch_oh_package(raw: bytes, api: int) -> bytes:
    text = raw.decode("utf-8")
    if '"compatibleSdkVersion"' not in text:
        return raw
    import re

    text = re.sub(
        r'"compatibleSdkVersion"\s*:\s*\d+',
        f'"compatibleSdkVersion":{api}',
        text,
    )
    return text.encode("utf-8")


def patch_module_json(raw: bytes, api: int) -> bytes:
    text = raw.decode("utf-8")
    version = encode_version(api)
    import re

    text = re.sub(r'"minAPIVersion"\s*:\s*\d+', f'"minAPIVersion": {version}', text)
    text = re.sub(r'"targetAPIVersion"\s*:\s*\d+', f'"targetAPIVersion": {version}', text)
    return text.encode("utf-8")


def patch_har(path: pathlib.Path, api: int) -> bool:
    data = path.read_bytes()
    # har 是 gzip 压缩的 tar
    try:
        raw = gzip_decompress(data)
    except Exception:
        return False

    members = {}
    with tarfile.open(fileobj=io.BytesIO(raw), mode="r:") as tf:
        for member in tf.getmembers():
            if member.isfile():
                f = tf.extractfile(member)
                assert f is not None
                members[member.name] = (member, f.read())

    changed = False
    out_members = {}
    for name, (member, content) in members.items():
        if name.endswith("oh-package.json5"):
            new = patch_oh_package(content, api)
        elif name.endswith("module.json"):
            new = patch_module_json(content, api)
        else:
            new = content
        if new != content:
            changed = True
        member.size = len(new)
        out_members[name] = (member, new)

    if not changed:
        return False

    buf = io.BytesIO()
    with tarfile.open(fileobj=buf, mode="w") as tf:
        for name, (member, content) in out_members.items():
            tf.addfile(member, io.BytesIO(content))
    path.write_bytes(gzip_compress(buf.getvalue()))
    return True


def gzip_decompress(data: bytes) -> bytes:
    import gzip

    return gzip.decompress(data)


def gzip_compress(data: bytes) -> bytes:
    import gzip

    return gzip.compress(data, 9)


def main() -> None:
    api = int(sys.argv[1]) if len(sys.argv) > 1 else 18
    root = pathlib.Path(
        sys.argv[2]
        if len(sys.argv) > 2
        else os.environ.get(
            "FLUTTER_ROOT",
            str(pathlib.Path(__file__).resolve().parents[3] / "flutter"),
        )
    )
    engine = root / "bin/cache/artifacts/engine"
    count = 0
    for har in sorted(engine.glob("ohos-*/*.har")):
        if patch_har(har, api):
            print(f"  [ok] {har.relative_to(root)} -> API {api}")
            count += 1
        else:
            print(f"  [--] {har.relative_to(root)} 无需修改")
    print(f"==> 共修改 {count} 个 har (API {api})")


if __name__ == "__main__":
    main()
