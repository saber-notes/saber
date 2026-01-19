#!/bin/bash
#
# Removes development dependencies from pubspec.yaml
# which are not needed for production

echo "Removing golden_screenshot from pubspec.yaml"
sed -i -e "/golden_screenshot/d" pubspec.yaml
