#!/usr/bin/env python3
"""agc_console.py —— 用 CDP 驱动 AGC(华为 AppGallery Connect)控制台。

AGC 控制台的结构:
  * 左侧菜单(开发者管理 / 设备 / Profile …)在**顶层文档**里;
  * 真正的业务内容在一个 iframe(`#mainIframeView`)里,
    路由形如 `.../amp/?_=xxx#/permission/deviceManage`。

所以本工具分两个入口:
  * `top`   —— 操作顶层文档(点左侧菜单)
  * `iframe`—— 操作 iframe 里的内容(按钮 / 输入框 / 表格)

前置条件:
  1. 一个带 `--remote-debugging-port=9333` 的 Chrome(Playwright chromium 也行),
     已经登录华为账号;
  2. `pip install websocket-client`。

常用命令:
  agc_console.py top menus                      列出左侧菜单
  agc_console.py top click Profile              点左侧菜单
  agc_console.py iframe text                     iframe 里的可见文本
  agc_console.py iframe url                      iframe 当前路由
  agc_console.py iframe shot out.png             截图
  agc_console.py iframe buttons                  可见按钮
  agc_console.py iframe inputs                   可见输入框
  agc_console.py iframe click "添加设备"          按文字精确点击
  agc_console.py iframe clickcontains "手机"      模糊点击
  agc_console.py iframe filld 0 "Pura X Max"     填对话框内第 N 个输入框
  agc_console.py iframe fill 0 "关键字"           填页面内第 N 个可见输入框
  agc_console.py iframe waits "添加设备" 30       等待文本出现
  agc_console.py iframe eval "<JS>"               执行 JS
  agc_console.py dl                              允许下载到指定目录
  agc_console.py reload                          重载 iframe
"""
import argparse
import base64
import json
import os
import sys
import time
import urllib.request

try:
    import websocket
except ImportError:  # pragma: no cover
    raise SystemExit("缺少依赖:pip install websocket-client")

DEFAULT_PORT = 9333
DL_DIR = "/root/agc_dl"
DIALOG = ".el-dialog, .el-drawer"


# --------------------------------------------------------------------------- #
# 底层 CDP 客户端
# --------------------------------------------------------------------------- #
class CDP:
    def __init__(self, port=DEFAULT_PORT, target_id=None):
        self.port = port
        with urllib.request.urlopen(
            "http://127.0.0.1:%s/json/list" % port, timeout=10
        ) as r:
            pages = json.load(r)
        pages = [p for p in pages if p.get("type") == "page"]
        if not pages:
            raise SystemExit("没有可用的标签页(Chrome 是否带 --remote-debugging-port=%s?)" % port)
        # 会话过期时控制台会新开一个华为账号登录页,那个标签排在最前面,
        # 连上去就只会看到登录框。这里优先挑开发者后台的标签页。
        def rank(page):
            url = page.get("url") or ""
            if "hdc-console" in url:
                return 0
            if "developer.huawei.com" in url:
                return 1
            if "huawei.com" in url:
                return 3
            return 2

        pages.sort(key=rank)
        # 2026-11-20 新增:同名排序下(都是 developer.huawei.com)仍可能挑到
        # 「审核报告」那个标签页 —— 它**没有左侧栏**,拿它当控制台主页会点不到
        # 「版本历史记录」。所以允许调用方指定要用的标签页(按 target id)。
        if target_id:
            picked = [pg for pg in pages if pg.get("id") == target_id]
            if not picked:
                raise SystemExit("找不到指定的标签页 id=%s" % target_id)
            pages = picked
        self.ws = websocket.create_connection(pages[0]["webSocketDebuggerUrl"], timeout=180)
        self._id = 0

    def send(self, method, **params):
        self._id += 1
        self.ws.send(json.dumps({"id": self._id, "method": method, "params": params}))
        while True:
            msg = json.loads(self.ws.recv())
            if msg.get("id") == self._id:
                return msg

    def eval(self, expr, context_id=None):
        params = dict(expression=expr, returnByValue=True, userGesture=True)
        if context_id:
            params["contextId"] = context_id
        r = self.send("Runtime.evaluate", **params)
        res = r.get("result", {})
        if "exceptionDetails" in res:
            return {"__error__": res["exceptionDetails"].get("text"),
                    "detail": str(res["exceptionDetails"])[:300]}
        return res.get("result", {}).get("value")

    def close(self):
        try:
            self.ws.close()
        except Exception:
            pass


