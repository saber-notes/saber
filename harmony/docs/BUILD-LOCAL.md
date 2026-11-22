# harmony/docs/BUILD-LOCAL.md —— 在 Windows 本机构建 Saber 鸿蒙版

本文档描述如何在一台 **Windows 11 x64/ARM64** 机器上,**不依赖 Linux 构建机**,
构建出可安装到 HarmonyOS NEXT 设备的 Saber 鸿蒙包。

> 背景:原始流程是"Linux 构建机 + Wine + 无线调试安装"三段式,产物上传慢、
> 编译慢、交付慢。本文对应的 Windows 流程把三段合成一段:
> **本机构建 → 直连平板安装(实测 73.4 MB 用时 2.5 秒)**。

---

## 0. 一分钟速查

```powershell
# 构建(debug / release)
powershell -ExecutionPolicy Bypass -File <repo>\scripts\build_ohos.ps1 -Mode debug
powershell -ExecutionPolicy Bypass -File <repo>\scripts\build_ohos.ps1 -Mode release -NoTreeShakeIcons

# 安装到平板(hdc 走 easytier 直连)
& <devEco-tools>\command-line-tools\sdk\default\openharmony\toolchains\hdc.exe tconn <device-ip>:<wireless-debug-port>
& <devEco-tools>\command-line-tools\sdk\default\openharmony\toolchains\hdc.exe install -r <repo>\build\ohos\hap\entry-default-signed.hap

# 启动 + 看日志
& <上面那个 hdc> shell "aa start -a EntryAbility -b com.sabernotes.saber"
& <上面那个 hdc> shell "hilog -x | grep -iE 'saber|flutter' | tail -30"
```

---

## 1. 目录布局

工作区固定放在 **`<workspace>`**(短路径:Windows 有 260 字符的 MAX_PATH 限制,
pub 的 git 缓存目录名带 40 位 SHA,长路径会直接 checkout 失败)。

```
<workspace>\
├─ flutter\                 Flutter-OH SDK 3.47.9-ohos-1.0.0(gitcode.com/oh-flutter/flutter_flutter)
├─ deveco-tools\            DevEco 命令行工具 6.0.1.251(Windows)
├─ ohos-sdk-root\           OpenHarmony 5.1.0 SDK(Windows 部分)
├─ jdk\                     Temurin JDK 17
├─ .pub-cache\              pub 缓存(1.9 GB)
└─ saber\                   本仓库(分支 feature/ohos-harmonyos)
```

环境变量由 **`harmony/toolchain/env.ps1`** 统一设置(SABER_OHOS_ROOT / FLUTTER_ROOT /
DEVECO_SDK_ROOT / OHOS_SDK_HOME / PUB_CACHE / PATH / JAVA_HOME …),所有脚本都先
`. (Join-Path $toolchain 'env.ps1')`。

---

## 2. 一次性环境准备

### 2.1 需要的组件

| 组件 | 版本 | 来源 |
|---|---|---|
| Flutter-OH SDK | 3.47.9-ohos-1.0.0 | `gitcode.com/oh-flutter/flutter_flutter` |
| DevEco 命令行工具 | 6.0.1.251 | 华为 |
| OpenHarmony SDK | 5.1.0(Windows 部分) | 华为 |
| JDK | 17 | Temurin |
| hdc | 3.2.0b | DevEco / OpenHarmony SDK 自带 |

### 2.2 全局 git 配置(两个必做项)

```powershell
# ① 长路径:pub 的 git 缓存路径会超过 260 字符
git config --global core.longpaths true

# ② GitHub 被墙时走 SOCKS 跳板(见 §5)
git config --global http.https://github.com.proxy socks5h://127.0.0.1:1081
```

### 2.3 SDK 侧准备(一条命令)

```powershell
powershell -ExecutionPolicy Bypass -File <repo>\toolchain\ohos\windows\setup_sdk.ps1
```

它做四件事(幂等,每次构建也会自动跑):

1. `flutter config --ohos-sdk=<DEVECO_SDK_HOME>`;
2. **引擎 HAR 的 API 版本降到 21**(`patch_engine_har_api.py`)——
   引擎 HAR 里是 `compatibleSdkVersion: 24`,与项目的 21 冲突,hvigor 会报
   `00306004 Specification Limit Violation`;
