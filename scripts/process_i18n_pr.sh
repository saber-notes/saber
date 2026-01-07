#!/usr/bin/env bash

set -e

echo "(1 / 4) slang apply"
dart run slang apply

echo "(2 / 4) slang"
dart run slang

echo "(3 / 4) slang analyze"
dart run slang analyze --full

echo "(4 / 4) committing"
git add lib/i18n/
git commit -m "i18n: apply strings"
