#!/bin/bash

# Remove this on Android: https://github.com/FlutterQuill/quill-native-bridge/issues/17
echo "Removing quill_native_bridge_linux from pubspec.yaml"
sed -i -e "/quill_native_bridge_linux/d" pubspec.yaml
