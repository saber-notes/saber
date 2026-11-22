# 鸿蒙构建工具链

这个目录是 **Saber 鸿蒙适配的主机侧工具链**:把上游那个 Flutter 应用
变成能装进鸿蒙平板的 `.hap`,中间所有脏活累活都在这里。

工具链整体是**幂等**的 —— 每个脚本都可以重复跑,已经做过的步骤会跳过。

> 这些脚本以前散在仓库外的 `toolchain/` 目录里,别人根本复现不了。
> 现在统一收进仓库,路径全部通过 [`common.sh`](common.sh) 推导,
> 换机器只要设 `SABER_OHOS_ROOT` 就行。

---

## 目录

| 路径 | 说明 |
|---|---|
| [`common.sh`](common.sh) | **所有脚本的公共部分**:路径推导 + 小工具函数 |
| [`env.sh`](env.sh) | 构建环境变量(`FLUTTER_ROOT` / `OHOS_SDK_HOME` / `PATH` …) |
| [`saber-harmony.sh`](saber-harmony.sh) | 顶层入口:一条命令跑完 setup / build / sign / install |
| [`pubspec_overrides.yaml`](pubspec_overrides.yaml) | 依赖覆盖(见下文「为什么不放仓库根目录」) |
| [`dist/`](dist/) | 打包给终端用户的安装脚本(装平板用) |
| [`loader-declarations-extra/`](loader-declarations-extra/) | ArkTS loader 专属声明(不能被覆盖掉) |

---

## 快速上手

```bash
cd saber
source harmony/toolchain/env.sh

bash harmony/toolchain/saber-harmony.sh setup    # 准备 SDK(声明树同步 + API 回补 + AOT 打通)
bash harmony/toolchain/saber-harmony.sh build    # 构建 HAP
bash harmony/toolchain/saber-harmony.sh install  # 装到平板并启动
```

`saber-harmony.sh` 的子命令:

| 命令 | 作用 |
|---|---|
| `setup` | 准备构建环境(SDK 修补、声明树同步、AOT 打通);已完成则跳过 |
| `build` | 构建签名 HAP |
| `sign` | 申请 AGC 调试证书 + Profile 并重新构建(需要 AGC 凭据) |
| `install` | 安装到平板并启动 |
| `device` | 平板连接体检 |
| `all` | `sign` + `install` 全流程 |

---

## 路径是怎么推出来的

`common.sh` 里的推导链:

```
harmony/toolchain/common.sh
        │  ../..
        ▼
SABER_REPO_ROOT  = <仓库根>          # harmony/toolchain/ 在它下面
        │  ..
        ▼
SABER_OHOS_ROOT  = <工作区根>         # 默认取仓库的上一级目录
        ├── flutter/                         Flutter-OH SDK
        ├── ohos-sdk-root/ohos-sdk/          OpenHarmony SDK
        └── deveco-tools/command-line-tools/ DevEco 命令行工具
```

想换布局,只要设 `SABER_OHOS_ROOT`:

```bash
export SABER_OHOS_ROOT=/your/workspace
source harmony/toolchain/env.sh
```

每个变量也都能单独覆盖(`FLUTTER_ROOT`、`OHOS_SDK_HOME`、`DEVECO_TOOLS` …),
Python / JS 脚本读同名环境变量。

### `DEVECO_SDK_HOME` 与 `DEVECO_SDK_ROOT` 的区别

这两个**差一层,是故意的**:

| 变量 | 指向 | 谁在用 |
|---|---|---|
| `DEVECO_SDK_HOME` | `<tools>/sdk` | Flutter-OH。它按 `sdk/<apiVersion 对应的目录名>` 定位 SDK,所以必须是这一层 |
| `DEVECO_SDK_ROOT` | `<tools>/sdk/default` | 本工具链的脚本。它们要访问 `openharmony/toolchains/lib/hap-sign-tool.jar` 这类路径,用的是真正放内容的那一层 |

混用会踩坑:source 了 `env.sh` 之后 `DEVECO_SDK_HOME` 存在,
脚本如果拿它当 SDK 根,就会在 `.../sdk/openharmony/...` 下找文件 —— 找不到。

---

## 脚本一览

### 环境与编排

