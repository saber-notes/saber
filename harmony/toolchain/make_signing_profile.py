#!/usr/bin/env python3
"""
make_signing_profile.py

Regenerates the OpenHarmony signing material for the saber HAP:

  1. builds an unsigned provisioning profile (release type) whose bundle-name
     matches the app and whose validity window starts now
  2. signs it with the SDK's own "openharmony application profile release" key
     via `hap-sign-tool.jar sign-profile`
  3. copies the application certificate *chain* and the keystore next to it

Everything comes from the SDK that ships with DevEco's command line tools, so
no Huawei developer account is required.  The result is an OpenHarmony
profile: it installs on OpenHarmony devices and on the DevEco simulator, but
a real HarmonyOS NEXT phone requires Huawei issued material (see docs/ohos.md).
"""
import pathlib
import json
import os
import re
import shutil
import subprocess
import sys
import time

ROOT = os.environ.get(
    "SABER_OHOS_ROOT",
    str(pathlib.Path(__file__).resolve().parents[3]),
)
REPO = os.environ.get(
    "SABER_REPO_ROOT",
    str(pathlib.Path(__file__).resolve().parents[2]),
)
SDK = os.path.join(ROOT, "deveco-tools/command-line-tools/sdk/default")
OHOS_LIB = os.path.join(SDK, "openharmony/toolchains/lib")
SIGN = os.path.join(REPO, "ohos/signing")
BUILD_PROFILE = os.path.join(REPO, "ohos/build-profile.json5")
TOOLCHAIN = os.path.join(REPO, "harmony/toolchain")

BUNDLE_NAME = os.environ.get("BUNDLE_NAME", "com.sabernotes.saber")
STORE_PWD = os.environ.get("STORE_PWD", "123456")
APP_ALIAS = "openharmony application release"
PROFILE_ALIAS = "openharmony application profile release"
SIGN_ALG = "SHA256withECDSA"


def read_pem(path):
    """Return the PEM text of a certificate chain file."""
    with open(path) as f:
        return f.read().strip()


def build_unsigned_profile(path):
    """Write the unsigned provisioning profile JSON.

    The profile is derived from the SDK's own UnsgnedReleasedProfileTemplate
    so that every field the sign tool expects is present.  Only three fields
    are changed:

      * bundle-name                 -> our application
      * uuid                        -> unique per build
      * validity                    -> valid from now for ~10 years

    In particular the "distribution-certificate" is kept exactly as the SDK
    ships it: the sign tool wants that single leaf certificate here, while
    the *application* certificate file has to be the full chain.
    """
    now = int(time.time())
    with open(os.path.join(OHOS_LIB, "UnsgnedReleasedProfileTemplate.json")) as f:
        profile = json.load(f)

    profile["uuid"] = "com.sabernotes.saber-%d" % now
    profile["validity"] = {
        "not-before": now,
        "not-after": now + 315360000,  # ~10 years
    }
    profile["bundle-info"]["bundle-name"] = BUNDLE_NAME

    with open(path, "w") as f:
        json.dump(profile, f, indent=4)
    return profile


def sign_profile(unsigned, signed):
    """Sign the unsigned profile into a .p7b."""
    cmd = [
        "java", "-jar", os.path.join(OHOS_LIB, "hap-sign-tool.jar"), "sign-profile",
        "-mode", "localSign",
        "-keyAlias", PROFILE_ALIAS,
        "-keyPwd", STORE_PWD,
        "-profileCertFile", os.path.join(OHOS_LIB, "OpenHarmonyProfileRelease.pem"),
        "-inFile", unsigned,
        "-signAlg", SIGN_ALG,
        "-keystoreFile", os.path.join(OHOS_LIB, "OpenHarmony.p12"),
        "-keystorePwd", STORE_PWD,
        "-outFile", signed,
    ]
    print("==> java -jar hap-sign-tool.jar sign-profile ...")
    res = subprocess.run(cmd, capture_output=True, text=True)
    sys.stdout.write(res.stdout)
    sys.stderr.write(res.stderr)
    if res.returncode != 0:
        raise SystemExit("sign-profile failed with %d" % res.returncode)


