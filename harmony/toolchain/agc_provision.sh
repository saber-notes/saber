#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# agc_provision.sh
#
# 一条命令搞定「华为账号签发的调试签名材料」全流程:
#
#   1. 生成/复用本地密钥对 + CSR
#   2. 调 AGC Provisioning API 申请调试证书(.cer)
#   3. 注册平板设备(debug profile 需要设备白名单)
#   4. 调 AGC Provisioning API 申请调试 Profile(.p7b,绑定设备 UDID)
#   5. 改写 ohos/build-profile.json5 的 signingConfigs
#   6. 构建签名 HAP
#
# 用法:
#   bash toolchain/agc_provision.sh <凭据文件> [选项]
#
#   <凭据文件>   AGC 的 Service Account 凭据(*.private.json)
#                获取路径:AGC → 用户和权限 → API 密钥 → Connect API
#                          → Service Account → 创建 → 下载
#
# 选项:
#   --app-id <id>        已有应用的 APP ID(不给就自动创建)
#   --project-id <id>    AGC 项目 ID(创建应用时需要)
#   --package-name <pkg> 包名,默认 com.sabernotes.saber
#   --app-name <name>    应用名,默认 Saber
#   --udid <udid>        设备 UDID(不给就自动从 hdc 读)
#   --device-name <name> 设备名,默认 MatePad Edge
#   --skip-build         只准备签名材料,不构建
#   --type debug|release 证书类型,默认 debug
#
# 环境变量:
#   AGC_CREDENTIALS   等价于传凭据文件路径
# ---------------------------------------------------------------------------
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"
ROOT="$SABER_OHOS_ROOT"
SDK="$DEVECO_SDK_ROOT"
HOS_LIB="$SDK/openharmony/toolchains/lib"
SIGN_DIR="$SIGN_DIR"
AGC="$TOOLCHAIN_DIR/agc-cli/node_modules/.bin/agc"

# ---- 参数解析 --------------------------------------------------------------
CREDS="${AGC_CREDENTIALS:-}"
APP_ID=""
PROJECT_ID=""
PACKAGE_NAME="com.sabernotes.saber"
APP_NAME="Saber"
UDID=""
DEVICE_NAME="MatePad Edge"
SKIP_BUILD=0
CERT_TYPE="debug"
KEY_ALIAS="saber-key"
KEY_PWD="123456"

while [ $# -gt 0 ]; do
  case "$1" in
    --app-id)        APP_ID="$2"; shift 2 ;;
    --project-id)    PROJECT_ID="$2"; shift 2 ;;
    --package-name)  PACKAGE_NAME="$2"; shift 2 ;;
    --app-name)      APP_NAME="$2"; shift 2 ;;
    --udid)          UDID="$2"; shift 2 ;;
    --device-name)   DEVICE_NAME="$2"; shift 2 ;;
    --type)          CERT_TYPE="$2"; shift 2 ;;
    --skip-build)    SKIP_BUILD=1; shift ;;
    -h|--help)       sed -n '2,40p' "$0"; exit 0 ;;
    *)               CREDS="$1"; shift ;;
  esac
done

if [ -z "$CREDS" ] || [ ! -f "$CREDS" ]; then
  echo "错误:需要 AGC Service Account 凭据文件(*.private.json)" >&2
  echo "  用法:bash toolchain/agc_provision.sh <凭据文件> [选项]" >&2
  echo "  获取:AGC → 用户和权限 → API 密钥 → Connect API → Service Account" >&2
  exit 1
fi
CREDS="$(cd "$(dirname "$CREDS")" && pwd)/$(basename "$CREDS")"

if [ ! -x "$AGC" ]; then
  echo "错误:找不到 agc CLI,先执行:" >&2
  echo "  bash toolchain/install_agc_cli.sh" >&2
  exit 1
fi

# hdc
if [ -x "$SDK/hms/toolchains/hdc" ]; then
  HDC="$SDK/hms/toolchains/hdc"
