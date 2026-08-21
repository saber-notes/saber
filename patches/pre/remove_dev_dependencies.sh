#!/bin/bash
#
# Removes development dependencies from pubspec.yaml
# which are not needed for production

set -e

echo "Removing golden_screenshot from pubspec.yaml"
sed -i -e "/golden_screenshot/d" pubspec.yaml
