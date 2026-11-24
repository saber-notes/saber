#!/usr/bin/env python3
"""patch_ohos_aot_platform.py —— 修正「用 --target-os=linux 编 AOT 时鸿蒙被误判」的问题

## 背景

Linux 主机上没有可用的 ohos 版 `frontend_server`(fork 只发布了 macOS/Windows
两版),所以 AOT 编译时只能传 `--target-os=linux`。

但 `--target-os` 的作用就是**把 `Platform.isXxx` 常量折叠进 AOT 快照**。
用它编出来的包里 `Platform.isLinux` 恒为 `true`,于是 Flutter 框架的

    _platform_io.dart:  if (Platform.isLinux) result = TargetPlatform.linux;
                        ... else if (Platform.operatingSystem == 'ohos') ...

永远先命中 Linux 分支,`defaultTargetPlatform` 变成 `TargetPlatform.linux`。
后果:插件按桌面 Linux 选实现,`path_provider` 拿不到文档目录,应用白屏:

    SEVERE: ErrorLogger: MissingPlatformDirectoryException(
        Unable to get application documents directory)

## 做法

给框架加一个编译期开关 `FLUTTER_OHOS_AOT_BUILD`,为 true 时直接判定为
`TargetPlatform.ohos`,跳过 `Platform.isLinux` 那条错误分支。

构建时带:`--dart-define=FLUTTER_OHOS_AOT_BUILD=true`

## 注意

这是**工具链侧的权宜之计**,不属于 saber 本身的改动。真正干净的做法是
从 Dart 源码构建一份 `TargetOS` 白名单里含 `ohos` 的 `frontend_server`,
那时就不需要本补丁了。

用法:
    python3 patch_ohos_aot_platform.py [--revert]
"""
import os
import pathlib
import sys

FLUTTER_LIB = str(
    pathlib.Path(
        os.environ.get(
            "FLUTTER_ROOT",
            str(pathlib.Path(__file__).resolve().parents[3] / "flutter"),
        )
    )
    / "packages/flutter/lib/src"
)

PLATFORM_IO = FLUTTER_LIB + '/foundation/_platform_io.dart'
WINDOW_IO = FLUTTER_LIB + '/widgets/_window_io.dart'

CONST_DEF = """
/// OHOS: 用 `--target-os=linux` 编出来的 AOT 快照里 `Platform.isLinux` 恒为
/// true,会把鸿蒙误判成桌面 Linux。构建时用
/// `--dart-define=FLUTTER_OHOS_AOT_BUILD=true` 打开本开关,直接判定为鸿蒙。
///
/// 详见 toolchain/patch_ohos_aot_platform.py。
const bool _kOhosAotBuild = bool.fromEnvironment('FLUTTER_OHOS_AOT_BUILD');
"""


def patch_platform_io(revert=False):
    src = open(PLATFORM_IO).read()
    marker = "if (_kOhosAotBuild) {"

    if revert:
        if marker in src:
            src = src.replace(
                "  if (_kOhosAotBuild) {\n"
                "    result = platform.TargetPlatform.ohos;\n"
                "  } else if (Platform.isAndroid) {",
                "  if (Platform.isAndroid) {")
            src = src.replace(CONST_DEF, "")
            open(PLATFORM_IO, 'w').write(src)
            print("  已还原 _platform_io.dart")
        return

    if marker in src:
        print("  _platform_io.dart 已打过补丁,跳过")
        return

    # 1. 插入常量定义
    anchor = 'export \'platform.dart\' show TargetPlatform;\n'
    assert anchor in src
    src = src.replace(anchor, anchor + CONST_DEF, 1)

    # 2. 在判定链最前面插入 ohos 分支
    old = "  platform.TargetPlatform? result;\n  if (Platform.isAndroid) {"
    new = ("  platform.TargetPlatform? result;\n"
           "  if (_kOhosAotBuild) {\n"
           "    result = platform.TargetPlatform.ohos;\n"
           "  } else if (Platform.isAndroid) {")
    assert old in src
    src = src.replace(old, new, 1)

    open(PLATFORM_IO, 'w').write(src)
    print("  ✓ _platform_io.dart")


def patch_window_io(revert=False):
    src = open(WINDOW_IO).read()
    marker = "if (_kOhosAotBuild) {"

    if revert:
        if marker in src:
            src = src.replace(
                "  if (_kOhosAotBuild) {\n"
                "    return ohosWindowingSupported ? WindowingOwnerOHOS() : null;\n"
                "  } else if (Platform.isWindows) {",
                "  if (Platform.isWindows) {")
            src = src.replace(CONST_DEF, "")
            open(WINDOW_IO, 'w').write(src)
            print("  已还原 _window_io.dart")
        return

    if marker in src:
        print("  _window_io.dart 已打过补丁,跳过")
        return

    # 常量放文件级:插在最后一个 import 之后
    if '_kOhosAotBuild = bool.fromEnvironment' not in src:
        lines = src.split('\n')
        last_import = 0
        for i, line in enumerate(lines):
            if line.startswith('import '):
                last_import = i
        lines.insert(last_import + 1, CONST_DEF)
        src = '\n'.join(lines)

    # 函数体内只插 ohos 分支
    old_block = "WindowingOwner? createDefaultOwner() {\n  if (Platform.isWindows) {"
    assert old_block in src, "未找到 createDefaultOwner 的函数体"
    new_block = ("WindowingOwner? createDefaultOwner() {\n"
                 "  if (_kOhosAotBuild) {\n"
                 "    return ohosWindowingSupported ? WindowingOwnerOHOS() : null;\n"
                 "  } else if (Platform.isWindows) {")
    src = src.replace(old_block, new_block, 1)

    open(WINDOW_IO, 'w').write(src)
    print("  ✓ _window_io.dart")


def main():
    revert = '--revert' in sys.argv
    print("==> %s OHOS AOT 平台判定补丁" % ("还原" if revert else "应用"))
    patch_platform_io(revert)
    patch_window_io(revert)
    print("完成")


if __name__ == '__main__':
    main()