3. **回补 API 22/24 的声明**(`backport_api22_24_declarations.py`)——
   `CompetitionStrategy`(API 24)、`Window.isInFreeWindowMode`(API 22),
   否则 ArkTS 编译报 `Cannot find name 'CompetitionStrategy'`;
4. **flutter_tools 补丁**(`patch_flutter_tools_symlink.py`)——
   Windows 没开发者模式时建不了符号链接,让 flutter 容忍这件事。

---

## 3. 构建

```powershell
powershell -ExecutionPolicy Bypass -File scripts\build_ohos.ps1 -Mode release
```

内部五步(见 `harmony/scripts/build_ohos.ps1`):

| 步 | 动作 |
|---|---|
| 0 | 载入 `env.ps1` + 调 `setup_sdk.ps1` + 调 `setup_ohos_aot.py` |
| 1 | 把 `harmony/toolchain/pubspec_overrides.yaml` 复制到仓库根(pub 只认根目录) |
| 2 | `flutter pub get`(依赖覆盖生效) |
| 3 | 给第三方依赖打鸿蒙补丁(`apply_ohos_patches.py`,5 处) |
| 4 | 准备签名材料并改写 `ohos/build-profile.json5`(`prepare_signing.py`) |
| 5 | `flutter build hap --<mode> --dart-define=FLUTTER_OHOS_AOT_BUILD=true` |

产物:`build\ohos\hap\entry-default-signed.hap`

| 模式 | 体积 | 实测耗时 |
|---|---|---|
| debug | 267 MB | 108–217 s |
| release | **73.4 MB** | 约 380 s(hvigor 阶段) |

### 3.1 release(AOT)的两个要点

* **AOT 快照器直接跑 Windows exe,不需要 Wine**。fork 的 `flutter_cache.dart`
  原生支持 Windows 主机(`ohos-arm64-release/windows-x64/`),工具会自动下载。
  但 **OBS 上的那个是 kernel 130(3.44.9 时代)太旧**,要用 3.47.4-ohos-1.0.4 的
  Windows 主机包(kernel 138)—— 通过 SDK 自带的工件覆盖机制
  `bin/internal/dart-sdk-url.ohos` 指定(本仓库的 SDK 里已经加好那两行)。
* **三处 AOT 补丁**(`setup_ohos_aot.py`,幂等):
  `--target-os=linux`(前端服务器的 TargetOS 白名单里没有 ohos)、
  框架侧的 `FLUTTER_OHOS_AOT_BUILD` 开关、插件注册表把 ohos 分支提前
  (否则 `--target-os=linux` 会让 `Platform.isLinux` 恒真,桌面 Linux 插件会顶掉鸿蒙插件)。

### 3.2 图标摇树(const_finder)的 SDK hash

release 模式会跑引擎自带的 `const_finder` 扫图标常量。它是一个 **JIT 快照**,
由**引擎工件对应的那个 Dart SDK** 构建(原版 Dart 3.13.7,revision `416e33b0ff`),
并且里面编进了 `package:kernel` 用来核对 kernel 的 SDK hash。

而 Windows 上的主机 Dart SDK 是 **ohos 定制版**(revision `e8c31beb6a`,Dart 3.13.3),
两边对不上,于是报:

```
Can't load Kernel binary: Invalid SDK hash.
```

> **注意**:这条报错**说的是快照,不是 kernel** —— 是 VM 在加载 const_finder 快照时
> 的 SDK hash 校验失败,排查时极易误判成"kernel 的 hash 不对"。

**解法**:把快照里编译进去的 SDK hash 对齐成主机 SDK 的 revision 前缀
(`harmony/toolchain/windows/align_const_finder.py`,`setup_sdk.ps1` 的第 5 步会自动跑,
幂等)。`flutter precache` 重下引擎工件会把这个补丁冲掉,所以必须每次构建都补。

对齐之后 release 包 **37.9 MB**(跳过摇树是 73.4 MB),和 Linux 那边的产物同量级。

---

## 4. 安装到平板

```powershell
$hdc = '<devEco-tools>\command-line-tools\sdk\default\openharmony\toolchains\hdc.exe'
& $hdc tconn <device-ip>:<wireless-debug-port>     # 无线调试端口是动态的,变了要重新连
& $hdc install -r <repo>\build\ohos\hap\entry-default-signed.hap
& $hdc shell "aa start -a EntryAbility -b com.sabernotes.saber"
```

要点:

