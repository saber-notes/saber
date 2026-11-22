#!/usr/bin/env python3
"""Drive and inspect the Saber app on a HarmonyOS device over hdc.

Commands:
    python3 scripts/hui.py dump [--bundle <name>]   print the UI tree outline
    python3 scripts/hui.py tap <x> <y>              click at device coordinates
    python3 scripts/hui.py swipe <x1> <y1> <x2> <y2> [velocity]
    python3 scripts/hui.py key <Back|Home|Power>
    python3 scripts/hui.py text <string>            type into the focused field
    python3 scripts/hui.py shot <file.jpeg>         capture a screenshot
    python3 scripts/hui.py launch                   (re)start the Saber ability
    python3 scripts/hui.py stop                    stop the Saber ability
"""
import json
import os
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile

def _find_hdc():
    """Locate hdc: $HDC, then the usual workspace layouts, then $PATH."""
    env = os.environ.get("HDC")
    if env and os.path.isfile(env):
        return env
    # <repo>/harmony/docs/manual/tools/ -> up 4 = <repo>; the SDK workspace
    # (deveco-tools/, flutter/, ...) lives one level above the repo.
    repo = pathlib.Path(__file__).resolve().parents[4]
    for base in (repo.parent, repo):
        for candidate in (
            base / "deveco-tools/command-line-tools/sdk/default/openharmony/toolchains/hdc.exe",
            base / "deveco-tools/command-line-tools/sdk/default/hms/toolchains/hdc.exe",
            base / "ohos-sdk-root/ohos-sdk/18/toolchains/hdc",
        ):
            if candidate.is_file():
                return str(candidate)
    found = shutil.which("hdc")
    if found:
        return found
    sys.exit("找不到 hdc:请设 $HDC,或把它放进 PATH")


HDC = _find_hdc()
BUNDLE = "com.sabernotes.saber"
REMOTE = "/data/local/tmp/layout.json"


def hdc(*args, check=True):
    r = subprocess.run([HDC, *args], capture_output=True, text=True)
    if check and r.returncode != 0:
        sys.exit(f"hdc {' '.join(args)} 失败:\n{r.stdout}\n{r.stderr}")
    return r.stdout


def _recv_layout():
    """Pull the dumped layout off the device and parse it."""
    local = os.path.join(tempfile.gettempdir(), "saber-layout.json")
    hdc("file", "recv", REMOTE, local)
    with open(local, encoding="utf-8") as f:
        return json.load(f)


def _node_count(node):
    total = 0
    for c in node.get("children") or []:
        total += 1 + _node_count(c)
    return total


def _find_window(data, bundle):
    """Locate the app's window id by matching its title against the bundle name.

    The Flutter window shows up as a node whose text is the app name
    (e.g. "Saber"), and every node of that window shares its hostWindowId.
    """
    app = bundle.rsplit(".", 1)[-1].lower()
    found = []

    def walk(node):
        a = node.get("attributes") or {}
        label = (a.get("text") or a.get("description") or "").lower()
        if app and app in label:
            wid = a.get("hostWindowId")
            if wid:
                found.append(wid)
        for c in node.get("children") or []:
            walk(c)

    walk(data)
    return found[0] if found else None


def _keep_window(data, window_id):
    """Keep one window's nodes (by hostWindowId) plus their ancestors.

    The Flutter content lives under an XComponent whose own hostWindowId is
    empty, so dropping every non-matching node would take the app with it.
    """
    def prune(node):
        a = node.get("attributes") or {}
        kept = []
        for c in node.get("children") or []:
            sub = prune(c)
            if sub is not None:
                kept.append(sub)
        node["children"] = kept
        if a.get("hostWindowId") == window_id or kept:
            return node
        return None

    return prune(data) or data


def dump(bundle=None):
    # The device-side `-b` filter returns an empty tree for the Flutter window
    # on some devices, so try it first and fall back to a full-screen dump
    # filtered on the client side.
    if bundle:
        hdc("shell", "uitest", "dumpLayout", "-p", REMOTE, "-b", bundle)
        data = _recv_layout()
        if _node_count(data) == 0:
            hdc("shell", "uitest", "dumpLayout", "-p", REMOTE)
            data = _recv_layout()
            window_id = _find_window(data, bundle)
            if window_id:
                data = _keep_window(data, window_id)
    else:
        hdc("shell", "uitest", "dumpLayout", "-p", REMOTE)
        data = _recv_layout()
    return data


