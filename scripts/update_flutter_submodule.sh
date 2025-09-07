#!/usr/bin/env bash

# Update Flutter version used in F-Droid builds
pushd submodules/flutter
git fetch origin
git reset --hard origin/stable
git checkout stable
git pull
popd

# Update Flutter version used in Linux builds
FLUTTER_VERSION=$(flutter --version | head -n 1 | awk '{print $2}')
sed -i -E "s/flutter-version: .*/flutter-version: $FLUTTER_VERSION/" .github/workflows/linux.yml