class Frame:
    """顶层文档 + 业务 iframe 的两个执行上下文。"""

    def __init__(self, port=DEFAULT_PORT, target_id=None):
        self.c = CDP(port, target_id=target_id)
        self.c.send("Page.enable")
        self.ctx = None
        tree = self.c.send("Page.getFrameTree")
        children = tree["result"]["frameTree"].get("childFrames") or []
        if children:
            # 业务内容在 #mainIframeView 里。页面里可能还有别的 iframe
            # (埋点、登录跳转等),childFrames[0] 不一定是它 —— 挑错了
            # ev() 就会跑到顶层文档上,查询结果全是空。
            fid = None
            for child in children:
                url = child["frame"].get("url") or ""
                if "/service/josp/agc/amp" in url or "mainIframeView" in url:
                    fid = child["frame"]["id"]
                    break
            if fid is None:
                fid = children[0]["frame"]["id"]
            wid = self.c.send("Page.createIsolatedWorld", frameId=fid, worldName="agc",
                               grantUniveralAccess=True)
            self.ctx = wid["result"]["executionContextId"]

    def ev(self, expr):
        return self.c.eval(expr, context_id=self.ctx) if self.ctx else self.c.eval(expr)

    def close(self):
        self.c.close()


# --------------------------------------------------------------------------- #
# 片段
# --------------------------------------------------------------------------- #
CLICK = r"""
(() => {
  const root = %s ? (document.querySelector(%s) || document) : document;
  const want = %s;
  const all = Array.from(root.querySelectorAll('a,button,li,span,div,i'));
  const vis = el => { const r = el.getBoundingClientRect(); return r.width>0 && r.height>0; };
  let hit = all.filter(el => vis(el) && (el.innerText||'').trim() === want);
  if (!hit.length) hit = all.filter(el => vis(el) && (el.innerText||'').includes(want));
  if (!hit.length) return 'NOT_FOUND';
  const el = hit[hit.length - 1];
  el.scrollIntoView({block: 'center'});
  const r = el.getBoundingClientRect();
  const o = {bubbles:true, cancelable:true, view:window,
             clientX:r.left+r.width/2, clientY:r.top+r.height/2};
  for (const t of ['mousedown','mouseup','click']) el.dispatchEvent(new MouseEvent(t,o));
  return 'CLICKED:' + el.tagName + ':' + (el.innerText||'').trim().slice(0,30);
})()
"""

FILL = r"""
(() => {
  const root = %s ? (document.querySelector(%s) || document) : document;
  const els = Array.from(root.querySelectorAll('input:not([type=hidden]),textarea'))
                  .filter(e => { const r = e.getBoundingClientRect(); return r.width>0 && r.height>0; });
  const el = els[%d];
  if (!el) return 'NOT_FOUND:' + els.length;
  const proto = el.tagName === 'TEXTAREA' ? HTMLTextAreaElement.prototype : HTMLInputElement.prototype;
  Object.getOwnPropertyDescriptor(proto,'value').set.call(el, %s);
  el.dispatchEvent(new Event('input',{bubbles:true}));
  el.dispatchEvent(new Event('change',{bubbles:true}));
  el.dispatchEvent(new Event('blur',{bubbles:true}));
  return 'SET:' + el.value;
})()
"""


def _click_js(scope, text):
    return CLICK % ("true" if scope else "false",
                    json.dumps(scope) if scope else "''",
                    json.dumps(text))


def _fill_js(scope, idx, val):
    return FILL % ("true" if scope else "false",
                   json.dumps(scope) if scope else "''",
                   idx, json.dumps(val))


# --------------------------------------------------------------------------- #
# 命令
# --------------------------------------------------------------------------- #
def cmd_top(f, a):
    if a.cmd == "menus":
        print(f.c.eval(r"""
        (() => {
          const out = [];
          document.querySelectorAll('li[title]').forEach(el => {
            const r = el.getBoundingClientRect();
            if (r.width>0) out.push(el.getAttribute('title'));
          });
          return JSON.stringify(out);
        })()
        """))
    elif a.cmd == "click":
        print(f.c.eval(r"""
        (() => {
          const want = %s;
          let el = document.querySelector('li[title="' + want + '"]');
          if (!el) el = Array.from(document.querySelectorAll('a,li,span')).find(
                             e => (e.getAttribute('title')||'') === want);
          if (!el) return 'NOT_FOUND';
          const r = el.getBoundingClientRect();
          const o = {bubbles:true, cancelable:true, view:window,
                     clientX:r.left+r.width/2, clientY:r.top+r.height/2};
          for (const t of ['mousedown','mouseup','click']) el.dispatchEvent(new MouseEvent(t,o));
          return 'CLICKED:' + el.tagName;
        })()
        """ % json.dumps(a.text)))
        time.sleep(3)
        print("iframe:", f.c.eval(
            "(() => { const x=document.getElementById('mainIframeView'); return x?x.src:'NO_IFRAME'; })()"))
    elif a.cmd == "url":
        print(f.c.eval("location.href"))
    else:
        raise SystemExit("未知命令")


