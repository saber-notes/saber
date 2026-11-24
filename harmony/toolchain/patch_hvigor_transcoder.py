#!/usr/bin/env python3
"""让 hvigor 在缺少 libimage_transcoder_shared.so 时不传 extensionPath。

背景
----
HarmonyOS(商用 SDK) 的 `toolchains/lib/` 里带 `libimage_transcoder_shared.so`,
hvigor 的 process-resource 任务会把它写进 restool 的配置:

    "context": { "extensionPath": "<sdk>/default/hms/toolchains/lib/libimage_transcoder_shared.so" }

restool 启动时无条件 dlopen 这个库,找不到就直接报:

    Error Code: 11201001
    Error: Dependency Error
    Error Message: Failed to load the library '.../libimage_transcoder_shared.so', path invalid

而 OpenHarmony 公开 SDK 的 toolchains 里根本没有这个库
(hvigor 自己的 OhosSdkInfo.getLibimageTranscoderShared() 返回的就是空串),
HarmonyOS 商用 SDK 又需要登录华为开发者站点下载(本机 403)。

该库只在「资源压缩(resources compression)」开启时才会真正被用到,
本项目没有开启压缩,所以只要不传 extensionPath 即可。

本脚本把 hvigor 插件里的
    r.setExtensionPath(this.sdkInfo.getLibimageTranscoderShared())
改成先判断文件是否存在,不存在就传空串。

用法: python3 patch_hvigor_transcoder.py [hvigor 插件目录]
"""

from __future__ import annotations

import os
import pathlib
import sys

OLD = "r.setExtensionPath(this.sdkInfo.getLibimageTranscoderShared())"
OLD_BARE = "if(this.sdkInfo.getLibimageTranscoderShared(),o){"
NEW = (
    "r.setExtensionPath((e=>e&&fs_1.default.existsSync(e)?e:\"\")("
    "this.sdkInfo.getLibimageTranscoderShared()))"
)


def main() -> None:
    root = pathlib.Path(
        sys.argv[1]
        if len(sys.argv) > 1
        else os.environ.get(
            "DEVECO_TOOLS",
            str(pathlib.Path(__file__).resolve().parents[3] / "deveco-tools/command-line-tools"),
        ) + "/hvigor/hvigor-ohos-plugin"
    )
    target = root / "src/tasks/process-resource.js"
    if not target.exists():
        raise SystemExit(f"找不到 {target}")
    s = target.read_text(encoding="utf-8")
    if NEW in s:
        print("  [skip] 已经打过补丁")
        return
    if OLD_BARE in s:
        # 之前的补丁把 setExtensionPath 整段删掉了,补回来
        s = s.replace(OLD_BARE, NEW)
        target.write_text(s, encoding="utf-8")
        print(f"  [ok] {target} 已补回 setExtensionPath")
        return
    if OLD not in s:
        raise SystemExit(f"{target}: 找不到目标代码,版本可能不匹配")
    target.write_text(s.replace(OLD, NEW), encoding="utf-8")
    print(f"  [ok] {target} 已打补丁")


if __name__ == "__main__":
    main()
