#!/usr/bin/env bash

pushd submodules/flutter
git fetch
git reset --hard origin/stable
popd
