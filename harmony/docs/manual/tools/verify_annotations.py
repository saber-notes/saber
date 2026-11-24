#!/usr/bin/env python3
"""Verify that every badge in an annotated image is actually drawn.

Finds accent-coloured blobs in the PNG and reports how many distinct
numbered badges exist and where their centres are.

Usage:
    python harmony/docs/manual/tools/verify_annotations.py [glob]
    # 默认校验 harmony/docs/manual/img/*.png
"""
import glob
import os
import pathlib
import sys

from PIL import Image

ACCENT = (255, 196, 0)

# <repo>/harmony/docs/manual/tools/ -> up 4 = <repo>
REPO = pathlib.Path(__file__).resolve().parents[4]
DEFAULT_GLOB = str(REPO / "harmony" / "docs" / "manual" / "img" / "*.png")


def is_accent(p):
    return abs(p[0] - 255) < 30 and abs(p[1] - 196) < 40 and p[2] < 90


def main():
    paths = sorted(glob.glob(sys.argv[1] if len(sys.argv) > 1
                             else DEFAULT_GLOB))
    if not paths:
        print(f"没有找到标注图:{sys.argv[1] if len(sys.argv) > 1 else DEFAULT_GLOB}",
              file=sys.stderr)
        return 1
    for path in paths:
        im = Image.open(path).convert("RGB")
        W, H = im.size
        px = im.load()
        # badge = a disc of accent with a dark digit in the middle
        badges = []
        for y in range(0, H, 3):
            for x in range(0, W, 3):
                if not is_accent(px[x, y]):
                    continue
                # look for a dark hole (the digit) nearby
                hole = False
                for dy in range(-4, 5, 2):
                    for dx in range(-4, 5, 2):
                        if 0 <= y + dy < H and 0 <= x + dx < W:
                            q = px[x + dx, y + dy]
                            if sum(q) < 90:
                                hole = True
                if hole:
                    badges.append((x, y))
        # cluster
        clusters = []
        for x, y in badges:
            for c in clusters:
                if abs(c[0] - x) < 40 and abs(c[1] - y) < 40:
                    c[2] += 1
                    break
            else:
                clusters.append([x, y, 1])
        big = [c for c in clusters if c[2] >= 2]
        print(f"{os.path.basename(path):<26} {W}x{H}  "
              f"badges={len(big):<3} centres="
              f"{[(round(c[0] / W * 3120), round(c[1] / H * 2080)) for c in big]}")


if __name__ == "__main__":
    main()
