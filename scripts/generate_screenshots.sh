#!/bin/bash

./test.sh \
  --update-goldens \
  --dart-define=ALL_SCREENSHOTS=true \
  test/screenshot_goldens_test.dart
