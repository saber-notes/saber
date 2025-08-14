#!/bin/bash

# Convert all svg to png
for svg_file in assets/icon/*.svg; do
  png_file="${svg_file%.svg}.png"
  echo "Rasterizing $svg_file..."
  rsvg-convert -o "$png_file" "$svg_file" -w 1024 -h 1024
done
echo

# Use the icons_launcher package to generate icons as a starting point
echo "Generating icons with icons_launcher..."
dart run icons_launcher:create
echo

# Re-generate android icons because icons_launcher' are pixelated
echo "Replacing android icons"
function replace_android_icons() {
  local normalSize=$1
  local adaptiveSize=$2
  local sizeName=$3
  echo "Resizing icon_maskable.svg to ${sizeName} (${adaptiveSize}px)"
  rsvg-convert -o "android/app/src/main/res/mipmap-${sizeName}/ic_launcher_foreground.png" assets/icon/icon_maskable.svg -w $adaptiveSize -h $adaptiveSize
  echo "Resizing icon_monochrome.svg to ${sizeName} (${adaptiveSize}px)"
  rsvg-convert -o "android/app/src/main/res/mipmap-${sizeName}/ic_launcher_monochrome.png" assets/icon/icon_monochrome.svg -w $adaptiveSize -h $adaptiveSize
  echo "Resizing icon.svg to ${sizeName} (${normalSize}px)"
  rsvg-convert -o "android/app/src/main/res/mipmap-${sizeName}/ic_launcher.png" assets/icon/icon.svg -w $normalSize -h $normalSize
}
replace_android_icons 48 108 mdpi
replace_android_icons 72 162 hdpi
replace_android_icons 96 216 xhdpi
replace_android_icons 144 324 xxhdpi
replace_android_icons 192 432 xxxhdpi
echo

echo "Replacing iOS icons"
function replace_ios_icon() {
  local size=$1
  local sizeName=$2
  echo "Resizing icon_opaque.svg to ${sizeName} (${size}x${size})"
  rsvg-convert -o "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-${sizeName}.png" assets/icon/icon_opaque.svg -w $size -h $size
}
replace_ios_icon 20 20x20@1x
replace_ios_icon 40 20x20@2x
replace_ios_icon 60 20x20@3x
replace_ios_icon 29 29x29@1x
replace_ios_icon 58 29x29@2x
replace_ios_icon 87 29x29@3x
replace_ios_icon 76 38x38@2x
replace_ios_icon 114 38x38@3x
replace_ios_icon 40 40x40@1x
replace_ios_icon 80 40x40@2x
replace_ios_icon 120 40x40@3x
replace_ios_icon 120 60x60@2x
replace_ios_icon 180 60x60@3x
replace_ios_icon 128 64x64@2x
replace_ios_icon 192 64x64@3x
replace_ios_icon 136 68x68@2x
replace_ios_icon 76 76x76@1x
replace_ios_icon 152 76x76@2x
replace_ios_icon 167 83.5x83.5@2x
replace_ios_icon 1024 1024x1024@1x
echo

# No macOS rasters are generated since macOS 26+ uses AppIcon.icon bundled with svg layers

echo All done!
