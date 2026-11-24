<#
  build_ohos.ps1 -- build a HarmonyOS / OpenHarmony HAP for Saber (Windows).

  Usage:
      powershell -ExecutionPolicy Bypass -File harmony\scripts\build_ohos.ps1
      powershell -ExecutionPolicy Bypass -File harmony\scripts\build_ohos.ps1 -Mode debug

  Equivalent of harmony/scripts/build_ohos.sh. Steps:
      0. load env + prepare the SDK (idempotent)
      1. place pubspec_overrides.yaml
      2. flutter pub get
      3. patch third-party dependencies (harmony/patches/ohos)
      4. prepare signing material and write ohos/build-profile.json5
      5. flutter build hap --<mode> --dart-define=FLUTTER_OHOS_AOT_BUILD=true

  Output: build\ohos\hap\entry-default-signed.hap

  NOTE: keep this file ASCII-only. PowerShell 5.1 reads BOM-less UTF-8 as ANSI,
  so non-ASCII text here turns into mojibake and breaks the parser.
#>
param(
  [ValidateSet('debug', 'profile', 'release')]
  [string]$Mode = 'release',
  [switch]$NoTreeShakeIcons
)

# 'Continue': tools like flutter write progress to stderr; with 'Stop' every
# stderr line becomes a terminating NativeCommandError. We check exit codes
# explicitly instead, which is what matters here.
$ErrorActionPreference = 'Continue'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$toolchain = Join-Path $repo 'harmony\toolchain'

Write-Host "==> 0/6 apply upstream patches"
# The upstream Saber files stay pristine in the repository; our six changes to
# them live as patches in harmony/patches/upstream/. Apply them here.
# This MUST happen before `flutter pub get`: one patch adds the
# file_picker_ohos dependency to pubspec.yaml, and without it the HarmonyOS
# file picker plugin is never registered.
# Idempotent - already applied patches are skipped.
$applyPatches = Join-Path $PSScriptRoot 'apply_upstream_patches.ps1'
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $applyPatches
if ($LASTEXITCODE -ne 0) { throw "upstream patch application failed (exit $LASTEXITCODE)" }

Write-Host "==> 1/6 load build env + prepare SDK"
. (Join-Path $toolchain 'env.ps1')
$flutter = Join-Path $env:FLUTTER_ROOT 'bin\flutter.bat'
$python = if (Get-Command python -ErrorAction SilentlyContinue) { 'python' } else { 'py' }

# SDK-side patches are idempotent; run them on every build because the engine
# HARs get re-downloaded by flutter and would otherwise lose the API-version fix.
# Call as a child process so $LASTEXITCODE is deterministic (in-process `&` can
# leave a stale value behind).
$setup = Join-Path $toolchain 'windows\setup_sdk.ps1'
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $setup
if ($LASTEXITCODE -ne 0) { throw "SDK setup failed (exit $LASTEXITCODE)" }

Write-Host "==> 2/6 place pubspec_overrides.yaml"
Copy-Item -Force (Join-Path $toolchain 'pubspec_overrides.yaml') (Join-Path $repo 'pubspec_overrides.yaml')

Write-Host "==> 3/6 flutter pub get"
Push-Location $repo
$pubLog = & $flutter pub get 2>&1
$pubRc = $LASTEXITCODE
Pop-Location
$pubText = $pubLog | Out-String
$pubOk = $pubText -match 'Got dependencies!' -or $pubText -match 'Changed \d+ dependencies!'
if (-not $pubOk) {
  $pubLog | ForEach-Object { "    $_" }
  throw "flutter pub get failed (exit=$pubRc)"
}
if ($pubRc -ne 0) {
  # Same tolerance as the bash version: "No Hmos SDK found" is a harmless probe
  # warning under the command-line-tools + standalone-SDK layout.
  if ($pubText -match 'No Hmos SDK found') {
    Write-Host "    (ignored: 'No Hmos SDK found' is only a probe warning)"
  } else {
    $pubLog | ForEach-Object { "    $_" }
    throw "flutter pub get failed (exit=$pubRc)"
  }
}
Write-Host "    dependencies ready"

Write-Host "==> 4/6 patch third-party dependencies (harmony/patches/ohos)"
& $python (Join-Path $toolchain 'apply_ohos_patches.py') --cache $env:PUB_CACHE
if ($LASTEXITCODE -ne 0) { throw "dependency patch failed" }

Write-Host "==> 5/6 prepare signing material + write build-profile.json5"
& $python (Join-Path $toolchain 'prepare_signing.py')
if ($LASTEXITCODE -ne 0) { throw "signing preparation failed" }

Write-Host "==> 6/6 flutter build hap ($Mode)"
Push-Location $repo
# Build the argument list as one array and splat it once. Splatting an empty
# array into a native command makes PowerShell 5.1 pass an empty argument,
# which the flutter tool then reads as the target file ("Target file '' not
# found").
$buildArgs = @('build', 'hap', "--$Mode")
if ($NoTreeShakeIcons) { $buildArgs += '--no-tree-shake-icons' }
$buildArgs += '--dart-define=FLUTTER_OHOS_AOT_BUILD=true'
& $flutter @buildArgs
$buildRc = $LASTEXITCODE
Pop-Location
if ($buildRc -ne 0) { throw "flutter build hap failed (exit=$buildRc)" }

Write-Host ""
Get-ChildItem (Join-Path $repo 'build\ohos') -Recurse -Filter '*.hap' -ErrorAction SilentlyContinue |
  Sort-Object LastWriteTime -Descending | Select-Object -First 5 |
  ForEach-Object { "    {0,10:N1} MB  {1}  {2}" -f ($_.Length/1MB), $_.LastWriteTime, $_.FullName }

Write-Host ""
Write-Host "Tips:"
Write-Host "  * install on the device: harmony\toolchain\dist\install-harmony.bat (finds hdc.exe itself)"
Write-Host "  * see harmony\docs\ohos.md"
