#!/usr/bin/env python3
"""complete_cert_chain.py

把只有一张叶子证书的 .cer 补成完整证书链。

签名工具要求 `certpath` 指向的是**证书链**而不是单张证书
(否则报 `11013004 Profile cert must a cert chain`)。

AGC 下载的 .cer 有时只含叶子证书,这时需要追加上级 CA。
本脚本从已知 CA 池里按「签发者」匹配上级 CA,按链的顺序输出。

用法:
    python3 complete_cert_chain.py <输入.cer> <输出.pem>

退出码:
    0  补链成功(或输入本来就是链)
    1  找不到能补的上级 CA
"""
import pathlib
import base64
import glob
import os
import re
import subprocess
import sys

CERT_RE = re.compile(
    r"-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----", re.S)


def split_certs(text):
    return CERT_RE.findall(text)


def der_of(pem):
    body = "".join(l for l in pem.splitlines() if "CERTIFICATE" not in l)
    return base64.b64decode(body)


def subject_of(pem):
    """用 openssl 读出 subject DN,拿来做链的顺序判断。"""
    p = subprocess.run(
        ["openssl", "x509", "-noout", "-subject", "-issuer"],
        input=pem.encode(), capture_output=True)
    out = p.stdout.decode(errors="replace")
    subj = issuer = ""
    for line in out.splitlines():
        if line.startswith("subject="):
            subj = line.split("=", 1)[1].strip()
        elif line.startswith("issuer="):
            issuer = line.split("=", 1)[1].strip()
    return subj, issuer


def ca_pool():
    """收集本机能找到的所有 CA 证书。"""
    roots = [
        os.environ.get("DEVECO_SDK_HOME", ""),
        os.environ.get(
            "DEVECO_SDK_ROOT",
            str(pathlib.Path(__file__).resolve().parents[3] / "deveco-tools/command-line-tools/sdk/default"),
        ),
    ]
    pool = []
    for base in roots:
        if not base:
            continue
        for pat in ("**/toolchains/lib/*.pem", "**/toolchains/lib/*.cer",
                    "**/toolchains/lib/**/*.pem"):
            for path in glob.glob(os.path.join(base, pat), recursive=True):
                try:
                    with open(path) as f:
                        for c in split_certs(f.read()):
                            pool.append((path, c))
                except Exception:
                    continue
    return pool


def main():
    if len(sys.argv) < 3:
        raise SystemExit(__doc__)

    src, dst = sys.argv[1], sys.argv[2]
    with open(src) as f:
        certs = split_certs(f.read())

    if not certs:
        print("输入里没有找到证书", file=sys.stderr)
        return 1

    if len(certs) >= 2:
        # 本来就是链,直接规范输出(叶子在前)
        with open(dst, "w") as f:
            f.write("\n".join(certs) + "\n")
        return 0

    leaf = certs[0]
    leaf_subject, leaf_issuer = subject_of(leaf)
    print("  叶子证书 subject : %s" % leaf_subject)
    print("  叶子证书 issuer  : %s" % leaf_issuer)

    # 找一个 subject 与叶子 issuer 匹配的 CA
    for path, ca in ca_pool():
        ca_subject, _ = subject_of(ca)
        if not ca_subject:
            continue
        # 归一化比较:去掉空格
        if ca_subject.replace(" ", "") == leaf_issuer.replace(" ", ""):
            print("  找到上级 CA:%s" % os.path.basename(path))
            print("  CA subject : %s" % ca_subject)
            with open(dst, "w") as f:
                f.write(leaf.rstrip() + "\n" + ca.rstrip() + "\n")
            return 0

    print("  没找到能匹配的上级 CA" , file=sys.stderr)
    print("  可用 CA 池里的签发者:" , file=sys.stderr)
    seen = set()
    for path, ca in ca_pool():
        s, _ = subject_of(ca)
        if s and s not in seen:
            seen.add(s)
            print("    %s" % s, file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())