* 平板的**无线调试端口会变**(设备息屏/重启后失效),端口号要从平板的
  「开发者选项 → 无线调试」里读;变了就重新 `tconn`。
* 首次连接设备会显示 `Unauthorized`,**再连一次**即通过。
* 仓库里也有 `harmony/toolchain/dist/install-harmony.bat`(会自己找 hdc 和 HAP)。
* **签名**:profile 绑定了一台设备的 UDID,换设备要重新申请;
  `ohos/signing/` 在 `.gitignore` 里,不要提交。

---

## 5. GitHub 走跳板(Seoul)

本机直连 GitHub 不通,需要一个 SOCKS 跳板:

```powershell
# 后台起隧道(Seoul 只需要能 SSH 进来)
ssh -N -D 1081 -o StrictHostKeyChecking=no <build-host>
# git 侧指过去
git config --global http.https://github.com.proxy socks5h://127.0.0.1:1081
```

非交互式 SSH 需要 askpass 助手:

```powershell
$ask = "$env:TEMP\dsh_ssh\askpass.cmd"
New-Item -ItemType Directory -Force -Path (Split-Path $ask -Parent) | Out-Null
'@echo <密码>' | Set-Content -Path $ask -Encoding ASCII
$env:SSH_ASKPASS = $ask; $env:SSH_ASKPASS_REQUIRE = 'force'; $env:DISPLAY = '1'
```

---

## 6. 踩过的坑(留着省时间)

| 现象 | 根因 | 解法 |
|---|---|---|
| `TargetPlatform is not exhaustively matched` | **上游 bug**:`patch_target_platform_ohos.py` 从没扫到 `hosted/pub.dev/<pkg>/` | 修扫描循环(本仓库已修) |
| `00306004 Specification Limit Violation` | 引擎 HAR 是 API 24 | `patch_engine_har_api.py 21` |
| `Cannot find name 'CompetitionStrategy'` | API 24 符号 | `backport_api22_24_declarations.py` |
| `spawn java ENOENT` | 签名要 JDK | env.ps1 自动发现 JDK |
| pub 报 `Filename too long` | MAX_PATH 260 | `core.longpaths true` + 短路径工作区 |
| 依赖树每次构建都漂 | overrides 文件漏抄了上游 `dependency_overrides` 两条 | 已补 `flutter_speed_dial` / `native_toolchain_rust` |
| `.ps1` 解析失败 / 环境变量没设 | PS 5.1 把无 BOM 的 UTF-8 当 ANSI | **所有 .ps1 存 UTF-8 BOM**,构建脚本正文纯 ASCII |
| `Target file "" not found` | PS 5.1 把 `@$emptyArray` splat 成空参数 | 拼成一个参数数组再一次性 splat |
| 命令行参数被拆成两个 | PS 5.1 把未加引号的 `lib/main.dart` 当成"表达式 + 属性访问" | **给路径加引号**;看到日志里参数被拆开先怀疑调用方 |
| flutter 命令卡住不动 | `flutter.bat` 的锁被强杀的任务留下 | 杀残留 dart 进程、删 `bin\cache\flutter.bat.lock` |
| `Wrong full snapshot version` | flutter_tools 快照与 dartvm.exe 的 SDK hash 不一致 | 两个都要恢复成同一份 |
| 构建脚本报 `NativeCommandError`、退出码 1,但日志里有 `√ Built ...` | flutter 把提示写到 stderr,PS 5.1 把它包装成错误 | **以 `√ Built` 为准**,构建其实是成功的(退出码不可信) |

---

## 7. 与 Linux 流程的对应关系

| Linux(Seoul) | Windows(本机) |
|---|---|
| `harmony/toolchain/env.sh` | `harmony/toolchain/env.ps1` |
| (同一个 `harmony/toolchain/setup_ohos_aot.py`,两边共用) | 同左 |
| (同一个 `harmony/toolchain/apply_ohos_patches.py`,两边共用) | 同左 |
| (同一个 `harmony/toolchain/prepare_signing.py`,两边共用) | 同左 |
| `harmony/scripts/build_ohos.sh` | `harmony/scripts/build_ohos.ps1` |
| Wine 跑 `gen_snapshot.exe` | 直接跑(Windows exe) |
| `harmony/toolchain/dist/install-harmony.sh` | `harmony/toolchain/dist/install-harmony.bat` |
| (无) | `harmony/toolchain/windows/setup_sdk.ps1` —— SDK 侧准备集中化 |
