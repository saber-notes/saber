#!/usr/bin/env python3
"""agc_upload.py —— 给 AGC 控制台的「<input type=file>」塞文件。

**为什么单独写一个脚本**:AGC 上传 CSR(申请发布证书)、上传 Profile 都必须走
文件选择框,而浏览器没有提供「用 JS 模拟选文件」的 API —— 唯一能用的路子是
CDP 的 `DOM.setFileInputFiles`。`agc_console.py` 里没有这条命令,而按
「不改动既有脚本的逻辑」的原则,
所以这里新加一个薄脚本,复用 `agc_console.py` 里的 CDP 客户端。

**注意**:被选中的文件路径不会出现在输出里(只回显文件名),避免私钥级材料
的路径/名字在日志里到处散落。

用法:
  python3 agc_upload.py <文件路径>            # 选第 0 个 file input(默认 iframe)
  python3 agc_upload.py <文件路径> --index 1  # 选第 1 个
  python3 agc_upload.py <文件路径> --scope top
"""
import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from agc_console import CDP, Frame  # noqa: E402


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("path", help="要上传的文件路径")
    ap.add_argument("--port", type=int, default=9333)
    ap.add_argument("--scope", default="iframe", choices=["iframe", "top"])
    ap.add_argument("--index", type=int, default=0, help="第几个 input[type=file]")
    a = ap.parse_args()

    path = os.path.abspath(a.path)
    if not os.path.isfile(path):
        raise SystemExit("文件不存在:%s" % path)

    f = Frame(a.port)
    f.c.send("DOM.enable")

    # 关键点:nodeId 必须用 DOM.querySelector 现查。
    # DOM.getDocument(depth=-1, pierce=True) 返回的 nodeId 是"过期"的,
    # 直接拿来 setFileInputFiles 会报 "Could not find node with given id";
    # 而用 querySelector 查出来的 nodeId 就能用,浏览器也会自动派发 change 事件。
    root = f.c.send("DOM.getDocument")["result"]["root"]["nodeId"]

    scope_id = root
    if a.scope == "iframe":
        fid = f.c.send("DOM.querySelector", nodeId=root,
                       selector="#mainIframeView")["result"].get("nodeId")
        if not fid:
            raise SystemExit("找不到 #mainIframeView,控制台页面结构可能变了")
        cd = f.c.send("DOM.describeNode", nodeId=fid)["result"]["node"]
        scope_id = cd.get("contentDocument", {}).get("nodeId")
        if not scope_id:
            raise SystemExit("拿不到 iframe 的 contentDocument")

    ids = f.c.send("DOM.querySelectorAll", nodeId=scope_id,
                   selector="input[type=file]")["result"].get("nodeIds", [])
    if not ids:
        raise SystemExit("没找到 input[type=file](页面结构可能变了)")
    if a.index >= len(ids):
        raise SystemExit("只有 %d 个 input[type=file]" % len(ids))

    f.c.send("DOM.setFileInputFiles", files=[path], nodeId=ids[a.index])

    # 触发 input/change 事件,让 el-upload 感知到文件已选
    f.ev("(() => {const els=document.querySelectorAll('input[type=file]');"
         "const el=els[%d]; if(!el) return 'NO_INPUT';"
         "el.dispatchEvent(new Event('input',{bubbles:true}));"
         "el.dispatchEvent(new Event('change',{bubbles:true}));"
         "return 'FIRED';})()" % a.index)

    print("已选择文件:%s(scope=%s,index=%d)" % (os.path.basename(path), a.scope, a.index))
    f.close()


if __name__ == "__main__":
    main()