def dump_profile(path):
    """Print a short summary of the signed profile by unpacking the p7b."""
    import tempfile
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as tmp:
        payload = tmp.name
    r = subprocess.run(
        ["openssl", "smime", "-verify", "-noverify", "-in", path,
         "-inform", "DER", "-out", payload],
        capture_output=True, text=True,
    )
    try:
        if r.returncode != 0:
            print("  (could not unpack profile payload)")
            return
        with open(payload) as f:
            data = json.load(f)
        print("  type        :", data.get("type"))
        print("  bundle      :", data["bundle-info"]["bundle-name"])
        print("  validity    :", data["validity"])
    finally:
        os.unlink(payload)


def ensure_material_dir():
    """把 hvigor 插件自带的 material/ 复制到签名目录。

    hvigor 用它派生 AES 密钥来解密 build-profile.json5 里的
    storePassword / keyPassword。密钥库必须与 material/ 同级。
    """
    material = os.path.join(SIGN, "material")
    if os.path.isdir(material):
        return material
    src = os.path.join(
        ROOT,
        "deveco-tools/command-line-tools/hvigor/hvigor-ohos-plugin/res/material",
    )
    if not os.path.isdir(src):
        raise SystemExit(
            "找不到 hvigor 插件的 material 目录: %s\n"
            "请确认 DevEco 命令行工具已安装到 %s" % (src, ROOT)
        )
    shutil.copytree(src, material)
    return material


def write_build_profile():
    """把社区证书材料写进 build-profile.json5。

    与 AGC 路径共用 apply_signing_config.py,保证两条路径生成的配置格式一致。
    """
    node = shutil.which("node")
    if not node:
        raise SystemExit("找不到 node —— 加密签名密码需要它")

    enc = os.path.join(TOOLCHAIN, "encrypt_signing_password.js")
    res = subprocess.run(
        [node, enc, SIGN, STORE_PWD], capture_output=True, text=True
    )
    if res.returncode != 0:
        sys.stderr.write(res.stdout)
        sys.stderr.write(res.stderr)
        raise SystemExit("加密签名密码失败")
    hexpwd = res.stdout.strip()

    apply = os.path.join(TOOLCHAIN, "apply_signing_config.py")
    res = subprocess.run(
        [
            sys.executable, apply, BUILD_PROFILE,
            "--store-file", "signing/saber.p12",
            "--profile-file", "signing/saber.p7b",
            "--certpath", "signing/saber-app-cert.pem",
            "--key-alias", "openharmony application release",
            "--password-hex", hexpwd,
        ],
        capture_output=True, text=True,
    )
    sys.stdout.write(res.stdout)
    sys.stderr.write(res.stderr)
    if res.returncode != 0:
        raise SystemExit("改写 build-profile.json5 失败")


def main():
    os.makedirs(SIGN, exist_ok=True)
    unsigned = os.path.join(SIGN, "saber-profile-unsigned.json")
    signed = os.path.join(SIGN, "saber.p7b")

    build_unsigned_profile(unsigned)
    sign_profile(unsigned, signed)

    # The sign tool insists on a *chain* (three level + two root).  A single
    # certificate fails with: "Profile cert must a cert chain".
    shutil.copyfile(
        os.path.join(OHOS_LIB, "OpenHarmonyApplication.pem"),
        os.path.join(SIGN, "saber-app-cert.pem"),
    )
    shutil.copyfile(
        os.path.join(OHOS_LIB, "OpenHarmony.p12"),
        os.path.join(SIGN, "saber.p12"),
    )

    ensure_material_dir()
    write_build_profile()

    print()
    print("==> signing material:")
    for name in sorted(os.listdir(SIGN)):
        p = os.path.join(SIGN, name)
        if os.path.isfile(p):
            print("  %-32s %8d bytes" % (name, os.path.getsize(p)))
    print()
    print("==> profile summary:")
    dump_profile(signed)


if __name__ == "__main__":
    main()