else
  HDC="$(command -v hdc || true)"
fi

mkdir -p "$SIGN_DIR"

echo "════════════════════════════════════════════════════"
echo " Saber 鸿蒙版 · AGC 调试签名全流程"
echo "════════════════════════════════════════════════════"
echo "  包名      : $PACKAGE_NAME"
echo "  证书类型  : $CERT_TYPE"
echo

# ---- API 调用辅助 ----------------------------------------------------------
# agc CLI 出错时输出 {"error":..., "message":...}。
#
# agc_call 把 JSON 结果写到 $AGC_OUT 文件,失败时打印中文提示并返回 1。
# 注意:必须**直接调用**它(不能放进 $( ) 里),否则 exit 1 只会结束子 shell。
AGC_OUT="$(mktemp)"
AGC_ERR="$(mktemp)"
trap 'rm -f "$AGC_OUT" "$AGC_ERR"' EXIT

agc_call() {
  local desc="$1"; shift
  local rc
  set +e
  # stdout 存 JSON,stderr 单独存(node 的 warning 会污染 stdout 的解析)
  "$AGC" --json --credentials "$CREDS" "$@" > "$AGC_OUT" 2> "$AGC_ERR"
  rc=$?
  set -e
  if [ $rc -ne 0 ] || python3 -c "
import json,sys
try:
    d=json.load(open('$AGC_OUT'))
except Exception:
    sys.exit(1)
sys.exit(0 if isinstance(d,dict) and d.get('error') else 1)
"; then
    echo "    ✗ $desc 失败" >&2
    python3 "$TOOLCHAIN_DIR/agc_error.py" "$desc" < "$AGC_OUT" >&2
    if [ -s "$AGC_ERR" ] && ! grep -q "FORCE_COLOR\|trace-warnings" "$AGC_ERR"; then
      sed 's/^/      /' "$AGC_ERR" >&2
    fi
    return 1
  fi
  return 0
}

# ---- 1. 密钥对 + CSR -------------------------------------------------------
echo "==> 1/6 准备密钥对与 CSR"
P12="$SIGN_DIR/app.p12"
CSR="$SIGN_DIR/app.csr"
if [ -f "$P12" ] && [ -f "$CSR" ]; then
  echo "    复用已有密钥对 $P12"
  echo "    (密钥对一旦生成就不能改,已签发的证书都绑定在它的公钥上)"
else
  "$AGC" key gen \
    --alias "$KEY_ALIAS" --out "$P12" --csr-out "$CSR" \
    --cn "$APP_NAME" --ou "dev" --o "saber" --c CN \
    --validity 9125 --password "$KEY_PWD" --force
fi
echo

# ---- 2. 设备 UDID ----------------------------------------------------------
echo "==> 2/6 确认设备"
if [ -z "$UDID" ]; then
  if [ -n "$HDC" ] && [ -x "$HDC" ]; then
    UDID=$("$HDC" shell bm get --udid 2>/dev/null | tr -d '\r\n' | grep -oE '[0-9A-Fa-f]{40,}' | head -1)
  fi
fi
if [ -z "$UDID" ]; then
  echo "    ✗ 拿不到设备 UDID。请插上平板并开启 USB 调试,或用 --udid 手动指定。" >&2
  echo "      UDID 获取:hdc shell bm get --udid" >&2
  exit 1
fi
echo "    UDID: $UDID"
echo

