#!/usr/bin/env python3
"""Align the engine's const_finder snapshot with the host Dart SDK.

Background
----------
`flutter build hap --release` runs the engine's host tool
`artifacts/engine/<host>/const_finder.dart.snapshot` to shake the icon tree.
That snapshot is a **JIT snapshot built with the Dart SDK the engine artifacts
were built with** (revision 416e33b0ff, i.e. stock Dart 3.13.7), and it also
embeds the SDK hash that `package:kernel` compares a kernel against.

On Windows the host Dart SDK is the ohos-customised build (revision
e8c31beb6a, Dart 3.13.3), so:

  * the VM refuses to load the snapshot at all
    ("Can't load Kernel binary: Invalid SDK hash." - that message is about the
    *snapshot*, not about the kernel), and
  * even if it loaded, `package:kernel` would demand the engine's hash
    (416e33b0ff) while our kernel records ours (e8c31beb6a).

Both live in the same string inside the snapshot, so one in-place patch of
that string fixes both checks:

    416e33b0ff  ->  <host dart sdk revision, first 10 chars>

(That is exactly what the Linux build gets for free: the fork's custom
Dart SDK zeroes the SDK hash, and `package:kernel` treats an all-zero hash
as "do not check".)

The patch is idempotent and re-applied automatically by setup_sdk.ps1, because
`flutter precache` re-downloads the engine artifacts and would otherwise
undo it.

Usage:
    python harmony/toolchain/windows/align_const_finder.py --flutter <FLUTTER_ROOT>
"""
from __future__ import annotations

import argparse
import pathlib
import sys

# The SDK hash the engine's host tools were built with (stock Dart 3.13.7).
ENGINE_SDK_HASH = b"416e33b0ff"


def host_sdk_hash(cache: pathlib.Path) -> str | None:
    """First 10 chars of the host Dart SDK's git revision."""
    revision = cache / "dart-sdk" / "revision"
    if not revision.is_file():
        return None
    text = revision.read_text(encoding="utf-8").strip()
    return text[:10] if len(text) >= 10 else None


def patch(snapshot: pathlib.Path, target: bytes) -> bool:
    data = snapshot.read_bytes()
    if target in data:
        print(f"    [skip] {snapshot.name}: already aligned to {target.decode()}")
        return False
    if ENGINE_SDK_HASH not in data:
        print(
            f"    [error] {snapshot.name}: neither {ENGINE_SDK_HASH.decode()} nor "
            f"{target.decode()} found - the engine artifacts changed?",
            file=sys.stderr,
        )
        raise SystemExit(2)
    count = data.count(ENGINE_SDK_HASH)
    snapshot.write_bytes(data.replace(ENGINE_SDK_HASH, target))
    print(f"    [ok] {snapshot.name}: {count} occurrence(s) {ENGINE_SDK_HASH.decode()} -> {target.decode()}")
    return True


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--flutter", default="", help="Flutter-OH SDK root")
    args = ap.parse_args()

    root = pathlib.Path(args.flutter or pathlib.Path(sys.argv[0]).resolve().parents[3])
    cache = root / "bin" / "cache"

    target = host_sdk_hash(cache)
    if not target:
        print("    [warn] no host dart-sdk/revision found; cannot align", file=sys.stderr)
        return 0
    print(f"    host Dart SDK hash = {target}")

    engine = cache / "artifacts" / "engine"
    if not engine.is_dir():
        print("    [warn] no engine artifacts yet; nothing to do", file=sys.stderr)
        return 0

    changed = False
    for snapshot in sorted(engine.glob("*/const_finder.dart.snapshot")):
        changed |= patch(snapshot, target.encode())
    if not changed:
        print("    (nothing to do)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
