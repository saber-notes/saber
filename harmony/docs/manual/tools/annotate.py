#!/usr/bin/env python3
"""Annotate a HarmonyOS screenshot with numbered callouts.

Each annotation may be:
    badge  (x, y)                 -- a numbered circle placed at (x, y)
    box    (x1, y1, x2, y2)       -- a translucent highlight rectangle
    label  (x, y, "text")         -- a text label placed at (x, y)

Usage:
    python3 scripts/annotate.py in.jpeg out.png --scale 1600 \\
        --ann "badge:3036,1871" \\
        --ann "box:2983,1818,3089,1924" \\
        --ann "label:2900,1700,新建"

All coordinates are in the ORIGINAL screenshot's pixel space.
"""
import argparse
import json
import os
import sys

from PIL import Image, ImageDraw, ImageFont

def _resolve_font(env_name, candidates):
    """Find a usable font file: env override first, then platform defaults."""
    override = os.environ.get(env_name)
    if override and os.path.isfile(override):
        return override
    for path in candidates:
        if os.path.isfile(path):
            return path
    return None


# The digit badges and the Chinese captions need two different faces.
# Override with ANNOTATE_DIGIT_FONT / ANNOTATE_CJK_FONT if needed.
DIGIT_FONT = _resolve_font("ANNOTATE_DIGIT_FONT", [
    "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
    "C:/Windows/Fonts/arialbd.ttf",
    "C:/Windows/Fonts/segoeuib.ttf",
])

CJK_FONT = _resolve_font("ANNOTATE_CJK_FONT", [
    "/usr/share/fonts/opentype/noto/NotoSansCJK-Bold.ttc",
    "C:/Windows/Fonts/NotoSansSC-VF.ttf",
    "C:/Windows/Fonts/msyhbd.ttc",
    "C:/Windows/Fonts/simhei.ttf",
])

ACCENT = (255, 196, 0)
ACCENT_DARK = (140, 90, 0)
TEXT_BG = (18, 16, 10)
TEXT_FG = (255, 245, 220)


def parse_ann(spec):
    kind, _, rest = spec.partition(":")
    if kind == "badge":
        x, y = (int(v) for v in rest.split(","))
        return {"kind": "badge", "x": x, "y": y}
    if kind == "box":
        x1, y1, x2, y2 = (int(v) for v in rest.split(","))
        return {"kind": "box", "box": (x1, y1, x2, y2)}
    if kind == "label":
        x, y, _, text = rest.partition(",")
        return {"kind": "label", "x": int(x), "y": int(y), "text": text}
    raise SystemExit(f"未知标注类型: {spec}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("src")
    ap.add_argument("dst")
    ap.add_argument("--scale", type=int, default=1600)
    ap.add_argument("--ann", action="append", default=[])
    ap.add_argument("--title", default=None)
    ap.add_argument("--footer", default=None)
    args = ap.parse_args()

    im = Image.open(args.src).convert("RGB")
    W, H = im.size
    k = args.scale / W          # output pixels per original pixel
    im = im.resize((args.scale, int(H * k)), Image.LANCZOS)

    def S(v):
        return v * k

    anns = [parse_ann(a) for a in args.ann]
    overlays = []
    labels = []

    for a in anns:
        if a["kind"] == "box":
            overlays.append(a)

    # highlight boxes on a translucent layer
    if overlays:
        layer = Image.new("RGBA", im.size, (0, 0, 0, 0))
        d = ImageDraw.Draw(layer)
        for a in overlays:
            x1, y1, x2, y2 = a["box"]
            d.rectangle([S(x1), S(y1), S(x2), S(y2)],
                        outline=ACCENT + (255,), width=max(2, int(3 * k)))
            d.rectangle([S(x1), S(y1), S(x2), S(y2)],
                        fill=ACCENT + (28,))
        im = Image.alpha_composite(im.convert("RGBA"), layer).convert("RGB")

    d = ImageDraw.Draw(im)
    badge_font = (ImageFont.truetype(DIGIT_FONT, int(30 * k))
                 if DIGIT_FONT else ImageFont.load_default())
    cjk_font = (ImageFont.truetype(CJK_FONT, int(26 * k))
               if CJK_FONT else ImageFont.load_default())

    # numbered badges
    for i, a in enumerate([x for x in anns if x["kind"] == "badge"], start=1):
        x, y = S(a["x"]), S(a["y"])
        r = 22 * k
        d.ellipse([x - r, y - r, x + r, y + r], fill=ACCENT,
                  outline=ACCENT_DARK, width=max(2, int(2 * k)))
        n = str(i)
        bb = d.textbbox((0, 0), n, font=badge_font)
        d.text((x - (bb[2] - bb[0]) / 2, y - (bb[3] - bb[1]) / 2 - bb[1]),
               n, font=badge_font, fill=(20, 16, 4))

    # text labels
    for a in [x for x in anns if x["kind"] == "label"]:
        x, y = S(a["x"]), S(a["y"])
        text = a["text"]
        bb = d.textbbox((0, 0), text, font=cjk_font)
        tw, th = bb[2] - bb[0], bb[3] - bb[1]
        pad = 10 * k
        d.rounded_rectangle([x, y, x + tw + pad * 2, y + th + pad * 2],
                            radius=8 * k, fill=TEXT_BG,
                            outline=ACCENT,
                            width=max(1, int(2 * k)))
        d.text((x + pad, y + pad - bb[1]), text, font=cjk_font, fill=TEXT_FG)

    if args.title:
        tf = ImageFont.truetype(CJK_FONT, int(34 * k))
        bb = d.textbbox((0, 0), args.title, font=tf)
        d.rectangle([0, 0, im.width, bb[3] + 24 * k], fill=TEXT_BG)
        d.text((16 * k, 12 * k - bb[1]), args.title, font=tf, fill=TEXT_FG)

    if args.footer:
        ff = ImageFont.truetype(CJK_FONT, int(24 * k))
        bb = d.textbbox((0, 0), args.footer, font=ff)
        d.rectangle([0, im.height - bb[3] - 24 * k, im.width, im.height],
                    fill=TEXT_BG)
        d.text((16 * k, im.height - bb[3] - 12 * k - bb[1]),
               args.footer, font=ff, fill=TEXT_FG)

    im.save(args.dst)
    print(f"{args.dst}  ({im.width}x{im.height})")


if __name__ == "__main__":
    main()
