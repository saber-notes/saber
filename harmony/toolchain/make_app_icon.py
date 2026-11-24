#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""生成鸿蒙版「赛博手写笔记」的应用图标。

背景(2026-11-17 第 2 轮审核驳回):
  1. 第 1 轮:商店上传的图标**带透明背景** → 要求纯色背景;
  2. 第 1 轮:商店图标与**应用安装后终端显示的图标不一致** → 要求两者是同一张图;
  3. 第 1 轮:「知识产权」判定应用与市场上已有的「Saber」**名称/图标相似**
     → 第 2 轮改名「赛博手写笔记」,图标也要彻底换掉;
  4. 第 2 轮:包内**单层图只有 144×144**,标准要求 **1024×1024**
     → 包内资源直接放 1024×1024 原图。

所以这里现画一张**全新**的图标:深色石板底 + 青色霓虹触控笔 + 电路节点,
配色刻意避开上游 Saber 那张「靛蓝底 + 黄色笔尖」,天然不带 alpha。

用法:
    python3 harmony/toolchain/make_app_icon.py
    # 产出(全部 RGB 无 alpha):
    #   harmony/assets/app-icon-1024.png                     1024×1024,商店上传用
    #   ohos/entry/src/main/resources/base/media/icon.png     512×512,包内 ability 图标
    #   ohos/AppScope/resources/base/media/app_icon.png       512×512,包内应用图标(桌面/最近任务)

包内为什么用 512 而不是 1024
-------------------------
第 1、2 轮审核都被判「图标有透明背景」「商店图标与终端图标不一致」。
商店侧已经改对(1024×1024 RGB 无 alpha),但**包内**那一份还是被 SDK 改坏了:

* hvigor 的 restool 开着 iconCheck,会把 media 里的图标**归一化到 512×512**;
* 源图是 1024 时,这一步要缩放,会走 SDK 的图像转码器
  (libimage_transcoder_shared.so),转码器输出的是 **RGBA 且 alpha=254**
  的 PNG —— 也就是「每个像素都还带一点透明」,正好撞上审核的「透明背景」;
* 源图本来就是 ≤512 时,restool **原样拷贝**,不转码 → 输出就是干净的 RGB。

实测(用 SDK 自带的 restool 跑一遍):
    源图 1024×1024 RGB → 包内 512×512 RGBA(alpha 254)   ✗ 有透明通道
    源图  512×512 RGB → 包内 512×512 RGB               ✓ 无 alpha 通道

所以:商店图标保持 1024(商店要求),包内图标改成 512×512 RGB,
两者的画面内容完全一致(同一张图缩放而来),但包内不再带 alpha 通道。

