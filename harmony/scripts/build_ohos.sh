#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# 构建 Saber 的鸿蒙 / HarmonyOS NEXT HAP 包。
#
# 用法:
#   bash harmony/scripts/build_ohos.sh              # release 构建
#   bash harmony/scripts/build_ohos.sh --debug      # debug 构建
#
# 前置条件:
#   * 准备好 Flutter-OH SDK + DevEco 命令行工具,并 source 过环境变量
#     (见 harmony/docs/ohos.md 中的"环境准备"一节);
#   * harmony/toolchain/ 下的 SDK 修补脚本已经执行过一次(见 harmony/docs/ohos.md)。
#
# 产物: build/ohos/hap/entry-default-signed.hap
# ---------------------------------------------------------------------------
set -euo pipefail

cd "$(dirname "$0")/../.."
REPO_ROOT="$(pwd)"

# harmony/toolchain 目录: 与 saber 仓库放在一起,路径可移植
# shellcheck disable=SC1091
source "$REPO_ROOT/harmony/toolchain/common.sh"

BUILD_MODE="release"
BUILD_TARGET="hap"
for arg in "$@"; do
  case "$arg" in
    --debug)   BUILD_MODE="debug" ;;
    --profile) BUILD_MODE="profile" ;;
    --release) BUILD_MODE="release" ;;
    --app)     BUILD_TARGET="app" ;;   # 打应用市场要用的 .app 包
    *) echo "未知参数: $arg"; exit 1 ;;
  esac
done

# ---------------------------------------------------------------------------
# 版本号:单一来源。
#
# 华为应用市场的审核员会在「设置」页看到版本号,也会在商店里看到版本号,
# 两者必须一致。上游 Dart 里写死的是 1.37.1+137010(buildName/buildNumber),
# 而商店线用的是 1.0.0+1000000 —— 以前两套号各走各的,审核被打回过。
#
# 这里把同一个值同时喂给:
#   * --build-name / --build-number  -> 写进 ohos/AppScope/app.json5(包元数据)
#   * --dart-define=APP_VERSION_*    -> 设置页显示(lib/components/settings/app_info.dart)
#
# 升级版本:改下面两个默认值(或用环境变量覆盖),三处显示就都是同一个号。
# ---------------------------------------------------------------------------
APP_VERSION_NAME="${APP_VERSION_NAME:-1.0.2}"
APP_VERSION_CODE="${APP_VERSION_CODE:-1000002}"

# release/profile 需要 AOT,依赖 toolchain 侧的 Wine 版 gen_snapshot。
# 详见 harmony/docs/ohos.md §4.9。
if [ "$BUILD_MODE" != "debug" ]; then
  GEN_SNAP="$FLUTTER_ROOT/bin/cache/artifacts/engine/ohos-arm64-release/linux-x64/gen_snapshot"
  if [ ! -x "$GEN_SNAP" ]; then
    echo "错误: 缺少 ohos AOT 用的 gen_snapshot" >&2
    echo "  期望: $GEN_SNAP" >&2
    echo "  修复: bash \"$TOOLCHAIN_DIR/setup_ohos_aot.sh\"" >&2
    exit 1
  fi
fi

if ! command -v flutter > /dev/null 2>&1; then
  echo "错误:找不到 flutter,请先 source 鸿蒙构建环境的 env.sh" >&2
  exit 1
fi

echo "==> 0/6 应用上游补丁(把对上游文件的改动打到工作树上)"
# 上游 Saber 的文件在仓库里保持原样,我们对它们的 6 处改动以补丁形式放在
# harmony/patches/upstream/ 下。这里打上 —— 幂等,已打过会跳过。
#
# 必须发生在 `flutter pub get` **之前**:其中一处补丁给 pubspec.yaml 加上
# file_picker_ohos 依赖,少了它鸿蒙侧的文件选择器插件不会被注册。
bash "$REPO_ROOT/harmony/scripts/apply_upstream_patches.sh"

echo "==> 1/6 解析依赖"
# 依赖覆盖文件放在 harmony/toolchain/ 下,这里复制到仓库根目录 ——
# pub 只会读根目录的 pubspec_overrides.yaml。
# 不这么做的话,与鸿蒙无关的构建也会被强制拉取 gitcode 上的鸿蒙分支插件。
# 根目录那份已在 .gitignore 里,不会被提交。
cp -f "$TOOLCHAIN_DIR/pubspec_overrides.yaml" "$REPO_ROOT/pubspec_overrides.yaml"

# `flutter pub get` 会顺带检查 HarmonyOS SDK。在这个"命令行工具 + 独立 SDK"
# 的混合布局下,它会打印 "No Hmos SDK found" 并返回 1 —— 但依赖其实已经
# 解析成功了(紧跟着的 `flutter build hap` 内部还会再跑一次 pub get 并正常
# 找到 SDK)。所以这里只把"真的解析失败"当错误。
#
# 依赖解析成功时 pub 会打印两种消息之一:
#   "Got dependencies!"                —— 锁文件本来就是对的,没变化
#   "Changed N dependencies!"          —— 锁文件需要更新(例如首次带覆盖构建)
# 两种都算成功。
if ! flutter pub get 2>&1 | tee /tmp/saber_pubget.log; then
  if grep -q "No Hmos SDK found" /tmp/saber_pubget.log && \
     grep -qE "(Got|Changed [0-9]+) dependencies" /tmp/saber_pubget.log; then
    echo "    (忽略:只是 SDK 探测告警,依赖已解析完成)"
  else
    echo "错误:flutter pub get 失败" >&2
    exit 1
  fi
