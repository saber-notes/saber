#!/usr/bin/env bash

# Update local Flutter SDK
flutter channel stable
flutter upgrade

# Update Flutter submodule
pushd submodules/flutter
git fetch origin
git reset --hard origin/stable
git checkout stable
git pull
popd

# Save the current Flutter version to a file
FLUTTER_VERSION=$(flutter --version | head -n 1 | awk '{print $2}')
echo "$FLUTTER_VERSION" > submodules/.flutter-version
