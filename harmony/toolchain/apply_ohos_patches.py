#!/usr/bin/env python3
"""给 pub cache 里的第三方依赖打鸿蒙适配补丁。

五个补丁,两个平台共用这一份实现:

  1. TargetPlatform 的穷尽 switch —— Flutter-OH 给 TargetPlatform 加了 `ohos`
     成员,cupertino_ui / material_ui / flutter_quill 等包内部对它的 switch
     是穷尽的,不加分支会直接编译失败:
       "The type 'TargetPlatform' is not exhaustively matched by the switch
        cases since it doesn't match 'TargetPlatform.ohos'."
     交给 patch_target_platform_ohos.py 统一扫描 pub cache 处理。
  2. super_native_extensions —— 它的 build hook 会调用 Rust 工具链交叉编译
     原生扩展(还依赖 glib/gobject),鸿蒙端没有对应产物,直接跳过。
  3. pdfium_dart —— 它的 build hook 会从 GitHub 下载预编译的 pdfium 动态库
     (只有 android/linux/macos/windows 版本),鸿蒙端没有,直接跳过。
     代价是鸿蒙版暂时不支持 PDF 预览/导入。
  4. window_manager —— 桌面专用插件,鸿蒙没有原生侧。缺失时静默降级,
     否则 main() 的 Future.wait 会中断,直接白屏。
  5. url_launcher_ohos —— 没有内嵌浏览器页面时退回系统浏览器。

用法:
    python harmony/toolchain/apply_ohos_patches.py [--cache <PUB_CACHE>]

幂等:每个补丁都靠"改前先看有没有标记"来判断是否已打过。
"""
from __future__ import annotations

import argparse
import pathlib
import subprocess
import sys

REPO_ROOT = pathlib.Path(__file__).resolve().parents[2]
PATCH_TARGET_PLATFORM = REPO_ROOT / "harmony" / "patches" / "ohos" / "patch_target_platform_ohos.py"

# --- 2) super_native_extensions:跳过 Rust 交叉编译 ------------------------
SUPER_NATIVE_HOOK = """import 'package:hooks/hooks.dart';

/// OpenHarmony:跳过 Rust 原生扩展的交叉编译。
///
/// 上游会用 native_toolchain_rust 编译 `rust/` 目录下的 crate,并依赖
/// glib / gobject 等 Linux 桌面库;鸿蒙端既没有对应的 Rust 目标产物,
/// 也不需要这些能力,这里直接产出空资产。
void main(List<String> args) async {
  await build(args, (input, output) async {
    // no code assets
  });
}
"""

# --- 3) pdfium_dart:跳过预编译 pdfium 下载 ---------------------------------
PDFIUM_HOOK = """import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';

const _assetName = 'libpdfium';

/// OpenHarmony:跳过预编译 pdfium 的下载。
///
/// 上游会从 https://github.com/bblanchon/pdfium-binaries 下载
/// android/linux/macos/windows 四个平台的动态库,鸿蒙端没有对应产物。
/// 这里不产出任何 code asset,鸿蒙版因此暂时不支持 PDF 预览/导入。
void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) return;
    // 不添加任何 CodeAsset
  });
}
"""

# --- 4) window_manager:缺少原生实现时静默降级 ------------------------------
WM_ENSURE_OLD = """  Future<void> ensureInitialized() async {
    await _channel.invokeMethod('ensureInitialized');
  }"""
WM_ENSURE_NEW = """  Future<void> ensureInitialized() async {
    // OHOS: 缺少原生实现时静默降级。
    // 鸿蒙没有 window_manager 的原生侧,而 Platform.isLinux 在
    // --target-os=linux 的 AOT 快照里恒为 true,Saber 会误以为在桌面上
    // 而调用本方法。异常会中断 main() 的 Future.wait 导致白屏。
    try {
      await _channel.invokeMethod('ensureInitialized');
    } on MissingPluginException {
      // 鸿蒙上不需要窗口管理,忽略。
    }
  }"""

WM_FULLSCREEN_OLD = """  Future<void> setFullScreen(bool isFullScreen) async {
    await _channel.invokeMethod('setFullScreen', {'isFullScreen': isFullScreen});
  }"""
WM_FULLSCREEN_NEW = """  Future<void> setFullScreen(bool isFullScreen) async {
    // OHOS: 同上,鸿蒙上没有原生实现。
    try {
      await _channel.invokeMethod('setFullScreen', {'isFullScreen': isFullScreen});
    } on MissingPluginException {
      // 忽略
    }
  }"""

# --- 5) url_launcher_ohos:退回系统浏览器 -----------------------------------
UL_OLD = """    final bool succeeded;
    if (useWebView) {"""
UL_NEW = """    final bool succeeded;
    // OHOS: 内嵌浏览器页面未注册时退回系统浏览器。
    // 鸿蒙的 url_launcher 对 http/https 默认走应用内嵌 WebView,而原生侧要求
    // 宿主应用传 harmony_browser_page 并真的实现那个页面,否则只弹一个 toast。
    final bool hasHarmonyBrowserPage =
        headers.containsKey('harmony_browser_page');
    if (useWebView && !hasHarmonyBrowserPage) {
      succeeded = await _hostApi.launchUrl(url, headers);
    } else if (useWebView) {"""


