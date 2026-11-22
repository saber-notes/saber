#!/usr/bin/env python3
"""把 Dart SDK 的 frontend_server 改成"只做 kernel 编译"的精简版。

OpenHarmony 构建 HAP 时只会用到 frontend_server 的 kernel 编译能力;
DDC / JS bundler(依赖 SDK 内部的 package:dev_compiler / package:dart2wasm,
两者都没发布到 pub.dev)对 HAP 完全没有意义。

本脚本:
  * 删掉 package:dev_compiler / package:front_end(.../ddc.dart) 的依赖;
  * 用本地最小实现替代 ModuleFormat / parseModuleFormat / Compiler /
    ExpressionCompiler / IncrementalJavaScriptBundler;
  * 让 writeJavaScriptBundle / compileExpressionToJs 直接抛 UnsupportedError。

用法: python3 patch_frontend_server.py <pkg/frontend_server 目录>
"""

from __future__ import annotations

import pathlib
import re
import sys

STUB = '''// OpenHarmony 本地构建用的精简版 javascript_bundle.dart。
//
// 原版依赖 Dart SDK 内部的 `package:dev_compiler` / `package:dart2wasm`
// (两者都未发布到 pub.dev),而 DDC / JS bundler 只服务于 Web 端增量编译,
// HAP(kernel 快照)构建完全用不到。
//
// 这里只保留 frontend_server.dart 实际引用到的 API 表面,执行时抛
// UnsupportedError。

// ignore_for_file: implementation_imports

import 'dart:io';

import 'package:front_end/src/api_unstable/vm.dart' show FileSystem;
import 'package:kernel/ast.dart';
import 'package:kernel/class_hierarchy.dart';
import 'package:kernel/core_types.dart';
import 'package:package_config/package_config.dart';

/// JS 模块输出格式(DDC 相关,HAP 构建用不到)。
enum ModuleFormat { ddc, ddcLibraryBundle }

ModuleFormat parseModuleFormat(String format) {
  switch (format) {
    case 'ddc':
      return ModuleFormat.ddc;
    case 'ddcLibraryBundle':
      return ModuleFormat.ddcLibraryBundle;
    default:
      return ModuleFormat.ddc;
  }
}

/// kernel2js 编译器占位类型。
class Compiler {
  Compiler(this.name);
  final String name;
}

/// 表达式编译占位类型。
class ExpressionCompiler {
  ExpressionCompiler(
    this.compilerOptions,
    this.moduleFormat,
    this.errors,
    this.incrementalCompiler,
    this.kernel2jsCompiler,
    this.component,
  );

  final Object compilerOptions;
  final ModuleFormat moduleFormat;
  final List<String> errors;
  final Object incrementalCompiler;
  final Compiler kernel2jsCompiler;
  final Object component;

  Future<String?> compileExpressionToJs(
    String libraryUri,
    String? scriptUri,
    int line,
    int column,
    Map<String, String> jsModules,
    Map<String, String> jsFrameValues,
    String expression,
  ) async => throw UnsupportedError(
    'ExpressionCompiler is not available in the OpenHarmony frontend_server '
    'build (DDC is only needed for web targets).',
  );
}

class IncrementalJavaScriptBundler {
  IncrementalJavaScriptBundler(
    this._fileSystem,
    this._loadedLibraries,
    this._fileSystemScheme, {
    this.useDebuggerModuleNames = false,
    this.emitDebugMetadata = false,
    this.emitDebugSymbols = false,
    this.useStronglyConnectedComponents = true,
    this.canaryFeatures = false,
    String? moduleFormat,
    this.extraDdcOptions = const [],
  }) : _moduleFormat = moduleFormat ?? 'amd';

  final bool useDebuggerModuleNames;
  final bool emitDebugMetadata;
  final bool emitDebugSymbols;
  final bool useStronglyConnectedComponents;
  final String _moduleFormat;
  final List<String> extraDdcOptions;
  final bool canaryFeatures;
  final FileSystem? _fileSystem;
  final Set<Library> _loadedLibraries;
  final String _fileSystemScheme;

  Never _unsupported(String what) => throw UnsupportedError(
    'IncrementalJavaScriptBundler.$what is not available in the OpenHarmony '
    'frontend_server build (DDC/JS bundling is only needed for web targets).',
  );

  Future<void> initialize(
    Component fullComponent,
    Uri mainUri,
    PackageConfig packageConfig,
  ) async => _unsupported('initialize');

  Future<void> invalidate(
    Component partialComponent,
    Component lastFullComponent,
    Uri mainUri,
    PackageConfig packageConfig, {
    required bool recompileRestart,
  }) async => _unsupported('invalidate');

  Future<Map<String, Compiler>> compile(
    ClassHierarchy classHierarchy,
    CoreTypes coreTypes,
    PackageConfig packageConfig,
    IOSink codeSink,
    IOSink manifestSink,
    IOSink sourceMapsSink,
    IOSink? metadataSink,
    IOSink? symbolsSink,
  ) async => _unsupported('compile');

  String makeLibraryBundleName(String name) =>
      _unsupported('makeLibraryBundleName');

  String urlForComponentUri(Uri componentUri, PackageConfig packageConfig) =>
      _unsupported('urlForComponentUri');
}
'''


