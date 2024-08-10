#!/bin/bash

flutter test \
  --reporter expanded \
  --update-goldens \
  --dart-define=LOCALIZE_SCREENSHOTS=true \
  test/screenshot_goldens_test.dart
