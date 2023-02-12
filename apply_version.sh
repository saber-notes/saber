#!/bin/bash

# get the current version name from lib/data/version.dart
function get_version_name {
  grep -oP '(?<=buildName = ").*(?=")' lib/data/version.dart
}

# get the current version code from lib/data/version.dart
function get_version_code {
  grep -oP '(?<=buildNumber = ).*(?=;)' lib/data/version.dart
}

function print_help {
  echo "This script is used to apply the version to the relevant files."
  echo "Usage: $0 <version-name> <version-code>"
  echo "e.g. $0 $(get_version_name) $(get_version_code)"
  exit 0
}

# help
if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ]; then
  print_help
fi

# check if we have 2 arguments
if [ "$#" -ne 2 ]; then
  print_help
fi

DUMMY_CHANGELOG="Release notes will be added here"
BUILD_NAME=$1
BUILD_NUMBER=$2
DATE=$(date +%Y-%m-%d)
YEAR=$(date +%Y)

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
sed -i "s/buildName = .*/buildName = \"$BUILD_NAME\";/g" lib/data/version.dart

echo " - Updating buildYear in lib/data/version.dart" # e.g. const int buildYear = 2023;
sed -i "s/buildYear = .*/buildYear = $YEAR;/g" lib/data/version.dart

echo " - Updating version in pubspec.yaml" # e.g. version: 5.5.0+5050
sed -i "s/version: .*/version: $BUILD_NAME+$BUILD_NUMBER/g" pubspec.yaml

echo " - Updating version in snap/snapcraft.yaml" # e.g. version: 0.5.5
sed -i "s/version: .*/version: $BUILD_NAME/g" snap/snapcraft.yaml

echo " - Updating VERSION_AS_NUMBER in windows/runner/Runner.rc" # e.g. #define VERSION_AS_NUMBER 0,5,5,0
BUILD_NAME_WITH_COMMAS=$(echo $BUILD_NAME | sed 's/\./,/g')
sed -i "s/#define VERSION_AS_NUMBER .*/#define VERSION_AS_NUMBER $BUILD_NAME_WITH_COMMAS,0/g" windows/runner/Runner.rc

echo " - Updating VERSION_AS_STRING in windows/runner/Runner.rc" # e.g. #define VERSION_AS_STRING "0.5.5.0"
sed -i "s/#define VERSION_AS_STRING .*/#define VERSION_AS_STRING \"$BUILD_NAME.0\"/g" windows/runner/Runner.rc

echo

CHANGELOG_FILE="metadata/en-US/changelogs/$BUILD_NUMBER.txt"
if [ -f "$CHANGELOG_FILE" ]; then
  echo " - Changelog file already exists at $CHANGELOG_FILE"
  echo " - Assuming that the <release> tag exists in flatpak/com.adilhanney.saber.metainfo.xml"
else
  echo " - (*) Creating a blank changelog file at $CHANGELOG_FILE"
  echo "• $DUMMY_CHANGELOG" > "$CHANGELOG_FILE"

  echo " - (*) Add <release> tag to flatpak/com.adilhanney.saber.metainfo.xml"
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
  awk -v release="$RELEASE_TAG" 'NR==62{print release}1' flatpak/com.adilhanney.saber.metainfo.xml > flatpak/com.adilhanney.saber.metainfo.xml.tmp
  mv flatpak/com.adilhanney.saber.metainfo.xml.tmp flatpak/com.adilhanney.saber.metainfo.xml
fi

echo
echo "Make sure to update the two changelog files:"
echo " - metadata/en-US/changelogs/$BUILD_NUMBER.txt"
echo " - flatpak/com.adilhanney.saber.metainfo.xml"
echo "Done!"