fi

echo "==> 2/6 应用第三方依赖补丁(harmony/patches/ohos)"
# 必须放在 `flutter pub get` **之后**:pub get 会重新解压/替换 pub cache 里的
# 包目录,补丁写在 cache 里的源码会被原样覆盖掉。顺序反了就会出现
# "TargetPlatform is not exhaustively matched ... 'TargetPlatform.ohos'"。
bash "$REPO_ROOT/harmony/patches/ohos/apply_ohos_patches.sh"

echo "==> 3/6 准备签名材料 + 写入 build-profile.json5"
# 仓库里提交的是「模板」:storePassword / keyPassword 是空串,
# 因为这两个字段是 hvigor 用的 AES 密文,和你的密钥库绑定,不能进版本库。
#
# prepare_signing.sh 会按 ohos/signing/ 里已有的材料自动选一条路:
#   * AGC(华为账号)签发的材料 -> 校验证书与 profile 是否配套
#   * OpenHarmony 社区证书     -> 直接写配置
#   * 什么都没有               -> 现场生成社区证书
bash "$TOOLCHAIN_DIR/prepare_signing.sh"

# 保险:profile 的类型必须和构建类型对得上。
#   调试 Profile(development-certificate)不能用来打上架包,
#   发布 Profile(distribution-certificate)不能用来装真机做调试。
# 对不上就直接停下,免得把调试签名的包传到应用市场。
PROFILE="$REPO_ROOT/ohos/signing/app.p7b"
if [ -f "$PROFILE" ]; then
    PROFILE_TYPE=$(openssl smime -verify -noverify -in "$PROFILE" -inform DER 2>/dev/null \
        | grep -o '"distribution-certificate"\|"development-certificate"' | head -1)
    case "$PROFILE_TYPE" in
        '"distribution-certificate"')
            [ "$BUILD_MODE" = "debug" ] && {
                echo "!! ohos/signing/app.p7b 是【发布 Profile】,不能用来做 debug 构建。" >&2
                echo "   调试请换回调试 Profile;要上架请用 --release。" >&2
                exit 1
            }
            echo "--> 使用发布 Profile(distribution-certificate)"
            ;;
        '"development-certificate"')
            [ "$BUILD_MODE" != "debug" ] && [ "$BUILD_TARGET" = "app" ] && {
                echo "!! ohos/signing/app.p7b 是【调试 Profile】,不能用来打上架用的 .app 包。" >&2
                echo "   上架请换成发布 Profile(AGC -> Profile -> 下载发布 Profile);" >&2
                echo "   本地装真机调试则用调试 Profile。" >&2
                exit 1
            }
            echo "--> 使用调试 Profile(development-certificate)"
            ;;
    esac
fi

echo "==> 4/6 构建 $BUILD_TARGET ($BUILD_MODE)"
# OHOS: 本工程用 --target-os=linux 编 AOT(见 harmony/docs/ohos.md §4.9),
# 这会让 Platform.isLinux 变成编译期常量 true,框架会把鸿蒙误判成桌面 Linux。
# 这个 dart-define 打开 harmony/toolchain/patch_ohos_aot_platform.py 加的开关,
# 强制把 defaultTargetPlatform 判为 ohos。对鸿蒙构建始终是正确的。
flutter build "$BUILD_TARGET" --"$BUILD_MODE" \
  --build-name="$APP_VERSION_NAME" \
  --build-number="$APP_VERSION_CODE" \
  --dart-define=APP_VERSION_NAME="$APP_VERSION_NAME" \
  --dart-define=APP_VERSION_CODE="$APP_VERSION_CODE" \
  --dart-define=FLUTTER_OHOS_AOT_BUILD=true \
  --dart-define=UPDATE_CHECK=false

echo "==> 版本号: $APP_VERSION_NAME ($APP_VERSION_CODE)"

# UPDATE_CHECK=false:关掉「启动时向 GitHub 查更新」。
# 上游默认开启,启动就会请求 raw.githubusercontent.com / api.github.com ——
# 这跟我们在应用市场与隐私政策里写的「平时完全离线可用 / 不与任何服务器通信」
# 对不上(而且它查的是上游的 Android 版 release,给鸿蒙用户也没有意义)。
# 改成只由用户主动触发时才会联网(上游保留了 userTriggered 分支)。

echo "==> 5/6 完成"
find build/ohos \( -name "*.hap" -o -name "*.app" \) -exec ls -lh {} \;

cat <<'EOF'

提示:
  * 若 signing/app.p7b 是 AGC(华为账号)签发的调试 Profile,则该 HAP
    可直接安装到 Profile 白名单里的 HarmonyOS 真机(如 MatePad Edge)。
  * 若用的是 SDK 自带的 OpenHarmony 社区证书,只能装到 OpenHarmony 设备
    与 DevEco 模拟器 —— 真机报 code:9568257 (fail to verify pkcs7 file)。
  * 安装:bash harmony/toolchain/install_on_device.sh
  详见 harmony/docs/ohos.md 的"真机安装"一节。
EOF