| 脚本 | 作用 |
|---|---|
| `common.sh` | 路径推导与公共函数,被其余脚本 source |
| `env.sh` | 导出构建环境变量;`source` 一次即可 |
| `saber-harmony.sh` | 顶层入口,串联下面所有步骤 |

### SDK 准备

| 脚本 | 作用 |
|---|---|
| `sync_api21_declarations.sh` | 把 **官方 API 21** 声明树覆盖到 SDK 的 `ets-loader/declarations/`(SDK 自带的是过时的 API 18) |
| `backport_api22_24_declarations.py` | 回补 `CompetitionStrategy`(API 24)、`Window.isInFreeWindowMode()`(API 22)两个高版本符号 |
| `sync_sdk_api_version.py` | 统一各 SDK 组件的 `apiVersion` 元数据(hvigor 会校验一致性) |
| `fix_hms_sdk_metadata.py` | 给 HarmonyOS(`hms/`)侧补 `sdk-pkg.json` |
| `install_hms_sdk_overlay.sh` | 按 DevEco 命令行工具包的真实布局重装 SDK 组件 |
| `fix_sdk_permissions.sh` | 修复解压后丢失的可执行位(`es2abc` / `restool` 会报 Permission denied) |
| `install_host_strip.sh` | 用宿主 LLVM 替换 SDK 里只有 aarch64 的 `llvm-strip` |
| `fetch_ohos_sdk_parts.sh` | 从官方 SDK 大压缩包里只抽取需要的组件(分片 range 下载,不落整包) |
| `fetch_remote_zip.py` | 从远程 zip 里按 HTTP Range 只取需要的条目 |

> `sync_api21_declarations.sh` 默认**直接用 DevEco SDK 自带的官方 API 21 声明树**
> (`$DEVECO_SDK_ROOT/openharmony/ets`)作为源 —— 它本来就在那里,
> 没必要在仓库里再放一份几千个 `.d.ts` 的拷贝。

### Flutter / Dart 侧补丁

