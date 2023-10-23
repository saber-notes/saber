# onyxsdk_pen_dummy

This plugin is intended to replace `onyxsdk_pen` in order to remove proprietary dependencies,
e.g. to publish to F-Droid.

## Setup

Replace `onyxsdk_pen` with the path to `onyxsdk_pen_dummy`:

```yaml
dependencies:
  # onyxsdk_pen: ^1.0.3
  onyxsdk_pen:
    git:
      url: https://github.com/saber-notes/saber
      path: packages/onyxsdk_pen_dummy
```