def patch(root: pathlib.Path) -> None:
    lib = root / "lib"

    # 1) 精简版 javascript_bundle.dart
    (lib / "src/javascript_bundle.dart").write_text(STUB, encoding="utf-8")
    print("  [ok] lib/src/javascript_bundle.dart 已替换为精简实现")

    # 2) frontend_server.dart
    p = lib / "frontend_server.dart"
    s = p.read_text(encoding="utf-8")

    s2 = re.sub(
        r"import 'package:dev_compiler/dev_compiler\.dart'\n"
        r"    show\n(?:        \w+,\n)+        parseModuleFormat;\n",
        "",
        s,
    )
    assert s2 != s, "未找到 package:dev_compiler 导入块"
    s = s2

    s2 = re.sub(
        r"import 'package:front_end/src/api_unstable/ddc\.dart'\n"
        r"    as ddc\n    show IncrementalCompiler;\n",
        "",
        s,
    )
    assert s2 != s, "未找到 front_end ddc 导入块"
    s = s2

    s2 = s.replace(
        "import 'src/javascript_bundle.dart';",
        "import 'src/javascript_bundle.dart'\n"
        "    show Compiler, ExpressionCompiler, ModuleFormat, parseModuleFormat;",
    )
    assert s2 != s, "未找到 javascript_bundle 导入"
    s = s2

    # 删除 _installDartdevcTarget 方法及其调用
    s2 = re.sub(
        r"  void _installDartdevcTarget\(\) \{\n"
        r"    targets\['dartdevc'\] = \(TargetFlags flags\) => new DevCompilerTarget\(flags\);\n"
        r"  \}\n\n",
        "",
        s,
    )
    assert s2 != s, "未找到 _installDartdevcTarget"
    s = s2
    s = s.replace("    _installDartdevcTarget();\n", "")

    # writeJavaScriptBundle 整体替换为抛异常
    s2 = re.sub(
        r"  /// Write a JavaScript bundle containing the provided component\.\n"
        r"  ///\n"
        r"  /// \[recompileRestart\] should be true when this is part of a\n"
        r"  /// `recompile-restart` request\.\n"
        r"  Future<void> writeJavaScriptBundle\(.*?\n  \}\n\n",
        "  /// Write a JavaScript bundle containing the provided component.\n"
        "  ///\n"
        "  /// OpenHarmony 本地构建不支持 DDC/JS bundle。\n"
        "  Future<void> writeJavaScriptBundle(\n"
        "    KernelCompilationResults results,\n"
        "    String filename,\n"
        "    String fileSystemScheme,\n"
        "    String moduleFormat, {\n"
        "    required bool fullComponent,\n"
        "    required bool recompileRestart,\n"
        "    required bool useStronglyConnectedComponents,\n"
        "    List<String>? extraDdcOptions,\n"
        "  }) async {\n"
        "    throw UnsupportedError(\n"
        "      'writeJavaScriptBundle is not supported in the OpenHarmony '\n"
        "      'frontend_server build (DDC is only needed for web targets).',\n"
        "    );\n"
        "  }\n\n",
        s,
        flags=re.S,
    )
    assert s2 != s, "未找到 writeJavaScriptBundle"
    s = s2

    # compileExpressionToJs 整体替换为抛异常
    s2 = re.sub(
        r"  @override\n  Future<void> compileExpressionToJs\(.*?\n  \}\n\n",
        "  @override\n"
        "  Future<void> compileExpressionToJs(\n"
        "    String libraryUri,\n"
        "    String? scriptUri,\n"
        "    int line,\n"
        "    int column,\n"
        "    Map<String, String> jsModules,\n"
        "    Map<String, String> jsFrameValues,\n"
        "    String expression,\n"
        "  ) async {\n"
        "    throw UnsupportedError(\n"
        "      'compileExpressionToJs is not supported in the OpenHarmony '\n"
        "      'frontend_server build (DDC is only needed for web targets).',\n"
        "    );\n"
        "  }\n\n",
        s,
        flags=re.S,
    )
    assert s2 != s, "未找到 compileExpressionToJs"
    s = s2

    p.write_text(s, encoding="utf-8")
    print("  [ok] lib/frontend_server.dart 已去掉 DDC 相关代码")


def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit("用法: patch_frontend_server.py <pkg/frontend_server 目录>")
    root = pathlib.Path(sys.argv[1]).resolve()
    print(f"==> 打补丁: {root}")
    patch(root)
    print("==> 完成")


if __name__ == "__main__":
    main()
