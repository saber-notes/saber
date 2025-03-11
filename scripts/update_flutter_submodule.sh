#!/usr/bin/env bash

pushd submodules/flutter
git fetch origin
git reset --hard origin/stable
git checkout stable
git pull
popd
