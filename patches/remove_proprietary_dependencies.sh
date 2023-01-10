#!/bin/bash

# find "path: packages/onyxsdk_pen" and replace with "path: packages/onyxsdk_pen_dummy"
sed -i -e 's/path: packages\/onyxsdk_pen/path: packages\/onyxsdk_pen_dummy/g' pubspec.yaml
