<#
  apply_upstream_patches.ps1 —— 把「对上游文件的改动」打到工作树上(Windows 版)。

  与 harmony/scripts/apply_upstream_patches.sh 等价。

  用法:
      powershell -ExecutionPolicy Bypass -File harmony\scripts\apply_upstream_patches.ps1
      powershell -ExecutionPolicy Bypass -File harmony\scripts\apply_upstream_patches.ps1 -Reverse
      powershell -ExecutionPolicy Bypass -File harmony\scripts\apply_upstream_patches.ps1 -Check

  NOTE: keep this file ASCII-only. PowerShell 5.1 reads BOM-less UTF-8 as ANSI,
  so non-ASCII text here turns into mojibake and breaks the parser.
#>
param(
  [switch]$Reverse,
  [switch]$Check
)

$ErrorActionPreference = 'Continue'

$here = Split-Path -Parent $PSScriptRoot
$repo = Split-Path -Parent $here
$patchDir = Join-Path $repo 'harmony\patches\upstream'

function Invoke-Git([string[]]$GitArgs, [switch]$Quiet) {
  $out = & git -C $repo @GitArgs 2>&1
  if (-not $Quiet -and $LASTEXITCODE -ne 0) {
    Write-Host "    git $($GitArgs -join ' ') -> exit $LASTEXITCODE"
  }
  return @{ Code = $LASTEXITCODE; Out = ($out | Out-String) }
}

if (-not (Test-Path $patchDir)) {
  throw "patch dir not found: $patchDir"
}

$applied = 0
$skipped = 0
$failed = 0

foreach ($p in Get-ChildItem $patchDir -Filter *.patch | Sort-Object Name) {
  $name = $p.Name

  $fwd = Invoke-Git @('apply', '--check', $p.FullName) -Quiet
  if ($fwd.Code -eq 0) {
    if ($Check) {
      Write-Host "  [todo] $name"
    } elseif ($Reverse) {
      Write-Host "  [skip] $name (reverse mode: not applied)"
    } else {
      Invoke-Git @('apply', $p.FullName) | Out-Null
      Write-Host "  [applied] $name"
    }
    $applied++
    continue
  }

  $rev = Invoke-Git @('apply', '--reverse', '--check', $p.FullName) -Quiet
  if ($rev.Code -eq 0) {
    if ($Check) {
      Write-Host "  [applied] $name"
    } elseif ($Reverse) {
      Invoke-Git @('apply', '--reverse', $p.FullName) | Out-Null
      Write-Host "  [reverted] $name"
    } else {
      Write-Host "  [skip] $name (already applied)"
    }
    $skipped++
    continue
  }

  Write-Host "  [error] $name cannot be applied - upstream files were modified" -ForegroundColor Red
  $failed++
}

if ($Check) {
  Write-Host "==> upstream patches: todo $applied, applied $skipped"
} elseif ($Reverse) {
  Write-Host "==> upstream patches: reverted $skipped, kept $applied"
  Write-Host "    the working tree now matches the upstream baseline (except harmony/ and ohos/)"
} else {
  Write-Host "==> upstream patches: applied $applied, skipped $skipped (already applied)"
}

if ($failed -gt 0) { exit 1 }
