# This patch is necessary when building an appbundle on GitHub Actions,
# as the signing action will fail if the .aab was already signed.

# Remove `signingConfig signingConfigs.release` from android/app/build.gradle
sed -i -e 's/signingConfig signingConfigs.release//g' android/app/build.gradle
