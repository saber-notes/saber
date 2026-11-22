@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

REM ---------------------------------------------------------------------------
REM install-harmony.bat —— 在 Windows 上把 Saber 装到鸿蒙平板
REM
REM 用法:
REM   install-harmony.bat             装 + 启动
REM   install-harmony.bat --no-start  只装
REM   install-harmony.bat --hdc "C:\path\to\hdc.exe"
REM ---------------------------------------------------------------------------

set "HERE=%~dp0"
set "HAP=%HERE%entry-default-signed.hap"
if not exist "%HAP%" if exist "%SABER_REPO_ROOT%\build\ohos\hap\entry-default-signed.hap" set "HAP=%SABER_REPO_ROOT%\build\ohos\hap\entry-default-signed.hap"
set "BUNDLE=com.sabernotes.saber"
set "ABILITY=EntryAbility"
set "START=1"
set "HDC="

:parse
if "%~1"=="" goto parsed
if /i "%~1"=="--no-start" ( set "START=0" & shift & goto parse )
if /i "%~1"=="--hdc" ( set "HDC=%~2" & shift & shift & goto parse )
echo 未知参数: %~1
exit /b 1
:parsed

REM ---- 找 hdc ---------------------------------------------------------------
if not "%HDC%"=="" if exist "%HDC%" goto havehdc

where hdc >nul 2>&1
if %errorlevel%==0 (
  for /f "delims=" %%i in ('where hdc') do ( set "HDC=%%i" & goto havehdc )
)

REM DevEco Studio / 命令行工具的常见安装位置
REM 另外:本机的工作区布局是 <workspace>\deveco-tools\command-line-tools\sdk\default\openharmony\toolchains
REM (环境变量 SABER_OHOS_ROOT 指向工作区根)
for %%D in (
  "%SABER_OHOS_ROOT%\deveco-tools\command-line-tools\sdk\default\openharmony\toolchains"
  "%SABER_OHOS_ROOT%\deveco-tools\command-line-tools\sdk\default\hms\toolchains"
  "%SABER_OHOS_ROOT%\ohos-sdk-root\ohos-sdk\18\toolchains"
  "%LOCALAPPDATA%\Huawei\Sdk"
  "%USERPROFILE%\AppData\Local\Huawei\Sdk"
  "C:\Program Files\Huawei\DevEco Studio\sdk"
  "C:\Program Files\Huawei\DevEcoStudio\sdk"
  "%USERPROFILE%\command-line-tools"
  "%HERE%command-line-tools"
) do (
  if exist "%%~D" (
    for /f "delims=" %%F in ('dir /s /b "%%~D\hdc.exe" 2^>nul') do (
      set "HDC=%%F"
      goto havehdc
    )
  )
)

echo.
echo [X] 找不到 hdc.exe
echo.
echo 装一个就行:
echo   * 已装 DevEco Studio -^> 它自带 hdc
echo   * 或者用 --hdc 手动指定,例如:
echo       install-harmony.bat --hdc "C:\command-line-tools\sdk\default\hms\toolchains\hdc.exe"
echo.
pause
exit /b 1

:havehdc
echo ==^> hdc: %HDC%

REM ---- 检查安装包 -----------------------------------------------------------
if not exist "%HAP%" (
  echo [X] 找不到 entry-default-signed.hap
  echo     请确保它和本脚本在同一个目录
  pause
  exit /b 1
)
for %%A in ("%HAP%") do set "SIZE=%%~zA"
set /a SIZEMB=%SIZE%/1048576
echo ==^> 安装包: %SIZEMB% MB

REM ---- 检查设备 -------------------------------------------------------------
echo.
echo ==^> 检查设备
"%HDC%" list targets
echo.
echo 如果上面是 [Empty],检查:
echo   1^) 平板:设置 -^> 关于平板 -^> 连点「版本号」7 次开开发者模式
echo   2^) 设置 -^> 系统和更新 -^> 开发人员选项 -^> 打开「USB 调试」
echo   3^) 数据线连接^(要能传数据的线^)
echo   4^) 平板弹窗点「允许 USB 安装」
echo.

set /p CONFIRM=设备已连接?继续安装 (y/n):
if /i not "%CONFIRM%"=="y" (
  echo 已取消
  pause
  exit /b 0
)

REM ---- 安装 -----------------------------------------------------------------
echo.
echo ==^> 安装到平板^(246MB,要等一会儿^)
"%HDC%" install -r "%HAP%"
if errorlevel 1 (
  echo.
  echo [X] 安装失败。常见原因:
  echo   9568257 签名不被设备信任
  echo   9568393 Profile 和设备不匹配
  echo   已装过同包名 -^> 先卸载: "%HDC%" uninstall com.sabernotes.saber
  echo.
  pause
  exit /b 1
)

echo ==^> 安装成功

if "%START%"=="0" (
  echo ==^> ^(未启动^)
  pause
  exit /b 0
)

REM ---- 启动 -----------------------------------------------------------------
echo.
echo ==^> 启动 Saber
"%HDC%" shell aa start -a %ABILITY% -b %BUNDLE%

echo.
echo ============================
echo  完成。平板上应该能看到 Saber 了。
echo ============================
echo.
echo 如果打开后闪退,把日志发我:
echo   "%HDC%" shell hilog -x ^| findstr /i "saber flutter dart"
echo.
pause