# ---- 3. 创建应用(如果没给 --app-id)----------------------------------------
echo "==> 3/6 确认应用 APP ID"
if [ -z "$APP_ID" ]; then
  # 先按包名查已有的应用
  if agc_call "查询应用" app appid "$PACKAGE_NAME"; then
    EXISTING=$(python3 -c "
import json,sys
try:
    d=json.load(open('$AGC_OUT'))
except Exception:
    sys.exit(0)
data = d.get('data') if isinstance(d.get('data'), dict) else d
items = data.get('appInfos') or data.get('appIds') or data.get('list') or []
if isinstance(items, str):
    print(items.split(',')[0])
elif isinstance(items, list) and items:
    first = items[0]
    print(first.get('appId') if isinstance(first, dict) else first)
" 2>/dev/null || true)
  else
    EXISTING=""
  fi
  if [ -n "$EXISTING" ]; then
    APP_ID="$EXISTING"
    echo "    找到已有应用: $APP_ID"
  else
    if [ -z "$PROJECT_ID" ]; then
      echo "    ✗ 需要 --project-id(AGC 项目 ID)。在 AGC 控制台首页可以看到。" >&2
      exit 1
    fi
    echo "    创建新应用..."
    agc_call "创建应用" create-appid \
      --project-id "$PROJECT_ID" --name "$APP_NAME" \
      --package-name "$PACKAGE_NAME" --parent-type 13 --installation-free 0 || exit 1
    OUT="$(cat "$AGC_OUT")"
    APP_ID=$(echo "$OUT" | python3 -c "
import json,sys
try:
    d=json.load(sys.stdin)
except Exception:
    print(''); sys.exit(0)
data = d.get('data') if isinstance(d.get('data'), dict) else d
print(data.get('appId',''))
")
    if [ -z "$APP_ID" ]; then
      echo "    ✗ 创建应用失败:" >&2
      echo "$OUT" >&2
      exit 1
    fi
    echo "    创建成功: $APP_ID"
  fi
else
  echo "    使用指定 APP ID: $APP_ID"
fi
echo

# ---- 4. 注册设备 -----------------------------------------------------------
echo "==> 4/6 注册调试设备"
# 调试 Profile 里的设备用的是 AGC 的「设备 ID」,不是原始 UDID,
# 所以必须先把设备注册进 AGC。
DEV_ID=""
if agc_call "查询设备列表" device list --max 100; then
  DEV_ID=$(python3 -c "
import json,sys
try:
    d=json.load(open('$AGC_OUT'))
except Exception:
    sys.exit(0)
data = d.get('data') if isinstance(d.get('data'), dict) else d
for x in (data.get('deviceList') or data.get('list') or []):
    if '$UDID' in str(x):
        print(x.get('id') or x.get('deviceId') or '')
        break
" 2>/dev/null || true)
fi

if [ -n "$DEV_ID" ]; then
  echo "    设备已注册,设备 ID: $DEV_ID"
else
  # 批量添加设备的请求体格式各版本略有差异,这里依次试几种常见写法,
  # 第一个成功的就采用。
  ADDED=0
  for BODY in \
    "{\"deviceList\":[{\"deviceName\":\"$DEVICE_NAME\",\"udid\":\"$UDID\",\"deviceType\":\"tablet\"}]}" \
    "[{\"deviceName\":\"$DEVICE_NAME\",\"udid\":\"$UDID\"}]" \
    "{\"deviceName\":\"$DEVICE_NAME\",\"udid\":\"$UDID\",\"deviceType\":\"tablet\"}"
  do
    if agc_call "注册调试设备" device add -d "$BODY" 2>/dev/null; then
      ADDED=1
      break
    fi
  done

  if [ "$ADDED" -eq 0 ]; then
    echo "    ✗ 自动注册设备失败(几种请求格式都被拒了)。" >&2
    echo "      请在 AGC 网页上手动添加,然后重跑本脚本:" >&2
    echo "        AGC → 证书、APP ID 和 Profile → 设备管理 → 添加设备" >&2
    echo "        设备名称: $DEVICE_NAME" >&2
    echo "        UDID    : $UDID" >&2
    exit 1
  fi
  echo "    注册成功"

  # 注册后立刻回查设备 ID
  if agc_call "查询设备列表" device list --max 100; then
    DEV_ID=$(python3 -c "
import json,sys
try:
    d=json.load(open('$AGC_OUT'))
except Exception:
    sys.exit(0)
data = d.get('data') if isinstance(d.get('data'), dict) else d
for x in (data.get('deviceList') or data.get('list') or []):
    if '$UDID' in str(x):
        print(x.get('id') or x.get('deviceId') or '')
        break
" 2>/dev/null || true)
  fi
  if [ -z "$DEV_ID" ]; then
    echo "    ⚠️ 设备已提交,但暂时查不到设备 ID。" >&2
    echo "      AGC 对新增调试设备可能需要审核(通常几分钟到 1 个工作日)," >&2
    echo "      通过后再重跑本脚本即可。" >&2
    exit 1
  fi
  echo "    设备 ID: $DEV_ID"
fi
echo

# ---- 5. 申请证书 + Profile -------------------------------------------------
echo "==> 5/6 申请证书与 Profile"
CERT_NAME="${APP_NAME}-${CERT_TYPE}-$(date +%Y%m%d)"
CER_OUT="$SIGN_DIR/app.cer"
P7B_OUT="$SIGN_DIR/app.p7b"

echo "    5a 申请 $CERT_TYPE 证书..."
agc_call "申请证书" cert apply \
  --name "$CERT_NAME" --type "$CERT_TYPE" \
  --csr "$CSR" --out "$CER_OUT" --force || exit 1
CERT_JSON="$(cat "$AGC_OUT")"
CERT_ID=$(echo "$CERT_JSON" | python3 -c "
import json,sys
try:
    d=json.load(sys.stdin)
except Exception:
    print(''); sys.exit(0)
data = d.get('data') if isinstance(d.get('data'), dict) else d
ci = data.get('certInfo') or {}
print(ci.get('id',''))
")
if [ -z "$CERT_ID" ]; then
  echo "    ✗ 拿不到证书 ID。完整返回如下:" >&2
  echo "$CERT_JSON" >&2
  exit 1
fi
echo "      证书 ID: $CERT_ID"

echo "    5b 申请 $CERT_TYPE Profile(绑定设备 $DEV_ID)..."
# 注意:--device-ids 用的是 AGC 的设备 ID($DEV_ID),不是原始 UDID
agc_call "申请 Profile" profile apply \
  --name "${CERT_NAME}-profile" --type "$CERT_TYPE" \
  --app-id "$APP_ID" --cert-id "$CERT_ID" \
  --device-ids "$DEV_ID" --out "$P7B_OUT" --force || exit 1
echo "      完成"
echo

# ---- 6. 配置 + 构建 --------------------------------------------------------
echo "==> 6/6 配置签名并构建"
cp "$CER_OUT" "$SIGN_DIR/app-cert.pem"

bash "$TOOLCHAIN_DIR/use_agc_signing.sh" "$KEY_PWD" "$KEY_ALIAS"

# 包名要跟 AGC 一致
python3 - "$APP_JSON5" "$PACKAGE_NAME" <<'PY'
import json, re, sys
path, pkg = sys.argv[1], sys.argv[2]
src = open(path).read()
new = re.sub(r'("bundleName"\s*:\s*")[^"]*(")', r'\g<1>' + pkg + r'\g<2>', src)
if new != src:
    open(path, 'w').write(new)
    print("    AppScope/app.json5 的 bundleName → %s" % pkg)
else:
    print("    AppScope/app.json5 的 bundleName 已是 %s" % pkg)
PY

if [ "$SKIP_BUILD" -eq 1 ]; then
  echo
  echo "完成(--skip-build,未构建)。签名材料在 $SIGN_DIR"
  exit 0
fi

cd "$SABER_REPO_ROOT"
source "$TOOLCHAIN_DIR/env.sh"
flutter build hap --debug 2>&1 | tail -3

echo
echo "════════════════════════════════════════════════════"
echo " ✓ 全部完成"
echo "════════════════════════════════════════════════════"
echo "  HAP: $SABER_REPO_ROOT/build/ohos/hap/entry-default-signed.hap"
echo
echo "  下一步(插上平板后):"
echo "    bash $TOOLCHAIN_DIR/install_on_device.sh"
echo "════════════════════════════════════════════════════"