另外,包内那份**不是重新画一遍 512**,而是把商店那张 1024 用 LANCZOS 缩到 512 ——
这样包内图标与商店上传的那张图是**逐像素可验证的同一张**(审核员比对两个图标时
不会有任何差异),而不是「同一段代码画的相似图」。
"""
import os

from PIL import Image, ImageDraw

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
SS = 4  # 超采样倍数,画完再缩小,边缘更干净

BG_TOP = (14, 20, 33)       # 深石板
BG_BOTTOM = (23, 38, 58)
NEON = (34, 211, 238)       # 青
NEON_DIM = (14, 116, 144)
WHITE = (240, 253, 255)


def _gradient(size):
    img = Image.new("RGB", (size, size), BG_TOP)
    draw = ImageDraw.Draw(img)
    for y in range(size):
        t = y / max(size - 1, 1)
        draw.line(
            [(0, y), (size, y)],
            fill=tuple(int(BG_TOP[i] + (BG_BOTTOM[i] - BG_TOP[i]) * t) for i in range(3)),
        )
    return img


def draw_icon(size=1024):
    """画一张 size×size 的图标(RGB,无 alpha)。"""
    s = size * SS
    img = _gradient(s)
    draw = ImageDraw.Draw(img)

    # 圆角底板:深色底上再压一层更深的圆角方块,形成描边感
    pad = int(s * 0.06)
    radius = int(s * 0.22)
    draw.rounded_rectangle(
        [pad, pad, s - pad, s - pad],
        radius=radius,
        fill=(9, 14, 24),
        outline=NEON_DIM,
        width=max(int(s * 0.006), 2),
    )

    # 电路走线:两条折线 + 端点,呼应「赛博」
    line_w = max(int(s * 0.012), 3)
    for idx, (pts, dot) in enumerate(
        [
            ([(0.22, 0.78), (0.34, 0.78), (0.34, 0.66)], (0.34, 0.66)),
            ([(0.78, 0.26), (0.68, 0.26), (0.68, 0.36)], (0.68, 0.36)),
        ]
    ):
        scaled = [(int(px * s), int(py * s)) for px, py in pts]
        draw.line(scaled, fill=NEON_DIM, width=line_w, joint="curve")
        r = int(s * 0.022)
        x, y = int(dot[0] * s), int(dot[1] * s)
        draw.ellipse([x - r, y - r, x + r, y + r], fill=NEON)

    # 触控笔:斜着的白笔身 + 青色笔尖
    cx, cy = 0.52 * s, 0.5 * s
    length = 0.56 * s
    width = 0.13 * s
    angle = -35  # 度

    import math

    rad = math.radians(angle)
    ux, uy = math.cos(rad), math.sin(rad)

    # 笔尖(三角形)
    tip_len = length * 0.22
    tip = (cx + ux * length / 2, cy + uy * length / 2)
    left = (cx - ux * length / 2 + uy * width / 2, cy - uy * length / 2 - ux * width / 2)
    right = (cx - ux * length / 2 - uy * width / 2, cy - uy * length / 2 + ux * width / 2)
    draw.polygon([tip, left, right], fill=NEON)

    # 笔身(矩形)
    back = (cx - ux * length / 2, cy - uy * length / 2)
    draw.polygon(
        [
            left,
            right,
            (right[0] - ux * length * 0.30, right[1] - uy * length * 0.30),
            (left[0] - ux * length * 0.30, left[1] - uy * length * 0.30),
        ],
        fill=WHITE,
    )
    # 笔帽
    cap_w = width * 0.9
    cap = [
        (left[0], left[1]),
        (right[0], right[1]),
        (right[0] - ux * length * 0.06 - uy * cap_w / 2, right[1] - uy * length * 0.06 + ux * cap_w / 2),
        (left[0] - ux * length * 0.06 - uy * cap_w / 2, left[1] - uy * length * 0.06 + ux * cap_w / 2),
    ]
    draw.polygon(cap, fill=NEON)

    # 笔身上一道青色装饰线
    draw.line(
        [
            (back[0] - ux * length * 0.22, back[1] - uy * length * 0.22),
            (back[0] - ux * length * 0.30, back[1] - uy * length * 0.30),
        ],
        fill=NEON_DIM,
        width=max(int(s * 0.02), 4),
    )

    return img.resize((size, size), Image.LANCZOS)


def main():
    # 商店上传用:1024×1024(华为商店的图标规格)
    store = draw_icon(1024)
    assert store.mode == "RGB", store.mode
    store_path = os.path.join(ROOT, "harmony", "assets", "app-icon-1024.png")
    os.makedirs(os.path.dirname(store_path), exist_ok=True)
    store.save(store_path, "PNG")
    print(f"✓ {store_path} (1024x1024, RGB 无 alpha,商店上传用)")

    # 包内用:把这张 1024 原图 LANCZOS 缩到 512 —— 不是重新画一遍。
    # 两个好处:
    #   * restool 对 ≤512 的图原样拷贝,不会转码出 alpha 通道;
    #   * 包内图标与商店上传的那张是「同一张图」,逐像素可验证一致。
    packaged = store.resize((512, 512), Image.LANCZOS)
    assert packaged.mode == "RGB", packaged.mode
    for path in [
        os.path.join(ROOT, "ohos", "entry", "src", "main", "resources", "base", "media", "icon.png"),
        os.path.join(ROOT, "ohos", "AppScope", "resources", "base", "media", "app_icon.png"),
    ]:
        os.makedirs(os.path.dirname(path), exist_ok=True)
        packaged.save(path, "PNG")
        print(f"✓ {path} (512x512, RGB 无 alpha,包内;= 商店图标的 LANCZOS 缩放)")

    # 应用内品牌图标:「关于」弹窗、登录页、桌面端标题栏原来用的是上游的
    # assets/icon/icon.svg —— 那正是市场上「Saber」应用用的那张图标。
    # 审核报告的「知识产权」判定本应用与「Saber」名称/图标相似,应用内部
    # 再露出同一张图标等于自证相似,所以这里换成同一张母图缩出来的 PNG。
    brand = store.resize((128, 128), Image.LANCZOS)
    assert brand.mode == "RGB", brand.mode
    brand_path = os.path.join(ROOT, "assets", "icon", "brand_icon.png")
    os.makedirs(os.path.dirname(brand_path), exist_ok=True)
    brand.save(brand_path, "PNG")
    print(f"✓ {brand_path} (128x128, RGB 无 alpha,应用内品牌图标)")


if __name__ == "__main__":
    main()
