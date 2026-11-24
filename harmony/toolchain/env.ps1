<#
  env.ps1 —— Saber 鸿蒙(HarmonyOS NEXT)构建环境变量(Windows 版)

  用法(在 PowerShell 里点源引入):
      . .\harmony\toolchain\env.ps1

  与 harmony/toolchain/env.sh 完全对应,只是换成 Windows 的路径与 PATH 分隔符。

  默认目录布局:
      <SABER_OHOS_ROOT>\
      ├── flutter\                          Flutter-OH SDK
      ├── ohos-sdk-root\ohos-sdk\           OpenHarmony SDK(布局 <api>/{ets,js,native,previewer,toolchains})
      ├── deveco-tools\command-line-tools\  DevEco 命令行工具(ohpm / hvigor / SDK)
      ├── saber\                            本仓库
      └── jdk\                              JDK 17(hap-sign-tool 签名要用)

  所有路径都可以用同名环境变量覆盖。
#>

# --- 仓库根 / 工作区根 ------------------------------------------------------
$here = Split-Path -Parent $MyInvocation.MyCommand.Path          # <repo>\toolchain\ohos
$RepoRoot = if ($env:SABER_REPO_ROOT) { $env:SABER_REPO_ROOT } else { (Resolve-Path (Join-Path $here '..\..')).Path }
$env:SABER_REPO_ROOT = $RepoRoot
$env:SABER_OHOS_ROOT = if ($env:SABER_OHOS_ROOT) { $env:SABER_OHOS_ROOT } else { (Split-Path -Parent $RepoRoot) }

$Root = $env:SABER_OHOS_ROOT

# --- 各组件 -----------------------------------------------------------------
$env:FLUTTER_ROOT   = if ($env:FLUTTER_ROOT)   { $env:FLUTTER_ROOT }   else { Join-Path $Root 'flutter' }
$env:DEVECO_TOOLS  = if ($env:DEVECO_TOOLS)  { $env:DEVECO_TOOLS }  else { Join-Path $Root 'deveco-tools\command-line-tools' }
$env:OHOS_SDK_HOME = if ($env:OHOS_SDK_HOME) { $env:OHOS_SDK_HOME } else { Join-Path $Root 'ohos-sdk-root\ohos-sdk' }
$env:DEVECO_SDK_HOME = if ($env:DEVECO_SDK_HOME) { $env:DEVECO_SDK_HOME } else { Join-Path $env:DEVECO_TOOLS 'sdk' }
$env:DEVECO_SDK_ROOT = if ($env:DEVECO_SDK_ROOT) { $env:DEVECO_SDK_ROOT } else { Join-Path $env:DEVECO_TOOLS 'sdk\default' }
$env:OHOS_API_DIR  = if ($env:OHOS_API_DIR)  { $env:OHOS_API_DIR }  else { Join-Path $env:OHOS_SDK_HOME '18' }
$env:PUB_CACHE     = if ($env:PUB_CACHE)     { $env:PUB_CACHE }     else { Join-Path $Root '.pub-cache' }
$env:TOOLCHAIN_DIR = $here
$env:OHOS_HOME     = $env:OHOS_SDK_HOME
$env:HOS_SDK_HOME  = $env:OHOS_SDK_HOME
$env:OHOS_NDK_HOME = Join-Path $env:OHOS_API_DIR 'native'
$env:DEVECO_NODE_HOME = Join-Path $env:DEVECO_TOOLS 'tool\node'

# --- JDK 17 (hvigor 签名时要用 hap-sign-tool.jar) ---------------------------
# Linux 上 java 来自系统(/usr/bin/java),Windows 上要自己指。
$jdkHome = $env:JAVA_HOME
if (-not $jdkHome) {
  $jdkRoot = Join-Path $Root 'jdk'
  if (Test-Path $jdkRoot) {
    $cand = Get-ChildItem $jdkRoot -Directory -ErrorAction SilentlyContinue |
            Where-Object { Test-Path (Join-Path $_.FullName 'bin\java.exe') } |
            Select-Object -First 1
    if ($cand) { $jdkHome = $cand.FullName }
  }
}
if ($jdkHome) {
  $env:JAVA_HOME = $jdkHome
  $env:PATH = "$(Join-Path $jdkHome 'bin');$env:PATH"
}

# --- PATH -------------------------------------------------------------------
# 注意:Windows 的 PATH 分隔符是 ';'。hvigor / ohpm 需要 node 在前面。
$add = @(
  (Join-Path $env:FLUTTER_ROOT 'bin'),
  (Join-Path $env:DEVECO_TOOLS 'bin'),
  (Join-Path $env:DEVECO_TOOLS 'tool\node'),
  (Join-Path $env:OHOS_API_DIR 'native\llvm\bin'),
  (Join-Path $env:OHOS_API_DIR 'toolchains'),
  (Join-Path $env:DEVECO_SDK_ROOT 'openharmony\toolchains')
)
foreach ($p in $add) { if (Test-Path $p) { $env:PATH = "$p;$env:PATH" } }
if ($jdkHome) { $env:PATH = "$(Join-Path $jdkHome 'bin');$env:PATH" }

# --- Flutter / pub ----------------------------------------------------------
# Flutter 引擎产物走国内镜像。
if (-not $env:FLUTTER_STORAGE_BASE_URL) { $env:FLUTTER_STORAGE_BASE_URL = 'https://storage.flutter-io.cn' }

# pub 包走 pub.dev 官方源,**不要**改成 pub.flutter-io.cn。
# 原因见 toolchain/ohos/env.sh 的注释(镜像的 archive_url 指向的路径现在对所有包
# 都返回错误页,pub 会报 "Downloaded archive ... had wrong content-hash")。
if (-not $env:PUB_HOSTED_URL) { $env:PUB_HOSTED_URL = 'https://pub.dev' }
$env:FLUTTER_SUPPRESS_ANALYTICS = 'true'

# --- 自检 -------------------------------------------------------------------
Write-Host "SABER_OHOS_ROOT = $env:SABER_OHOS_ROOT"
Write-Host "SABER_REPO_ROOT = $env:SABER_REPO_ROOT"
Write-Host "FLUTTER_ROOT    = $env:FLUTTER_ROOT   $(if (Test-Path $env:FLUTTER_ROOT) { '[ok]' } else { '[缺失]' })"
Write-Host "OHOS_SDK_HOME   = $env:OHOS_SDK_HOME  $(if (Test-Path $env:OHOS_API_DIR) { '[ok]' } else { '[缺失]' })"
Write-Host "DEVECO_SDK_ROOT = $env:DEVECO_SDK_ROOT  $(if (Test-Path $env:DEVECO_SDK_ROOT) { '[ok]' } else { '[缺失]' })"
Write-Host "PUB_CACHE       = $env:PUB_CACHE"