def walk(node, depth=0):
    yield depth, node
    for c in node.get("children", []) or []:
        yield from walk(c, depth + 1)


def get(node, key, default=""):
    return (node.get("attributes", {}) or {}).get(key, default) or default


def outline(data, show_all=False):
    rows = []
    for depth, node in walk(data):
        a_type = get(node, "type")
        text = get(node, "text")
        desc = get(node, "description") or get(node, "hint")
        nid = get(node, "id")
        label = text or desc
        if not show_all and not label and not nid:
            continue
        if not show_all and label and len(label) < 2:
            continue
        rows.append((depth, a_type, label, nid, get(node, "bounds"),
                     get(node, "clickable")))
    return rows


def cmd_dump(args):
    bundle = None
    show_all = "--all" in args
    if "--bundle" in args:
        bundle = args[args.index("--bundle") + 1]
    data = dump(bundle)
    for depth, t, label, nid, bounds, click in outline(data, show_all):
        print(f"{'  ' * depth}[{t:<16}] {label!r:<44} id={nid!r:<26} "
              f"{bounds} click={click}")
    return 0


def cmd_tap(args):
    x, y = int(args[0]), int(args[1])
    hdc("shell", "uitest", "uiInput", "click", str(x), str(y))
    return 0


def cmd_swipe(args):
    x1, y1, x2, y2 = (int(a) for a in args[:4])
    vel = args[4] if len(args) > 4 else "800"
    hdc("shell", "uitest", "uiInput", "swipe",
        str(x1), str(y1), str(x2), str(y2), vel)
    return 0


def cmd_key(args):
    hdc("shell", "uitest", "uiInput", "keyEvent", args[0])
    return 0


def cmd_text(args):
    hdc("shell", "uitest", "uiInput", "text", " ".join(args))
    return 0


def cmd_shot(args):
    out = args[0]
    remote = "/data/local/tmp/shot.jpeg"
    hdc("shell", "snapshot_display", "-f", remote)
    hdc("file", "recv", remote, out)
    hdc("shell", "rm", "-f", remote, check=False)
    print(out)
    return 0


def cmd_launch(args):
    hdc("shell", "aa", "start", "-a", "EntryAbility", "-b", BUNDLE)
    return 0


def cmd_stop(args):
    hdc("shell", "aa", "force-stop", BUNDLE, check=False)
    return 0


def cmd_windows(args):
    """List the windows of the current layout with their node counts.

    Handy before `uitest dumpLayout -w <windowId>`: the device-side `-b`
    filter returns an empty tree for the Flutter window, but `-w` works.
    """
    hdc("shell", "uitest", "dumpLayout", "-p", REMOTE)
    data = _recv_layout()
    stats = {}

    def walk(node):
        a = node.get("attributes") or {}
        wid = a.get("hostWindowId") or "(none)"
        entry = stats.setdefault(wid, {"count": 0, "titles": []})
        entry["count"] += 1
        label = a.get("text") or a.get("description") or ""
        if label and len(entry["titles"]) < 3:
            entry["titles"].append(label[:40])
        for c in node.get("children") or []:
            walk(c)

    walk(data)
    for wid, entry in sorted(stats.items(), key=lambda kv: -kv[1]["count"]):
        print(f"  windowId={wid:<8} nodes={entry['count']:<5} "
              f"{' | '.join(entry['titles'])}")
    return 0


COMMANDS = {
    "dump": cmd_dump, "tap": cmd_tap, "swipe": cmd_swipe, "key": cmd_key,
    "text": cmd_text, "shot": cmd_shot, "launch": cmd_launch, "stop": cmd_stop,
    "windows": cmd_windows,
}


def main():
    if len(sys.argv) < 2 or sys.argv[1] not in COMMANDS:
        print(__doc__)
        return 1
    return COMMANDS[sys.argv[1]](sys.argv[2:])


if __name__ == "__main__":
    sys.exit(main())
