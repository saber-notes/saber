#!/usr/bin/env bash

# Change applicationId to "com.adilhanney.saber.alt"
echo "Changing applicationId to com.adilhanney.saber.alt"
sed -i "s/applicationId \"com.adilhanney.saber\"/applicationId \"com.adilhanney.saber.alt\"/g" android/app/build.gradle
