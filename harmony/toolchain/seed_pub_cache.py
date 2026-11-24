#!/usr/bin/env python3
"""把 pub 缓存里缺失/损坏的包从可用的归档地址补齐。

背景:
  pub.flutter-io.cn 的 API 元数据里 archive_url 指向
  storage.flutter-io.cn/dartlang-pub-exported-api/latest/api/archives/<pkg>.tar.gz,
  但本机 pub 客户端不认 archive_url,自己按
  storage.flutter-io.cn/dartlang-pub-public-packages/packages/<pkg>.tar.gz
  去下载 —— 那个路径现在对所有包都返回一个几百字节的错误页,
  于是 pub 报 "Downloaded archive ... had wrong content-hash"。

解法:
  从能用的那个路径把归档抓下来,校验 sha256 后直接铺进 pub 缓存
  (hosted/<host>/<name>-<version>/ + hosted-hashes/<host>/<name>-<version>.sha256)。
  pub 发现缓存里已经有且哈希对得上,就不会再去下载。

用法:
  python3 toolchain/ohos/seed_pub_cache.py --packages pdfrx_engine:0.9.1,pdfrx:2.12.0
  python3 toolchain/ohos/seed_pub_cache.py --all      # 处理缓存里所有 hosted 包
"""

import argparse
import hashlib
import json
import os
import shutil
import sys
import tarfile
import tempfile
import urllib.request

PUB_CACHE = os.environ.get("PUB_CACHE", os.path.expanduser("~/.pub-cache"))
HOST = "pub.flutter-io.cn"
API = f"https://{HOST}/api/packages"
ARCHIVE = f"https://{HOST}/api/archives"


def fetch(url: str) -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": "dart-pub/3.0"})
    with urllib.request.urlopen(req, timeout=300) as resp:
        return resp.read()


def metadata(name: str) -> dict:
    return json.loads(fetch(f"{API}/{name}").decode("utf-8"))


def seed(name: str, version: str) -> bool:
    meta = metadata(name)
    entry = next((v for v in meta["versions"] if v["version"] == version), None)
    if entry is None:
        print(f"  !! {name} {version} 不在镜像里")
        return False

    want = entry["archive_sha256"]
    pkg_dir = os.path.join(PUB_CACHE, "hosted", HOST, f"{name}-{version}")
    hash_file = os.path.join(PUB_CACHE, "hosted-hashes", HOST, f"{name}-{version}.sha256")

    # 已经铺好且哈希对得上就跳过。
    if os.path.isdir(pkg_dir) and os.path.isfile(hash_file):
        with open(hash_file) as fh:
            if fh.read().strip() == want:
                print(f"  ok {name}-{version}(缓存已就绪)")
                return True

    print(f"  .. {name}-{version} 下载中")
    try:
        data = fetch(f"{ARCHIVE}/{name}-{version}.tar.gz")
    except Exception as exc:  # noqa: BLE001
        print(f"  !! 下载失败:{exc}")
        return False

    got = hashlib.sha256(data).hexdigest()
    if got != want:
        print(f"  !! 哈希不符:want={want[:16]} got={got[:16]}")
        return False

    with tempfile.TemporaryDirectory() as tmp:
        tarball = os.path.join(tmp, "a.tar.gz")
        with open(tarball, "wb") as fh:
            fh.write(data)
        with tarfile.open(tarball) as tf:
            tf.extractall(tmp, filter="data")
        # pub 归档顶层是 <name>-<version>/,解出来的那层就是包目录。
        entries = [e for e in os.listdir(tmp) if e not in ("a.tar.gz",)]
        src = os.path.join(tmp, entries[0]) if len(entries) == 1 else tmp
        if not os.path.isdir(src):
            print(f"  !! 归档结构异常:{entries}")
            return False
        if os.path.isdir(pkg_dir):
            shutil.rmtree(pkg_dir)
        shutil.copytree(src, pkg_dir)

    os.makedirs(os.path.dirname(hash_file), exist_ok=True)
    with open(hash_file, "w") as fh:
        fh.write(want)

    print(f"  ok {name}-{version}")
    return True


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--packages", help="name:version 列表,逗号分隔")
    ap.add_argument("--all", action="store_true", help="铺满缓存里所有 hosted 包")
    args = ap.parse_args()

    targets = []
    if args.packages:
        for item in args.packages.split(","):
            name, _, version = item.strip().partition(":")
            targets.append((name, version))
    elif args.all:
        base = os.path.join(PUB_CACHE, "hosted", HOST)
        for entry in sorted(os.listdir(base)):
            if "-" not in entry:
                continue
            name, _, version = entry.rpartition("-")
            targets.append((name, version))
    else:
        ap.error("需要 --packages 或 --all")

    failures = []
    for name, version in targets:
        if not seed(name, version):
            failures.append(f"{name}-{version}")

    if failures:
        print(f"\n失败:{len(failures)} 个 —— {', '.join(failures)}")
        return 1
    print("\n全部就绪")
    return 0


if __name__ == "__main__":
    sys.exit(main())
