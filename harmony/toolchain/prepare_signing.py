#!/usr/bin/env python3
"""准备签名材料,并把配置写进 ohos/build-profile.json5(两个平台共用)。

三条路径,按优先级自动判断:

  1. AGC(华为开发者账号)签发的材料齐全
     (signing/app.p12 + signing/app.p7b + signing/app.cer)
     -> 校验证书与 profile 是否配套,写配置
     -> 产物能装到「调试 Profile 白名单里的 HarmonyOS NEXT 真机」
  2. 已有 OpenHarmony 社区证书材料(signing/saber.p12 + signing/saber.p7b)
     -> 直接写配置
     -> 产物只能装到 OpenHarmony 设备 / DevEco 模拟器
  3. 什么都没有
     -> 用 SDK 自带的社区证书现场生成一套
     -> 同上,只能装到 OpenHarmony 设备 / 模拟器

用法:
    python harmony/toolchain/prepare_signing.py [--password 123456] [--alias saber-key]

环境变量:
    STORE_PWD  密钥库密码(默认 123456)
    ALIAS      密钥别名(默认 saber-key)
"""
from __future__ import annotations

import argparse
import base64
import hashlib
import json
import os
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile

REPO_ROOT = pathlib.Path(__file__).resolve().parents[2]
TOOLCHAIN = REPO_ROOT / "harmony" / "toolchain"
SIGN_DIR = REPO_ROOT / "ohos" / "signing"
BUILD_PROFILE = REPO_ROOT / "ohos" / "build-profile.json5"


def find_node() -> str:
    """hvigor/ohpm 自带的 node,或者 PATH 上的 node。"""
    for cand in (
        os.environ.get("DEVECO_NODE_HOME", ""),
        r"C:\Program Files\nodejs",
    ):
        if not cand:
            continue
        exe = pathlib.Path(cand) / ("node.exe" if os.name == "nt" else "node")
        if exe.is_file():
            return str(exe)
    node = shutil.which("node")
    if node:
        return node
    raise SystemExit("[error] 找不到 node(需要 DevEco 自带的 tool/node 或 PATH 上的 node)")


def find_openssl() -> str | None:
    """Git for Windows 自带 openssl.exe;没有就跳过 profile 校验。"""
    exe = shutil.which("openssl")
    if exe:
        return exe
    for base in (
        r"C:\Program Files\Git\usr\bin",
        r"C:\Program Files\Git\mingw64\bin",
    ):
        p = pathlib.Path(base) / "openssl.exe"
        if p.is_file():
            return str(p)
    return None


def copy_material() -> None:
    """material/ 是 hvigor 用来解密密钥库密码的密钥材料,SDK 插件里有一份。"""
    material = SIGN_DIR / "material"
    if material.is_dir():
        print(f"    {material} 已存在")
        return
    deveco = os.environ.get("DEVECO_TOOLS", "")
    if not deveco:
        print("    [warn] 没有 DEVECO_TOOLS,跳过 material 复制")
        return
    src = pathlib.Path(deveco) / "hvigor" / "hvigor-ohos-plugin" / "res" / "material"
    if not src.is_dir():
        print(f"    [warn] 找不到 {src},跳过 material 复制")
        return
    material.mkdir(parents=True, exist_ok=True)
    shutil.copytree(src, material, dirs_exist_ok=True)
    print(f"    material/ 已从 {src} 复制")


def encrypt_password(password: str) -> str:
    node = find_node()
    out = subprocess.run(
        [node, str(TOOLCHAIN / "encrypt_signing_password.js"), str(SIGN_DIR), password],
        capture_output=True,
        text=True,
        check=True,
    )
    return out.stdout.strip()


def certs_from_pem(text: str) -> list[str]:
    return re.findall(r"-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----", text, re.S)


def der_of(pem: str) -> bytes:
    body = "".join(l for l in pem.splitlines() if "CERTIFICATE" not in l)
    return base64.b64decode(body)


def same_public_key(cert_a: str, cert_b: str) -> bool:
    """比较两张证书的公钥是否相同(AGC 的自动签名证书与密钥库里的证书常是同一把钥匙)。"""
    openssl = find_openssl()
    if not openssl:
        return False
    import tempfile as _tf
    for cert in (cert_a, cert_b):
        with _tf.NamedTemporaryFile(suffix=".pem", delete=False, mode="w") as tmp:
            tmp.write(cert)
            path = tmp.name
        try:
            out = subprocess.run(
                [openssl, "x509", "-pubkey", "-noout", "-in", path],
                capture_output=True, text=True, check=False,
            )
            if out.returncode != 0:
                return False
            digest = hashlib.sha256(out.stdout.encode()).hexdigest()
            if cert is cert_a:
                first = digest
            else:
                return first == digest
        finally:
            try:
                os.unlink(path)
            except OSError:
                pass
    return False


