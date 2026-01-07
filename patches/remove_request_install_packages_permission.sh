#!/usr/bin/env bash

# Remove REQUEST_INSTALL_PACKAGES permission
echo -n "Removing REQUEST_INSTALL_PACKAGES permission: "
sed -i -e 's!<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />!!' android/app/src/main/AndroidManifest.xml
echo "done"
