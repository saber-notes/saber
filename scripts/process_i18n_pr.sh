#!/usr/bin/env bash

set -e

echo "(1 / 4) slang apply"
dart run slang apply

echo "(2 / 5) slang normalize"
dart run slang normalize

echo "(3 / 5) slang"
dart run slang

echo "(4 / 5) slang analyze"
dart run slang analyze --full

echo "(5 / 5) committing"
git add lib/i18n/
git commit -m "i18n: apply strings"