def cert_from_p12(p12: pathlib.Path, password: str) -> str:
    """从密钥库里导出证书(PEM 文本)。失败返回空串。"""
    openssl = find_openssl()
    if not openssl:
        return ""
    for extra in (["-legacy"], []):
        out = subprocess.run(
            [openssl, "pkcs12", "-in", str(p12), "-nokeys", "-passin", f"pass:{password}", *extra],
            capture_output=True, text=True, check=False,
        )
        # openssl 的输出前面会带一段 "Bag Attributes",证书在后面
        m = re.search(r"-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----", out.stdout, re.S)
        if m:
            return m.group(0) + "\n"
    return ""


def profile_cert(p7b: pathlib.Path) -> str:
    """从 profile(.p7b) 里取出它引用的那张证书(PEM 文本)。"""
    openssl = find_openssl()
    if not openssl:
        return ""
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as tmp:
        payload = tmp.name
    try:
        subprocess.run(
            [openssl, "smime", "-verify", "-noverify", "-in", str(p7b),
             "-inform", "DER", "-out", payload],
            capture_output=True, check=False,
        )
        if not os.path.exists(payload) or os.path.getsize(payload) == 0:
            return ""
        prof = json.loads(pathlib.Path(payload).read_text(encoding="utf-8"))
        bi = prof.get("bundle-info", {})
        for field in ("development-certificate", "distribution-certificate"):
            if field in bi:
                return bi[field]
        return ""
    except (ValueError, KeyError, OSError):
        return ""
    finally:
        try:
            os.unlink(payload)
        except OSError:
            pass


def build_chain(cer: pathlib.Path, chain: pathlib.Path, leaf: str = ""):
    """组装证书链,顺序跟 AGC 导出的 .cer 一致:根 CA → 中间 CA → 叶子。

    leaf 留空时用 cer 里的最后一张;需要指定时传 profile 引用的那张证书
    (调试 profile 引 Development 证书、发布 profile 引 Release 证书,
    两张证书公钥相同但不是同一张,叶子对不上设备会报 9568322)。
    """
    text = cer.read_text(encoding="utf-8", errors="replace")
    certs = re.findall(
        r"-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----", text, re.S
    )
    if len(certs) >= 2:
        cas = certs[:-1]
        tail = leaf.strip() if leaf.strip() else certs[-1]
        chain.write_text("\n".join(cas + [tail]) + "\n", encoding="utf-8")
        print(f"    证书链: {len(cas)} 张 CA + 1 张叶子")
        return
    print(f"    [warn] app.cer 只有 {len(certs)} 张证书,尝试自动补上级 CA")
    rc = subprocess.call(
        [sys.executable, str(TOOLCHAIN / "complete_cert_chain.py"), str(cer), str(chain)]
    )
    if rc == 0 and chain.is_file():
        print("    已补全证书链")
    else:
        shutil.copyfile(cer, chain)
        print("    [warn] 没能自动补链。签名会报「Profile cert must a cert chain」")


def check_profile(p7b: pathlib.Path, chain: pathlib.Path) -> None:
    """校验 profile 里的证书与 app-cert.pem 的叶子是否一致(可选,需要 openssl)。"""
    openssl = find_openssl()
    if not openssl:
        print("    [skip] 没有 openssl,跳过 profile/证书链一致性校验")
        print("           (Windows 上 Git for Windows 自带 openssl.exe,可以加进 PATH)")
        return
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as tmp:
        payload = tmp.name
    try:
        subprocess.run(
            [openssl, "smime", "-verify", "-noverify", "-in", str(p7b),
             "-inform", "DER", "-out", payload],
            capture_output=True,
            check=False,
        )
        if not os.path.exists(payload) or os.path.getsize(payload) == 0:
            print("    [warn] 无法解析 profile(.p7b),跳过一致性校验")
            return
        prof = json.loads(pathlib.Path(payload).read_text(encoding="utf-8"))
        bi = prof["bundle-info"]
        field = (
            "development-certificate"
            if "development-certificate" in bi
            else "distribution-certificate"
        )
        if field not in bi:
            print("    [error] profile 里既没有 development-certificate 也没有 distribution-certificate")
            return
        print(f"    profile 类型: {prof.get('type')},证书字段: {field}")
        dc_der = der_of(bi[field])
        chain_certs = certs_from_pem(chain.read_text(encoding="utf-8", errors="replace"))
        if not chain_certs:
            print("    [error] app-cert.pem 里没有找到证书")
            return
        if any(der_of(c) == dc_der for c in chain_certs):
            print(f"    profile 的 {field} 与证书链匹配")
        else:
            print(f"    [error] profile 的 {field} 与证书链不匹配!")
            print("      签名会报「verify certificate chain failed! Signature does not match.」")
            return
        di = prof.get("debug-info") or prof.get("debuginfo") or {}
        if di.get("device-ids"):
            print(f"    调试证书绑定设备 {len(di['device-ids'])} 台:")
            for u in di["device-ids"]:
                print(f"      {u}")
            print("    只有白名单里的设备能装这个包")
    finally:
        try:
            os.unlink(payload)
        except OSError:
            pass


