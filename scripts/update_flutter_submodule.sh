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
cp $(dirname $(which flutter))/cache/flutter.version.json submodules/.flutter.version.json
