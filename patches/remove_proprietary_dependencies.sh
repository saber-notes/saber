#!/bin/bash

# find "path: packages/onyxsdk_pen" and replace with "path: packages/onyxsdk_pen_dummy"
echo "Replacing onyxsdk_pen with onyxsdk_pen_dummy"
sed -i -e 's!/onyxsdk_pen!/onyxsdk_pen_dummy!' pubspec.yaml

# remove Onyx maven repo
echo "Removing Onyx,jitpack maven repo"
sed -i -e '18,24d' android/build.gradle

# Delete packages/onyxsdk_pen to make sure it's not used
echo "Deleting packages/onyxsdk_pen"
rm -rf packages/onyxsdk_pen
