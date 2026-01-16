#!/bin/bash
#
# Removes pdfrx's wasm modules to reduce bundle size

echo "Remove wasm pdfrx libraries"
dart run pdfrx:remove_wasm_modules
