#!/usr/bin/env python3
"""为 Linux 主机补齐 Flutter-OH 缺失的 OpenHarmony Dart ABI 支持。

背景
----
Flutter-OH(OpenHarmony-TPC/flutter_flutter)官方只发布 macOS / Windows 主机的
定制 Dart SDK(dart-sdk-ohos.zip / dart-sdk-ohos-windows-x64.zip),从未发布
linux-x64 版本;而 dart-sdk-ohos.zip 里带的 dartaotruntime 其实是 **macOS
(Mach-O arm64)** 二进制,在 Linux 上根本跑不起来。

Dart SDK 源码侧的 OpenHarmony 补丁是必需的:

* ``sdk/lib/ffi/abi.dart``
  ``dart:ffi`` 需要 ``Abi.ohosArm`` / ``Abi.ohosArm64`` / ``Abi.ohosX64``。
* ``sdk/lib/ffi/c_type.dart``
  ``@AbiSpecificIntegerMapping`` 注解表需要 ohos 条目。
* ``pkg/vm/lib/modular/transformations/ffi/abi.dart``
  CFE 需要把 ohos ABI 映射到原生类型,否则编译任何用到 dart:ffi 的
  Flutter-OH 应用都会崩:

  ``Type IntPtr has no mapping for ABI InstanceConstant(const Abi{Abi._os:
  const _OS{_Enum.index: 1, _Enum._name: "ohos"}, ...})``

用法: ``python3 patch_dart_sdk_ohos.py <dart-sdk-源码根目录>``
"""

from __future__ import annotations

import pathlib
import re
import sys

OHOS_ABIS = ("ohosArm", "ohosArm64", "ohosX64")
ARCH_OF = {"ohosArm": "arm", "ohosArm64": "arm64", "ohosX64": "x64"}


def patch_abi_enum(path: pathlib.Path) -> None:
    """给 dart:ffi(或 CFE 内部镜像)的 Abi 加上 ohos 三个 ABI。"""
    src = path.read_text(encoding="utf-8")
    if "ohosArm64" in src:
        print(f"  [skip] {path.name} 已含 ohos ABI")
        return

    # 1) _OS 枚举:把 ohos 追加到**末尾**,保持既有 index 不变
    #    (VM 内置的 Abi.current() 按 index 构造实例,打乱顺序会误判宿主平台)
    m = re.search(r"enum _OS \{ ([^}]*) \}", src)
    if not m:
        raise SystemExit(f"{path}: 找不到 _OS 枚举")
    if "ohos" not in m.group(1):
        src = src[: m.end(1)] + ", ohos" + src[m.end(1) :]

    # 2) 公开常量:static const ohosArm = _ohosArm;
    decls = "".join(
        f"  /// The application binary interface for OpenHarmony on the "
        f"{a} architecture.\n  static const {n} = _{n};\n\n"
        for n, a in (("ohosArm", "Arm"), ("ohosArm64", "Arm64"), ("ohosX64", "X64"))
    )
    anchor = "  static const androidRiscv64 = _androidRiscv64;\n"
    if anchor not in src:
        raise SystemExit(f"{path}: 找不到 androidRiscv64 锚点")
    src = src.replace(anchor, anchor + "\n" + decls.rstrip("\n") + "\n", 1)

    # 3) values 列表
    m = re.search(r"( *)androidRiscv64,\n", src)
    if not m:
        raise SystemExit(f"{path}: 找不到 values 中的 androidRiscv64")
    indent = m.group(1)
    src = src.replace(
        m.group(0),
        m.group(0) + "".join(f"{indent}{n},\n" for n in OHOS_ABIS),
        1,
    )

    # 4) 私有常量:static const _ohosArm = Abi._(_Architecture.arm, _OS.ohos);
    priv = "".join(
        f"  static const _{n} = Abi._(_Architecture.{ARCH_OF[n]}, _OS.ohos);\n"
        for n in OHOS_ABIS
    )
    anchor = "  static const _androidRiscv64 = Abi._(_Architecture.riscv64, _OS.android);\n"
    if anchor not in src:
        raise SystemExit(f"{path}: 找不到 _androidRiscv64 锚点")
    src = src.replace(anchor, anchor + priv, 1)

    path.write_text(src, encoding="utf-8")
    print(f"  [ok] {path.name}: 已加入 ohos ABI")


def patch_c_type(src: pathlib.Path) -> None:
    """给 dart:ffi 的 @AbiSpecificIntegerMapping 注解表加 ohos 条目。"""
    p = src / "sdk/lib/ffi/c_type.dart"
    s = p.read_text(encoding="utf-8")
    if "Abi.ohosArm" in s:
        print("  [skip] c_type.dart 已含 ohos 注解")
        return

    def repl(m: re.Match[str]) -> str:
        indent, ty = m.group(1), m.group(2)
        extra = "".join(f"{indent}Abi.{n}: {ty}(),\n" for n in OHOS_ABIS)
        return m.group(0) + extra

    s2, n = re.subn(r"( *)(Abi\.androidRiscv64: (\w+)\(\),\n)", repl, s)
    p.write_text(s2, encoding="utf-8")
    print(f"  [ok] c_type.dart: {n} 处注解表已加入 ohos 条目")


def patch_cfe(src: pathlib.Path) -> None:
    """给 CFE 的 abiNames / nonSizeAlignment 加 ohos。"""
    p = src / "pkg/vm/lib/modular/transformations/ffi/abi.dart"
    s = p.read_text(encoding="utf-8")
    if "Abi.ohosArm64: 'ohosArm64'" in s:
        print("  [skip] CFE abiNames 已含 ohos")
        return

    anchor = "  Abi.androidRiscv64: 'androidRiscv64',\n"
    if anchor not in s:
        raise SystemExit("CFE abi.dart: 找不到 androidRiscv64 锚点")
    s = s.replace(
        anchor,
        anchor
        + "  Abi.ohosArm: 'ohosArm',\n"
        + "  Abi.ohosArm64: 'ohosArm64',\n"
        + "  Abi.ohosX64: 'ohosX64',\n",
        1,
    )

    anchor = "  Abi.androidArm64: _wordSize64,\n"
    if anchor not in s:
        raise SystemExit("CFE abi.dart: 找不到 androidArm64 对齐锚点")
    s = s.replace(
        anchor, anchor + "  Abi.ohosArm64: _wordSize64,\n  Abi.ohosX64: _wordSize64,\n", 1
    )

    anchor = "  Abi.androidArm: _wordSize32Align64,\n"
    if anchor not in s:
        raise SystemExit("CFE abi.dart: 找不到 androidArm 对齐锚点")
    s = s.replace(anchor, anchor + "  Abi.ohosArm: _wordSize32Align64,\n", 1)

    p.write_text(s, encoding="utf-8")
    print("  [ok] CFE abiNames / nonSizeAlignment 已加入 ohos")


def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit("用法: patch_dart_sdk_ohos.py <dart-sdk-源码根目录>")
    root = pathlib.Path(sys.argv[1]).resolve()
    print(f"==> 打补丁: {root}")

    patch_abi_enum(root / "sdk/lib/ffi/abi.dart")
    patch_abi_enum(root / "pkg/vm/lib/modular/transformations/ffi/abi.dart")
    patch_c_type(root)
    patch_cfe(root)

    print("==> 补丁完成")


if __name__ == "__main__":
    main()
