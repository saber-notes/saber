#!/usr/bin/env python3
"""Cross-platform driver for the manual's annotated screenshots.

`make_manual_images.sh` is the single source of truth for *which* annotations
belong to *which* figure (60+ `--ann` coordinates). On Windows there is no
bash, so instead of hand-transcribing the list (and risking a typo in a
coordinate) this driver parses that shell script and replays the calls.

    python scripts/make_manual_images.py              # all figures
    python scripts/make_manual_images.py 01 05        # only the matching ones
    python scripts/make_manual_images.py --dry-run    # show what would run

Everything else (the annotation itself) is done by scripts/annotate.py.
"""
from __future__ import annotations

import argparse
import pathlib
import shlex
import subprocess
import sys

# <repo>/harmony/docs/manual/tools/ -> up 4 = <repo>
REPO = pathlib.Path(__file__).resolve().parents[4]
MANUAL = REPO / "harmony" / "docs" / "manual"
SH_SCRIPT = MANUAL / "tools" / "make_manual_images.sh"
ANNOTATE = MANUAL / "tools" / "annotate.py"
SHOTS = MANUAL / "shots"
OUT_DIR = MANUAL / "img"


def parse_commands(text: str) -> list[list[str]]:
    """Return the argument list of every `$A ...` invocation in the script."""
    # join line continuations first
    joined = text.replace("\\\n", " ")
    commands: list[list[str]] = []
    for line in joined.splitlines():
        line = line.strip()
        if not line.startswith("$A "):
            continue
        args = shlex.split(line[2:], posix=True)
        args = [
            a.replace("$OUT", str(OUT_DIR)).replace(
                "shots/", str(SHOTS) + "/"
            )
            for a in args
        ]
        if len(args) >= 2:
            commands.append(args)
    return commands


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("only", nargs="*", help="only figures whose name contains one of these")
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    if not SH_SCRIPT.is_file():
        print(f"[error] not found: {SH_SCRIPT}", file=sys.stderr)
        return 1
    if not ANNOTATE.is_file():
        print(f"[error] not found: {ANNOTATE}", file=sys.stderr)
        return 1

    commands = parse_commands(SH_SCRIPT.read_text(encoding="utf-8"))
    if not commands:
        print("[error] no commands parsed out of the shell script", file=sys.stderr)
        return 1

    out_dir = OUT_DIR
    out_dir.mkdir(parents=True, exist_ok=True)

    failures = 0
    done = 0
    for cmd in commands:
        name = pathlib.Path(cmd[1]).name
        if args.only and not any(k in name for k in args.only):
            continue
        full = [sys.executable, str(ANNOTATE)] + cmd
        if args.dry_run:
            print("would run:", " ".join(full))
            continue
        print(f"-> {cmd[1]}")
        r = subprocess.run(full, cwd=str(REPO))
        if r.returncode != 0:
            failures += 1
            print(f"   [error] exit={r.returncode}", file=sys.stderr)
        else:
            done += 1

    if not args.dry_run:
        print()
        print(f"已生成 {done} 张 -> {out_dir}")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
