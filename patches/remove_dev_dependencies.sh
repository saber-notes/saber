#!/bin/bash

echo "Removing golden_screenshot from pubspec.yaml"
sed -i -e "/golden_screenshot/d" pubspec.yaml
