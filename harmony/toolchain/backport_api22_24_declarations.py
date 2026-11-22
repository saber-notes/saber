#!/usr/bin/env python3
"""
backport_api22_24_declarations.py
========================================================================
Toolchain-side fix (lives in harmony/toolchain/, not part of the app itself).

Why this exists
---------------
The Flutter-OH engine har (@ohos/flutter_ohos) is built against
HarmonyOS 6.1.1 (API 24) and therefore uses two symbols that are newer
than the HarmonyOS 6.0.1 (API 21) SDK we can actually obtain:

    1. CompetitionStrategy              -- @since 24 dynamic
       used as a bare global enum in
       embedding/ohos/EmbeddingNodeController.ets:235,248,298

    2. Window.isInFreeWindowMode()      -- @since 22 dynamic / 23 static
       used in embedding/ohos/FlutterManager.ets:845

The ArkTS compiler type-checks against the SDK's declaration tree, so both
symbols are reported as "does not exist" and the build fails.

Both call sites are runtime-guarded inside the engine itself:

    // EmbeddingNodeController.ets
    private supportPostInputEventWithStrategy(): boolean {
      return deviceInfo.sdkApiVersion >= 24
        && typeof (this.builderNode as ESObject)?.postInputEventWithStrategy === 'function';
    }

    // FlutterManager.ets
    isInFreeWindowModeSupported(context?): boolean {
      if (deviceInfo.sdkApiVersion < 22) { return false; }
      ...
    }

=> On an API-21 device neither code path is ever entered, so declaring the
   symbols is compile-time-only and behaviourally neutral.

The declarations below are copied VERBATIM from the authoritative upstream
OpenHarmony sources:

    CompetitionStrategy
      https://github.com/openharmony/interface_sdk-js
      api/@internal/component/ets/enums.d.ts  (@since 24)

    Window.isInFreeWindowMode
      https://github.com/openharmony/interface_sdk-js
      OpenHarmony-7.0-Release/api/@ohos.window.d.ts  (@since 22 dynamic)

Usage
-----
    python3 backport_api22_24_declarations.py [--sdk <sdk/default dir>]

The script is idempotent: running it twice changes nothing.
"""

import pathlib
import argparse
import os
import re
import sys

DEFAULT_SDK = os.environ.get(
    "DEVECO_SDK_ROOT",
    str(pathlib.Path(__file__).resolve().parents[3] / "deveco-tools/command-line-tools/sdk/default"),
)

# --------------------------------------------------------------------------
# 1. CompetitionStrategy  (global ambient enum -> component/enums.d.ts)
# --------------------------------------------------------------------------
COMPETITION_STRATEGY = """/**
 * Defines whether the dispatched event is a competitive gesture. In the competitive scenario, only one of the original
 * node and target node of the gesture responds. In the non-competitive scenario, both the original node and target node
 * of the gesture can respond.
 *
 * @syscap SystemCapability.ArkUI.ArkUI.Full
 * @stagemodelonly
 * @crossplatform
 * @atomicservice
 * @since 24 dynamic
 */
declare enum CompetitionStrategy {
  /**
   * Indicates that the dispatched event is a non-competitive gesture.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @stagemodelonly
   * @crossplatform
   * @atomicservice
   * @since 24 dynamic
   */
  DEFAULT = 0,

  /**
   * Indicates that the dispatched event is a competitive gesture.
   *
   * @syscap SystemCapability.ArkUI.ArkUI.Full
   * @stagemodelonly
   * @crossplatform
   * @atomicservice
   * @since 24 dynamic
   */
  COMPETITION = 1
}
"""

# --------------------------------------------------------------------------
# 2. Window.isInFreeWindowMode()  (member of interface Window)
# --------------------------------------------------------------------------
IS_IN_FREE_WINDOW_MODE = """        /**
         * Checks whether this window is in [freeform window](docroot://windowmanager/window-terminology.md#freeform-window)
         * mode.
         *
         * @returns { boolean } Check result for whether the window is in freeform window mode. **true** if the window is in
         *     freeform window mode, **false** otherwise.
         * @throws { BusinessError } 1300002 - This window state is abnormal.
         *     Possible cause: The window is not created or destroyed.
         * @throws { BusinessError } 1300003 - This window manager service works abnormally.
         * @syscap SystemCapability.WindowManager.WindowManager.Core
         * @atomicservice
         * @since 22 dynamic
         * @since 23 static
         */
        isInFreeWindowMode(): boolean;
"""


def read(path):
    with open(path, "r", encoding="utf-8") as fh:
        return fh.read()


def write(path, text):
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(text)


def backport_competition_strategy(path):
    """Append the upstream CompetitionStrategy enum to a global-scope d.ts."""
    if not os.path.isfile(path):
        return False, "missing"
    text = read(path)
    if re.search(r"^\s*declare enum CompetitionStrategy\b", text, re.M):
        return False, "already present"
    if not text.endswith("\n"):
        text += "\n"
    text += "\n" + COMPETITION_STRATEGY
    write(path, text)
    return True, "added"


def backport_is_in_free_window_mode(path):
    """Insert isInFreeWindowMode() into `interface Window` of @ohos.window.d.ts."""
    if not os.path.isfile(path):
        return False, "missing"
    text = read(path)
    if "isInFreeWindowMode" in text:
        return False, "already present"

    # Locate `    interface Window {` and its matching closing brace.
    m = re.search(r"^([ \t]*)interface Window \{", text, re.M)
    if not m:
        return False, "interface Window not found"

    start = m.end()          # first char after the opening brace
    depth = 1
    i = start
    while i < len(text) and depth > 0:
        ch = text[i]
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
        i += 1
    if depth != 0:
        return False, "unbalanced braces"

    close = i - 1             # index of the closing '}'
    body = text[start:close]
    # The member must sit on its own line, right before the closing brace.
    insert_at = close
    tail = text[:insert_at]
    stripped = tail.rstrip()
    insert_at = len(stripped)
    if not stripped.endswith("\n"):
        insert_at += 1

    new_text = text[:insert_at] + IS_IN_FREE_WINDOW_MODE + text[insert_at:]
    write(path, new_text)
    return True, "added"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--sdk", default=DEFAULT_SDK)
    args = ap.parse_args()
    sdk = args.sdk

    targets = []

    # (a) CompetitionStrategy -> global ambient enum.
    #     component/enums.d.ts is the global script the loader mirrors into
    #     ets-loader/declarations/, and the HMS tree keeps a parallel copy.
    targets += [
        ("CompetitionStrategy", os.path.join(
            sdk, "openharmony/ets/component/enums.d.ts"), backport_competition_strategy),
        ("CompetitionStrategy", os.path.join(
            sdk, "openharmony/ets/build-tools/ets-loader/declarations/enums.d.ts"),
            backport_competition_strategy),
        ("CompetitionStrategy", os.path.join(
            sdk, "hms/ets/component/enums.d.ts"), backport_competition_strategy),
    ]

    # (b) Window.isInFreeWindowMode -> member of interface Window.
    targets += [
        ("isInFreeWindowMode", os.path.join(
            sdk, "openharmony/ets/api/@ohos.window.d.ts"), backport_is_in_free_window_mode),
    ]

    changed = 0
    for label, path, fn in targets:
        ok, msg = fn(path)
        rel = path.replace(sdk, "<sdk>")
        print(f"  {label:<22} {msg:<16} {rel}")
        if ok:
            changed += 1

    print(f"\n==> {changed} file(s) updated")
    return 0


if __name__ == "__main__":
    sys.exit(main())