def patch_file(path: pathlib.Path, pairs: list[tuple[str, str]], marker: str) -> str:
    """按顺序做一次替换;marker 命中说明已经打过补丁。"""
    try:
        src = path.read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError):
        return "skip"
    if marker in src:
        return "skip"
    changed = False
    for old, new in pairs:
        if old in src:
            src = src.replace(old, new, 1)
            changed = True
    if not changed:
        return "skip"
    path.write_text(src, encoding="utf-8")
    return "ok"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--cache", default="", help="pub 缓存目录(默认取环境变量 PUB_CACHE)")
    args = ap.parse_args()

    cache = pathlib.Path(args.cache) if args.cache else pathlib.Path(
        (sys.argv[0] and "") or "."
    )
    import os

    if not args.cache:
        cache = pathlib.Path(os.environ.get("PUB_CACHE", pathlib.Path.home() / ".pub-cache"))

    print(f"PUB_CACHE={cache}")
    patched = 0
    skipped = 0

    # --- 1) TargetPlatform.ohos 穷尽性 ---------------------------------------
    print("==> 1/5 修补 TargetPlatform.ohos 穷尽性")
    if PATCH_TARGET_PLATFORM.is_file():
        rc = subprocess.call(
            [sys.executable, str(PATCH_TARGET_PLATFORM), "--cache", str(cache)]
        )
        if rc != 0:
            print(f"  [warn] patch_target_platform_ohos.py 返回 {rc}")
        patched += 1
    else:
        print(f"  [warn] 找不到 {PATCH_TARGET_PLATFORM}")

    # --- 2) super_native_extensions ------------------------------------------
    print("==> 2/5 跳过 super_native_extensions 的 Rust 原生扩展构建")
    hits = list(cache.glob("hosted/*/super_native_extensions-*/hook/build.dart"))
    if not hits:
        print("  [skip] 未找到 super_native_extensions")
        skipped += 1
    for f in hits:
        if "OpenHarmony" in f.read_text(encoding="utf-8", errors="replace"):
            print("  [skip] 已打过补丁")
            skipped += 1
            continue
        f.write_text(SUPER_NATIVE_HOOK, encoding="utf-8")
        print(f"  [ok] {f}")
        patched += 1

    # --- 3) pdfium_dart --------------------------------------------------------
    print("==> 3/5 跳过 pdfium_dart 的预编译 pdfium 下载")
    hits = list(cache.glob("hosted/*/pdfium_dart-*/hook/build.dart"))
    if not hits:
        print("  [skip] 未找到 pdfium_dart")
        skipped += 1
    for f in hits:
        if "OpenHarmony" in f.read_text(encoding="utf-8", errors="replace"):
            print("  [skip] 已打过补丁")
            skipped += 1
            continue
        f.write_text(PDFIUM_HOOK, encoding="utf-8")
        print(f"  [ok] {f}")
        patched += 1

    # --- 4) window_manager ------------------------------------------------------
    print("==> 4/5 window_manager:鸿蒙上没有原生实现时静默降级")
    hits = list(cache.glob("hosted/*/window_manager-*/lib/src/window_manager.dart"))
    if not hits:
        print("  [skip] 未找到 window_manager")
        skipped += 1
    for f in hits:
        state = patch_file(
            f,
            [(WM_ENSURE_OLD, WM_ENSURE_NEW), (WM_FULLSCREEN_OLD, WM_FULLSCREEN_NEW)],
            "OHOS: 缺少原生实现时静默降级",
        )
        if state == "ok":
            src = f.read_text(encoding="utf-8")
            if "import 'package:flutter/services.dart'" not in src:
                src = src.replace(
                    "import 'package:flutter/foundation.dart';",
                    "import 'package:flutter/foundation.dart';\n"
                    "import 'package:flutter/services.dart' show MissingPluginException;",
                    1,
                )
                f.write_text(src, encoding="utf-8")
            print(f"  [ok] {f}")
            patched += 1
        else:
            print("  [skip] 已打过补丁或未匹配")
            skipped += 1

    # --- 5) url_launcher_ohos ----------------------------------------------------
    print("==> 5/5 url_launcher_ohos:没有内嵌浏览器页面时退回系统浏览器")
    hits = list(
        cache.glob("git/*/packages/url_launcher/url_launcher_ohos/lib/url_launcher_ohos.dart")
    )
    if not hits:
        print("  [skip] 未找到 url_launcher_ohos(git 依赖)")
        skipped += 1
    for f in hits:
        state = patch_file(f, [(UL_OLD, UL_NEW)], "OHOS: 内嵌浏览器页面未注册")
        if state == "ok":
            print(f"  [ok] {f}")
            patched += 1
        else:
            print("  [skip] 已打过补丁或未匹配")
            skipped += 1

    print(f"==> 完成:修补 {patched} 处,跳过 {skipped} 处")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