def cmd_iframe(f, a):
    c = a.cmd
    if c == "text":
        print(f.ev("document.body ? document.body.innerText : ''"))
    elif c == "url":
        print(f.ev("location.href"))
    elif c == "shot":
        f.c.send("Page.enable")
        r = f.c.send("Page.captureScreenshot", format="png")
        data = base64.b64decode(r["result"]["data"])
        with open(a.text, "wb") as fh:
            fh.write(data)
        print("saved", a.text, len(data))
    elif c == "reload":
        f.ev("location.reload()")
        time.sleep(3)
        print("reloaded")
    elif c == "click":
        print(f.ev(_click_js(None, a.text)))
    elif c == "clickd":
        print(f.ev(_click_js(DIALOG, a.text)))
    elif c == "clickcontains":
        print(f.ev(_click_js(None, a.text)))
    elif c == "fill":
        print(f.ev(_fill_js(None, a.index, a.value)))
    elif c == "filld":
        print(f.ev(_fill_js(DIALOG, a.index, a.value)))
    elif c == "buttons":
        print(f.ev(r"""
        (() => {
          const out = [];
          document.querySelectorAll('button,a[class*=btn],div[class*=btn],span[class*=btn]').forEach(el => {
            const t = (el.innerText||'').trim().replace(/\s+/g,' ');
            const r = el.getBoundingClientRect();
            if (t && t.length<40 && r.width>0 && r.height>0)
              out.push(t+'  ['+el.tagName+'.'+(el.className||'').toString().split(' ').slice(0,2).join('.')+']');
          });
          return JSON.stringify(out, null, 1);
        })()
        """))
    elif c == "inputs":
        print(f.ev(r"""
        (() => {
          const out = [];
          document.querySelectorAll('input,textarea').forEach((el,i) => {
            const r = el.getBoundingClientRect();
            out.push({i, type:el.type, ph:el.placeholder, val:el.value,
                      inDialog: !!el.closest('.el-dialog,.el-drawer'),
                      visible: r.width>0 && r.height>0});
          });
          return JSON.stringify(out, null, 1);
        })()
        """))
    elif c == "waits":
        t0 = time.time()
        while time.time() - t0 < a.timeout:
            txt = f.ev("document.body ? document.body.innerText : ''") or ""
            if a.text in txt:
                print("OK %.1fs" % (time.time() - t0))
                return
            time.sleep(1)
        print("TIMEOUT %.0fs" % a.timeout)
    elif c == "eval":
        out = f.ev(a.text)
        print(json.dumps(out, ensure_ascii=False, indent=2) if not isinstance(out, str) else out)
    else:
        raise SystemExit("未知命令")


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--port", type=int, default=DEFAULT_PORT, help="CDP 端口(默认 9333)")
    ap.add_argument("--dl-dir", default=DL_DIR, help="下载目录")
    sub = ap.add_subparsers(dest="scope", required=True)

    p_top = sub.add_parser("top", help="操作顶层文档(左侧菜单)")
    p_top.add_argument("cmd", choices=["menus", "click", "url"])
    p_top.add_argument("text", nargs="?", default="")

    p_if = sub.add_parser("iframe", help="操作业务 iframe")
    p_if.add_argument("cmd", choices=["text", "url", "shot", "reload", "click", "clickd",
                                      "clickcontains", "fill", "filld", "buttons",
                                      "inputs", "waits", "eval"])
    p_if.add_argument("text", nargs="?", default="")
    p_if.add_argument("--index", type=int, default=0)
    p_if.add_argument("--value", default="")
    p_if.add_argument("--timeout", type=float, default=30)

    sub.add_parser("dl", help="允许下载到 --dl-dir")
    a = ap.parse_args()

    f = Frame(a.port)
    try:
        if a.scope == "top":
            cmd_top(f, a)
        elif a.scope == "iframe":
            if a.cmd == "fill":
                a.index = int(a.text)
                a.value = a.value
                print(f.ev(_fill_js(None, a.index, a.value)))
            elif a.cmd == "filld":
                a.index = int(a.text)
                print(f.ev(_fill_js(DIALOG, a.index, a.value)))
            else:
                cmd_iframe(f, a)
        elif a.scope == "dl":
            os.makedirs(a.dl_dir, exist_ok=True)
            try:
                f.c.send("Browser.setDownloadBehavior", behavior="allow",
                         downloadPath=a.dl_dir, eventsEnabled=True)
                print("下载目录:", a.dl_dir)
            except Exception as e:
                print("设置下载目录失败:", e)
    finally:
        f.close()


if __name__ == "__main__":
    main()
