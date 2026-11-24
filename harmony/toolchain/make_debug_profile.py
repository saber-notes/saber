#!/usr/bin/env python3
"""make_debug_profile.py

生成一个 **调试类型(type=debug)** 的 provisioning profile(.p7b)。

与发布 profile 的区别:

| | 发布(release) | 调试(debug) |
|---|---|---|
| 证书字段 | `bundle-info.distribution-certificate` | `bundle-info.development-certificate` |
| 设备绑定 | 无 | `debug-info.device-ids` 列出允许安装的设备 UDID |
| 能否上架 | ✅ | ❌ 只能装到白名单设备 |

用法:
    python3 make_debug_profile.py <app.p12> <app.cer> <输出.p7b> [UDID ...]

    <app.p12>   密钥库(需与 keyPassword 一致)
    <app.cer>   证书链(叶子证书必须与 p12 的公钥匹配)
    <输出.p7b>  输出路径
    [UDID ...]  设备白名单,可指定多个;不给则留空

注意:
    * 这里只用 SDK 自带的 OpenHarmony 调试 CA 签发 profile,
      因此产出的包只能装到 **信任 OpenHarmony CA 的设备**
      (DevEco 模拟器 / OpenHarmony 设备)。
      HarmonyOS NEXT 真机只认华为账号签发的材料,那种情况请走
      toolchain/use_agc_signing.sh(AGC 下载的 .cer + .p7b)。
    * 证书链的叶子证书必须与密钥库里的公钥匹配,否则签名会报
      "verify certificate chain failed! Signature does not match."。
"""
import json
import os
import subprocess
import sys
import tempfile
import time

TOOLCHAIN = os.path.dirname(os.path.abspath(__file__))
# <repo>/harmony/toolchain -> <repo>; the SDK lives next to the repo, not in it.
REPO = os.path.dirname(os.path.dirname(TOOLCHAIN))
ROOT = os.environ.get("SABER_OHOS_ROOT", os.path.dirname(REPO))


def find_sdk():
    """定位 SDK 的 toolchains/lib 目录。"""
    candidates = [
        os.environ.get("DEVECO_SDK_HOME", ""),
        os.path.join(ROOT, "deveco-tools/command-line-tools/sdk/default"),
    ]
    for base in candidates:
        if not base:
            continue
        lib = os.path.join(base, "openharmony/toolchains/lib")
        if os.path.isdir(lib):
            return lib
    raise SystemExit("找不到 SDK toolchains/lib,请先 source env.sh")


def der_of(pem_text):
    """PEM 文本 -> DER 字节(用于比对公钥对应的证书)。"""
    import base64
    body = "".join(l for l in pem_text.splitlines() if "CERTIFICATE" not in l)
    return base64.b64decode(body)


def main():
    if len(sys.argv) < 4:
        raise SystemExit(__doc__)

    p12 = os.path.abspath(sys.argv[1])
    cer = os.path.abspath(sys.argv[2])
    out = os.path.abspath(sys.argv[3])
    udids = sys.argv[4:]

    lib = find_sdk()
    sign_tool = os.path.join(lib, "hap-sign-tool.jar")
    keystore = os.path.join(lib, "OpenHarmony.p12")
    profile_cert = os.path.join(lib, "OpenHarmonyProfileDebug.pem")
    template = os.path.join(lib, "UnsgnedDebugProfileTemplate.json")

    for f in (sign_tool, keystore, profile_cert, template, p12, cer):
        if not os.path.exists(f):
            raise SystemExit("缺少文件: %s" % f)

    with open(template) as f:
        prof = json.load(f)

    # 证书链里的叶子证书 = 第一张
    import re
    with open(cer) as f:
        certs = re.findall(
            r"-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----", f.read(), re.S)
    if not certs:
        raise SystemExit("%s 里没有找到证书" % cer)
    leaf = certs[0]

    now = int(time.time())
    prof["uuid"] = "com.sabernotes.saber-debug-%d" % now
    prof["validity"] = {"not-before": now, "not-after": now + 315360000}
    prof["bundle-info"]["bundle-name"] = "com.sabernotes.saber"
    # ⚠️ PEM 末尾必须保留换行符,否则 sign-app 会报
    #    "Illegal base64 character 20"(20 是空格的十六进制码)
    prof["bundle-info"]["development-certificate"] = leaf.strip() + "\n"
    prof["debug-info"] = {
        "device-ids": udids,
        "device-id-type": "udid",
    }

    tmp_json = tempfile.NamedTemporaryFile("w", suffix=".json", delete=False)
    with tmp_json as f:
        json.dump(prof, f, indent=4)
        tmp_path = f.name

    print("==> 签发 debug profile")
    r = subprocess.run([
        "java", "-jar", sign_tool, "sign-profile",
        "-mode", "localSign",
        "-keyAlias", "openharmony application profile debug",
        "-keyPwd", "123456",
        "-profileCertFile", profile_cert,
        "-inFile", tmp_path,
        "-signAlg", "SHA256withECDSA",
        "-keystoreFile", keystore,
        "-keystorePwd", "123456",
        "-outFile", out,
    ], capture_output=True, text=True)
    os.unlink(tmp_path)

    if r.returncode != 0:
        sys.stderr.write(r.stdout + r.stderr)
        raise SystemExit("签发失败")

    print("==> 完成:", out)
    print("    type        : debug")
    print("    bundle      :", prof["bundle-info"]["bundle-name"])
    print("    设备白名单  :", udids or "(空 — 任何设备都可装)")


if __name__ == "__main__":
    main()