| 脚本 | 作用 |
|---|---|
| `setup_ohos_aot.py` | **AOT 的三处源码补丁**(跨平台共用)—— `--target-os` 白名单、框架的平台判定、插件注册表顺序 |
| `setup_ohos_aot.sh` | **在 Linux 主机上打通 release(AOT)构建**:装 Wine + 下载 Windows 版 gen_snapshot,源码补丁交给上面那个 —— 见 [§4.9](../docs/ohos.md#49-linux-主机上的-releaseaot构建--已打通) |
| `patch_ohos_aot_platform.py` | AOT 下强制把 `defaultTargetPlatform` 判为 `ohos`(否则 `Platform.isLinux` 恒为 true,白屏) |
| `patch_frontend_server.py` | 把 `frontend_server` 改成「只做 kernel 编译」的精简版 |
| `patch_dart_sdk_ohos.py` | 给 `dart:ffi` 补上 `Abi.ohosArm` / `Abi.ohosArm64` / `Abi.ohosX64` |
| `patch_engine_har_api.py` | 把引擎 har 声明的 API 版本下调到当前 SDK 能提供的版本 |
| `patch_hvigor_transcoder.py` | 让 hvigor 在缺少 `libimage_transcoder_shared.so` 时不传 `extensionPath` |
| `patch_hvigor_version_map.py` | 给 hvigor 的 `osVersionMapper` 补上较新的 HarmonyOS 版本 |

### 签名

| 脚本 | 作用 |
|---|---|
| `prepare_signing.py` | **入口**:按 `ohos/signing/` 里已有的材料自动选一条路,并写好 `build-profile.json5`(跨平台共用) |
| `prepare_signing.sh` | → 上面那个的薄封装 |
| `gen_csr.sh` | 生成密钥对(`.p12`)+ 证书签名请求(`.csr`) |
| `make_signing_profile.py` | 本地生成 provisioning profile(社区调试证书用) |
| `make_debug_profile.py` | 生成带设备 UDID 白名单的调试 profile |
| `complete_cert_chain.py` | 把单张叶子证书补成完整证书链(签名工具要求是「链」) |
| `use_agc_signing.sh` | 切换到 AGC(华为账号)签发的材料 → `prepare_signing.py --password … --alias …` 的薄封装 |
| `apply_signing_config.py` | 把签名配置写进 `ohos/build-profile.json5`(上面两条路径共用) |
| `encrypt_signing_password.js` | 把明文密码加密成 hvigor 要的 hex 串 |
| `decrypt_default_store_pass.js` | 上面那个的逆运算,用于解开 SDK 默认密码 |
| `install_agc_cli.sh` | 安装 `@byterm/agc-cli` |
| `agc_provision.sh` | 用 agc-cli 自动申请证书与 profile |
| `agc_error.py` | 把 agc CLI 的 JSON 错误翻译成可读的中文提示 |
| `verify_app_package.py` | **验收上架包**:图标有没有 alpha 通道、签名/profile 对不对、版本号与包名、应用名 |
| `make_app_icon.py` | 生成应用图标(商店 1024×1024 RGB + 包内 512×512 RGB) |

### 依赖补丁

| 脚本 | 作用 |
|---|---|
| `apply_ohos_patches.py` | 给 pub cache 里的第三方依赖打鸿蒙补丁(跨平台共用,五个补丁) |
| `../patches/ohos/apply_ohos_patches.sh` | → 上面那个的薄封装 |
| `../patches/ohos/patch_target_platform_ohos.py` | 给穷尽的 `TargetPlatform` switch 补 `ohos` 分支 |

### Windows 专属

Linux 那边的等价实现在 `windows/` 里没有对应物 —— 它们解决的是
Windows 特有的问题。

| 脚本 | 作用 |
|---|---|
| `windows/setup_sdk.ps1` | 把 SDK 侧的准备串成一步(幂等):引擎 HAR 的 API 版本、API 22/24 声明回补、符号链接容忍、`const_finder` 对齐、AOT 补丁 |
| `windows/patch_flutter_tools_symlink.py` | 没开开发者模式时,让 flutter 容忍创建插件符号链接失败(1314) |
| `windows/align_const_finder.py` | 把 `const_finder` 快照里的 SDK hash 对齐成主机 Dart SDK 的 revision(release 的图标摇树要用) |

### 设备

| 脚本 | 作用 |
|---|---|
| `device.sh` | 平板连接体检(连上了吗?UDID 是多少?) |
| `install_on_device.sh` | 安装 HAP 并启动 |
| `make_install_kit.sh` | 把 HAP + 安装脚本打成一个自包含目录,发给只用 Mac/Windows 的同事 |

---

## 依赖覆盖为什么不放仓库根目录

仓库根目录的 `pubspec_overrides.yaml` 会被 **pub 自动读取**。
如果把它提交在根目录,那么:

* 上游 CI(`.github/workflows/tests.yml` 跑 `flutter pub get`)会被迫去拉
  [gitcode.com/openharmony-tpc/flutter_packages](https://gitcode.com/openharmony-tpc/flutter_packages)
  上的鸿蒙分支插件;
* 任何克隆了本仓库的人,跑与鸿蒙完全无关的 Android / Linux / Windows 构建,
  也会被拖慢、甚至因为 gitcode 不可达而直接失败。

所以覆盖文件本体放在 `harmony/toolchain/pubspec_overrides.yaml`,
由 `harmony/scripts/build_ohos.sh` 在构建前复制到仓库根目录。
根目录那份已经在 `.gitignore` 里,不会被提交。

> 副作用:跑完鸿蒙构建后,`pubspec.lock` 会被 `flutter pub get` 改写
> (因为依赖集合变了)。这是本地产物,想还原就:
>
> ```bash
> git checkout -- pubspec.lock
> ```
>
> 同理,`ohos/build-profile.json5` 里的 `storePassword` / `keyPassword`
> 会被 `prepare_signing.sh` 填成实际值(那两个字段是 hvigor 用的
> AES 密文,和你的密钥库绑定,仓库里提交的是空串模板)。
> 想还原就:
>
> ```bash
> git checkout -- ohos/build-profile.json5
> ```

---

## 目录约定

```
harmony/toolchain/
├── common.sh          路径推导(被所有脚本 source)
├── env.sh             构建环境变量
├── saber-harmony.sh   顶层入口
├── *.sh / *.py / *.js 具体工具
├── agc-cli/           agc-cli 的 package.json(node_modules 不入库)
├── dist/              给终端用户的安装脚本
├── loader-declarations-extra/
│                      ArkTS loader 专属声明(覆盖时必须保留)
└── backup/            SDK 声明树备份(本地产物,不入库)
```