def write_config(hex_pwd: str, alias: str) -> None:
    subprocess.check_call(
        [sys.executable, str(TOOLCHAIN / "apply_signing_config.py"), str(BUILD_PROFILE),
         "--store-file", "signing/app.p12",
         "--profile-file", "signing/app.p7b",
         "--certpath", "signing/app-cert.pem",
         "--key-alias", alias,
         "--password-hex", hex_pwd]
    )


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--password", default=os.environ.get("STORE_PWD", "123456"))
    ap.add_argument("--alias", default=os.environ.get("ALIAS", "saber-key"))
    args = ap.parse_args()

    print("==> 1/5 检查签名材料")
    p12 = SIGN_DIR / "app.p12"
    cer = SIGN_DIR / "app.cer"
    p7b = SIGN_DIR / "app.p7b"
    chain = SIGN_DIR / "app-cert.pem"

    if p12.is_file() and p7b.is_file() and cer.is_file():
        print("    检测到 AGC(华为账号)签发的材料")
        print("==> 2/5 检查 material 目录(密码解密密钥)")
        copy_material()
        print("==> 3/5 加密密码")
        hex_pwd = encrypt_password(args.password)
        print(f"    storePassword/keyPassword = {hex_pwd[:24]}... ({len(hex_pwd)} chars)")
        print("==> 4/5 组装证书链")
        # AGC 的 profile 里引用的证书,必须和签名用的私钥(app.p12)配套,
        # 而且证书链的叶子必须正好是 profile 引用的那张证书:
        # 调试 profile 引的是 Development 证书、发布 profile 引的是 Release 证书,
        # 两者公钥相同但是两张不同的证书。叶子对不上,设备端会报
        # code:9568322 "not trusted app source",装不上。
        p12_cert = cert_from_p12(p12, args.password)
        prof_cert = profile_cert(p7b)
        if p12_cert and prof_cert and same_public_key(p12_cert, prof_cert):
            build_chain(cer, chain, leaf=prof_cert)
        else:
            build_chain(cer, chain)
            if p12_cert and prof_cert:
                print("    [warn] profile 引用的证书与密钥库里的证书不是同一把钥匙,已回退到 app.cer")
        print("==> 4.5/5 校验 profile 与证书是否匹配")
        check_profile(p7b, chain)
        print("==> 5/5 改写 build-profile.json5")
        write_config(hex_pwd, args.alias)
        print("完成。现在可以构建:scripts\\build_ohos.ps1")
        return 0

    if (SIGN_DIR / "saber.p12").is_file() and (SIGN_DIR / "saber.p7b").is_file():
        print("    检测到 OpenHarmony 社区证书材料")
        copy_material()
        hex_pwd = encrypt_password(args.password)
        subprocess.check_call(
            [sys.executable, str(TOOLCHAIN / "apply_signing_config.py"), str(BUILD_PROFILE),
             "--store-file", "signing/saber.p12",
             "--profile-file", "signing/saber.p7b",
             "--certpath", "signing/saber-app-cert.pem",
             "--key-alias", "openharmony application release",
             "--password-hex", hex_pwd]
        )
        print("    注意:社区证书只能装到 OpenHarmony 设备 / DevEco 模拟器。")
        return 0

    print("    未找到签名材料,用 SDK 自带的社区证书生成一套")
    subprocess.check_call([sys.executable, str(TOOLCHAIN / "make_signing_profile.py")])
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
