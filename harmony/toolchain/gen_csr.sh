#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# 生成鸿蒙应用签名所需的「密钥对 + CSR」。
#
# 用途:
#   HarmonyOS NEXT(纯血鸿蒙)真机只认华为签发的证书,必须走这套流程:
#
#     1. 本脚本生成 .p12 密钥库 + .csr 证书签名请求
#     2. 拿 .csr 去 AppGallery Connect 申请 -> 得到 .cer 证书
#     3. 拿 .cer + Bundle Name + 设备 UDID 去 AGC 申请 -> 得到 .p7b 描述文件
#     4. 用 .p12 + .cer + .p7b 填 build-profile.json5,重新构建
#
# 用法:
#   bash toolchain/gen_csr.sh [输出目录] [密钥对密码] [密钥别名]
#
# 默认:
#   输出目录   saber/ohos/signing
#   密码       123456
#   别名       saber-key
#
# 生成后请把 .csr 上传到 AGC(证书管理 → 新建证书 → 上传 CSR)。
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
SDK="$DEVECO_SDK_ROOT"
SIGN_TOOL="$SDK/openharmony/toolchains/lib/hap-sign-tool.jar"

OUT_DIR="${1:-$SIGN_DIR}"
PWD_PLAIN="${2:-123456}"
ALIAS="${3:-saber-key}"

if [ ! -f "$SIGN_TOOL" ]; then
  echo "错误:找不到签名工具 $SIGN_TOOL" >&2
  exit 1
fi

mkdir -p "$OUT_DIR"
cd "$OUT_DIR"

P12="$OUT_DIR/app.p12"
CSR="$OUT_DIR/app.csr"

# 密钥对一旦生成就不能再改:已签发的 .cer / .p7b 都绑定在这把公钥上,
# 重新生成密钥对会让之前申请的证书全部失效。所以默认不覆盖。
FORCE=0
if [ "${4:-}" = "--force" ]; then
  FORCE=1
fi

if [ -f "$P12" ] && [ "$FORCE" -eq 0 ]; then
  echo "==> 检测到已存在的密钥对: $P12"
  echo "    密钥对一旦生成就不能再改 —— 已签发的 .cer / .p7b 都绑定在它的公钥上,"
  echo "    重新生成会让之前申请的证书全部失效(签名时报 Certificates Error)。"
  echo "    如确实要换一把新密钥,加 --force 参数重新运行。"
  echo
  if [ ! -f "$CSR" ]; then
    echo "==> 重新生成 CSR(使用已有密钥对)"
    rm -f "$CSR"
    java -jar "$SIGN_TOOL" generate-csr \
      -keyAlias "$ALIAS" \
      -keyPwd "$PWD_PLAIN" \
      -subject "C=CN,O=saber,OU=dev" \
      -signAlg SHA256withECDSA \
      -keystoreFile "$P12" \
      -keystorePwd "$PWD_PLAIN" \
      -outFile "$CSR"
  else
    echo "    CSR 已存在: $CSR"
  fi
  echo
  echo "==> 跳过密钥对生成"
else
  echo "==> 1/2 生成密钥对"
  rm -f "$P12"
  java -jar "$SIGN_TOOL" generate-keypair \
    -keyAlias "$ALIAS" \
    -keyPwd "$PWD_PLAIN" \
    -keyAlg ECC \
    -keySize NIST-P-256 \
    -keystoreFile "$P12" \
    -keystorePwd "$PWD_PLAIN"

  echo
  echo "==> 2/2 生成 CSR"
  rm -f "$CSR"
  java -jar "$SIGN_TOOL" generate-csr \
    -keyAlias "$ALIAS" \
    -keyPwd "$PWD_PLAIN" \
    -subject "C=CN,O=saber,OU=dev" \
    -signAlg SHA256withECDSA \
    -keystoreFile "$P12" \
    -keystorePwd "$PWD_PLAIN" \
    -outFile "$CSR"
fi

echo
echo "════ 接下来在 AppGallery Connect 上完成 ════"
cat <<EOF

1. 打开 https://developer.huawei.com/consumer/cn/service/josp/agc/index.html
   选择「用户与访问」→「证书管理」
2. 点「新建证书」→ 类型选「调试」→ 上传这个文件:
      $CSR
   审核通过后下载 .cer 文件
3. 点「Profile」→ 新建 → 填写:
      证书:   上一步下载的 .cer
      包名:   com.sabernotes.saber   (要和你在 AppGallery Connect 创建的应用一致)
      设备:   填入平板的 UDID,见下方命令
   保存后下载 .p7b 文件
4. 把 .cer / .p7b 放到:
      $OUT_DIR/
   并把 .cer 重命名为 app-cert.pem(注意要是「证书链」,不是单张证书)

获取平板 UDID:
      $SDK/hms/toolchains/hdc shell bm get --udid
EOF
