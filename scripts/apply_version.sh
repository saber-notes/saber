#!/usr/bin/env bash

# Fixes 'grep: -P supports only unibyte and UTF-8 locales'
# for Git Bash on Windows
export LC_ALL=en_US.utf8

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Use GNU grep on macOS
  # brew install grep gnu-sed gawk
  PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
  PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
  PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
fi

# Path to an editor executable with which to open
# the files you need to manually edit.
#
# E.g. if you are using VS Code, you can set this to
# EDITOR="code"
#
# If you leave this empty, the script will not open any files.
# This is the same as using the -q flag.
EDITOR=$(which code)

# get the current version name from lib/data/version.dart
function get_version_name {
  grep -oP "(?<=buildName = ').*(?=')" lib/data/version.dart
}

# get the current version code from lib/data/version.dart
function get_version_code {
  grep -oP '(?<=buildNumber = ).*(?=;)' lib/data/version.dart
}

function print_help {
  echo "This script is used to apply the version to the relevant files."
  echo "Usage: $0 <version-name> <version-code> [-q]"
  echo "e.g. $0 $(get_version_name) $(get_version_code)"

  echo
  echo "Options:"
  echo "  -q: Quiet mode. Doesn't automatically open files that need to be manually edited."

  exit 0
}

# help
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ]; then
  print_help
fi

# check if we have 2-3 arguments
if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
  print_help
fi

DUMMY_CHANGELOG="Release notes will be added here"
BUILD_NAME=$1
BUILD_NUMBER=$2
DATE=$(date +%Y-%m-%d)
YEAR=$(date +%Y)

# -q flag
if [ "$3" == "-q" ]; then
  EDITOR=""
elif [ "$3" != "" ]; then
  print_help
fi

# Check if the editor exists
if [ "$EDITOR" != "" ] && [ ! -f "$EDITOR" ]; then
  echo "Editor not found: $EDITOR"
  echo "Please set the EDITOR variable in this script to the path of your editor executable,"
  echo "or use the -q flag to not open any files."
  exit 1
fi

# check if the build name is valid
if [[ ! $BUILD_NAME =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid build name: $BUILD_NAME"
  exit 1
fi

# check if the build number is valid
if [[ ! $BUILD_NUMBER =~ ^[0-9]+$ ]]; then
  echo "Invalid build number: $BUILD_NUMBER"
  exit 1
fi

echo "Applying version $BUILD_NAME ($BUILD_NUMBER) ($DATE) to the relevant files..."

echo " - Updating MyAppVersion in installers/desktop_inno_script.iss" # e.g. #define MyAppVersion "0.5.5"
sed -i "s/#define MyAppVersion .*/#define MyAppVersion \"$BUILD_NAME\"/g" installers/desktop_inno_script.iss

echo " - Updating buildNumber in lib/data/version.dart" # e.g. const int buildNumber = 5050;
sed -i "s/buildNumber = .*/buildNumber = $BUILD_NUMBER;/g" lib/data/version.dart

echo " - Updating buildName in lib/data/version.dart" # e.g. const String buildName = "0.5.5";
sed -i "s/buildName = .*/buildName = '$BUILD_NAME';/g" lib/data/version.dart

echo " - Updating buildYear in lib/data/version.dart" # e.g. const int buildYear = 2023;
sed -i "s/buildYear = .*/buildYear = $YEAR;/g" lib/data/version.dart

echo " - Updating version in pubspec.yaml" # e.g. version: 5.5.0+5050
sed -i "s/version: .*/version: $BUILD_NAME+$BUILD_NUMBER/g" pubspec.yaml

echo " - Updating version in snap/snapcraft.yaml" # e.g. source-tag: 'v0.5.5'
sed -i "s/source-tag: 'v.*/source-tag: 'v$BUILD_NAME'/g" snap/snapcraft.yaml

echo " - Updating VERSION_AS_NUMBER in windows/runner/Runner.rc" # e.g. #define VERSION_AS_NUMBER 0,5,5,0
BUILD_NAME_WITH_COMMAS=${BUILD_NAME//./,}
sed -i "s/#define VERSION_AS_NUMBER .*/#define VERSION_AS_NUMBER $BUILD_NAME_WITH_COMMAS,0/g" windows/runner/Runner.rc

echo " - Updating VERSION_AS_STRING in windows/runner/Runner.rc" # e.g. #define VERSION_AS_STRING "0.5.5.0"
sed -i "s/#define VERSION_AS_STRING .*/#define VERSION_AS_STRING \"$BUILD_NAME.0\"/g" windows/runner/Runner.rc

echo " - Updating Windows download link in README.md"
# e.g. [download_windows]: https://github.com/saber-notes/saber/releases/download/v0.11.0/SaberInstaller_v0.11.0.exe
sed -i "s|\[download_windows\]: .*|\[download_windows\]: https://github.com/saber-notes/saber/releases/download/v${BUILD_NAME}/SaberInstaller_v${BUILD_NAME}.exe|g" README.md

echo " - Updating AppImage download link in README.md"
# e.g. [download_appimage]: https://github.com/saber-notes/saber/releases/download/v0.11.0/Saber-0.11.0-x86_64.AppImage
sed -i "s|\[download_appimage\]: .*|\[download_appimage\]: https://github.com/saber-notes/saber/releases/download/v${BUILD_NAME}/Saber-${BUILD_NAME}-x86_64.AppImage|g" README.md

echo

CHANGELOG_FILE="metadata/en-US/changelogs/$BUILD_NUMBER.txt"
if [ -f "$CHANGELOG_FILE" ]; then
  echo " - Changelog file already exists at $CHANGELOG_FILE"
else
  echo " - (*) Creating a blank changelog file at $CHANGELOG_FILE"
  echo "• $DUMMY_CHANGELOG" > "$CHANGELOG_FILE"
fi

FLATPAK_FILE="flatpak/com.adilhanney.saber.metainfo.xml"
if grep -q "$BUILD_NAME" "$FLATPAK_FILE"; then
  echo " - <release> tag already exists in $FLATPAK_FILE"
else
  echo " - (*) Adding <release> tag to $FLATPAK_FILE"
  # shellcheck disable=SC1078,SC1079
  RELEASE_TAG="""\
        <release version=\"$BUILD_NAME\" type=\"development\" date=\"$DATE\">
            <description>
                <ul>
                    <li>$DUMMY_CHANGELOG</li>
                </ul>
            </description>
        </release>\
"""
  awk -v release="$RELEASE_TAG" 'NR==268{print release}1' "$FLATPAK_FILE" > "${FLATPAK_FILE}.tmp"
  mv "${FLATPAK_FILE}.tmp" "$FLATPAK_FILE"
fi

echo
echo "Make sure to update the two changelog files:"
echo " - $CHANGELOG_FILE"
echo " - $FLATPAK_FILE"
echo "And then run:"
echo " - dart scripts/translate_changelogs.dart"
echo "And then:"
echo " - Go to https://snapcraft.io/saber/builds and click 'Trigger new build'"

if [ "$EDITOR" != "" ]; then
  echo
  echo "Opening the changelog files in $EDITOR..."
  "$EDITOR" "$CHANGELOG_FILE"
  "$EDITOR" flatpak/com.adilhanney.saber.metainfo.xml
fi
