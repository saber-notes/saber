#!/bin/bash

echo "Removing golden_screenshot from pubspec.yaml"
sed -i -e "/golden_screenshot/d" pubspec.yaml

echo "Remove wasm pdfrx libraries"
dart run pdfrx:remove_wasm_modules
