<#
  setup_sdk.ps1 —— Windows 上的鸿蒙构建环境准备(一次性,幂等)

  对应 Linux 侧 harmony/toolchain/ 下那一堆零散的 SDK 修补脚本,这里串成一步:

    1. flutter config --ohos-sdk      —— 让 Flutter-OH 知道鸿蒙 SDK 在哪
    2. patch_engine_har_api.py 21     —— 引擎 HAR 里 compatibleSdkVersion 是 24,
                                        与项目的 21 冲突(hvigor 会报
                                        00306004 Specification Limit Violation),
                                        降到 21
    3. backport_api22_24_declarations.py
                                     —— 回补 CompetitionStrategy(API 24)、
                                        Window.isInFreeWindowMode()(API 22)
                                        两个高版本符号,否则 ArkTS 编译报
                                        "Cannot find name 'CompetitionStrategy'"
    4. patch_flutter_tools_symlink.py —— Windows 没开发者模式时无法创建插件
                                        符号链接,让 flutter 容忍这件事
    5. align_const_finder.py         —— 对齐 const_finder 快照的 SDK hash
                                        (release 的图标摇树要用它)
    6. setup_ohos_aot.py             —— AOT 的三处源码补丁(与 Linux 共用)

  用法:
      powershell -ExecutionPolicy Bypass -File harmony\toolchain\windows\setup_sdk.ps1
#>
$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$toolchain = Split-Path -Parent $here
$repo = Split-Path -Parent (Split-Path -Parent $toolchain)

. (Join-Path $toolchain 'env.ps1')
$python = if (Get-Command python -ErrorAction SilentlyContinue) { 'python' } else { 'py' }

Write-Host "==> 1/6 flutter config --ohos-sdk"
& (Join-Path $env:FLUTTER_ROOT 'bin\flutter.bat') config --ohos-sdk="$env:DEVECO_SDK_HOME" | Out-Null
Write-Host "    $($env:DEVECO_SDK_HOME)"

Write-Host "==> 2/6 引擎 HAR 的 API 版本降到 21"
& $python (Join-Path $toolchain 'patch_engine_har_api.py') 21 "$env:FLUTTER_ROOT"

Write-Host "==> 3/6 回补 API 22/24 的声明"
& $python (Join-Path $toolchain 'backport_api22_24_declarations.py') --sdk "$env:DEVECO_SDK_ROOT"

Write-Host "==> 4/6 flutter_tools 补丁(容忍 Windows 符号链接权限问题)"
& $python (Join-Path $toolchain 'windows\patch_flutter_tools_symlink.py') --flutter "$env:FLUTTER_ROOT"

Write-Host "==> 5/6 对齐 const_finder 快照的 SDK hash"
& $python (Join-Path $toolchain 'windows\align_const_finder.py') --flutter "$env:FLUTTER_ROOT"
if ($LASTEXITCODE -ne 0) { throw "const_finder alignment failed" }

Write-Host "==> 6/6 AOT 补丁(release 构建才需要,但幂等)"
$env:PYTHONIOENCODING = 'utf-8'
& $python (Join-Path $toolchain 'setup_ohos_aot.py') --flutter "$env:FLUTTER_ROOT"
if ($LASTEXITCODE -ne 0) { throw "AOT patch failed" }

Write-Host ""
Write-Host "环境就绪。构建:harmony\scripts\build_ohos.ps1"
