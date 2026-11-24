#!/usr/bin/env python3
"""从远程 zip 里只取需要的文件(HTTP Range,不全量下载)。

背景
----
HarmonyOS 商用 SDK 只能从 DevEco Studio 的命令行工具包里拿,
包很大(2~3 GB),而本机磁盘只剩 1.6 GB,直接下载解不开。

这里用 remotezip(基于 HTTP Range)只把需要的条目拉下来:
  * sdk/default/hms/ets/api/**            —— HarmonyOS 的 API 声明(.d.ts)
  * sdk/default/hms/ets/build-tools/ets-loader/sysResource.js
  * sdk/default/hms/js/api/**(可选)

用法:
    python3 fetch_remote_zip.py <zip-url> <prefix> [<dest>] [--list]
"""

from __future__ import annotations

import pathlib
import sys

from remotezip import RemoteZip

URLS = {
    "6.0.1": "https://hf-mirror.com/csukuangfj/harmonyos-commandline-tools/resolve/main/commandline-tools-linux-x64-6.0.1.251.zip",
    "5.0.5": "https://hf-mirror.com/csukuangfj/harmonyos-commandline-tools/resolve/main/commandline-tools-linux-x64-5.0.5.200.zip",
}


def main() -> None:
    arg = sys.argv[1] if len(sys.argv) > 1 else "6.0.1"
    url = URLS.get(arg, arg)
    prefix = sys.argv[2] if len(sys.argv) > 2 else "sdk/default/hms/ets/api/"
    dest = pathlib.Path(sys.argv[3] if len(sys.argv) > 3 else "/tmp/hms_sdk_extract")
    list_only = "--list" in sys.argv

    print(f"=> {url}")
    with RemoteZip(url) as z:
        names = [n for n in z.namelist() if n.startswith(prefix)]
        print(f"   命中 {len(names)} 个条目")
        if list_only:
            for n in names[:50]:
                print("   ", n)
            return
        for n in names:
            if n.endswith("/"):
                continue
            data = z.read(n)
            out = dest / n
            out.parent.mkdir(parents=True, exist_ok=True)
            out.write_bytes(data)
    print(f"=> 已解压到 {dest}")


if __name__ == "__main__":
    main()
