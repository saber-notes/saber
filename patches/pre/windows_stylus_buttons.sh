#!/bin/bash
# Applies the patches from https://github.com/flutter/flutter/pull/183369
# which wouldn't otherwise land until around August 2026.
#
# The patches were downloaded from
# https://github.com/flutter/flutter/compare/master...CodeDoctorDE:flutter:windows/pointer-buttons.patch

set -e

if [ -z "$FLUTTER_ROOT" ]; then
  echo "Warning: FLUTTER_ROOT is not set. Defaulting to ./submodules/flutter"
  echo "Please set FLUTTER_ROOT to silence this warning in the future."
  echo
  FLUTTER_ROOT="$(pwd)/submodules/flutter"
fi

git -C "$FLUTTER_ROOT" am "$(pwd)/patches/pre/windows_stylus_buttons.patch"
