#!/usr/bin/env python3
"""
apply_signing_config.py

把 hvigor 的签名配置写进 `ohos/build-profile.json5`。

两条签名路径都要用它,保证仓库里那份模板和本机实际用的材料始终一致:

  * AGC(华为开发者账号)路径   -> use_agc_signing.sh
  * OpenHarmony 社区证书路径  -> make_signing_profile.py

用法:
    apply_signing_config.py <build-profile.json5> \\
        --store-file signing/app.p12 \\
        --profile    signing/app.p7b \\
        --certpath   signing/app-cert.pem \\
        --key-alias  saber-key \\
        --password-hex <hex>

`--password-hex` 必须是 hvigor 认的那种 hex(AES-128-GCM 密文),
用 `encrypt_signing_password.js` 生成。
"""
import argparse
import re
import sys


def set_field(text: str, field: str, value: str) -> str:
    """替换 build-profile.json5 里的一个字符串字段(第一个匹配)。"""
    pat = re.compile(r'("%s"\s*:\s*)"[^"]*"' % field)
    if not pat.search(text):
        raise SystemExit(f"字段 {field} 未找到,请检查 build-profile.json5")
    return pat.sub(lambda m: m.group(1) + '"%s"' % value, text, count=1)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("profile", help="ohos/build-profile.json5 的路径")
    ap.add_argument("--store-file", required=True)
    ap.add_argument("--profile-file", dest="profile_file", required=True,
                    help="provisioning profile(.p7b)")
    ap.add_argument("--certpath", required=True, help="证书链(.pem)")
    ap.add_argument("--key-alias", required=True)
    ap.add_argument("--password-hex", required=True)
    args = ap.parse_args()

    hexpwd = args.password_hex.strip()
    if len(hexpwd) < 32 or len(hexpwd) % 2 != 0:
        raise SystemExit(
            f"password hex 长度 {len(hexpwd)} 不合法"
            "(hvigor 要求 >= 32 且为偶数);"
            "用 encrypt_signing_password.js 生成"
        )

    with open(args.profile, encoding="utf-8") as f:
        src = f.read()

    new = src
    new = set_field(new, "storeFile", args.store_file)
    new = set_field(new, "storePassword", hexpwd)
    new = set_field(new, "keyPassword", hexpwd)
    new = set_field(new, "keyAlias", args.key_alias)
    new = set_field(new, "profile", args.profile_file)
    new = set_field(new, "certpath", args.certpath)

    if new != src:
        with open(args.profile, "w", encoding="utf-8") as f:
            f.write(new)
        print("    已更新 signingConfigs")
    else:
        print("    signingConfigs 已是目标值,无需改动")
    return 0


if __name__ == "__main__":
    sys.exit(main())
