#!/usr/bin/env python3
"""给 release(AOT)构建打的三处源码补丁。

平台无关的一半。Linux 侧还需要额外做两件事(装 Wine、下载 Windows 版
gen_snapshot),那部分在 harmony/toolchain/setup_ohos_aot.sh 里;Windows 上
AOT 快照器是原生 exe,由 SDK 自己按 bin/internal/dart-sdk-url.ohos 的覆盖
机制拉取(kernel 138,与本分支的 Dart 3.13.3 匹配)。

三处补丁:

  1. flutter_tools/build_system/targets/common.dart
     frontend_server 的 --target-os 白名单里没有 'ohos',而且缺 ohos 的 ABI
     映射("AbiSpecificInteger 'Int32' is missing mapping for 'ohos_arm64'")。
     改成传 'linux' —— 语义上也对,OpenHarmony 的 Dart 运行时本就是 Linux 系。

  2. flutter framework:加一个编译期开关 FLUTTER_OHOS_AOT_BUILD
     (委托给 harmony/toolchain/patch_ohos_aot_platform.py,那份本来就跨平台)。
     传 'linux' 会让 Platform.isLinux 折叠成常量 true,框架与插件注册表会把
     鸿蒙误判成桌面 Linux,这个开关强制判定为 ohos。

  3. flutter_tools/flutter_plugins.dart:把 ohos 分支提到插件注册表最前面。
     同上,否则注册的是桌面 Linux 插件(path_provider_linux 等),应用白屏。

用法:
    python harmony/toolchain/setup_ohos_aot.py [--flutter <FLUTTER_ROOT>]
"""
from __future__ import annotations

import argparse
import os
import pathlib
import subprocess
import sys

TOOLS = "packages/flutter_tools/lib/src"

# --- patch 1: common.dart ---------------------------------------------------
CTX_OLD = """      TargetPlatform.ohos ||
      TargetPlatform.ohos_arm ||
      TargetPlatform.ohos_arm64 ||
      TargetPlatform.ohos_x64 => 'ohos',"""

CTX_NEW = """      TargetPlatform.ohos ||
      TargetPlatform.ohos_arm ||
      TargetPlatform.ohos_arm64 ||
      TargetPlatform.ohos_x64 =>
        globals.platform.environment['FLUTTER_OHOS_AOT_TARGET_OS'] ?? 'linux',"""

CT_IMPORT_OLD = "import '../../globals.dart' as globals show xcode;"
CT_IMPORT_NEW = "import '../../globals.dart' as globals show platform, xcode;"

CTX_MARKER = "FLUTTER_OHOS_AOT_TARGET_OS"

# --- patch 3: flutter_plugins.dart ------------------------------------------
FP_HEAD_OLD = """  static void register() {
    if (Platform.isAndroid) {
      {{#android}}
$_dartPluginRegisterWith
      {{/android}}
    } else if (Platform.isIOS) {"""

FP_HEAD_NEW = """  static void register() {
    // OHOS: the ohos branch must come first.
    // --target-os=linux folds Platform.isLinux into the constant true, so
    // without this the desktop Linux plugins get registered (e.g.
    // path_provider_linux) and the app renders a white screen.
    if (const bool.fromEnvironment('FLUTTER_OHOS_AOT_BUILD') ||
        Platform.operatingSystem == 'ohos') {
      {{#ohos}}
$_dartPluginRegisterWith
      {{/ohos}}
    } else if (Platform.isAndroid) {
      {{#android}}
$_dartPluginRegisterWith
      {{/android}}
    } else if (Platform.isIOS) {"""

FP_TAIL_OLD = """    } else if (Platform.isWindows) {
      {{#windows}}
$_dartPluginRegisterWith
      {{/windows}}
    } else if (Platform.operatingSystem == 'ohos') {
      {{#ohos}}
$_dartPluginRegisterWith
      {{/ohos}}
    }
  }
}"""

FP_TAIL_NEW = """    } else if (Platform.isWindows) {
      {{#windows}}
$_dartPluginRegisterWith
      {{/windows}}
    }
  }
}"""

