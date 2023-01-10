#!/bin/bash

# find "path: packages/onyxsdk_pen" and replace with "path: packages/onyxsdk_pen_dummy"
echo "Replacing onyxsdk_pen with onyxsdk_pen_dummy"
sed -i -e 's/path: packages\/onyxsdk_pen/path: packages\/onyxsdk_pen_dummy/g' pubspec.yaml

# Delete packages/onyxsdk_pen to make sure it's not used
echo "Deleting packages/onyxsdk_pen"
rm -rf packages/onyxsdk_pen
