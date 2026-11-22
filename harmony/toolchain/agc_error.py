#!/usr/bin/env python3
"""agc_error.py —— 把 agc CLI 的 JSON 错误转成可读的中文提示。

用法:
    agc_error.py <场景描述>      # 从 stdin 读 agc 的 JSON 输出
"""
import json
import sys

SCENES = {
    "credentials": "凭据无效或已过期。检查 *.private.json 是否完整、Service Account 是否有效",
    "permission": "权限不足。Service Account 需 developer 级别,且账号要有目标项目的权限",
    "param": "请求参数被服务器拒绝",
    "network": "连不上 AGC 服务器,检查网络/代理",
    "quota": "配额用尽。调试证书每个账号通常只允许 1 个,先删掉旧的",
    "notfound": "目标不存在。检查 APP ID / 证书 ID / 项目 ID 是否正确",
}


def main():
    desc = sys.argv[1] if len(sys.argv) > 1 else "调用"
    raw = sys.stdin.read()

    try:
        d = json.loads(raw)
    except Exception:
        print("      %s:无法解析返回内容" % desc)
        print("      " + raw.strip()[:400])
        return

    if not isinstance(d, dict):
        print("      %s: %s" % (desc, str(d)[:300]))
        return

    err = d.get("error")
    if not err:
        print("      %s: %s" % (desc, raw.strip()[:300]))
        return

    msg = str(d.get("message") or d.get("msg") or d.get("detail") or "")

    # 从 message 里挖出错误码
    code = ""
    for c in ("401", "403", "400", "404", "429", "9568257", "9568393"):
        if c in msg:
            code = c
            break

    hint = ""
    if err == "AgcCredentialsError" or code == "401":
        hint = SCENES["credentials"]
    elif code == "403":
        hint = SCENES["permission"]
    elif code == "400":
        hint = SCENES["param"]
    elif code == "404":
        hint = SCENES["notfound"]
    elif code == "429":
        hint = SCENES["quota"]
    elif "ENOTFOUND" in msg or "ECONNREFUSED" in msg or "ETIMEDOUT" in msg:
        hint = SCENES["network"]

    print("      %s 失败(%s)" % (desc, err))
    if msg:
        print("      %s" % msg[:400])
    if hint:
        print("      → %s" % hint)


if __name__ == "__main__":
    main()