# The bash implementation of this patch (which this script replaced)
# used a Chinese marker; accept both so an SDK that was patched by
# either one is recognised as already patched.
FP_MARKER = ("the ohos branch must come first", "鸿蒙分支必须放在最前面")


def patch_file(
    path: pathlib.Path,
    pairs: list[tuple[str, str]],
    marker: str | tuple[str, ...],
    label: str,
) -> bool:
    """Apply replacements; return True when the file changed."""
    src = path.read_text(encoding="utf-8")
    markers = (marker,) if isinstance(marker, str) else marker
    if any(m in src for m in markers):
        print(f"    [skip] {label}: already patched")
        return False
    out = src
    applied = 0
    for old, new in pairs:
        if old in out:
            out = out.replace(old, new, 1)
            applied += 1
    if applied == 0:
        print(f"    [error] {label}: anchor not found (flutter_tools version changed?)", file=sys.stderr)
        raise SystemExit(2)
    path.write_text(out, encoding="utf-8")
    print(f"    [ok] {label}: patched ({applied} hunk(s))")
    return True


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--flutter", default="", help="Flutter-OH SDK root")
    args = ap.parse_args()

    root_arg = args.flutter or os.environ.get("FLUTTER_ROOT", "")
    if not root_arg:
        print("[error] need --flutter or FLUTTER_ROOT", file=sys.stderr)
        return 1
    root = pathlib.Path(root_arg)

    changed = False

    print("==> 1/3 flutter_tools: --target-os=linux for the ohos target")
    ct = root / TOOLS / "build_system" / "targets" / "common.dart"
    changed |= patch_file(
        ct,
        [(CTX_OLD, CTX_NEW), (CT_IMPORT_OLD, CT_IMPORT_NEW)],
        CTX_MARKER,
        "common.dart target-os",
    )

    print("==> 2/3 flutter framework: FLUTTER_OHOS_AOT_BUILD switch")
    toolchain = pathlib.Path(__file__).resolve().parents[0]
    patcher = toolchain / "patch_ohos_aot_platform.py"
    if patcher.is_file():
        env = dict(os.environ)
        env["FLUTTER_ROOT"] = str(root)
        # the console here is GBK; force UTF-8 so the helper script's unicode
        # symbols (e.g. the check mark) do not blow up
        env["PYTHONIOENCODING"] = "utf-8"
        # the framework patch is idempotent; detect "already patched" up front so
        # we do not force a flutter_tools rebuild on every single build
        marker = "_kOhosAotBuild"
        fw = root / "packages" / "flutter" / "lib" / "src"
        already = any(
            marker in f.read_text(encoding="utf-8", errors="ignore")
            for f in (
                fw / "foundation" / "_platform_io.dart",
                fw / "widgets" / "_window_io.dart",
            )
            if f.is_file()
        )
        rc = subprocess.call([sys.executable, str(patcher)], env=env)
        if rc != 0:
            print(f"    [error] patch_ohos_aot_platform.py returned {rc}", file=sys.stderr)
            return rc
        changed = changed or not already
    else:
        print(f"    [error] not found: {patcher}", file=sys.stderr)
        return 1

    print("==> 3/3 flutter_tools: ohos branch first in the plugin registry")
    fp = root / TOOLS / "flutter_plugins.dart"
    changed |= patch_file(
        fp,
        [(FP_HEAD_OLD, FP_HEAD_NEW), (FP_TAIL_OLD, FP_TAIL_NEW)],
        FP_MARKER,
        "flutter_plugins.dart plugin registry",
    )

    if changed:
        # The tool source changed -> let flutter rebuild its snapshot.
        for name in ("flutter_tools.stamp", "flutter_tools.snapshot"):
            p = root / "bin" / "cache" / name
            if p.exists():
                p.unlink()
                print(f"    [ok] removed {name} (flutter rebuilds it on next run)")
    else:
        print("    (nothing to do)")
    print("==> AOT patches ready")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
